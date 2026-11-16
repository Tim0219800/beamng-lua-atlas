# `flowgraph_nodes_gameplay_race_filePath`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua` · VM: Game Engine (GE) · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/filePath")` (file under extensions/ but not a regular extension)

Flowgraph node "File Path" (category once_p_duration, tag scenario). Loads a race path (.race.json file) into a gameplay/race/path object, deserializes it, reverses it if requested, calls autoConfig() and publishes it. Inputs: file (string, path with or without .race.json, resolved by mgr:getRelativeAbsolutePath), reverse (bool). Outputs: pathData ('pathData' table for the other race nodes), name, desc, branching, closed, laps (default laps), checkpointCount (number of sorted pathnodes) and recoveryCount (pathnodes with a recovery point, depending on direction). Loading happens only once (as long as self.path is nil).

## Notes

- If the file cannot be found, a node error is set on the 'file' pin.
- In the editor, the properties panel offers to open the Race Editor and to hardcode the opened file into the file pin.
- The description of checkpointCount states that the count does not work for branching paths.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Forgets the loaded path when the graph stops. | 64 |
| `C:drawCustomProperties()` | Editor properties panel: button to open the Race Editor, name of the opened file and "Hardcode to File Pin" button. | 42 |
| `C:init(mgr, ...)` | Initializes self.path to nil and disables clearOutPinsOnStart. | 31 |
| `C:onNodeReset()` | Forgets the loaded path (self.path = nil) to force a reload. | 60 |
| `C:postInit()` | Restricts the file selector of the 'file' pin to "Race Files" (.race.json). | 36 |
| `C:work(args)` | Loads the race file if it is not loaded yet, applies reverse/autoConfig and fills all output pins. | 68 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua`.*
