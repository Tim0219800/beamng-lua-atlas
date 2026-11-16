# `flowgraph_nodes_gameplay_sites_locationByName`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/locationByName")` (file under extensions/ but not a regular extension)

Flowgraph node "Location by Name". Looks up a location by name in sitesData.locations.byName. Inputs: flow, sitesData, locationName; outputs: flow (true if found), exists (hidden), location (locationData). The editor allows hardcoding the name of the location selected in the Sites Editor.

## Notes

- If the name does not exist, self._location is nil and `self._location.missing` raises a Lua error (no nil check).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 45 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 27 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the flowgraph editor (ImGui). | 66 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 23 |
| `C:work(args)` | When the flow is active and the name changes, looks up the location and activates the flow output if it exists (not missing). | 49 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua`.*
