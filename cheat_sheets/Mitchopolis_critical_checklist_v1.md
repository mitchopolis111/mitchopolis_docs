# MITCHOPOLIS CRITICAL ENGINEERING CHECKLIST v1.0
Phase‑3 Stability Protocol • Mandatory for Router, Timeline, OCR, Bundle, Watcher, and Process Layers

---

## SECTION 1 — CORE RULES (NEVER BREAK THESE)

1. **Never modify `router.py` and `timeline.py` in the same patch.**
2. **Do not change Pydantic models mid-session.**
3. **Never create circular imports.**
4. **Never run Python modules directly** (e.g. `python src/router.py`).
5. **Every change must be validated by targeted pytest runs.**
6. Before stopping work → **`pytest -q` must be green.**

---

## SECTION 2 — MODULE CHECKS

### A. ROUTER (`src/router.py`)
Router may only import the following:

- `from .models import …`
- `from .ocr import safe_extract_text`
- `from .routing import route_evidence_file`
- `from .analysis.narrative import generate_narrative, generate_master_narrative_pdf`
- `from .analysis.timeline import TimelineEntry, append_timeline_entry, extract_timestamp`
- `from .utils.court_bundle_v2 import build_court_bundle`
- `from .utils.zip_exporter import zip_folder`

Router must pass:
- `pytest -q tests/test_routing.py`
- `pytest -q tests/test_process_evidence.py`
- `pytest -q tests/test_ingest_endpoint.py`
- `pytest -q tests/test_export_endpoint.py`
- `pytest -q tests/test_narrative_generation.py`
- `pytest -q tests/test_court_bundle.py`

---

### B. MODELS (`src/models.py`)
Required fields:

**ProcessEvidenceRequest**
- case_id: str
- items: List[EvidenceItem]

**EvidenceItem**
- id (optional)
- source
- content
- media_path (optional)
- tags[]

**ProcessEvidenceResponse**
- ocr_text: str
- narrative: dict
- timeline: list
- routed_path: optional str

Models must pass:
- `pytest -q tests/test_ingest_endpoint.py`
- `pytest -q tests/test_process_evidence.py`

---

### C. TIMELINE (`src/analysis/timeline.py`)
- `extract_timestamp()` must return “YYYY-MM-DD”
- Must detect:
  - ISO dates (`2025‑11‑20`)
  - Embedded filename styles (`OFW_Messages_2025-12-01.pdf`)
- Must define:
  - `TimelineEntry`
  - `append_timeline_entry`
  - `extract_date` alias

Must pass:
- `pytest -q tests/test_timeline_date_extraction.py`

---

### D. OCR ENGINE (`src/ocr/ocr_engine.py`)
- `safe_extract_text()` must **never raise** and must **always return a string**.
- If OCR engine missing → return placeholder:
  - `[OCR DISABLED] filename`
- Must pass all routing and process tests.

---

### E. ZIP EXPORTER (`src/utils/zip_exporter.py`)
Must define:
- `EXPORT_ROOT`
- `zip_folder(path: Path) -> Path`

Must pass:
- `pytest -q tests/test_zip_exporter.py`

---

### F. COURT BUNDLE (`src/utils/court_bundle_v2.py`)
Bundle must include:
- exhibits/
- raw/
- timeline.csv
- metadata.json
- index.md

Saved to:
`~/Mitchopolis/cases/<case>/bundles/`

Must pass:
- `pytest -q tests/test_court_bundle.py`

---

### G. EVIDENCE WATCHER (Phase‑2 Legacy)
- Must **not** import router or narrative modules.
- Must skip dotfiles.
- Must safely move inbox files → case/source_evidence.
- Must pass watcher tests.

---

## SECTION 3 — PATCH RULES
1. **Only modify one module per patch.**
2. Run only relevant tests before full suite.
3. **Only commit when the module-specific tests are green.**

---

## SECTION 4 — FULL SUITE (MANDATORY BEFORE STOPPING WORK)
Run:

```
pytest -q
```

Everything must be green.

---

## SECTION 5 — NO‑GO RULES
Never:
- Modify router & timeline in same patch.
- Change models mid-session.
- Create circular imports.
- Run python files directly.

---

## SECTION 6 — “GREEN STATE” DEFINITION
You are in a stable engineering state when:

- All tests pass (`pytest -q`).
- Router stable.
- Models stable.
- Timeline stable.
- OCR cannot crash.
- Zip exporter stable.
- Bundle generator stable.
- Watcher stable.
- Documentation updated.

---

END OF CHECKLIST v1.0