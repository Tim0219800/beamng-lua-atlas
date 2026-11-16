# `gameplay_vehiclePerformance`

*File: `lua/ge/extensions/gameplay/vehiclePerformance.lua` · VM: Game Engine (GE) · 189 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_vehiclePerformance`: `extensions.load("gameplay_vehiclePerformance")`, then the global `gameplay_vehiclePerformance`

Computes a vehicle's performance index (PI) and class (X, S, A, B, C, D) from its automatic test results (0-60 time, 1/8 and 1/4 mile, trap speeds, braking in g, etc.). Also provides aggregate scores compared to a reference vehicle, class utilities for the UI (minimum class requirement) and selection of a mission's default vehicle. The data comes from vehicle configs ("Performance Data", "Drag Times", "Power", "Weight").

## Example

```lua
local res = gameplay_vehiclePerformance.getClassFromConfig("sunburst2", "base")
if res then print(res.class.name, res.performanceIndex) end
```

## Notes

- Classes (minimum PI): X 101, S 86, A 66, B 41, C 21, D 0.
- The PI is the sum of nine terms bias + multiplier * measurement, each floored at 0; a missing measurement counts as 0.
- getClassFromData never returns nil because of the PI (always a number); it returns nil only if testData is nil (error) or if the PI is below the lowest threshold, which cannot happen with D at 0.
- getClassFromConfigTable modifies the received 'Drag Times' table: it adds power and weight to it.
- getAggregateScores divides by testData.time_60, time_1_4, velAt_1_4/velAt_1_8 without checking: missing or zero values cause an error or a division by zero. If time_0_60 is 0 (60 mph not reached), it is reset to nil in testData and the score is 0.
- Certification vehicle references: power 1 395 241 W, weight 1280 kg, 0-60 mph 2.37 s, braking 1.417 g (values from the code).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_vehiclePerformance.buildClassRequirement(name)` | Builds a table in the performance index badge format for a class requirement alone; isThreshold = true tells the UI to display a minimum threshold (>=). | 150 |
| `gameplay_vehiclePerformance.getAggregateScores(testData)` | Computes aggregate scores (power, power-to-weight ratio, 0-60 mph, 60 ft, quarter mile, speed progression, braking) as a percentage of the reference vehicle. | 48 |
| `gameplay_vehiclePerformance.getClassByName(name)` | Returns the class row matching the given letter. | 131 |
| `gameplay_vehiclePerformance.getClassFromConfig(model, configName)` | Class of a vehicle config identified by model and config name (core_vehicles.getConfig). | 123 |
| `gameplay_vehiclePerformance.getClassFromConfigTable(configTable)` | Reads the class and PI already recorded by the automatic test (config["Performance Data"]); otherwise recomputes them from config["Drag Times"], config["Power"] and config["Weight"]. | 99 |
| `gameplay_vehiclePerformance.getClassFromData(testData)` | Computes the PI from the test data and returns the first class whose minimum PI is reached. | 85 |
| `gameplay_vehiclePerformance.getClassFromVehId(vehId)` | Class of a vehicle present in the game, via core_vehicles.getVehicleDetails(vehId).configs. | 116 |
| `gameplay_vehiclePerformance.getClassNames()` | Lists the class names, from highest to lowest. | 139 |
| `gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule)` | Determines the default vehicle implied by a mission's setupModules.vehicles block (the one the settings UI preselects): the player's vehicle, the first preset, or nothing. | 166 |

### Parameter details

#### `gameplay_vehiclePerformance.buildClassRequirement(name)`

Builds a table in the performance index badge format for a class requirement alone; isThreshold = true tells the UI to display a minimum threshold (>=).

- `name` (*string*) : Class letter.
- **returns**: table|nil {class = {name, description, minPI}, performanceIndex = minPI, isThreshold = true} or nil if the class is unknown.

#### `gameplay_vehiclePerformance.getAggregateScores(testData)`

Computes aggregate scores (power, power-to-weight ratio, 0-60 mph, 60 ft, quarter mile, speed progression, braking) as a percentage of the reference vehicle.

- `testData` (*table|nil*) : Test data: time_60, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG, power ({propulsionPowerCombined}), weight.
- **returns**: table|nil {powerScore, powerToWeightScore, timeTo60Score, quarterMileScore, speedProgressionScore, brakingGForceScore, time0To60Score}

#### `gameplay_vehiclePerformance.getClassByName(name)`

Returns the class row matching the given letter.

- `name` (*string|nil*) : Class letter (X, S, A, B, C, D).
- **returns**: table|nil {name, minPI, description} or nil.

#### `gameplay_vehiclePerformance.getClassFromConfig(model, configName)`

Class of a vehicle config identified by model and config name (core_vehicles.getConfig).

- `model` (*string*) : Vehicle model.
- `configName` (*string*) : Config name.
- **returns**: table|nil {class, performanceIndex} or nil.

#### `gameplay_vehiclePerformance.getClassFromConfigTable(configTable)`

Reads the class and PI already recorded by the automatic test (config["Performance Data"]); otherwise recomputes them from config["Drag Times"], config["Power"] and config["Weight"].

- `configTable` (*table|nil*) : Vehicle config table.
- **returns**: table|nil {class, performanceIndex} or nil if no data.

#### `gameplay_vehiclePerformance.getClassFromData(testData)`

Computes the PI from the test data and returns the first class whose minimum PI is reached.

- `testData` (*table*) : Test data (time_60, time_330, time_1000, time_1_8, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG).
- **returns**: table|nil {class = {name, description, minPI}, performanceIndex}

#### `gameplay_vehiclePerformance.getClassFromVehId(vehId)`

Class of a vehicle present in the game, via core_vehicles.getVehicleDetails(vehId).configs.

- `vehId` (*integer*) : Vehicle id.
- **returns**: table|nil {class, performanceIndex} or nil.

#### `gameplay_vehiclePerformance.getClassNames()`

Lists the class names, from highest to lowest.

- **returns**: string[] {"X","S","A","B","C","D"}

#### `gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule)`

Determines the default vehicle implied by a mission's setupModules.vehicles block (the one the settings UI preselects): the player's vehicle, the first preset, or nothing.

- `setupModule` (*table|nil*) : Setup module: enabled, includePlayerVehicle, prioritizePlayerVehicle, vehicles ({model, config}).
- **returns**: table|nil {kind = "player"} or {kind = "preset", model, config} or nil.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/vehiclePerformance.lua`.*
