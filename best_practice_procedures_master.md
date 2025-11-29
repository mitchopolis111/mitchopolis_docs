# Mitchopolis Best‑Practice Procedures — Master

## 1. Purpose & Scope
- Define how to operate the Mitchopolis system (Mac, repos, automations, Codex Cloud).
- This file is versioned and changes require an explicit version bump.

## 2. Daily Task Flow (Standard Pattern)
- Infra / system dependencies first.
- Workflow + automation second.
- Documentation / reflection third.
- Reference: Daily Task Flow template (see log for concrete daily instances).

## 3. Automation Principles
- Start simple: single stable trigger (e.g., `make full`).
- Stabilize before modularizing into separate scripts.
- Confirm correct folder paths before wiring automation.
- Disable old/duplicate LaunchAgents to avoid overlap.

## 4. Terminal & Environment Rules
- Use a new Terminal window for system‑level commands (LaunchAgents, etc.).
- Keep venv‑contained work isolated per repo.
- End‑of‑day system checks run from a clean Terminal window.

## 5. Projects & Chat Routing
- Each ChatGPT project only accesses its own files.
- This project: task flows and best practices only.
- Prompt procedure (see §6).

## 6. Prompt Procedure (Best Practice)
- Intent first: what outcome is desired.
- Context: repo/service, branch, folder, terminal.
- Format: commands first, explanations second.
- Constraints: best‑practice procedure, safety flags.
- Require final confirmation step before major ops.

## 7. Mac Folder Structure Standards
- Root: `~/Mitchopolis`.
- `_core/`: automation, scripts, LaunchAgents, logs.
- `evidence_engine/`: Python microservice (ingestion/OCR/classification/timeline).
- `legal_ai_engine/`: Node/Express microservice (legal AI).
- `parenting_evidence/`: user + machine evidence (inbox/exports/audio/photos/text_logs/timelines/witness_statements/metadata).
- `docs/`: logs, best practices, operational reference.
- Naming, sync, and backup rules.

## 8. Git Standards & Multi‑Repo Workflow
- Global Git config (name/email, default `main`).
- Branch model: `main` (stable), `dev`, `feature/*`, `hotfix/*`.
- Commit message convention (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`).
- Clean working tree rule.
- Multi‑repo discipline (no cross‑repo commits, heavy assets out of Git).

## 9. Operational Wait‑Time Guide (OWTG)
- Terminal/automations timing.
- Filesystem operations.
- Cloud sync (iCloud/Drive).
- MongoDB/network waits.
- Git operations.
- Mac automation timing.
- Summary rule: when in doubt, 1–3s; cloud/automation, 5–10s.

## 10. Service‑Specific Procedures (Skeletons)
### 10.1 Evidence Engine
- Location, stack, health checks.
- Standard dev run.
- Testing requirements before commit/PR.
- Endpoint rules (health, process, ingest, export).

### 10.2 Legal AI Engine
- Location, stack, health checks.
- Standard dev run.
- Testing requirements.
- Endpoint rules.

*(You already have the overview text; just reshape it into “do X before Y” style.)*

## 11. Shutdown Procedure (Daily Closeout)
- Stop services on ports 8000 and 3000 (CTRL+C; verify with `lsof`).
- Clean environment state (close Terminal tabs).
- Git sync (clean working trees, push to origin).
- Close apps; verify cloud sync.

## 12. Appendices
- Appendix A: Prompt templates.
- Appendix B: Codex Cloud Procedures (v6) — or link to `best_practice_procedures_codex_cloud_v6.md`.
