# `editor_rallyEditor_drivelineTab`

*Fichier : `lua/ge/extensions/editor/rallyEditor/drivelineTab.lua` · VM : Game Engine (GE) · 1326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/rallyEditor/drivelineTab")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_rallyEditor_drivelineTab")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateRaceDistance()` |  | 574 |
| `C:clearState()` |  | 94 |
| `C:computeSurfacePercentages(startPos, finishPos)` | Probe the terrain groundmodel along the race span (start line -> flying finish)<br> and return a map of category -> percentage (float, 1 decimal), only including<br> categories with a non-zero share. Returns nil if it can't be computed. | 618 |
| `C:createDrivelineFromSpline()` | Create a new driveline from the edited spline | 502 |
| `C:createTempRallyManager()` | Create a temporary rally manager with our current (possibly unsaved) drivelineV3<br> so we can query race path / distance against the in-editor geometry. | 548 |
| `C:deepCopySpline()` | Deep copy function for undo/redo | 485 |
| `C:draw(mouseInfo, dtReal, dtSim, dtRaw)` |  | 837 |
| `C:drawDebugEntrypoint(mouseInfo)` |  | 1186 |
| `C:formatDistance(dist)` |  | 182 |
| `C:formatDurationSecs(timeSecs)` |  | 208 |
| `C:generateBuffer()` | Generate buffer zone around driveline (experimental) | 772 |
| `C:getDrivelineLength()` |  | 444 |
| `C:getDrivelinePointCount()` |  | 463 |
| `C:getFinalDrivelineLength()` |  | 196 |
| `C:getMissionSilverTimeSecs()` |  | 221 |
| `C:handleSplineInteraction()` | Handle spline interaction (mouse/keyboard input) | 1314 |
| `C:hasFinalDriveline()` | Check if final driveline exists | 245 |
| `C:hasRecording()` | Check if recording driveline exists | 236 |
| `C:init(rallyEditor)` |  | 60 |
| `C:isPointInBuffer(point)` | Check if a point is inside the buffer zone | 814 |
| `C:loadFromFinal()` | Load from final driveline | 286 |
| `C:loadFromRace()` | Load from race path | 337 |
| `C:loadFromRecording()` | Load from recording (raw driveline) | 256 |
| `C:recalculateDrivelineStats()` |  | 517 |
| `C:recalculateRaceDistance()` |  | 531 |
| `C:redoSplineEdit(data)` | Redo callback | 496 |
| `C:refreshStats()` | Recompute the stored stats (race distance + surface composition) and persist<br> them into the driveline spline file under the top-level "stats" key. | 731 |
| `C:resetDrivelineStats()` |  | 510 |
| `C:saveFinalDriveline()` |  | 767 |
| `C:selected()` | called by RallyEditor when this tab is selected. | 169 |
| `C:setAverageSpeedFromSilverTimeAndRaceDistance()` |  | 594 |
| `C:setPath(path)` |  | 117 |
| `C:splineEditCallbacks()` |  | 157 |
| `C:undoSplineEdit(data)` | Undo callback | 490 |
| `C:unselect()` | called by RallyEditor when this tab is unselected. | 176 |
| `C:updateSplineGeometry()` |  | 476 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorEditModeChanged` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/rallyEditor/drivelineTab.lua`.*
