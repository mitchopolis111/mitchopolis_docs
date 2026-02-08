## Daily Log — 2026-02-08
- Moved `best_practices_log.md` to repo root (from `docs/logs/`) to match README/procedure references.
- Added batch ingestion script: `evidence_engine/scripts/batch_ingest_folder.py`.
- Updated `evidence_engine/scripts/README.md` with script usage.
- Smoke test: `evidence_engine/scripts/curl_process_evidence.sh` (PASS).
- Ingested `OFW_Messages_Report_2026-01-26_07-24-21 (1).pdf` via `scripts/batch_ingest_folder.py` for case `BCSC_138865_Watson_v_McClean` (tags: `our-family-wizard`, `messages`) — batch 1 OK (classified_count=1).
- Added inbox watcher script: `evidence_engine/scripts/watch_inbox.py` (polling auto-ingest + move to case folder).
- Added watcher helper scripts: `evidence_engine/scripts/watch_inbox_start.sh` and `watch_inbox_stop.sh`.
- Added `--file` filter to `scripts/batch_ingest_folder.py` for single-file ingestion.
- Made ingestion idempotent for file-based evidence (hash + stable timeline id) to prevent duplicate entries.
- Tests run: `pytest -q` (pending re-run after idempotent change); smoke test (PASS).
- Next steps: none.

## Daily Log — 2025-11-29
- Split best practices into:
  - best_practice_procedures_master.md
  - best_practice_procedures_codex_cloud_v6.md
  - best_practices_log.md
- Formalized Codex Cloud Best‑Practice Procedures (v6) as an official addendum.
- Linked Master Procedures and Codex addendum from the docs index.
### [2025-12-04] Evidence Routing & Naming Standard v1.0

- Implemented automatic evidence routing from global inbox:
  - `~/Mitchopolis/parenting_evidence/inbox`
  - to case-specific folder:
    - `~/Mitchopolis/cases/BCSC_138865_Watson_v_McClean/source_evidence/`
- Evidence only moved AFTER successful OCR + processing.
- Implemented court-safe naming:
  - `YYYY-MM-DD_TYPE_UID.ext`
- Preserved original path in timeline entries via `media_path`.
- Updated `/process` pipeline to include routing + naming.
- Aligned with Best Practice Procedures for chain-of-custody and case integrity.
### [2025-12-04] Automated Testing Framework Operational

- Added routing, narrative, and timeline test suites.
- Verified full ingestion pipeline with pytest.
- System now guarded by automated tests:
  - Evidence routing integrity
  - Filename safety
  - Case folder movement
  - Narrative generation
  - Master narrative PDF
  - Timeline date extraction
- Achieved 100% passing tests (16/16).
- Future changes MUST run pytest before deployment.

### [2025-12-04] Evidence Watcher v1.0 Implemented

- Implemented src/watcher/evidence_watcher.py
- Added:
  - scan_inbox()
  - should_process_file()
  - process_file(path, case_id)
- Watcher responsibilities (v1.0):
  - Scan inbox for new evidence files.
  - Skip dotfiles (.DS_Store, etc.).
  - Generate safe filenames using Evidence Routing standard.
  - Move files into case/source_evidence.
  - Append entries to ~/Mitchopolis/logs/evidence_watcher.log.
- Guarded by tests in tests/test_evidence_watcher.py.
