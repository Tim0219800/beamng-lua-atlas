# `controller_pneumatics_autoLevelSuspension`

*File: `lua/vehicle/controller/pneumatics/autoLevelSuspension.lua` · VM: Vehicle · 344 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics/autoLevelSuspension` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary pneumatic suspension controller with automatic leveling (defaultOrder 80). For each "control group" (one measurement beam + one or more airbag beam groups), it compares the measured length of the beam to a target length and opens/closes the actuator's valves (by default the "airbags" controller) in proportion to the difference. A modder uses it to set the ride height (setTargetLength), raise/lower it manually (setAdjustmentRate) or temporarily suspend the regulation.

## Example

```lua
local als = controller.getController("autoLevelSuspension")
als.setAdjustmentRate("front", 1) -- raise
als.stopAdjusting("front", true) -- freezes the new height as the target
```

## Notes

- jbeam keys read in init: actuatorGroups (name of a jbeam section, list of rows {controlBeamName, controlGroupName (default = controlBeamName), beamGroup, defaultTargetLength, debug}), actuationStartDistance (0.01 m), actuationEndDistance (0.06 m), actuationDelay (0 s), minValveOpenAmount (0.15). initSecondStage reads actuatorName ("airbags").
- Lengths in meters. The actuation interpolates linearly between minValveOpenAmount (difference = actuationStartDistance) and 1 (difference = actuationEndDistance); below actuationStartDistance, the valve is closed.
- Without defaultTargetLength, the group spends 1.5 s in calibration after reset/init then takes the current length as the target.
- The groupNames parameters of the functions accept a group name or a list of names; an unknown name logs a warning (W) and is ignored.
- If the actuator controller is not found, updateFixedStep is replaced by nop (log E "suspension.init").
- The state (getState/setState) uses keys <controller name>_<group>_targetLength and ..._adjustmentRate.
- Probable bug: reset sets commitNewHeight to 0 (number) whereas everywhere else it is a boolean. In Lua 0 is true, so at the first step after a reset (outside calibration, without manual adjustment) `if controlGroup.commitNewHeight` is true and the target is overwritten by the current length (even with defaultTargetLength).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics_autoLevelSuspension.getAverageFlowRate(groupName)` | Average air flow in the actuator's beam groups for this group. | 113 |
| `controller_pneumatics_autoLevelSuspension.getCurrentLength(groupName)` | Returns the last measured length of the control beam (0 and log E if unknown). | 104 |
| `controller_pneumatics_autoLevelSuspension.getState()` | Saveable state: target length and adjustment rate of each group (keys prefixed by the controller name). | 294 |
| `controller_pneumatics_autoLevelSuspension.getTargetLength(groupName)` | Returns the target length of a group (0 and log E if unknown). | 95 |
| `controller_pneumatics_autoLevelSuspension.init(jbeamData)` | Builds the control groups from the jbeam section actuatorGroups and reads the actuation parameters. *(internal)* | 213 |
| `controller_pneumatics_autoLevelSuspension.initSecondStage(jbeamData)` | Gets the actuator controller (jbeam actuatorName, "airbags" by default). Called after the init of all controllers. *(internal)* | 282 |
| `controller_pneumatics_autoLevelSuspension.isCalibrating(groupName)` | True while the group is in initial calibration (1.5 s). | 131 |
| `controller_pneumatics_autoLevelSuspension.isMoving(groupName)` | True if the absolute value of the average flow exceeds 1e-4. | 122 |
| `controller_pneumatics_autoLevelSuspension.reset()` | Resets targets, lengths, timers and adjustment speeds to zero; restarts the calibration of groups without defaultTargetLength. *(internal)* | 196 |
| `controller_pneumatics_autoLevelSuspension.setAdjustmentRate(groupNames, rate)` | Forces a manual height adjustment: the valve state is imposed at rate (-1 lowers, 1 raises). | 53 |
| `controller_pneumatics_autoLevelSuspension.setMomentaryDecrease(groupNames, decrease)` | Deprecated (log W): equivalent to setAdjustmentRate(groups, -1) then stopAdjusting(groups, true). | 76 |
| `controller_pneumatics_autoLevelSuspension.setMomentaryIncrease(groupNames, increase)` | Deprecated (log W): equivalent to setAdjustmentRate(groups, 1) then stopAdjusting(groups, true). | 67 |
| `controller_pneumatics_autoLevelSuspension.setState(data)` | Restores targets and adjustment rates (NaN or non-numeric values ignored). | 302 |
| `controller_pneumatics_autoLevelSuspension.setTargetLength(groupNames, targetLength, immediate)` | Sets the target length (m) of the groups; with immediate true, the regulation starts without waiting for actuationDelay. | 85 |
| `controller_pneumatics_autoLevelSuspension.setTemporarilyDisabled(groupNames, disabled)` | Suspends (true) or resumes (false) the automatic regulation of the groups; valves closed during suspension. | 47 |
| `controller_pneumatics_autoLevelSuspension.stopAdjusting(groupNames, commitNewHeight)` | Stops the manual adjustment; with commitNewHeight true the current length becomes the new target. | 60 |
| `controller_pneumatics_autoLevelSuspension.updateFixedStep(dt)` | Physics step: for each group, calibrates, applies a manual adjustment or regulates toward the target length via actuator.setBeamGroupsValveState. *(internal)* | 140 |

