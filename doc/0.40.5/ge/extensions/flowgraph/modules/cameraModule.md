# `flowgraph_modules_cameraModule`

*File: `lua/ge/extensions/flowgraph/modules/cameraModule.lua` · VM: Game Engine (GE) · 141 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/cameraModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder -500, so one of the first) that manages camera paths (camPath) during a project. It loads a <name>/<name>.camPath.json file relative to the project via core_paths.loadPath, or stores a path provided in memory, then plays it with core_paths.playPath. It tracks the active path, the number of path completions and the loop mode.

## Notes

- Paths are identified by an integer id local to the module (getFreeId) and indexed by name in pathIds.
- Bug (copy-paste): getCmd returns a command that calls the 'button' module (buttonClicked); unusable for the camera.
- afterTrigger contains an empty scheduleAction block.
- isPathComplete raises an error if activePathId == id but completions is nil (should not happen after startPath).
- getPathDuration reads the time of the last marker; error if the path has no marker.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_cameraModule.addCustomPath(name, path, force)` | Registers an already built path under a name. Without force, returns the existing id if the name is already known. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.afterTrigger()` | Called after the graph tick: finalizes the variables. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_cameraModule.cancelPathCam()` | Stops the current camera path (core_paths.stopCurrentPath). (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.clear()` | Resets the active path, the completions and the stored path tables. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_cameraModule.endActivePath(id)` | Stops the active path (if id is nil or equal to the active one) and clears the state. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.executionStopped()` | Called when the project stops: stops the path camera if active then calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_cameraModule.findPath(name)` | Returns the id of the path with this name, loading it if needed from <name>/<name>.camPath.json (resolved by mgr:getRelativeAbsolutePath). Logs an error if the file is not found. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.finishedPath()` | Callback called by core_paths at the end of a path: without loop, stops the camera; in all cases increments completions. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_cameraModule.getCmd(id)` | Builds a Lua command for the 'button' module (see notes: probable copy-paste). (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.getFreeId()` | Increments and returns an id. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.getPath(id)` | Returns the stored path's table. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.getPathDuration(id)` | Path duration = time of the last marker, 0 if the path is unknown. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.getUniqueName(prefix)` | Returns a unique prefix..'-'..id. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.init()` | Creates the variableStorage and calls clear(). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_cameraModule.isPathComplete(id)` | True if this path is the active path and has been completed at least once. (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.restartActivePath(id)` | Restarts the active path with the same loop setting (if id is nil or equal to the active one). (dynamically assigned) | dyn |
| `flowgraph_modules_cameraModule.startPath(id, loop)` | Switches to the game camera if the free camera is active, then plays the path with core_paths.playPath (useDtReal = true) and stores the id, the loop and completions = 0. Does nothing if the id is unknown. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_cameraModule.addCustomPath(name, path, force)`

Registers an already built path under a name. Without force, returns the existing id if the name is already known. (dynamically assigned)

- `name` (*string*) : name
- `path` (*table*) : camera path (with markers)
- `force` (*boolean|nil*) : replace the existing name
- **returns**: integer path id

#### `flowgraph_modules_cameraModule.endActivePath(id)`

Stops the active path (if id is nil or equal to the active one) and clears the state. (dynamically assigned)

- `id` (*integer|nil*) : expected id

#### `flowgraph_modules_cameraModule.findPath(name)`

Returns the id of the path with this name, loading it if needed from <name>/<name>.camPath.json (resolved by mgr:getRelativeAbsolutePath). Logs an error if the file is not found. (dynamically assigned)

- `name` (*string*) : path / folder name
- **returns**: integer path id

#### `flowgraph_modules_cameraModule.getCmd(id)`

Builds a Lua command for the 'button' module (see notes: probable copy-paste). (dynamically assigned)

- `id` (*integer*) : id
- **returns**: string Lua code

#### `flowgraph_modules_cameraModule.getFreeId()`

Increments and returns an id. (dynamically assigned)

- **returns**: integer id

#### `flowgraph_modules_cameraModule.getPath(id)`

Returns the stored path's table. (dynamically assigned)

- `id` (*integer*) : path id
- **returns**: table|nil path

#### `flowgraph_modules_cameraModule.getPathDuration(id)`

Path duration = time of the last marker, 0 if the path is unknown. (dynamically assigned)

- `id` (*integer*) : path id
- **returns**: number duration (s)

#### `flowgraph_modules_cameraModule.getUniqueName(prefix)`

Returns a unique prefix..'-'..id. (dynamically assigned)

- `prefix` (*string*) : prefix
- **returns**: string unique name

#### `flowgraph_modules_cameraModule.isPathComplete(id)`

True if this path is the active path and has been completed at least once. (dynamically assigned)

- `id` (*integer*) : path id
- **returns**: boolean completed

#### `flowgraph_modules_cameraModule.restartActivePath(id)`

Restarts the active path with the same loop setting (if id is nil or equal to the active one). (dynamically assigned)

- `id` (*integer|nil*) : expected id

#### `flowgraph_modules_cameraModule.startPath(id, loop)`

Switches to the game camera if the free camera is active, then plays the path with core_paths.playPath (useDtReal = true) and stores the id, the loop and completions = 0. Does nothing if the id is unknown. (dynamically assigned)

- `id` (*integer*) : path id
- `loop` (*boolean|nil*) : replay in a loop

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:addCustomPath(name, path, force)` |  | 48 |
| `C:afterTrigger()` |  | 127 |
| `C:cancelPathCam()` |  | 92 |
| `C:clear()` |  | 25 |
| `C:endActivePath(id)` |  | 104 |
| `C:executionStopped()` |  | 134 |
| `C:findPath(name)` |  | 34 |
| `C:finishedPath()` |  | 96 |
| `C:getCmd(id)` |  | 122 |
| `C:getFreeId()` |  | 11 |
| `C:getPath(id)` |  | 57 |
| `C:getPathDuration(id)` |  | 61 |
| `C:getUniqueName(prefix)` |  | 16 |
| `C:init()` |  | 20 |
| `C:isPathComplete(id)` |  | 65 |
| `C:restartActivePath(id)` |  | 114 |
| `C:startPath(id, loop)` |  | 69 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/cameraModule.lua`.*
