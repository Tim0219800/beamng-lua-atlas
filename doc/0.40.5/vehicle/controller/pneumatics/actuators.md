# `controller_pneumatics_actuators`

*File: `lua/vehicle/controller/pneumatics/actuators.lua` · VM: Vehicle · 750 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics/actuators` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller (type "auxiliary", defaultOrder 50) for pneumatic cylinders with simplified gas physics: an air tank (energyStorage) feeds, via valves, "virtual buffers" (cross-flow groups) then the pressurized beams of a group. The flows depend on pressure differences and passage cross-sections, the air's energy is conserved (PV = e) and the air consumption empties the tank. One valve per group (valveState -1..1) opens the intake (> 0) or the exhaust; it can be read from an electrics value. It also plays sounds according to the flow.

## Example

```lua
local a = controller.getControllerSafe('pneumatics/actuators')
a.setBeamGroupValveState('liftAxle', 1)    -- intake
local p = a.getAveragePressure('liftAxle') -- in absolute Pa
```

## Notes

- Units: pressures in pascals (absolute), flows in m³/s, radii in m. An electrics value <controllerName>_<group>_pressure_avg receives the average relative pressure (average - ambient pressure).
- Controller jbeam keys (default): airTankName ("mainAirTank"), pressuredBeams (v.data table name with beamName, groupName, crossFlowTag (default = groupName), supplyHoseRadius, supplyValveRadius, maxSupplyPressure, maxSupplyPressurePSI, valveStateElectricsName, disableAirConsumption, debug), crossFlowGroups (table name with crossFlowTag, virtualBufferCapacity, debug), supplyHoseRadius (0.0075 m), supplyValveRadius (0.2 * supplyHoseRadius), maxSupplyPressure (infinite), maxSupplyPressurePSI (converted to absolute pressure + 101325 Pa), virtualBufferCapacity (0.005 m³), pressureDumpFlowRate (0.01 m³/s), crossFlowBetweenBeams (boolean), debug (boolean), groupSounds (table name with groupName, node, volume/volumeIncrease/volumeDecrease, soundIncrease, soundDecrease, startFlowRateThreshold..., stopFlowRateThreshold..., flowRateVolumeFactor...).
- Beam fields read: name, pressure (default pressure), maxPressure, beamSpring, beamDamp, surface (cross-section in m²), lengthOffset.
- If the tank is not found, an error is logged and updateFixedStep becomes nop; but updateGFX stays active and reads uninitialized data (inferred from code: avoid).
- valveState > 0: the buffer is fed by the tank (limited by maxSupplyPressure); valveState <= 0: the buffer empties to the atmosphere. If valveState = 0 (and no crossFlowBetweenBeams) there is no exchange with the beams.
- An implicit cross-flow group is created (with a warning) if a crossFlowTag is not declared in crossFlowGroups.
- The computation is executed at every physics step (updateFixedStep) and can be costly.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics_actuators.getAverageFlowRate(groupName)` | Returns the average flow to the beams of a group (m³/s; 0 if not found). | 210 |
| `controller_pneumatics_actuators.getAveragePressure(groupName)` | Returns the average pressure of the beams of a group (absolute Pa; 0 if not found). | 219 |
| `controller_pneumatics_actuators.getBeamGroupsAverageFlowRate(groupNames)` | Returns the average of the average flows of several groups. | 228 |
| `controller_pneumatics_actuators.getValveState(groupName)` | Returns the valve state of a group (0 if not found). | 201 |
| `controller_pneumatics_actuators.init(jbeamData)` | Builds beam groups, virtual buffers and flow parameters from the jbeam and finds the air tank. *(internal)* | 528 |
| `controller_pneumatics_actuators.initSounds(jbeamData)` | Creates the flow increase/decrease sound sources for each group. Called by the controller manager. *(internal)* | 683 |
| `controller_pneumatics_actuators.reset()` | Resets pressures, stored energies, valves and virtual buffers to their initial state. *(internal)* | 500 |
| `controller_pneumatics_actuators.resetSounds()` | Cuts the sound volume and resets their state. *(internal)* | 717 |
| `controller_pneumatics_actuators.setBeamGroupCrossFlowTag(groupName, crossFlowTag)` | Changes the virtual buffer (cross-flow group) a group is connected to; resets the buffer if the group is the first to use it. | 169 |
| `controller_pneumatics_actuators.setBeamGroupMaximumSupplyPressure(groupName, maxSupplyPressure)` | Sets the maximum supply pressure of a group. | 154 |
| `controller_pneumatics_actuators.setBeamGroupValveState(groupName, valveState)` | Sets the valve state of a group. | 122 |
| `controller_pneumatics_actuators.setBeamGroupsMaximumSupplyPressure(groupNames, maxSupplyPressure)` | Same for several groups. | 163 |
| `controller_pneumatics_actuators.setBeamGroupsValveState(groupNames, valveState)` | Same for several groups. | 131 |
| `controller_pneumatics_actuators.toggleBeamGroupValveState(groupName)` | Toggles the valve between 1 (intake) and -1 (exhaust): if the current state is < 0 it goes to 1, otherwise to -1. | 137 |
| `controller_pneumatics_actuators.toggleBeamGroupsValveState(groupNames)` | Same for several groups. | 148 |
| `controller_pneumatics_actuators.updateFixedStep(dt)` | Every physics step: computes the tank -> buffers -> beams flows, updates the pressures and the tank's energy, applies the pressures to the beams. *(internal)* | 243 |
| `controller_pneumatics_actuators.updateGFX(dt)` | Every frame: handles the sounds according to the flow, resets the per-tick energies to zero, writes the average relative pressure into electrics and draws the debug graphs. *(internal)* | 415 |

