# `flowgraph_nodes_util_randomQuaternion`

*File: `lua/ge/extensions/flowgraph/nodes/util/randomQuaternion.lua` · VM: Game Engine (GE) · 38 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/randomQuaternion")` (file under extensions/ but not a regular extension)

Node "Random Quaternion" (repeat_instant, casino icon). Provides a random quaternion every frame. Inputs (degrees, hidden/fixed): xMin/xMaxAngle (0, 0), yMin/yMaxAngle (0, 0), zMin/zMaxAngle (0, 360). Output: quaternion (table {x,y,z,w}). By default: random rotation around the Z axis only.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Draws a random angle per axis between min and max (converted to radians), composes the X then Y then Z rotations via quatFromEuler and writes the quaternion. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/randomQuaternion.lua`.*
