# Narrative Engine v2 — Specification

## Purpose
Transform OCR → structured legal narrative.

## Requirements
- Template-based structure  
- Extract key elements:
  - Parties  
  - Location  
  - Timeline  
  - Key incident  
- Maintain consistent tone  
- Return:
```
{
  "narrative_text": "...",
  "summary": "...",
  "confidence": float
}
```

## Improvements over v1
- Legal coherence  
- Reduced hallucination  
- Deterministic section headers  
- More robust to poor OCR  