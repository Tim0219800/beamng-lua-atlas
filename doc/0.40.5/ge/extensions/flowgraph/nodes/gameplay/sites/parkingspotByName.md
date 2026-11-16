# `flowgraph_nodes_gameplay_sites_parkingspotByName`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/parkingspotByName")` (file under extensions/ but not a regular extension)

Flowgraph node "Parking Spot by Name". Looks up a parking spot by name in sitesData.parkingSpots.byName. Inputs: flow, sitesData, spotName; outputs: flow (true if found), exists (hidden), spot (parkingSpotData).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the flowgraph project execution starts; resets the node's internal state. | 45 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 27 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the flowgraph editor (ImGui). | 66 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 23 |
| `C:work(args)` | Looks up the spot by name, publishes spot and activates flow/exists if it exists and is not missing. | 49 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/parkingspotByName.lua`.*
