# Court Bundle v3 — Specification

## Improvements
- Exhibit stamping on each PDF  
- Metadata sheet (case name, registry, sworn date)  
- Enhanced index:
  - File type  
  - First narrative line  
  - Timestamps  
- ZIP layout:
```
bundle_v3/
   exhibits/
   index.csv
   metadata.yaml
   raw/
```

## Rules
- Maintain deterministic exhibit order  
- Maintain compatibility with earlier versions  
- Test: bundle must open in Preview and Windows  