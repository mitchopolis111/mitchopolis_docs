# Watcher v2 — Auto-Ingest Pipeline (Design Document)

## Purpose
Watcher v2 automates evidence ingestion end-to-end:

Inbox → OCR → Classification → Narrative → Routing → Timeline → Audit Log.

## Core Loop
1. Scan inbox directory  
2. For each new file:
   - Validate extension  
   - OCR → text  
   - Classify evidence type  
   - Generate narrative (Narrative Engine v2)  
   - Construct safe filename  
   - Route into case path  
   - Append timeline entry  
   - Log operation (watcher_v2.log)

## Internal Modules
- reader.py — loads and validates raw evidence  
- ocr.py — performs OCR  
- classifier.py — detects evidence type  
- narrative_v2.py — improved narrative model  
- router.py — moves evidence to case folder  
- timeline.py — writes timeline entries  
- audit.py — structured log entries

## Requirements
- Must be idempotent (no double processing)  
- Must skip hidden files  
- Must work offline using mocks  
- Must have full unit-test coverage  