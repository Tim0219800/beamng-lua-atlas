# `flowgraph_nodes_gameplay_sites_location`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua` · VM: Game Engine (GE) · 164 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/location")` (file under extensions/ but not a regular extension)

Flowgraph node "Location" (category repeat_instant, tags scenario/sites). Decomposes a location data (locationData table): outputs name, pos, hasNavPos, navPos (projection on the nearest road), roadSide (2 m from the edge), roadDir (quat) and navRadius (5 if no road). Additional output pins (options, "key" by default) expose the custom fields (customFields.values) of the location.

## Notes

- Without a nearby road: hasNavPos=false, navPos=roadSide=pos, navRadius=5, roadDir={0,0,0,0}.
- The editor's "Copy over Fields" button does nothing (empty block).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 118 |
| `C:_onDeserialized(nodeData)` | Restores the node's own settings from the saved data. | 156 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 152 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 69 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 30 |
| `C:postInit()` | Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys). | 34 |
| `C:updateKeys()` | Rebuilds the dynamic output pins from the node's options list. | 38 |
| `C:work(args)` | When the input location changes, fills the outputs (name, position, road info via findClosestRoadInfo, custom fields). | 122 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua`.*
