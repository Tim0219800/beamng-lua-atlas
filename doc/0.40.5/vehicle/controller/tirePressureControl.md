# `controller_tirePressureControl`

*File: `lua/vehicle/controller/tirePressureControl.lua` · VM: Vehicle · 373 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `tirePressureControl` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for central tire inflation/deflation (CTIS, off-road/military vehicles). Wheels are grouped into "groups" (axles, sides...); the driver enables/disables groups, then starts inflation, deflation or stop for all active groups. The controller directly modifies the pressure of the wheel pressure groups (obj:setGroupPressure), equalizes pressures within a group and publishes the average pressure of the active groups and the active state of each group in electrics. Registers a "Tire pressure control" radial menu.

## Example

```lua
local tpc = controller.getController("tirePressureControl")
tpc.setGroupState("front", true)
tpc.startDeflateActiveGroups()
```

## Notes

- jbeam keys read in initSecondStage: mode ("manualControl", the only supported mode), inflateMaxFlow (10) and deflateMaxFlow (10) (pressure change per second, unit of obj:getGroupPressure, Pa), activeGroupPressureElectricsName (<name>_activeGroupPressure), wheelGroups (header table: groupName, uiName, uiIcon, wheelNames, maxPressure, minPressure, groupEqualizeFlowLimit; all required except uiIcon).
- Published electrics: <name>_activeGroupPressure (smoothed average pressure of the active groups, absolute Pa) and <name>_<group>_isActive (1 or 0).
- Pressure never drops below obj:getEnvPressure(). A broken wheel is ignored in the average and in the equalization.
- The minPressure/maxPressure limits are absolute: inflating (resp. deflating) a wheel stops at maxPressure (resp. minPressure) but equalization continues.
- Groups are inactive after reset; unknown groups give a log E in setGroupState/toggleGroupState.
- init does nothing: all initialization is in initSecondStage (called after the init of all controllers, because it reads wheels.*).
- reset sets currentPressure to 0 for all wheels until the next read in updateGFX.
- The radial menu is registered only once per VM (hasRegisteredQuickAccess); it uses controller.getControllerSafe(M.name).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_tirePressureControl.getState()` | Saveable state: active pressure change, active state of each group and pressure of each wheel (keys prefixed by the controller name). | 126 |
| `controller_tirePressureControl.init(jbeamData)` | Does nothing (see initSecondStage). *(internal)* | 280 |
| `controller_tirePressureControl.initSecondStage(jbeamData)` | Builds the wheel groups, reads flows and pressure limits and registers the radial menu. Called after the init of the other controllers. *(internal)* | 283 |
| `controller_tirePressureControl.reset(jbeamData)` | Disables all groups, stops pressure changes and resets the electric smoother to zero. *(internal)* | 265 |
| `controller_tirePressureControl.setGroupState(groupName, state)` | Enables or disables a wheel group and displays a message. An unknown group name logs an error and does nothing. | 84 |
| `controller_tirePressureControl.setState(data)` | Restores activations, pressure change and wheel pressures (clamped between ambient pressure and maxPressure, broken wheels ignored). | 148 |
| `controller_tirePressureControl.startDeflateActiveGroups()` | Starts deflation (change = -deflateMaxFlow per second) of the active groups and displays a message. | 116 |
| `controller_tirePressureControl.startInflateActiveGroups()` | Starts inflation (change = +inflateMaxFlow per second) of the active groups and displays a message. | 111 |
| `controller_tirePressureControl.stopActiveGroups()` | Stops the current inflation/deflation and displays a message. | 121 |
| `controller_tirePressureControl.toggleGroupState(groupName)` | Toggles the activation of a wheel group. | 103 |
| `controller_tirePressureControl.updateGFX(dt)` | Every frame: reads the pressures, equalizes between wheels of a group, applies inflation/deflation to the active groups and publishes the electrics. *(internal)* | 28 |

### Parameter details

#### `controller_tirePressureControl.getState()`

Saveable state: active pressure change, active state of each group and pressure of each wheel (keys prefixed by the controller name).

- **returns**: table State table.

#### `controller_tirePressureControl.init(jbeamData)`

Does nothing (see initSecondStage).

- `jbeamData` (*table*) : Jbeam data.

#### `controller_tirePressureControl.initSecondStage(jbeamData)`

Builds the wheel groups, reads flows and pressure limits and registers the radial menu. Called after the init of the other controllers.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_tirePressureControl.reset(jbeamData)`

Disables all groups, stops pressure changes and resets the electric smoother to zero.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_tirePressureControl.setGroupState(groupName, state)`

Enables or disables a wheel group and displays a message. An unknown group name logs an error and does nothing.

- `groupName` (*string*) : Group name (jbeam groupName).
- `state` (*boolean*) : Active?

#### `controller_tirePressureControl.setState(data)`

Restores activations, pressure change and wheel pressures (clamped between ambient pressure and maxPressure, broken wheels ignored).

- `data` (*table|nil*) : Table produced by getState.

#### `controller_tirePressureControl.toggleGroupState(groupName)`

Toggles the activation of a wheel group.

- `groupName` (*string*) : Group name.

#### `controller_tirePressureControl.updateGFX(dt)`

Every frame: reads the pressures, equalizes between wheels of a group, applies inflation/deflation to the active groups and publishes the electrics.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getEnvPressure`, `getGroupPressure`, `setGroupPressure`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/tirePressureControl.lua`.*
