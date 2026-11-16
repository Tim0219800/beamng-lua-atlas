# `scenario_scenariohelper`

*File: `lua/ge/extensions/scenario/scenariohelper.lua` · VM: Game Engine (GE) · 220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `scenario_scenariohelper`: `extensions.load("scenario_scenariohelper")`, then the global `scenario_scenariohelper`

Scenario toolbox (GE extension scenario_scenariohelper). It wraps sending Lua commands to a vehicle by its name in the scenetree, AI control (mode, aggression, route, target, avoidance), breaking beam groups, and two interface messages. It is the API used by modders' scenarios. Each AI function sends a textual ai.xxx(...) command to the vehicle VM, then, if scenario_scenarios is loaded, stores the state via scenario_scenarios.updateVehicleAiState so it can be replayed after a reset.

## Example

```lua
local h = scenario_scenariohelper
h.setAiPath({
  vehicleName = 'ai1',
  waypoints = {'scenario_wp01', 'scenario_wp02', 'scenario_wp03', 'scenario_wp01'},
  lapCount = 3,
  aggression = 1.2,
  routeSpeed = 25,
  routeSpeedMode = 'limit',
  driveInLane = 'on'
})
h.flashUiMessage('Go !', 3)
```

## Notes

- The commands are built by string concatenation then executed in the vehicle VM via queueLuaCommand: string values are inserted between double quotes without escaping, so a name or value containing a quote breaks the command.
- breakBreakGroup and triggerDeformGroup have no check: if vehicleName is not found in the scenetree, getVehicleByName returns nil and the call crashes (nil error). Only queueLuaCommandByName logs a 'Vehicle not found' error and continues.
- setAiMode: if targetVehicleName is given but not found, vehicle.obj crashes (no nil check).
- The target name of setAiMode is converted to a numeric ID (vehicle.obj:getId()) and sent as targetObjectID.
- setAiAvoidCars stores the state under the key 'value' ({value = value}) and not 'avoidCars': probable inconsistency with the other functions that use an explicit key name (aggression, mode, target...).
- setAiPath: default values when an option is absent: routeSpeed 0, routeSpeedMode 'off', driveInLane 'off', speeds {}, lapCount 0, aggression 1, avoidCars 'off', aggressionMode ''. avoidCars is converted by tostring() so a boolean is accepted.
- setAiPath does not send resetLearning in the ai.driveUsingPath command built here, although the usage comment documents it: the option is only stored in arg (checkpoints / scenario state). To check in ai.lua.
- setAiPath saves arg via core_checkpoints.saveAIPath (if core_checkpoints is loaded) in order to reapply the path when AI vehicles are reset.
- Units: routeSpeed in m/s. Maximum aggression 2 according to the code comment (the internal multiplier is 0.7 per unit).
- getDistanceBetweenSceneObjects returns -1 (not nil) if either object does not exist, distance in meters otherwise.
- M.setAiTargetVehicle is commented out in the public interface: not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `scenario_scenariohelper.breakBreakGroup(vehicleName, group)` | Breaks a break group (breakGroup) of the vehicle by executing beamstate.breakBreakGroup(group) in its VM. | 29 |
| `scenario_scenariohelper.flashUiMessage(msg, duration, useBiggerText)` | Displays a flash message on screen via guihooks.trigger('ScenarioFlashMessage', {{msg, duration, 0, useBiggerText}}). | 178 |
| `scenario_scenariohelper.getDistanceBetweenSceneObjects(sceneObjectName1, sceneObjectName2)` | Computes the distance between the positions of two scenetree objects. | 189 |
| `scenario_scenariohelper.getVehicleByName(name)` | Returns the scenetree object with this name (scenetree.findObject), typically a vehicle. | 14 |
| `scenario_scenariohelper.queueLuaCommand(vehicle, command)` | Sends a string of Lua code to be executed in the given vehicle's VM (calls vehicle:queueLuaCommand). No check on vehicle. | 9 |
| `scenario_scenariohelper.queueLuaCommandByName(vehicleName, command)` | Sends a Lua command to a vehicle found by its name. If the vehicle does not exist, writes an error to the log (tag scenarioHelper) and does nothing else. | 19 |
| `scenario_scenariohelper.realTimeUiDisplay(msg)` | Updates the scenario's real-time display via guihooks.trigger('ScenarioRealtimeDisplay', {msg = msg}). | 185 |
| `scenario_scenariohelper.setAiAggression(vehicleName, aggression)` | Sets the AI aggression (ai.setAggression) and stores it in the scenario state. | 58 |
| `scenario_scenariohelper.setAiAggressionMode(vehicleName, aggrMode)` | Chooses the AI's dynamic aggression mode in manual mode (ai.setAggressionMode). With 'rubberBand', the aggression varies with the distance to the opponent: the closer the AI, the less aggressive. | 67 |
| `scenario_scenariohelper.setAiAvoidCars(vehicleName, value)` | Enables or disables the AI's avoidance of other cars (ai.setAvoidCars). | 81 |
| `scenario_scenariohelper.setAiMode(vehicleName, mode, targetVehicleName)` | Sets the vehicle's AI mode via ai.setState({mode=...}). If targetVehicleName is provided, that vehicle's ID is passed as targetObjectID (useful for modes that target another vehicle, for example chase or flee). Stores the mode in the scenario state. | 44 |
| `scenario_scenariohelper.setAiPath(arg)` | Makes an AI vehicle follow a route between waypoints (ai.driveUsingPath) with many options. The AI computes the shortest path between consecutive waypoints. The arg table is also saved (core_checkpoints.saveAIPath and scenario_scenarios.updateVehicleAiState) to be reapplied on reset. | 104 |
| `scenario_scenariohelper.setAiRoute(vehicleName, waypoints)` | Enables the AI's automatic progression along a list of waypoints (ai.driveUsingPath with wpTargetList). The AI mode must be manual or flee. Simple version of setAiPath, without speed or lap options. | 90 |
| `scenario_scenariohelper.setAiTarget(vehicleName, target)` | Sets the AI target (ai.setTarget) and stores it in the scenario state. | 74 |
| `scenario_scenariohelper.setCutOffDrivability(vehicleName, drivability)` | Sets the AI's cut-off drivability threshold (ai.setCutOffDrivability), used to discard roads of too low drivability. | 97 |
| `scenario_scenariohelper.trackVehicle(vehicleName, trackingName)` | Enables map tracking of the vehicle (mapmgr.enableTracking) under a custom tracking name. | 39 |
| `scenario_scenariohelper.triggerDeformGroup(vehicleName, group)` | Triggers a deform group (beamstate.triggerDeformGroup): switches to a broken material, for example to shatter a window. | 34 |

