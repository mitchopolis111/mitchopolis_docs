# Mitchopolis Best Practices Log — v1

## 1. Daily Task Flow (General Pattern)
- Infra / system dependencies first
- Workflow + automation second
- Documentation / reflection third

## 2. Automation Principles
- Start simple (single command like `make full`)
- Stabilize
- Then modularize into separate steps

## 3. Terminal & Environment Rules
- Use a NEW Terminal window for system-level commands (LaunchAgents, etc.)
- Keep venv-contained work isolated
- End-of-day system checks must be run from a clean Terminal window.


## 4. Projects & Chat Routing
- Each ChatGPT project only accesses its own files
- Use this project for task flows and best practices only

## 4.1 Prompt Procedure (Best Practice)

- Start with a clear **intent statement** (what outcome is desired).
- Specify **context**: which repo, which service, which folder, or which terminal.
- Define **format**: commands first, explanations second.
- State **constraints**: “use best practice procedure”, “short answer”, or “step-by-step”.
- Add **safety flags**: avoid running unknown commands, avoid modifying multiple repos at once.
- Require a **final confirmation step**: assistant summarizes and asks for “Proceed?” before executing major operations.

## 5. Open Items / To Refine
- Mac folder structure standards
- Full Operational Wait-Time Guide (OWTG)
- Detailed Evidence Engine procedures
### Lessons Learned — 2025-11-20
- Always implement automation with a single stable trigger first (`make full`).
- Stabilize the automation before adding complexity (separate scripts, retries, etc.).
- Confirm correct folder paths before wiring automation.
- Use a clean Terminal window when running LaunchAgent or system-level commands.
- Disable old or duplicate LaunchAgents to prevent overlapping automation.
## Daily Log — 2025-11-20
- Auto-processing fully implemented and verified.
- Old LaunchAgent removed.
- Best Practices Log v1 created and updated.
- Codex workflow established in VS Code.
- Project instructions configured and isolated in ChatGPT.
- Folder structure reviewed and confirmed healthy.

## Daily Task Flow — 2025-11-21 (Template)
- Session Header:
  - Date/time (local), repo(s), branch, cwd(s).
  - Active services/ports (uvicorn:8000, legal_api:3000).
  - Today’s focus (e.g., Day 2 – court-ready packaging).

- Status Dashboard (pre-flight):
  - Services state: up/down.
  - Last tests + result: `pytest -q` (evidence_engine), `npm test` (legal_ai_engine).
  - Git: `git status -sb` (clean?); open PRs to review?

- System Check:
  - Open new Terminal window
  - Validate environment paths
  - Confirm LaunchAgents status

- Quick-Start Commands (reference):
  ```
  # Root launcher
  cd ~/Mitchopolis
  ./run_evidence_api_dev.sh

  # Evidence Engine
  cd ~/Mitchopolis/evidence_engine
  source venv/bin/activate
  pytest -q

  # Legal AI Engine
  cd ~/Mitchopolis/legal_ai_engine
  npm test

  # Ports sanity
  lsof -i :8000
  lsof -i :3000
  ```

- Working Directory Guidance:
  - `~/Mitchopolis` for `./run_evidence_api_dev.sh`.
  - `~/Mitchopolis/evidence_engine` for venv commands, pytest, uvicorn tweaks.
  - `~/Mitchopolis/legal_ai_engine` for npm/yarn and Jest.
  - Use new Terminal tabs for system-level or cross-repo commands.

- Workflow Execution:
  - Run `make full` in evidence_engine
  - Review outputs in parenting_evidence/exports
  - Validate timeline generation

- Documentation:
  - Update Best Practices Log
  - Record any fixes, blockers, or improvements
  - Flag items to refine tomorrow
## Mac Folder Structure Standards

### Core Principles
- All Mitchopolis projects and automation live under `~/Mitchopolis`.
- `_core` holds automation scripts, watchers, utilities, and pipeline logic.
- `evidence_engine` (Python) and `legal_ai_engine` (Node) follow isolated service boundaries.
- `parenting_evidence` stores all evidence classified by type.
- `docs` contains best practices, logs, and operational reference.

### To Be Expanded
- Naming conventions  
- Folder roles  
- Sync rules  
- Backup rules  
- Git repo boundaries
 ### Folder Roles

