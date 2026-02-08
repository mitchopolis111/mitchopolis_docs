# Best Practices Log (v1)

Canonical reference for Git standards, commit conventions, and day-to-day discipline. Update this file when standards change; record daily notes in `docs/best_practices_log.md`.

## Git Standards
- Default branch: `dev`. Branch naming: `feat/<scope>`, `fix/<scope>`, `chore/<scope>`, `docs/<scope>`, `test/<scope>`.
- Never commit directly to `main`. Rebase or merge from `dev` after tests are green.
- Keep commits small and scoped; avoid cross-language bundles unless necessary.
- Run `git status -sb` before and after work; ensure no stray files (exports, logs, venv).

## Commit Message Conventions
- Format: `<type>(<scope>): <description>`
- Types: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`, `perf`, `ci`.
- Scope examples: `evidence`, `timeline`, `ocr`, `api`, `legal`, `docs`.
- Examples:
  - `feat(evidence): add OCR fallback for PDFs`
  - `fix(timeline): handle missing timestamps`
  - `chore(ci): pin pytest version`

## Multi-Repo Discipline
- Coordinate changes across `evidence_engine`, `legal_ai_engine`, and `_core` when API contracts shift.
- Keep `_core` scripts aligned with the FastAPI/Express services; retire duplicate pipelines.
- Update READMEs and doc references when moving endpoints or scripts.

## Testing Expectations
- Evidence Engine: `pytest -q` minimum; add unit/integration tests for new routes and utilities.
- Legal AI Engine: `npm test -- --runInBand`; mock Mongo for controller tests.
- For cross-repo changes, run both suites before merge. Document any skips with rationale.

## Clean Working-Tree Guidelines
- Do not commit artifacts: `node_modules`, `venv`, `exports/`, `logs/`, `.env`.
- Strip secrets from configs and commands before sharing output.
- If automation fails (LaunchAgent, watcher), log the incident and fix forward with a PR.
- Before modifying routing, naming, or case paths, run:
  `pytest -q tests/test_routing.py`
- All routing changes must keep tests green.
