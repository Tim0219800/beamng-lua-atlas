# `flowgraph_nodes_scene_camera_cameraPath`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua` · VM: Game Engine (GE) · 95 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/cameraPath")` (file under extensions/ but not a regular extension)

Flowgraph node 'Simple Cam Path' (once_f_duration category, file cameraPath). Starts a camera path (.camPath.json file designated by 'pathName') via the manager's camera module, with option 'loop'. Outputs: path id, impulse 'activated' on start, 'inactive' if the path is no longer active, 'duration'. The duration state goes to 'finished' when the path is complete.

## Notes

- legacyPins point to 'complete' and 'flow', pins that do not exist in the current schema.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets activatedFlag and the duration state to 'inactive'. | 45 |
| `C:_onDeserialized(data)` | Migrates the old field data.loop to the hard-coded pin 'loop'. | 89 |
| `C:drawMiddle(builder, style)` | Draws the middle of the node (empty). | 86 |
| `C:init()` | Empty. | 36 |
| `C:onNodeReset()` | Same reset. | 50 |
| `C:postInit()` | Restricts the pathName pin to '.camPath.json' files. | 39 |
| `C:work()` | During the started state: handles the activated impulse, sets inactive/duration depending on whether the path is active, goes to 'finished' when isPathComplete. | 64 |
| `C:workOnce()` | Finds the path (camera:findPath), starts it (startPath), writes id, activated=true and goes to the 'started' state. | 55 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua`.*