#### `_core/`
- Houses automation logic, watchers, utility scripts, LaunchAgent templates.
- Should contain only Python scripts, shell scripts, plist definitions, and logs.

#### `evidence_engine/`
- Python microservice responsible for ingestion, classification, OCR, timeline building, and exporting.
- Contains `src/`, `scripts/`, `tests/`, `venv/`, and automation pipelines.

#### `legal_ai_engine/`
- Node.js/Express microservice for legal document analysis, retrieval, indexing, and API endpoints.
- Contains `src/`, `routes/`, `models/`, `.env`, and test harness.

#### `parenting_evidence/`
- User-generated and machine-generated evidence.
- Subfolders: `inbox/`, `exports/`, `audio/`, `photos/`, `text_logs/`, `timelines/`, `witness_statements/`, `metadata/`.

#### `docs/`
- Persistent logs, best practices, ops documentation, templates, guides.

---

### Naming Conventions
- Use lowercase with underscores: `mitchopolis_core`, `evidence_engine`.
- For files: `verb_noun.py`, `feature_name.md`, `YYYY-MM-DD_description.md`.
- For automation: `com.mitchopolis.<service>.<action>.plist`.

---

### Sync Rules
- Only `parenting_evidence/` may sync with iCloud/Google Drive.
- Never sync `venv/`, `node_modules/`, or automation scripts.
- Sync-heavy folders (`photos`, `audio`) must remain out of Git.

---

### Backup Rules
- `docs/` gets backed up weekly.
- `parenting_evidence/exports/` backed up daily via iCloud.
- `LaunchAgents` and automation workflows stored in `_core/` and included in Git.

---

## Evidence Engine (Service Overview)

- **Codebase**: `~/Mitchopolis/evidence_engine`
- **Repo**: `https://github.com/mitchopolis111/evidence_engine`
- **Tech stack**: Python + FastAPI + Uvicorn
- **Dev run (preferred)**: From `~/Mitchopolis` root, run `./run_evidence_api_dev.sh`
- **Health check**: `GET /health` → returns `{"status":"ok","service":"evidence_engine"}`
- **Detailed setup, endpoints, and troubleshooting**: See `evidence_engine/README.md`

**Current endpoints:**
- Implemented: `/health`, `/api/evidence/process` (upload → OCR → classify → timeline)
- Planned: `/api/evidence/ingest`, `/api/evidence/timeline/{case_id}`, `/api/evidence/export`

---

## Legal AI Engine (Service Overview)

- **Codebase**: `~/Mitchopolis/legal_ai_engine`
- **Repo**: `https://github.com/mitchopolis111/legal_ai_engine`
- **Tech stack**: Node.js + Express + MongoDB
- **Dev run**: `npm run dev` (auto-reload via Nodemon, port 3000)
- **Health check**: `GET /health` → returns `{"status":"ok","service":"legal_ai_engine"}`
- **Detailed setup, endpoints, and troubleshooting**: See `legal_ai_engine/README.md`

**Current endpoints:**
- Implemented: `/health`, `/api/evidence` (GET list, POST create)
- Planned: `/api/evidence/:id` (GET/PUT/DELETE), `/api/evidence/search`, `/api/evidence/export`

---

## Git Repository Planning (Map)

### Repos to Create
- `evidence_engine` → Python microservice repo
- `legal_ai_engine` → Node/Express microservice repo
- `mitchopolis_docs` → Best practices, logs, templates
- `mitchopolis_core` → Automation scripts, watchers, LaunchAgents

### Local Folders (Not Repos)
- `parenting_evidence` → Raw and processed evidence (too large for Git)
- `photos`, `audio`, `text_logs`, `timelines` → Evidence artifacts
- `metadata`, `exports` → Output-heavy, excluded from Git

### Repo Boundaries
- Each repo must contain its own README.md
- Each repo uses its own .gitignore
- No cross-repo dependencies except via API or shared docs

### Notes
- Avoid storing large media in Git
- Sync with iCloud/Drive only for non-code folders
- Automations stay under `_core` and remain versioned

## Git Standards & Workflow

### 1. Global Git Configuration
- `user.name` = "Mitchel Watson"
- `user.email` = "owner@mitchopolis.com"
- Default initial branch:
  - Set globally via: `git config --global init.defaultBranch main`
  - All new repos must start on `main`.

---

### 2. Branching Model

