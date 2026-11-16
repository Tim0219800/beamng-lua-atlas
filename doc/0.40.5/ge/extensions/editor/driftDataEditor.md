# `editor_driftDataEditor`

*File: `lua/ge/extensions/editor/driftDataEditor.lua` · VM: Game Engine (GE) · 864 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_driftDataEditor`: `extensions.load("editor_driftDataEditor")`, then the global `editor_driftDataEditor`

Drift Data Editor (Gameplay > Drift Data Editor menu): two-tab window for drift mode data. "Drift stunt zones editor" creates, moves and reorders stunt zones (donut, driftThrough, hitPole, nearPole) with their score, and saves them as JSON (by default in /gameplay/temp/). "Drift spots editor" edits the drift spots of the current level (lines with position, rotation, scale, entry direction, big map teleport point, objective info) loaded via gameplay_drift_saveLoad. Requires a loaded level.

## Notes

- Proposed zone types and score tiers: driftThrough 1000/1500/2000 (max points), donut 250/500/750 (fixed points), hitPole and nearPole 500/1000/1500 (max points). The default score comes from gameplay_drift_scoring.getScoreOptions().defaultPoints.
- Positions, rotations and scales read from a JSON are converted to vec3/quat on load.
- Only donut, driftThrough and hitPole have a transform gizmo in selectStuntZone; nearPole has none.
- Probable bug: the variable logTag used in loadDriftData is not declared in this file (nil): the file-not-found error message is logged without a tag.
- onSerialize/onDeserialized keep the current file, the zones and the selected index across a reload; the selection is restored later via autoSelectElement.
- M.drawAxisBox is a duplicate of the box drawing utilities of the other editors.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_driftDataEditor.clearStuntZonesEditor()` | Resets the stunt zones tab: current file reset to /gameplay/temp/ with no name, empty data ({stuntZones = {}}). Also called when the Drift spots tab is displayed. *(internal)* | 171 |
| `editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr)` | Draws a solid box as debug (front/back face triangles and black edges) from a corner and three edge vectors. | 795 |
| `editor_driftDataEditor.drawElementDetail(elem)` | Draws the editing UI of the selected zone: updates pos/rot/scl from the gizmo (transformUtil), the cooldown delay if present, and the score via a tier list depending on the type. | 58 |
| `editor_driftDataEditor.onDeserialized(data)` | Post-reload hook: restores the file, the data and the index to reselect. *(internal)* *(hook)* | 749 |
| `editor_driftDataEditor.onEditorGui()` | Per-frame hook: draws the tabs if a level is loaded, otherwise a message asking to load a level. *(internal)* *(hook)* | 699 |
| `editor_driftDataEditor.onEditorInitialized()` | Hook: registers the window (1500x700), the Gameplay menu entry and creates empty data if needed. *(internal)* *(hook)* | 731 |
| `editor_driftDataEditor.onSerialize()` | Pre-reload hook: returns selectedStuntZoneIndex, currentFileDir, currentFileName and driftData. *(internal)* *(hook)* | 739 |
| `editor_driftDataEditor.selectStuntZone(index)` | Selects a stunt zone and creates the gizmo suited to its type (donut: position and uniform scale; driftThrough: position, rotation, scale; hitPole: position). *(internal)* | 113 |
| `editor_driftDataEditor.show()` | Clears the object selection and shows the driftDataEditor window. | 726 |
| `editor_driftDataEditor.updateMouseInfo()` | Updates the local mouse table (camera ray, raycast, click/hold/release and associated positions) used by the gizmos. | 759 |

### Parameter details

#### `editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr)`

Draws a solid box as debug (front/back face triangles and black edges) from a corner and three edge vectors.

- `corner` (*vec3*) : corner
- `x` (*vec3*) : X edge
- `y` (*vec3*) : Y edge
- `z` (*vec3*) : Z edge
- `clr` (*ColorF*) : color

#### `editor_driftDataEditor.drawElementDetail(elem)`

Draws the editing UI of the selected zone: updates pos/rot/scl from the gizmo (transformUtil), the cooldown delay if present, and the score via a tier list depending on the type.

- `elem` (*table|nil*) : stunt zone (type, pos, rot, scl, score, cooldown)

#### `editor_driftDataEditor.onDeserialized(data)`

Post-reload hook: restores the file, the data and the index to reselect.

- `data` (*table*) : table produced by onSerialize

#### `editor_driftDataEditor.onSerialize()`

Pre-reload hook: returns selectedStuntZoneIndex, currentFileDir, currentFileName and driftData.

- **returns**: table state to keep

#### `editor_driftDataEditor.selectStuntZone(index)`

Selects a stunt zone and creates the gizmo suited to its type (donut: position and uniform scale; driftThrough: position, rotation, scale; hitPole: position).

- `index` (*integer*) : index (1-based) in driftData.stuntZones

## Calls into the engine (C++)

- `FS:` `remove`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawCylinder`, `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`
- `obj:` `getPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/driftDataEditor.lua`.*
