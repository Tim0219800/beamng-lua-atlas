# `flowgraph_nodes_gameplay_sites_parkingspot`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua` · VM: Game Engine (GE) · 143 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/parkingspot")` (file under extensions/ but not a regular extension)

Flowgraph node "Parking Spot" (category repeat_instant). Decomposes a parking spot (parkingSpotData): outputs name, pos, rot (quat), scl (vec3). Option data.fixedHeight (>0) overrides the height of scl. Dynamic pins expose the custom fields (options, default "key").

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 106 |
| `C:_onDeserialized(nodeData)` | Restores the node's own settings from the saved data. | 135 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 131 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 66 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 27 |
| `C:postInit()` | Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys). | 32 |
| `C:updateKeys()` | Rebuilds the dynamic output pins from the node's options list. | 36 |
| `C:work(args)` | Copies the spot's name, position, rotation and scale to the outputs, applies fixedHeight if > 0 and reads the custom fields. | 110 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspot.lua`.*
