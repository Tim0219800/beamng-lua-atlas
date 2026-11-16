# `flowgraph_nodes_math_quaternion_lookAt`

*File: `lua/ge/extensions/flowgraph/nodes/math/quaternion/lookAt.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/math/quaternion/lookAt")` (file under extensions/ but not a regular extension)

Flowgraph node 'Look At' (simple category). Computes the quaternion that orients a direction going from point 'from' to 'to', with the 'up' vector (hidden, default (0,0,1)). Uses quat:setFromDir.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 26 |
| `C:work()` | If from and to exist: direction = to - from, up = pin up or (0,0,1), writes the quaternion table to 'value'. Otherwise does nothing. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/math/quaternion/lookAt.lua`.*
