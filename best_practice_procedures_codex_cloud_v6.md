# Codex Cloud Addendum (v6)

Rules for delegating work to Codex Cloud while keeping ownership, safety, and traceability.

## When to Delegate
- Use Codex for structured tasks: refactors, test authoring, doc generation, and repetitive edits.
- Keep sensitive data local; mask PII in prompts. Do not paste inbox contents or exports.
- Avoid delegating destructive actions (mass deletes, resets) without local review.

## Delegation Flow
- Provide crisp goals, constraints, and file paths. Share failing tests or reproduction steps.
- Require a plan for multi-step work; approve before execution.
- Prefer `rg`/`pytest`/`npm test` and avoid network calls unless explicitly needed.
- After changes, request a summary with file references and suggested next steps.

## Branch & Review Discipline
- Codex work happens on feature branches (`feature/<scope>`). No direct commits to `main`.
- Always run relevant tests locally before merging. If tests are skipped, document why.
- Review AI changes like any PR: check diffs, verify logs, and run the services.

## Safety & Logging
- No secrets in commands or prompts. `.env` stays local.
- Capture notable sessions in `docs/best_practices_log.md`: what was delegated, outcomes, follow-ups.
- If Codex hits sandbox limits, prefer local manual steps over expanding privileges.

## Testing Expectations
- Python: `pytest -q` in `evidence_engine`; mock external services/OCR.
- Node: `npm test -- --runInBand` in `legal_ai_engine`; keep controllers pure and inject dependencies for tests.
- Add tests alongside new endpoints or behaviors before calling work “done.”