### Parameter details

#### `scenario_scenariohelper.breakBreakGroup(vehicleName, group)`

Breaks a break group (breakGroup) of the vehicle by executing beamstate.breakBreakGroup(group) in its VM.

- `vehicleName` (*string*) : Vehicle name. Must exist, otherwise error.
- `group` (*string*) : Name of the breakGroup defined in the jbeam.

#### `scenario_scenariohelper.flashUiMessage(msg, duration, useBiggerText)`

Displays a flash message on screen via guihooks.trigger('ScenarioFlashMessage', {{msg, duration, 0, useBiggerText}}).

- `msg` (*string*) : Text to display.
- `duration` (*number*) : Display duration (seconds, inferred from code).
- `useBiggerText` (*boolean|nil*) : true for larger text; any other value is treated as false.

#### `scenario_scenariohelper.getDistanceBetweenSceneObjects(sceneObjectName1, sceneObjectName2)`

Computes the distance between the positions of two scenetree objects.

- `sceneObjectName1` (*string*) : Name of the first object.
- `sceneObjectName2` (*string*) : Name of the second object.
- **returns**: number Distance in meters, or -1 if either object is not found.

#### `scenario_scenariohelper.getVehicleByName(name)`

Returns the scenetree object with this name (scenetree.findObject), typically a vehicle.

- `name` (*string*) : Object name in the scenetree.
- **returns**: table|nil The object, or nil if it does not exist.

#### `scenario_scenariohelper.queueLuaCommand(vehicle, command)`

Sends a string of Lua code to be executed in the given vehicle's VM (calls vehicle:queueLuaCommand). No check on vehicle.

- `vehicle` (*table*) : Already resolved vehicle object (BeamObject), for example returned by getVehicleByName.
- `command` (*string*) : Lua code to execute on the vehicle side.

#### `scenario_scenariohelper.queueLuaCommandByName(vehicleName, command)`

Sends a Lua command to a vehicle found by its name. If the vehicle does not exist, writes an error to the log (tag scenarioHelper) and does nothing else.

