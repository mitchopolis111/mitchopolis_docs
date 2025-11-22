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
- System Check:
  - Open new Terminal window
  - Validate environment paths
  - Confirm LaunchAgents status

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
## Daily Log — 2025-11-22
- Completed system health check (LaunchAgents + logs).
- Expanded Mac Folder Structure Standards.
- Created Git scaffolds for core repos.
- Loaded multi-repo VS Code workspace.
- Verified automation, pipeline, and environment stability.
- Prepared for Git initialization and repository structure refinement.