- `main`
  - Always stable, production‑truth branch.
  - Only fast‑forward merges from reviewed branches (dev/feature/hotfix).
- `dev`
  - Active development branch.
  - New work branches are created from here, not from `main`.
- `feature/<short-description>`
  - For new features or non‑urgent changes.
  - Examples:
    - `feature/evidence-sorting-v2`
    - `feature/legal-api-endpoints`
- `hotfix/<short-description>`
  - For urgent fixes that must go to `main` quickly.
  - Examples:
    - `hotfix/fix-timeline-crash`
    - `hotfix/atlas-connection-timeout`

**Rules:**
- No direct commits to `main` unless absolutely necessary.
- Normal flow:
  - `feature/*` → merge into `dev` → validate → merge `dev` into `main`.

---

### 3. Commit Message Convention

Use a simple, consistent pattern:

`<type>(<optional-scope>): <short, imperative summary>`

**Types:**
- `feat`  – new user‑visible feature
- `fix`   – bug fix
- `chore` – maintenance, config, scaffolding, no behavior change
- `docs`  – documentation and best practices
- `refactor` – internal restructuring, no behavior change
- `test`  – add/improve tests

**Examples:**
- `chore: initialize mitchopolis_core repository`
- `chore: initialize evidence_engine repository`
- `chore(legal): initialize legal_ai_engine repository`
- `feat(evidence): add OCR pipeline step`
- `fix(timeline): handle empty evidence set`
- `docs: update best practices log`

**Rules:**
- Keep subject line under ~72 characters.
- Write in imperative form (e.g., “add”, “fix”, “update”, not “added” / “fixed”).
- One logical change per commit where possible.

---

### 4. When to Commit

- Commit when:
  - A small, coherent unit of work is complete.
  - Tests (if present) pass locally.
  - The code runs without obvious errors for that change.
- Do **not** commit:
  - Temporary debug prints.
  - Half‑finished experiments (unless clearly marked in commit message).

---

### 5. Multi‑Repo Discipline (Mitchopolis Ecosystem)

Repos:
- `mitchopolis_core` – automation scripts, watchers, LaunchAgent templates.
- `evidence_engine` – Python microservice.
- `legal_ai_engine` – Node/Express microservice.
- `docs` – best practices, logs, operational guides.

**Rules:**
- Do not mix unrelated changes across repos in a single commit.
- If a change spans multiple repos:
  - Make separate, clearly related commits in each repo.
  - Use similar commit messages for traceability (e.g., same summary text).
- Heavy assets (photos, audio, exports, large evidence) stay **out of Git**.

---

### 6. Clean Working Tree Rule

Before switching branches or ending a work session:
- Run `git status`.
- Aim for:
  - `On branch dev` (or relevant feature branch)
  - `nothing to commit, working tree clean`

If there are changes:
- Commit them, or
- Stash them (`git stash`) if not ready to commit.
## Operational Wait-Time Guide (OWTG)

### Purpose
To prevent sync conflicts, automation failures, and race conditions across the Mitchopolis ecosystem.  
These timing rules ensure predictable, stable execution of scripts and system-level operations.

---

### 1. Terminal & Automations
- After activating a Python venv → wait **1 second**
- After running `make full` → wait for full output (no fixed time)
- After loading a LaunchAgent → wait **2–3 seconds**
- After unloading a LaunchAgent → wait **2 seconds** before reloading
- After editing a `.plist` file → wait **1 second** after saving

---

### 2. File System Operations
- After creating or moving folders → wait **1–2 seconds**
- After writing ZIP exports → wait **3 seconds** for full disk flush
- After the watcher triggers → allow **2–5 seconds** for processing
- After dropping a file in `parenting_evidence/inbox` → expect immediate trigger but allow **5 seconds** before validation

---

### 3. Cloud Sync (iCloud / Google Drive)
- After saving a file in an iCloud Drive folder → wait **5–15 seconds** before relying on sync
- After moving large files (>50MB) → wait **20–60 seconds**
- Do NOT rely on sync timestamps; rely on manual checks

---

### 4. MongoDB Atlas & Network Services
- After starting Node/Express server → wait **1–2 seconds** for env injection and DB handshake
- After a failed DB connection attempt → wait **5 seconds** before retry
- When switching networks (WiFi/cellular/hotspot) → allow **10–15 seconds** for DNS stabilization

---

