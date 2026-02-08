# Master Procedures — Mitchopolis

Authoritative daily operating guide for the local Mitchopolis environment. Keep this file close; update `docs/best_practices_log.md` when procedures change.

## Daily Startup
- `cd ~/Mitchopolis && git status -sb` in each repo (`evidence_engine`, `legal_ai_engine`, `_core`, `docs`) to ensure a clean state.
- Python work → `source evidence_engine/venv/bin/activate`; Node work → fresh shell without the venv.
- Run quick baselines: `pytest -q` in `evidence_engine`, `npm test -- --runInBand` in `legal_ai_engine`.
- Verify ports: `lsof -i :8000` (uvicorn), `lsof -i :3000` (node) before launching services.

## Branch & Commit Discipline
- Branch from `dev`: `feature/<scope>` or `chore/<scope>`. Never commit directly to `main`.
- Conventional commits: `feat(evidence): ...`, `fix(timeline): ...`, `chore(docs): ...`, `test(api): ...`.
- One logical change per commit; keep diffs small and reviewed. No mixed Python/Node changes in the same commit unless they are tightly coupled.

## Working Tree Hygiene
- No untracked artifacts: keep logs, exports, and venv out of Git. `.env` files stay local.
- If a service can’t start, stop and fix before proceeding—do not “work around” red health checks.
- `pytest`/`npm test` must be green before pushing. If skipping a test, explain why in the log.

## Coding Workflow
- Evidence Engine (FastAPI): add Pydantic models first, then routes, then tests. Keep OCR calls wrapped in `safe_extract_text`.
- Legal AI Engine (Express/Mongo): add Mongoose schema first, then controller, then route + Jest test.
- Favor pure functions and dependency injection for testability. Keep side effects at the edges (routers/controllers).
- Logging: info for start/stop, warning for recoverable issues, error for failures. Avoid printing secrets.

## Multi-Repo Discipline
- Cross-repo changes (e.g., API contract) require synchronized branches and updates in both services.
- Keep `_core` automation pointing at the current microservices; retire legacy scripts when duplicated.
- Document any new scripts or cron/LaunchAgent behavior in `docs/best_practices_log.md`.
- Every repo must have a clear root `README.md` that defines scope/boundaries, how to run/use it, and where deeper docs live.
- Docs repo is explicitly “procedures + log”; `docs/README.md` is the single “start here” entrypoint, with detail in linked procedure files.

## Data Handling
- Evidence lives under `~/Mitchopolis/parenting_evidence/` with subfolders `inbox/`, `text_logs/`, `timelines/`, `exports/`.
- Do not delete or overwrite originals; exports should be additive with timestamps.
- Treat PII as sensitive: no uploading to external services; redact before sharing.

## Shutdown Checklist
- Stop running services (CTRL+C). Confirm ports 8000/3000 are free.
- `deactivate` Python venv if active.
- Append end-of-day notes to `docs/best_practices_log.md`: what changed, tests run, next steps.

## Incident Handling
- If automation misclassifies or crashes, capture logs and reproduction steps, then document in the log file.
- Roll forward with fixes rather than manual data edits; keep patches auditable.
## Automated Test Requirements (Mandatory)

Before modifying or deploying any part of the Evidence Engine:

1. Stop server.
2. Activate venv.
3. Run full test suite:
   pytest -q
4. Confirm passing state:
   > all tests passed
5. If any tests fail → STOP and fix before continuing.