### Parameter details

#### `controller_pneumatics_autoLevelSuspension.getAverageFlowRate(groupName)`

Average air flow in the actuator's beam groups for this group.

- `groupName` (*string*) : Group name.
- **returns**: number Average flow (actuator unit).

#### `controller_pneumatics_autoLevelSuspension.getCurrentLength(groupName)`

Returns the last measured length of the control beam (0 and log E if unknown).

- `groupName` (*string*) : Group name.
- **returns**: number Length in m.

#### `controller_pneumatics_autoLevelSuspension.getState()`

Saveable state: target length and adjustment rate of each group (keys prefixed by the controller name).

- **returns**: table State table (reused between calls).

#### `controller_pneumatics_autoLevelSuspension.getTargetLength(groupName)`

Returns the target length of a group (0 and log E if unknown).

- `groupName` (*string*) : Group name.
- **returns**: number Target length in m.

#### `controller_pneumatics_autoLevelSuspension.init(jbeamData)`

Builds the control groups from the jbeam section actuatorGroups and reads the actuation parameters.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_autoLevelSuspension.initSecondStage(jbeamData)`

Gets the actuator controller (jbeam actuatorName, "airbags" by default). Called after the init of all controllers.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_pneumatics_autoLevelSuspension.isCalibrating(groupName)`

True while the group is in initial calibration (1.5 s).

- `groupName` (*string*) : Group name.
- **returns**: boolean In calibration?

#### `controller_pneumatics_autoLevelSuspension.isMoving(groupName)`

True if the absolute value of the average flow exceeds 1e-4.

- `groupName` (*string*) : Group name.
- **returns**: boolean Is the group moving?

#### `controller_pneumatics_autoLevelSuspension.setAdjustmentRate(groupNames, rate)`

Forces a manual height adjustment: the valve state is imposed at rate (-1 lowers, 1 raises).

- `groupNames` (*string|table<integer, string>*) : Control group(s).
- `rate` (*number*) : Rate -1..1 (bounded).

#### `controller_pneumatics_autoLevelSuspension.setMomentaryDecrease(groupNames, decrease)`

Deprecated (log W): equivalent to setAdjustmentRate(groups, -1) then stopAdjusting(groups, true).

- `groupNames` (*string|table<integer, string>*) : Group(s).
- `decrease` (*boolean*) : Lower (true) or stop (false).

#### `controller_pneumatics_autoLevelSuspension.setMomentaryIncrease(groupNames, increase)`

Deprecated (log W): equivalent to setAdjustmentRate(groups, 1) then stopAdjusting(groups, true).

- `groupNames` (*string|table<integer, string>*) : Group(s).
- `increase` (*boolean*) : Raise (true) or stop (false).

#### `controller_pneumatics_autoLevelSuspension.setState(data)`

Restores targets and adjustment rates (NaN or non-numeric values ignored).

- `data` (*table|nil*) : Table produced by getState.

#### `controller_pneumatics_autoLevelSuspension.setTargetLength(groupNames, targetLength, immediate)`

Sets the target length (m) of the groups; with immediate true, the regulation starts without waiting for actuationDelay.

- `groupNames` (*string|table<integer, string>*) : Control group(s).
- `targetLength` (*number*) : Target length of the measurement beam in m.
- `immediate` (*boolean|nil*) : Bypass the actuation delay.

#### `controller_pneumatics_autoLevelSuspension.setTemporarilyDisabled(groupNames, disabled)`

Suspends (true) or resumes (false) the automatic regulation of the groups; valves closed during suspension.

- `groupNames` (*string|table<integer, string>*) : Control group(s).
- `disabled` (*boolean*) : Suspend?

#### `controller_pneumatics_autoLevelSuspension.stopAdjusting(groupNames, commitNewHeight)`

Stops the manual adjustment; with commitNewHeight true the current length becomes the new target.

- `groupNames` (*string|table<integer, string>*) : Control group(s).
- `commitNewHeight` (*boolean|nil*) : Store the reached height as the target.

#### `controller_pneumatics_autoLevelSuspension.updateFixedStep(dt)`

Physics step: for each group, calibrates, applies a manual adjustment or regulates toward the target length via actuator.setBeamGroupsValveState.

- `dt` (*number*) : Physics step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | Execution order (80). |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `getBeamLength`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics/autoLevelSuspension.lua`.*
