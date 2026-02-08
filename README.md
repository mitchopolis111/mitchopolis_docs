# Mitchopolis Docs

This repo contains operational docs, best-practice procedures, architecture references, and daily engineering logs for the Mitchopolis Legal Automation System.

The documentation is organized into clear subfolders aligned with the **Best Practice Procedures Master** and Codex Cloud operational model.

---

## 📘 Mitchopolis Master Cheat Sheet v2.0

A consolidated, always-up-to-date operational reference for the Mitchopolis Evidence Engine and Case Management System.

**Files:**

- **Markdown:**  
  [`mitchopolis_master_cheat_sheet_v2.md`](cheat_sheets/mitchopolis_master_cheat_sheet_v2.md)

- **PDF (standard formatting):**  
  [`mitchopolis_master_cheat_sheet_v2.pdf`](cheat_sheets/mitchopolis_master_cheat_sheet_v2.pdf)

- **Rebuild Script:**  
  [`make_cheat_sheet_pdf.sh`](cheat_sheets/make_cheat_sheet_pdf.sh)

**Purpose:**  
Provides quick access to:

- CONTROL + LOG terminal workflow  
- Evidence Engine start/stop commands  
- Case ID alignment protocol  
- Evidence routing + naming standards v1.0  
- Folder architecture  
- Narrative Engine (item-level + master)  
- Court Bundle v2.1 generation  
- Watcher Protocol v1.0  
- Pytest zsh-safe rules  
- Restart/hotfix commands  
- ASCII + Mermaid diagrams  
- Phase 3 readiness checklist  

Use this cheat sheet daily during development, testing, evidence ingestion, bundle creation, or court-prep workflows.

---

## 📁 Folder Structure

```
/docs
 ├── logs/                  # Build logs for each engineering phase
 │     ├── phase1_build_log.md
 │     ├── phase1_build_log.pdf
 │     ├── phase2_build_log.md
 │     ├── phase2_build_log.pdf
 │
 ├── cheat_sheets/          # Quick reference tools for daily operations
 │     ├── mitchopolis_master_cheat_sheet_v2.md
 │     ├── mitchopolis_master_cheat_sheet_v2.pdf
 │     ├── make_cheat_sheet_pdf.sh
 │     ├── iterm2_cheat_sheet.md
 │     └── api_cheat_sheet.md
 │
 ├── architecture/          # System design and architecture documents
 │     ├── evidence_engine_architecture.md
 │     ├── narrative_engine_architecture.md
 │     ├── court_bundle_pipeline.md
 │     └── diagrams/
 │          └── system_diagram.png
 │
 └── README.md              # (this file)
```

---

## 📘 Key Documents

### Master Procedures  
`best_practice_procedures_master.md`  
Canonical rules for daily flow, automation, Git discipline, folder standards, and shutdown protocol.

### Codex Cloud Addendum (v6)  
`best_practice_procedures_codex_cloud_v6.md`  
Rules for task delegation, branch discipline, review workflow, and safe AI usage.

### Best Practices Log  
`best_practices_log.md`  
Daily reflections, procedural improvements, completed tasks, and next-day focus.

---

## 🧩 Phase Build Logs

Detailed logs capturing engineering decisions, blockers, fixes, and phase milestones.

- **Phase 1 — Evidence Engine Foundations**  
  `logs/phase1_build_log.md` / `.pdf`

- **Phase 2 — Narrative Engine & Court Bundle Automation**  
  `logs/phase2_build_log.md` / `.pdf`

Future phases will be added as the system evolves.

---

## ⚡ Cheat Sheets (Daily Use)

Located in `cheat_sheets/`:

- **Master Cheat Sheet v2 (Current)**  
  Consolidated operational workflows and engine procedures.

- **iTerm2 Control/Log Workflow Guide**  
  Establishes reliable split-pane development.

- **API Quick Reference**  
  Endpoints, payloads, and common usage patterns.

These documents ensure consistency, speed, and confidence across work sessions.

---

## 🏗 Architecture Docs

Located in `architecture/`:

- Evidence Engine Architecture  
- Narrative Engine Architecture  
- Court Bundle Pipeline v2.x  
- PNG/PDF diagrams, PlantUML sources, and technical deep dives  

These support long-term scalability and onboarding.

---

## 🚀 How to Use This Repo

1. **Start each day** with the **Master Procedures**.  
2. **When using Codex Cloud**, follow the **Codex Addendum v6**.  
3. **Use cheat sheets** continuously during development.  
4. **End each session** by updating the Best Practices Log:  
   - What changed  
   - Tests run  
   - Issues resolved  
   - Next steps  
5. **Consult build logs** for context between phases or long breaks.

---

## 🔗 Related Repos

- `evidence_engine` – Python OCR, ingestion, timeline, narrative, and bundle service.  
- `legal_ai_engine` – Node/Express legal AI pipeline.  
- `_core` – Automation, environment helpers, and system tasks.

---

## 📚 Documentation Navigation

- Cheat Sheets  
  - `cheat_sheets/mitchopolis_master_cheat_sheet_v2.md`  
  - `cheat_sheets/mitchopolis_master_cheat_sheet_v2.pdf`

- Architecture Documents  
  - `architecture/diagrams/`

- Logs  
  - `logs/`

- Evidence Engine  
  - `../evidence_engine/`

- Legal AI Engine  
  - `../legal_ai_engine/`
