# `editor_dragRaceEditor_strips`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/strips.lua` · VM : Game Engine (GE) · 1061 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_strips` : `extensions.load("editor_dragRaceEditor_strips")`, puis la globale `editor_dragRaceEditor_strips`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_strips.addStrip()` |  | 227 |
| `editor_dragRaceEditor_strips.beginBoundaryDrag(boundary)` |  | 945 |
| `editor_dragRaceEditor_strips.draggingBoundary(boundary)` |  | 953 |
| `editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr)` |  | 981 |
| `editor_dragRaceEditor_strips.drawBoundariesInWorld()` |  | 1031 |
| `editor_dragRaceEditor_strips.drawLaneEditor()` |  | 659 |
| `editor_dragRaceEditor_strips.drawStripDetails()` |  | 434 |
| `editor_dragRaceEditor_strips.drawStripsList()` |  | 372 |
| `editor_dragRaceEditor_strips.drawStripsPreview()` |  | 919 |
| `editor_dragRaceEditor_strips.drawZonesInWorld()` |  | 894 |
| `editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex)` |  | 639 |
| `editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary)` |  | 927 |
| `editor_dragRaceEditor_strips.endBoundaryDrag(boundary)` |  | 977 |
| `editor_dragRaceEditor_strips.getAllStrips()` |  | 171 |
| `editor_dragRaceEditor_strips.getSelectedLane()` |  | 651 |
| `editor_dragRaceEditor_strips.getSelectedStrip()` |  | 192 |
| `editor_dragRaceEditor_strips.getSelectedStripIndex()` |  | 184 |
| `editor_dragRaceEditor_strips.hasSavedStrips()` |  | 175 |
| `editor_dragRaceEditor_strips.loadAllStrips()` |  | 157 |
| `editor_dragRaceEditor_strips.removeSelectedStrip()` |  | 313 |
| `editor_dragRaceEditor_strips.saveStrip(strip)` |  | 327 |
| `editor_dragRaceEditor_strips.selectStrip(index)` |  | 199 |
| `editor_dragRaceEditor_strips.setSelectedStripIndex(index)` |  | 188 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `renameFile`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `setName`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/strips.lua`.*
