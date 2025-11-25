# Copilot Instructions for Mitchopolis Docs

## Project Overview
This repository (`mitchopolis_docs`) is a **documentation and automation reference** for the Mitchopolis monorepo ecosystem. It is NOT a service codebase—it contains best practices, operational logs, and procedural guides for developers and AI agents working across the Mitchopolis system.

**Scope**: Documentation for the larger Mitchopolis system (evidence_engine, legal_ai_engine, _core automation, parenting_evidence).

## Architecture Context
The Mitchopolis system is organized as follows:
- **`evidence_engine`** (Python/FastAPI): Microservice for evidence ingestion, OCR, classification, and timeline generation
- **`legal_ai_engine`** (Node/Express/MongoDB): Microservice for legal analysis, document retrieval, and API endpoints
- **`_core`** (Shell/Python): Automation orchestration, LaunchAgents, watchers, and system-level tasks
- **`parenting_evidence`** (Data folder): User and machine-generated evidence, organized by type (inbox, exports, audio, photos, text_logs, timelines, etc.)
- **`docs`** (This repo): Persistent operational documentation, best practices, and task templates

**Key insight**: Services are isolated by folder; use separate Git repos for each service. Only sync `parenting_evidence/` with cloud storage. Never commit `venv/`, `node_modules/`, or system artifacts.

## Critical Developer Workflows

### Status Dashboard (Pre-Flight Check)
Run these commands to assess system health:
```bash
# From ~/Mitchopolis root
cd ~/Mitchopolis
git status -sb  # Confirm clean state, check branch

# Evidence Engine (Python/FastAPI, port 8000)
cd evidence_engine && source venv/bin/activate && pytest -q

# Legal AI Engine (Node, port 3000)
cd legal_ai_engine && npm test

# Port sanity check
lsof -i :8000 && lsof -i :3000
```

### Start Services
```bash
# From ~/Mitchopolis root - launches both services
./run_evidence_api_dev.sh

# Or manually:
cd evidence_engine && source venv/bin/activate && uvicorn src.main:app --reload
cd legal_ai_engine && npm run dev  # Nodemon auto-reload
```

### Test & Validate
- Evidence Engine: `cd evidence_engine && make full` (runs lint, tests, processes evidence)
- Legal AI Engine: `cd legal_ai_engine && npm test` (Jest test suite)

## Project-Specific Conventions

### Task Flow (Daily Execution Pattern)
1. **Infra/System** first (environment validation, ports, LaunchAgents)
2. **Workflow/Automation** second (run pipelines, process evidence)
3. **Documentation** third (update logs, record blockers)

### Automation Best Practice
- Start with a **single stable command** (e.g., `make full`)
- Stabilize it completely before modularizing
- Always run system-level commands (`LaunchAgent`, port binding) from a **clean Terminal window**
- Confirm folder paths before wiring automation

### Naming & File Organization
- Folders: lowercase with underscores (`evidence_engine`, `legal_ai_engine`)
- Files: `verb_noun.py`, `YYYY-MM-DD_description.md` for logs
- LaunchAgents: `com.mitchopolis.<service>.<action>.plist`
- All paths relative to `~/Mitchopolis/` root

### Terminal & Environment Isolation
- Use separate Terminal tabs/windows for:
  - System-level commands (LaunchAgents, port binding)
  - venv-contained work (evidence_engine Python)
  - npm-contained work (legal_ai_engine Node)
- Always activate correct environment before running tests or services:
  - Python: `source evidence_engine/venv/bin/activate`
  - Node: Managed by `npm` directly

### Evidence Pipeline
The evidence processing flow is: **Upload → OCR → Classify → Timeline Generation → Export**
- Input: `parenting_evidence/inbox/`
- Processing: Handled by evidence_engine microservice
- Output: `parenting_evidence/exports/` (synced daily to iCloud)

## Integration Points & Dependencies

### Health Checks
Both services expose health endpoints:
- Evidence Engine: `GET http://localhost:8000/health` → `{"status":"ok","service":"evidence_engine"}`
- Legal AI Engine: `GET http://localhost:3000/health` → `{"status":"ok","service":"legal_ai_engine"}`

### Key Endpoints (Current Implementation)
- **Evidence Engine**: `/health`, `/api/evidence/process` (upload + full pipeline)
- **Legal AI Engine**: `/health`, `/api/evidence` (GET list, POST create)

### External Dependencies
- MongoDB (legal_ai_engine data store)
- Uvicorn (ASGI server for evidence_engine)
- Express (legal_ai_engine web framework)
- FastAPI (evidence_engine API framework)

## When Working on This Repo
- **Update `best_practices_log_v1.md`** when discovering new patterns or blockers
- **Document task flows** in the daily template section for consistency
- **Cross-reference service READMEs** in evidence_engine/ and legal_ai_engine/ for detailed setup
- **Never commit** evidence artifacts, venv, or node_modules
- **Always run end-of-day system checks** from a clean Terminal window

## Common Gotchas
1. **Port conflicts**: Check `lsof -i :8000` and `lsof -i :3000` before starting services
2. **Wrong working directory**: Ensure you're in the correct service folder before running tests
3. **Stale LaunchAgents**: Verify old automation isn't running via `launchctl list | grep mitchopolis`
4. **Unactivated venv**: Always `source venv/bin/activate` before running Python commands
5. **Git repo boundaries**: Each service (evidence_engine, legal_ai_engine, _core, docs) is a separate repo; don't mix them
