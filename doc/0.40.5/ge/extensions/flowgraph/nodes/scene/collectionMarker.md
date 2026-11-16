# `flowgraph_nodes_scene_collectionMarker`

*File: `lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua` · VM: Game Engine (GE) · 100 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/scene/collectionMarker")` (file under extensions/ but not a regular extension)

Flowgraph node "Collection Marker" (repeat_instant, author BeamNG). Displays a colorable token in BeamNG colors (TSStatic art/shapes/collectible/s_collect_BNG.dae) with a PointLight, which floats and rotates at the position of the pos pin. Inputs: flow, reset (impulse that deletes the marker), pos (vec3), color (number 0-1 from orange to green, or color). Output: flow.

## Notes

- Bug: the reset pin calls self:clearMarkers(), a method that does not exist in this file (only hideMarker exists): triggering reset raises a Lua error.
- The registered object names are self.id..'marker' and self.id..'lighgt' (typo in the light's name, harmless).
- The output pin flow is never written by this node.

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Called when the graph stops: deletes the marker. | 42 |
| `C:destroy()` | Called when the node is destroyed: deletes the marker. | 94 |
| `C:hideMarker()` | Deletes the marker object and the light and sets the references back to nil. | 30 |
| `C:init(mgr, ...)` | Nothing to initialize. | 25 |
| `C:onClientEndMission()` | End-of-mission hook: deletes the marker. | 89 |
| `C:work()` | On reset, calls self:clearMarkers(). On flow, creates the TSStatic and the PointLight if needed, then updates position (with sinusoidal vertical oscillation), rotation, instance color and light (radius 3). | 47 |

## Calls into the engine (C++)

- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua`.*
