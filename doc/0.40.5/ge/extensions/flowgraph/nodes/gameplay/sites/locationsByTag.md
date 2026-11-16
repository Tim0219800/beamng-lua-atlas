# `flowgraph_nodes_gameplay_sites_locationsByTag`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua` · VM: Game Engine (GE) · 135 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/sites/locationsByTag")` (file under extensions/ but not a regular extension)

Flowgraph node "Locations by Tags" (category once_instant). Finds at most `count` locations with a given tag, optionally between minDist and maxDist of a position pos. Results are shuffled (math.random), then sorted by distance to pos if provided. Outputs: count, found_i (flow) and loc_i (locationData) for i=1..N (N adjustable). Inputs: sitesData, tag, pos, minDist/maxDist (-1 = no limit), amount (-1 = maximum).

## Notes

- `reason` is a global variable in drawCustomProperties (not declared local).

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores the node's own settings from the saved data. | 129 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 125 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 37 |
| `C:init(mgr, ...)` | Initializes the node's internal state at creation (called by the flowgraph engine). | 34 |
| `C:updatePins(old, new)` | Adds or removes the found_i / loc_i pin pairs. | 53 |
| `C:workOnce()` | Builds the list of locations (by tag or by radius), shuffles it, keeps the first ones, sorts them by distance, then fills found_i, loc_i and count. | 77 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationsByTag.lua`.*
