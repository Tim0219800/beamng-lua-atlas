# `flowgraph_nodes_career_vehicleGroupByClass`

*File: `lua/ge/extensions/flowgraph/nodes/career/vehicleGroupByClass.lua` · VM: Game Engine (GE) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/vehicleGroupByClass")` (file under extensions/ but not a regular extension)

Flowgraph node "Vehicle Group by Performance Class" (category once_instant, author BeamNG, tags career/race/class/vehicle). Generates a vehicle group for a performance class. Input: class (string class name, or number 1-based index, clamped to the list of gameplay_vehiclePerformance.getClassNames()). Outputs: vehGroup (vehicleGroupData table) and aggressionCoef (AI aggression multiplier). If the active mission defines generateVehicleGroup, it is used (editor vehicle selection filters); otherwise career_modules_vehicleClassGrouping.generateGroup. Depends on career_modules_vehicleClassGrouping and gameplay_vehiclePerformance.

**Dependencies (loaded first):** `career_modules_vehicleClassGrouping`, `gameplay_vehiclePerformance`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Converts the numeric class to a name, generates the vehicle group (mission or grouping module) and also outputs the aggression coefficient. | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/vehicleGroupByClass.lua`.*