### Parameter details

#### `controller_pneumatics_actuators.getAverageFlowRate(groupName)`

Returns the average flow to the beams of a group (m³/s; 0 if not found).

- `groupName` (*string*) : Group name.
- **returns**: number Average flow.

#### `controller_pneumatics_actuators.getAveragePressure(groupName)`

Returns the average pressure of the beams of a group (absolute Pa; 0 if not found).

- `groupName` (*string*) : Group name.
- **returns**: number Average pressure.

#### `controller_pneumatics_actuators.getBeamGroupsAverageFlowRate(groupNames)`

Returns the average of the average flows of several groups.

- `groupNames` (*string[]*) : Group names.
- **returns**: number Average flow (0 if the list is empty).

#### `controller_pneumatics_actuators.getValveState(groupName)`

Returns the valve state of a group (0 if not found).

- `groupName` (*string*) : Group name.
- **returns**: number Valve state -1..1.

#### `controller_pneumatics_actuators.init(jbeamData)`

Builds beam groups, virtual buffers and flow parameters from the jbeam and finds the air tank.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_actuators.initSounds(jbeamData)`

Creates the flow increase/decrease sound sources for each group. Called by the controller manager.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics_actuators.setBeamGroupCrossFlowTag(groupName, crossFlowTag)`

Changes the virtual buffer (cross-flow group) a group is connected to; resets the buffer if the group is the first to use it.

- `groupName` (*string*) : Group name.
- `crossFlowTag` (*string*) : Virtual buffer name.

#### `controller_pneumatics_actuators.setBeamGroupMaximumSupplyPressure(groupName, maxSupplyPressure)`

Sets the maximum supply pressure of a group.

- `groupName` (*string*) : Group name.
- `maxSupplyPressure` (*number*) : Maximum absolute pressure (Pa).

#### `controller_pneumatics_actuators.setBeamGroupValveState(groupName, valveState)`

Sets the valve state of a group.

- `groupName` (*string*) : Group name.
- `valveState` (*number*) : -1..1; > 0 intake, <= 0 exhaust; the absolute value sets the opening.

#### `controller_pneumatics_actuators.setBeamGroupsMaximumSupplyPressure(groupNames, maxSupplyPressure)`

Same for several groups.

- `groupNames` (*string[]*) : Group names.
- `maxSupplyPressure` (*number*) : Maximum absolute pressure (Pa).

#### `controller_pneumatics_actuators.setBeamGroupsValveState(groupNames, valveState)`

Same for several groups.

- `groupNames` (*string[]*) : Group names.
- `valveState` (*number*) : -1..1.

#### `controller_pneumatics_actuators.toggleBeamGroupValveState(groupName)`

Toggles the valve between 1 (intake) and -1 (exhaust): if the current state is < 0 it goes to 1, otherwise to -1.

- `groupName` (*string*) : Group name.

#### `controller_pneumatics_actuators.toggleBeamGroupsValveState(groupNames)`

Same for several groups.

- `groupNames` (*string[]*) : Group names.

#### `controller_pneumatics_actuators.updateFixedStep(dt)`

Every physics step: computes the tank -> buffers -> beams flows, updates the pressures and the tank's energy, applies the pressures to the beams.

- `dt` (*number*) : Time step (s).

#### `controller_pneumatics_actuators.updateGFX(dt)`

Every frame: handles the sounds according to the flow, resets the per-tick energies to zero, writes the average relative pressure into electrics and draws the debug graphs.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultOrder` | number | 50. |
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `cutSFX`, `getBeamLength`, `playSFX`, `setBeamPressureRel`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics/actuators.lua`.*