### 5. Git Operations (when added later)
- After `git init` → wait **1 second**
- After first commit → wait **1 second**
- After pushing to remote → allow **2–5 seconds** for Git server update
- When switching branches with large changes → wait **2 seconds**

---

### 6. General Mac Automation Timing
- After restarting Mac → LaunchAgents need **3–5 seconds** to revive
- After system updates → verify LaunchAgents again
- After editing `_core/scripts` → restart watcher using LaunchAgent (stop → wait 2 seconds → start)

---

### Summary Rule
**When in doubt, pause 1–3 seconds.  
When dealing with cloud or automation, pause 5–10 seconds.**
## Shutdown Procedure (Daily Closeout)

### 1. Stop All Running Services

#### Evidence Engine (Python)
- Go to the Terminal tab running `uvicorn`
- Press CTRL + C
- Verify nothing is running:
```
lsof -i :8000
```
- Output should be empty.

#### Legal AI Engine (Node/Express)
- Go to the Terminal tab running `npm run dev`
- Press CTRL + C
- Verify nothing is listening:
```
lsof -i :3000
```
- Output should be empty.

---

### 2. Clean Environment State
- Close all remaining Terminal tabs related to microservices
- Ensure `~/Mitchopolis` has no temporary processes running

---

### 3. Git Sync & Documentation
- Ensure working trees are clean:
```
git status -sb
```
- If changes exist:
  - Commit them
  - Push to origin/dev
- Update Best Practices Log (this file)

---

### 4. Close Applications
- Quit VS Code
- Quit Terminal
- Confirm cloud sync has completed (iCloud/Google Drive indicators)

---

### 5. Final Note
System is now safely shut down and ready for next session.

## Mitchopolis Roadmap (Active Build Plan)

### Day 1 — Evidence Engine Pipeline Completion
- Finalize ingestion → OCR → classification → timeline flow.
- Add endpoint coverage for planned routes.
- Expand pytest to include negative/edge cases.

### Day 2 — Court-Ready Evidence Packaging
- Add PDF/ZIP packaging pipeline using Python.
- Standardize folder structure for exports.
- Add automatic naming conventions for court submissions.
- Add integration test for full evidence package run.

### Day 3 — Legal AI Engine Case Intelligence
- Add case-based evidence retrieval routes (`/api/evidence/:id`).
- Implement search and filter routes.
- Build analysis helpers (classify, group, summarize).
- Add Jest tests for all new endpoints.

### Future Milestones
- Full-case timeline builder combining both engines.
- Automated “Court Bundle Generator” (PDF + index + timeline).
- Full UI dashboard (Phase 2).

## Daily Log — 2025-11-22
- Completed system health check (LaunchAgents + logs).
- Expanded Mac Folder Structure Standards.
- Created Git scaffolds for core repos.
- Loaded multi-repo VS Code workspace.
- Verified automation, pipeline, and environment stability.
- Prepared for Git initialization and repository structure refinement.
- Initialized Git repositories and defined Git standards & workflow.


## Daily Log — 2025-11-24
- Performed full system startup verification using verify_build.sh.
- Both Evidence Engine and Legal AI Engine started cleanly.
- Confirmed no leftover processes on ports 8000 or 3000 before launch.
- Completed service health checks (`/health` and `/version` for both services).
- Verified Jest tests (legal_ai_engine) and pytest suite (evidence_engine) passing.
- System stable and ready for work session.


## Mitchopolis Roadmap (Active Build Plan)

### Day 1 — Evidence Engine Pipeline Completion
- Finalize ingestion, classification, OCR, and timeline pipeline.
- Expand pytest coverage to include edge cases.
- Add performance logging to OCR and classifier stages.

### Day 2 — Court-Ready Evidence Packaging
- Implement timeline + evidence ZIP export via API.
- Add PDF generation for timeline summaries.
- Build `/api/evidence/export` endpoint with authentication placeholder.
- Add pytest for export flow.

### Day 3 — Legal AI Engine Case Intelligence
- Implement CRUD routes for evidence items in legal_ai_engine.
- Add `/api/evidence/search` with basic filters.
- Integrate test-mode behavior for safe runs without real DB.
- Expand Jest coverage to include controller-level tests.


### Future Milestones
- Add cross-service communication (Evidence Engine → Legal AI Engine aggregation).
- Implement authentication + user profiles.
- Add full case file assembly (affidavits, exhibits, indexes).
- Build dashboard UI for end-to-end legal workflow.

