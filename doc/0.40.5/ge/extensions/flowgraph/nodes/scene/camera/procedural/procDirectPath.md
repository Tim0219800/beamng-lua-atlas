# `flowgraph_nodes_scene_camera_procedural_procDirectPath`

*File: `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath.lua` · VM: Game Engine (GE) · 118 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath")` (file under extensions/ but not a regular extension)

Flowgraph node 'Procedural Direct Campath' (once_p_duration category). Generates a camera path that flies over the direct route from 'from' to 'to' (flyover from behind the start, climb to 180 m, then looking toward the destination with FOV zoom 50 then 30), of duration 'duration' (14 s by default); optionally 'loop' adds return keys. The path is registered via camera:addCustomPath and its name is output on 'pathName'.

## Notes

- The key times are expressed in fourteenths of 'duration'.
- The local variable 'fLen' (length clamped between 300 and 1000) is computed but never used, and 'mid' is computed but only 'mid2' is included in the path.
- The code comment says the category should be f_duration.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Computes the markers (from, from2, mid2, to, to2 and, if loop, out/back/back2) according to the horizontal direction from to to, then creates the path and writes pathName. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath.lua`.*
