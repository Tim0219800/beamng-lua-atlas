# `editor_rallyEditor_measurementsTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/measurementsTab.lua` · VM : Game Engine (GE) · 1174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/measurementsTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_measurementsTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addPointToMeasurement(measurementId, point)` | Add point to measurement | 576 |
| `C:calculateMeasurementDistance(measurementId)` | Calculate total distance for a measurement | 630 |
| `C:clearState()` |  | 45 |
| `C:createMeasurement(name)` | Create a new measurement | 502 |
| `C:deleteMeasurement(measurementId)` | Delete measurement | 546 |
| `C:deserialize(data)` | Deserialize measurements from JSON data | 103 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` |  | 982 |
| `C:drawDebugEntrypoint()` | Draw debug visualization for measurements and snaproad | 236 |
| `C:drawMeasurementPoints()` | Draw measurement points and lines | 250 |
| `C:findNearestPoint(mousePos)` | Find the nearest point to the mouse position | 747 |
| `C:getMeasurement(measurementId)` | Get measurement by ID | 532 |
| `C:getMeasurementsFilePath()` | Get the measurements file path | 64 |
| `C:handleMouseInput()` | Handle mouse interactions for placing, selecting, and moving measurement points | 772 |
| `C:init(rallyEditor)` |  | 26 |
| `C:loadMeasurements()` | Load measurements from file | 155 |
| `C:movePointDown(measurementId, pointIndex)` | Move point down in measurement (increase index) | 617 |
| `C:movePointUp(measurementId, pointIndex)` | Move point up in measurement (decrease index) | 604 |
| `C:removePointFromMeasurement(measurementId, pointIndex)` | Remove point from measurement | 589 |
| `C:saveMeasurements()` | Save measurements to file (auto-save) | 140 |
| `C:selectMeasurement(measurementId)` | Select a measurement | 569 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 203 |
| `C:serialize()` | Serialize measurements to JSON-compatible format | 74 |
| `C:setPath(path)` | this is the notebook. why am I still calling it a path??? | 193 |
| `C:setSnaproad(snaproad)` | Set the snaproad for distance calculations | 198 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 228 |
| `C:updateMeasurement(measurementId, name)` | Update measurement name | 537 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `stat`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/measurementsTab.lua`.*