## Appendix A – Prompt Templates (Best Practice)

### 1. Daily Task Flow Prompt
```
Header: date/time (local), repo(s), branch, cwd(s), active services/ports, today’s focus.
Status dashboard: services up/down; last tests + result (pytest -q, npm test); git status -sb clean?; open PRs?
Intent: <what I need to accomplish this session>.
Context: repo(s), branch, service, cwd, active terminals.
Tasks: <ordered list of tasks or checkpoints>.
Format: commands first (macOS + zsh), brief notes second; keep concise.
Constraints: apply best-practice procedure, avoid destructive changes, confirm before high-risk steps.
Request: Summarize plan, ask "Proceed?" before executing major actions.
Quick-start (reference):
- From ~/Mitchopolis: ./run_evidence_api_dev.sh
- From ~/Mitchopolis/evidence_engine: source venv/bin/activate; pytest -q
- From ~/Mitchopolis/legal_ai_engine: npm test
- Ports: lsof -i :8000 and :3000
Working dirs: root for launcher; evidence_engine for Python work; legal_ai_engine for Node work.
```

### 2. Technical Command Prompt
```
You are on macOS using zsh. Provide exact commands to <objective>.
Assume cwd: <path>. Avoid sudo or network unless requested.
Return a shell block with commands only, then a one-line explanation.
```

### 3. Code-Modification Prompt (VS Code)
```
Goal: <describe change>.
File(s): <path(s)>.
Context: repo, branch, language/framework constraints.
Instructions: use apply_patch when small; keep ASCII unless existing Unicode; minimal, useful comments only.
Output: step-by-step edits plus verification commands/tests to run.
```

### 4. Documentation Update Prompt
```
Append to <doc path>:
- Date:
- Changes made:
- Tests run:
- Next steps:
Use concise bullets; avoid repeating existing log entries.
```

### 5. Git Hygiene Prompt
```
Run from <repo path>:
1) git status -sb
2) git add <files>
3) git commit -m "<type>(<scope>): <summary>"
4) git push origin <branch>
Confirm clean working tree at the end.
```

### 6. Shutdown Procedure Prompt
```
Stop services: CTRL+C uvicorn (port 8000), CTRL+C npm run dev (port 3000).
Verify ports: lsof -i :8000 and :3000 should be empty.
Git sync: git status -sb; commit/push if needed.
Close apps: VS Code, Terminal; confirm cloud sync indicators.
```

### 7. Recon/Diagnostic Prompt
```
Intent: diagnose <issue/area>.
Context: repo/service, branch, cwd, env (venv/node), ports of interest.
Procedure: list safe read-only checks (version, env vars, lsof, ps, logs).
Format: commands first, expected signals second; call out risks; request confirmation if a command could be disruptive.
```
## Daily Log — 2025-11-25
- Implemented and tested a ZIP export helper in the Evidence Engine.
- Added a configurable `/api/evidence/export` endpoint to `router.py` which zips a chosen folder (via `folder` query param, env var fallback, or default `~/Mitchopolis/parenting_evidence/text_logs`) and returns it as `application/zip`.
- Wrote and passed an integration test (`test_export_endpoint.py`) using FastAPI’s `TestClient` to verify the endpoint’s status code and headers.
- Created branch `feature/export-configurable`, committed and pushed the changes, and added `.DS_Store` to `.gitignore`.
- Confirmed that all tests (including the new integration test) pass in GitHub Actions / local test suite.

## Day 3 — Planned Tasks
- **Ingest endpoint:** Restore the stashed `ocr.py`, `router.py`, and `test_ingest_endpoint.py` changes and finish the `/api/evidence/ingest` endpoint. Write and run an integration test for it.
- **Packaging pipeline:** Begin integrating the ZIP exporter into a full “court‑ready package” pipeline (ZIP + PDF generation) and verify naming conventions.
- **Documentation:** Update `README.md` and project docs to describe the new export endpoint and its configuration (folder param, env var).
- **Folder descriptions:** Add short descriptions of each project folder (`evidence_engine`, `legal_ai_engine`, `mitchopolis_core`, `docs`, etc.) to the Best Practices Log for quick reference.
- **PR housekeeping:** Open a pull request for `feature/export-configurable` with a clear title/description and assign reviewer(s).