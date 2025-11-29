# Mitchopolis Docs

This repo contains operational docs, best‑practice procedures, and daily logs
for the Mitchopolis engineering system.

## Key Documents

- **Master procedures**  
  `best_practice_procedures_master.md`  
  Canonical rules for daily flow, automation, Git standards, folder structure,
  and shutdown procedure.

- **Codex Cloud addendum (v6)**  
  `best_practice_procedures_codex_cloud_v6.md`  
  When and how to delegate work to Codex Cloud; branch discipline; review rules.

- **Best practices log**  
  `best_practices_log.md`  
  Chronological record of changes to procedures, daily notes, and next‑day focus.

## Additional Reference

- `best_practices_log_v1.md` — commit conventions, branch naming, testing expectations, and cross-repo discipline.

## How to Use This Repo

1. New day or new machine → read the **Master procedures** first.
2. When using Codex Cloud → follow the **Codex addendum (v6)**.
3. At the end of each work session → append to the **Best practices log**:
   - What changed.
   - Tests run.
   - Next steps.

## Related Repos

- `evidence_engine` – Python service for ingestion/OCR/timelines.
- `legal_ai_engine` – Node/Express legal AI service.
- `_core` – Automation scripts, LaunchAgents, and system scripts.
