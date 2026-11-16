# `flowgraph_nodes_debug_cameraMouseRayCast`

*File: `lua/ge/extensions/flowgraph/nodes/debug/cameraMouseRayCast.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/debug/cameraMouseRayCast")` (file under extensions/ but not a regular extension)

Flowgraph node "Camera Mouse Raycast" (category repeat_instant, tags util/click). Casts a ray from the camera toward the mouse position (cameraMouseRayCast) and outputs the result. Outputs: clicking (pulse on left click), hold (held), objID, objName, and hidden pins distance, pos (vec3), normal (vec3), face. Clicks are ignored if the ImGui interface captures the mouse. The game notes it may no longer be needed ("mouse tool" node).

## Notes

- Game C.todo: "Might not be needed anymore, since we have mouse tool node."
- No effect, all outputs are set to nil/false.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame: casts the ray and fills the pins (position, normal as {x,y,z} tables, hit object); resets everything to nil/false if there is no collision. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/debug/cameraMouseRayCast.lua`.*
