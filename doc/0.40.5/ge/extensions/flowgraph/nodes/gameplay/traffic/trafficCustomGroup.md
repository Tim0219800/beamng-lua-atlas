# `flowgraph_nodes_gameplay_traffic_trafficCustomGroup`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua` · VM: Game Engine (GE) · 239 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup")` (file under extensions/ but not a regular extension)

Flowgraph node "Generate Vehicle Group" (category provider, depends on gameplay_traffic_trafficUtils). Generates the data of a vehicle group (output group, vehicleGroupData) for the Spawn Vehicle Group node. Two modes: "Parameters" (standard, simpleTraffic, simpleParked, fromSettings, fromWorld, with cars/trucks/large trucks filters and player/traffic options) and "Custom" (pins model_i / config_i). If the group is empty, falls back to {model='pickup'}.

## Notes

- The "file" mode is no longer handled: use File Vehicle Group (warning in the logs).
- onStateStarted sets self.done to false (state hook).

**Dependencies (loaded first):** `gameplay_traffic_trafficUtils`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Sets self.done back to false. | 133 |
| `C:_onDeserialized(data)` | Restores the node's own settings from the saved data. | 222 |
| `C:_onSerialize(res)` | Adds the node's own settings to the `res` table when saving the graph. | 212 |
| `C:buildGroup()` | Builds a 'custom' type group from the model_i / config_i pins. | 137 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 34 |
| `C:generateGroup()` | Builds a 'generator' type group from the chosen parameters (20 vehicles via core_multiSpawn.createGroup or copy from settings/world). | 149 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 24 |
| `C:onStateStarted()` | Sets self.done back to false. | 105 |
| `C:resetParams()` | Resets the Parameters mode parameters to their default values. | 30 |
| `C:updatePins(old, new)` | Adds or removes the model_i / config_i pin pairs (Custom mode). | 109 |
| `C:work()` | Once per run: generates the group (generateGroup or buildGroup) and publishes it on group. | 192 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/trafficCustomGroup.lua`.*
