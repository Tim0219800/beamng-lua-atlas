# `controller_gauges_customModules_combustionEngineData`

*File: `lua/vehicle/controller/gauges/customModules/combustionEngineData.lua` · VM: Vehicle · 145 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `gauges/customModules/combustionEngineData` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Data module for genericGauges: computes fuel consumption (l/100 km), consumption display, power and torque of combustion engines and remaining range. Computations are only done for the requested properties.

## Notes

- The instantaneous consumption comes from the variation of electrics.values.fuelVolume divided by dt*wheelspeed, bounded to 0..50 l/100 km; the average is smoothed over ~10 minutes and initialized to 10 l/100 km.
- Power = sum of outputTorque1 * outputAV1 of the "combustionEngine" devices, converted to hp (W * 0.001 * 1.35962). The vehicle is considered moving above 0.5 m/s (wheelspeed).
- setupGaugeData adds each engine's tanks to fuelTanks without clearing the list: a second call duplicates them.
- updateGaugeData reads electrics.values.wheelspeed without a default value: Lua error if nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_gauges_customModules_combustionEngineData.init(jbeamData)` | Initializes the smoothed average consumption to 10 l/100 km. *(internal)* | 133 |
| `controller_gauges_customModules_combustionEngineData.reset()` | Resets the module's internal state. *(internal)* | 123 |
| `controller_gauges_customModules_combustionEngineData.setupGaugeData(properties)` | Called by genericGauges with the properties requested in displayData.customModules: fuelConsumption (averageFuelConsumption, currentFuelConsumption), fuelDisplay (fuelDisplay, -1..3), currentPower (currentPower and averagePower in hp, currentTorque in N·m), remainingRange (remainingRange; also enables fuelConsumption). *(internal)* | 107 |
| `controller_gauges_customModules_combustionEngineData.updateGFX(dt)` | Does nothing (the update is done by updateGaugeData). *(internal)* | 40 |
| `controller_gauges_customModules_combustionEngineData.updateGaugeData(moduleData, dt)` | Called by genericGauges before each send: fills moduleData with the requested values. *(internal)* | 43 |

### Parameter details

#### `controller_gauges_customModules_combustionEngineData.init(jbeamData)`

Initializes the smoothed average consumption to 10 l/100 km.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_gauges_customModules_combustionEngineData.setupGaugeData(properties)`

Called by genericGauges with the properties requested in displayData.customModules: fuelConsumption (averageFuelConsumption, currentFuelConsumption), fuelDisplay (fuelDisplay, -1..3), currentPower (currentPower and averagePower in hp, currentTorque in N·m), remainingRange (remainingRange; also enables fuelConsumption).

- `properties` (*table<string, boolean>*) : Set of requested properties (key = name, value = true).

#### `controller_gauges_customModules_combustionEngineData.updateGFX(dt)`

Does nothing (the update is done by updateGaugeData).

- `dt` (*number*) : Time step (s).

#### `controller_gauges_customModules_combustionEngineData.updateGaugeData(moduleData, dt)`

Called by genericGauges before each send: fills moduleData with the requested values.

- `moduleData` (*table*) : Module data table, then sent to the HTML page.
- `dt` (*number*) : Time elapsed since the last send (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/gauges/customModules/combustionEngineData.lua`.*
