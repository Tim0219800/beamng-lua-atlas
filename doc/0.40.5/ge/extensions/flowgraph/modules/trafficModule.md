# `flowgraph_modules_trafficModule`

*File: `lua/ge/extensions/flowgraph/modules/trafficModule.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/trafficModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 0) that wraps gameplay_traffic and gameplay_parking for traffic nodes. It remembers whether the flowgraph itself enabled traffic (trafficActive) or parked cars (parkedCarsActive) so as to disable them on stop only if it enabled them, unless keepTrafficState is true.

## Notes

- On stop (without keepTrafficState), if traffic was active, it resets the traffic and pursuit variables (setTrafficVars, setPursuitVars) and the parking ones, then disables traffic and parked cars.
- keepTrafficState is set back to false on every stop.

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_trafficModule.activateParkedCars(vehList)` | Enables parked cars (gameplay_parking.processVehicles(vehList)). (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.activateTraffic(vehList)` | Enables traffic (gameplay_traffic.activate) with a list of vehicles. (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.deactivateParkedCars()` | Disables parked cars (processVehicles without arguments), only if enabled by the flowgraph. (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.deactivateTraffic()` | Disables traffic (gameplay_traffic.deactivate), only if it was enabled by the flowgraph. (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.executionStopped()` | Called when the project stops: resets the traffic, pursuit and parking variables then disables traffic and parked cars, unless keepTrafficState is true. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_trafficModule.init()` | Called when the module is created: trafficActive, parkedCarsActive and keepTrafficState are false. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_trafficModule.insertTraffic(id)` | Adds a vehicle to the traffic (gameplay_traffic.insertTraffic) and updates the state. (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.removeTraffic(id)` | Removes a vehicle from the traffic (gameplay_traffic.removeTraffic) and updates the state. (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.updateParkedCarsState()` | Updates parkedCarsActive from gameplay_parking.getParkedCarsData(). (dynamically assigned) | dyn |
| `flowgraph_modules_trafficModule.updateTrafficState()` | Updates trafficActive from gameplay_traffic.getTrafficData(). Use only if the flowgraph changed the traffic state. (dynamically assigned) | dyn |

### Parameter details

#### `flowgraph_modules_trafficModule.activateParkedCars(vehList)`

Enables parked cars (gameplay_parking.processVehicles(vehList)). (dynamically assigned)

- `vehList` (*integer[]|nil*) : vehicle ids (inferred from code)

#### `flowgraph_modules_trafficModule.activateTraffic(vehList)`

Enables traffic (gameplay_traffic.activate) with a list of vehicles. (dynamically assigned)

- `vehList` (*integer[]|nil*) : vehicle ids (inferred from code)

#### `flowgraph_modules_trafficModule.insertTraffic(id)`

Adds a vehicle to the traffic (gameplay_traffic.insertTraffic) and updates the state. (dynamically assigned)

- `id` (*integer*) : vehicle id

#### `flowgraph_modules_trafficModule.removeTraffic(id)`

Removes a vehicle from the traffic (gameplay_traffic.removeTraffic) and updates the state. (dynamically assigned)

- `id` (*integer*) : vehicle id

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:activateParkedCars(vehList)` |  | 45 |
| `C:activateTraffic(vehList)` |  | 33 |
| `C:deactivateParkedCars()` |  | 50 |
| `C:deactivateTraffic()` |  | 38 |
| `C:executionStopped()` |  | 57 |
| `C:init()` |  | 8 |
| `C:insertTraffic(id)` |  | 23 |
| `C:removeTraffic(id)` |  | 28 |
| `C:updateParkedCarsState()` |  | 19 |
| `C:updateTrafficState()` | trafficActive and parkedCarsActive should only get updated if the flowgraph itself alters the traffic state | 15 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/trafficModule.lua`.*