- `vehicleName` (*string*) : Vehicle name in the scenetree.
- `command` (*string*) : Lua code to execute on the vehicle side.

#### `scenario_scenariohelper.realTimeUiDisplay(msg)`

Updates the scenario's real-time display via guihooks.trigger('ScenarioRealtimeDisplay', {msg = msg}).

- `msg` (*any*) : Content passed to the UI in the msg field.

#### `scenario_scenariohelper.setAiAggression(vehicleName, aggression)`

Sets the AI aggression (ai.setAggression) and stores it in the scenario state.

- `vehicleName` (*string*) : Vehicle name.
- `aggression` (*number*) : Aggression, inserted as is in the command (the setAiPath comment states a maximum of 2).

#### `scenario_scenariohelper.setAiAggressionMode(vehicleName, aggrMode)`

Chooses the AI's dynamic aggression mode in manual mode (ai.setAggressionMode). With 'rubberBand', the aggression varies with the distance to the opponent: the closer the AI, the less aggressive.

- `vehicleName` (*string*) : Vehicle name.
- `aggrMode` (*string*) : Currently 'rubberBand' (only value mentioned in the code).

#### `scenario_scenariohelper.setAiAvoidCars(vehicleName, value)`

Enables or disables the AI's avoidance of other cars (ai.setAvoidCars).

- `vehicleName` (*string*) : Vehicle name.
- `value` (*string*) : 'on' or 'off'.

#### `scenario_scenariohelper.setAiMode(vehicleName, mode, targetVehicleName)`

Sets the vehicle's AI mode via ai.setState({mode=...}). If targetVehicleName is provided, that vehicle's ID is passed as targetObjectID (useful for modes that target another vehicle, for example chase or flee). Stores the mode in the scenario state.

- `vehicleName` (*string*) : Name of the vehicle driven by the AI.
- `mode` (*string*) : AI mode (values from the vehicle's ai.lua, for example 'manual', 'chase', 'flee', 'stop', 'disabled': inferred from code, not verified here).
- `targetVehicleName` (*string|nil*) : Target vehicle name, optional. Must exist if provided.

#### `scenario_scenariohelper.setAiPath(arg)`

Makes an AI vehicle follow a route between waypoints (ai.driveUsingPath) with many options. The AI computes the shortest path between consecutive waypoints. The arg table is also saved (core_checkpoints.saveAIPath and scenario_scenarios.updateVehicleAiState) to be reapplied on reset.

- `arg` (*table*) : Options table. Only vehicleName and waypoints are required.

#### `scenario_scenariohelper.setAiRoute(vehicleName, waypoints)`

Enables the AI's automatic progression along a list of waypoints (ai.driveUsingPath with wpTargetList). The AI mode must be manual or flee. Simple version of setAiPath, without speed or lap options.

- `vehicleName` (*string*) : Vehicle name.
- `waypoints` (*string[]*) : List of waypoint names, serialized with serialize().

#### `scenario_scenariohelper.setAiTarget(vehicleName, target)`

Sets the AI target (ai.setTarget) and stores it in the scenario state.

- `vehicleName` (*string*) : Name of the vehicle driven by the AI.
- `target` (*string*) : Target passed to ai.setTarget (name, in quotes in the command).

#### `scenario_scenariohelper.setCutOffDrivability(vehicleName, drivability)`

Sets the AI's cut-off drivability threshold (ai.setCutOffDrivability), used to discard roads of too low drivability.

- `vehicleName` (*string*) : Vehicle name.
- `drivability` (*number*) : Drivability value, inserted as is in the command.

#### `scenario_scenariohelper.trackVehicle(vehicleName, trackingName)`

Enables map tracking of the vehicle (mapmgr.enableTracking) under a custom tracking name.

- `vehicleName` (*string*) : Vehicle name in the scenetree.
- `trackingName` (*string*) : Tracking name to use.

#### `scenario_scenariohelper.triggerDeformGroup(vehicleName, group)`

Triggers a deform group (beamstate.triggerDeformGroup): switches to a broken material, for example to shatter a window.

- `vehicleName` (*string*) : Vehicle name. Must exist, otherwise error.
- `group` (*string*) : Name of the deformGroup defined in the jbeam.

**UI events (guihooks.trigger):** `ScenarioFlashMessage`, `ScenarioRealtimeDisplay`

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/scenario/scenariohelper.lua`.*
