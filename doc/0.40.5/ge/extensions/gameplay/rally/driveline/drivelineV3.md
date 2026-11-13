# `gameplay_rally_driveline_drivelineV3`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua` · VM : Game Engine (GE) · 770 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/drivelineV3")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_drivelineV3")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_findSegmentRange(p1, p2)` | Projects p1 and p2 onto the final driveline segments and returns the ordered<br> segment range covering the span between them:<br>   startIdx, startXnorm, endIdx, endXnorm (startIdx/startXnorm always come first)<br> Returns nil if the range cannot be resolved. | 662 |
| `C:calculateDistanceBetweenPoints(p1, p2)` |  | 724 |
| `C:convertDrivelineToSpline(drivelinePoints)` | Convert driveline points to spline structure with RDP simplification | 335 |
| `C:createDrivelineFromSpline()` | Create a new driveline from the edited spline | 481 |
| `C:createDrivelinePointsFromPositions(positions)` | Helper: Convert array of positions to full driveline point structure | 418 |
| `C:createEmptySpline(name, isLoop, id)` |  | 65 |
| `C:deepCopySpline()` | Deep copy function for undo/redo | 503 |
| `C:getFinalPointList()` | Get a PointList from the final points | 493 |
| `C:getLiaisonAllocatedTimeSecs()` |  | 654 |
| `C:getPointsBetween(p1, p2)` | Returns the ordered list of finalDrivelinePoints covering the span between p1<br> and p2 (inclusive of the segment endpoints), or nil if it can't be resolved. | 713 |
| `C:getSpeedLimitKph()` |  | 650 |
| `C:init(missionDir)` |  | 41 |
| `C:loadDrivelineFromFile()` |  | 266 |
| `C:loadDrivelineSplineFromFile()` |  | 176 |
| `C:loadFinalDrivelineFromFile()` | Load final driveline from JSON file | 228 |
| `C:loadFromRecording()` | Complete loading pipeline: load raw recording → convert → process → generate final points | 306 |
| `C:loadPropertiesFromData(data)` |  | 86 |
| `C:loadRecceRecording()` | Load raw driveline recording from recce | 209 |
| `C:loadSplineFromData(data)` |  | 120 |
| `C:renderFinalDriveline()` | Render final driveline points | 587 |
| `C:renderRawDriveline()` | Render raw driveline points | 537 |
| `C:renderSmoothCurve(lineWidth)` | Render smooth spline curve | 563 |
| `C:renderSpline(selectedNodeIdx)` | Render editable spline with nodes | 613 |
| `C:saveSplineToFile()` |  | 145 |
| `C:serializeSpline()` |  | 97 |
| `C:updateSplineGeometry()` | Update spline geometry (compute smooth curve, terrain conformance) | 383 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `FS:` `directoryCreate`, `fileExists`
- `debugDrawer:` `drawCylinder`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/drivelineV3.lua`.*
