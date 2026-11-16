# `gameplay_rally_recce`

*File: `lua/ge/extensions/gameplay/rally/recce.lua` · VM: Game Engine (GE) · 295 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/recce")` (file under extensions/ but not a regular extension)

High-level manager of a rally's recce recordings. It loads the driveline (timestamped points of the driven route, via recce/drivelineRecording) and the cuts (the co-driver's voice markers with their transcriptions, via recce/cutsRecording), draws them in debug, and converts the cuts into pacenote data (createPacenotesData) from a snaproad. It is mainly used by the worldEditor's rally editor (recce import and visualization).

## Example

```lua
local Recce = require('/lua/ge/extensions/gameplay/rally/recce')
local recce = Recce(missionDir)
recce:loadDrivelineAndCuts()
local pacenotes = recce:createPacenotesData(notebook)
```

## Notes

- The module returns a constructor: Recce(missionDir) creates the object and calls init.
- loadDrivelineAndCuts always returns true; _loadedDrivelineAndCuts is only true if the driveline AND at least one cut were found (checkable with drivelineAndCutsLoaded).
- createPacenotesData depends on editor_rallyEditor.getPrefDefaultRadius(): it therefore only works if the rally editor is loaded.
- createPacenotesData merges consecutive cuts falling on the same snaproad point: the duplicate's text is appended (separated by a space) to the previous pacenote's note.
- Probable inconsistency: createPacenotesData calls Snaproad(self) with the Recce object, whereas Snaproad reads driveline().points (rallyManager passes it a PointList); the Recce's driveline is in self.driveline.
- The RecceSettings are commented out in this file (unused).

## Class `C`

Recce object returned by the module's constructor.

The module returns a constructor: `local obj = require("gameplay_rally_recce")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_resetState()` | Sets self.driveline and self.cuts back to nil. | 50 |
| `C:createPacenotesData(notebook)` | Converts the cuts into pacenote tables for a notebook: creates a Snaproad on the driveline, places for each cut a "corner end" waypoint as close as possible to the cut and a "corner start" set back by about 2 times the default radius, names the note (Import_<id> ... or Pacenote ...) and puts the transcription in it in the default co-driver language. | 165 |
| `C:drawDebugCuts()` | Draws each cut as a small car, with its transcription text. | 95 |
| `C:drawDebugRecce(drawLabels, mouseInfo)` | Draws the driveline (via PointList:drawDebug) then the cuts. Does nothing without a driveline. | 89 |
| `C:drawLittleCar(pos, quat, txt)` | Draws with debugDrawer a schematic car (4.4 x 1.8 x 1.6 m, four wheels as spheres, body as a prism) centered on pos and oriented by quat; displays txt behind it if provided. | 106 |
| `C:drivelineAndCutsLoaded()` | Indicates whether driveline and cuts were successfully loaded by loadDrivelineAndCuts. | 46 |
| `C:init(missionDir)` | Initializes the object: stores missionDir, marks driveline/cuts as not loaded and resets the state. | 36 |
| `C:loadCuts()` | Loads the cuts with their transcriptions into self.cuts. | 75 |
| `C:loadDriveline()` | Loads the driveline (PointList) into self.driveline. | 80 |
| `C:loadDrivelineAndCuts()` | Loads the driveline then the cuts, logs a warning for each if missing (normal for a new recce). | 55 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/recce.lua`.*
