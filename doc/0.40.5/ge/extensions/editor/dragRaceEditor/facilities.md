# `editor_dragRaceEditor_facilities`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/facilities.lua` · VM : Game Engine (GE) · 394 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_facilities` : `extensions.load("editor_dragRaceEditor_facilities")`, puis la globale `editor_dragRaceEditor_facilities`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_facilities.addFacility()` |  | 91 |
| `editor_dragRaceEditor_facilities.drawFacilitiesList()` |  | 197 |
| `editor_dragRaceEditor_facilities.drawFacilitiesPreview()` |  | 386 |
| `editor_dragRaceEditor_facilities.drawFacilityDetails()` |  | 248 |
| `editor_dragRaceEditor_facilities.getAllFacilities()` |  | 32 |
| `editor_dragRaceEditor_facilities.getSelectedFacility()` |  | 53 |
| `editor_dragRaceEditor_facilities.getSelectedFacilityIndex()` |  | 45 |
| `editor_dragRaceEditor_facilities.hasSavedFacilities()` |  | 36 |
| `editor_dragRaceEditor_facilities.loadAllFacilities()` |  | 18 |
| `editor_dragRaceEditor_facilities.removeSelectedFacility()` |  | 111 |
| `editor_dragRaceEditor_facilities.saveAllFacilities()` |  | 125 |
| `editor_dragRaceEditor_facilities.saveFacility(facility)` |  | 154 |
| `editor_dragRaceEditor_facilities.selectFacility(index)` |  | 60 |
| `editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index)` |  | 49 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `renameFile`
- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/facilities.lua`.*
