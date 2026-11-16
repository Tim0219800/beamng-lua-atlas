# `controller_pneumatics`

*File: `lua/vehicle/controller/pneumatics.lua` · VM: Vehicle · 375 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `pneumatics` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Simple pneumatic suspension/cylinder auxiliary controller (type "auxiliary"): it drives the pressure of "pressurized" beams (obj:setBeamPressureRel) grouped into named groups, with named pressure levels (minPressure, maxPressure, defaultPressure...), rise/fall speeds and inflation/deflation sounds. Unlike pneumatics/actuators, no gas physics or tank is modeled: the pressure simply follows the target at a limited speed. The public functions are called from inputs or other controllers with a list of group names.

## Example

```lua
local p = controller.getControllerSafe('pneumatics')
p.setBeamMax({"suspension"})        -- inflate to the maximum
p.setBeamPressure({"suspension"}, 30) -- 30 PSI raw
```

## Notes

- Units: the pressures in the jbeam and in the functions are in PSI; the conversion to pascals (1 PSI = 6894.757 Pa) is done internally for obj:setBeamPressureRel.
- Controller jbeam keys: pressuredBeams (name of the v.data table listing the beams; each entry contains beamName, groupName and possibly fields ending in "Pressure" (own levels), increaseRate, decreaseRate), pressureLevels (header table name/pressure for common levels; minPressure and maxPressure are 0 by default), increaseRate (0), decreaseRate (0) in PSI/s, groupSounds (v.data table name for the sounds: groupName, node, volumeUp, volumeDown, soundUp, soundDown, stopVelocityThresholdPressureIncrease, stopVelocityThresholdPressureDecrease).
- Beam fields read from the beam itself: name, pressurePSI (default pressure), maxPressure, beamSpring, beamDamp.
- If an increaseRate/decreaseRate is 0, the pressure does not move.
- The sounds stop either when the pressure has reached its target, or when the beams' average speed falls back below a threshold (if defined). The sound calls fail if a group has no sounds defined (soundLoopUp/soundLoopDown nil), inferred from code.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_pneumatics.init(jbeamData)` | Builds the beam groups from the jbeam tables and the pressure levels. *(internal)* | 245 |
| `controller_pneumatics.initSounds(jbeamData)` | Creates the rise/fall sound sources of each group. Called by the controller manager. *(internal)* | 317 |
| `controller_pneumatics.isBeamGroupAtPressureLevel(groupName, levelName)` | Indicates whether all beams of a group are exactly at the named pressure level. | 167 |
| `controller_pneumatics.reset()` | Returns all beams to their default pressure. *(internal)* | 235 |
| `controller_pneumatics.resetSounds()` | Cuts the sound volume and resets their state. *(internal)* | 344 |
| `controller_pneumatics.setBeamDefault(groupNames)` | Targets the default pressure (defaultPressure) of the groups. | 104 |
| `controller_pneumatics.setBeamMax(groupNames)` | Targets the maximum pressure (maxPressure) of the groups. | 100 |
| `controller_pneumatics.setBeamMin(groupNames)` | Targets the minimum pressure (minPressure) of the groups. | 96 |
| `controller_pneumatics.setBeamMomentaryDecrease(groupNames, enabled)` | Enables/disables the continuous pressure decrease of the groups; disables the increase. | 147 |
| `controller_pneumatics.setBeamMomentaryIncrease(groupNames, enabled)` | Enables/disables the continuous pressure increase of the groups (as long as enabled is true); disables the decrease. | 127 |
| `controller_pneumatics.setBeamPressure(groupNames, pressure)` | Directly sets the target pressure of the groups, bounded by the min and max of each beam. | 61 |
| `controller_pneumatics.setBeamPressureLevel(groupNames, pressureName)` | Targets a named pressure level (beam key, e.g. "maxPressure" or a level defined in pressureLevels). | 90 |
| `controller_pneumatics.toggleBeamMinMax(groupNames)` | For each group: switches to the minimum if everything is at the maximum, otherwise to the maximum. | 108 |
| `controller_pneumatics.updateGFX(dt)` | Every frame: applies the momentary increases/decreases, advances the current pressure toward the target at a limited speed and handles stopping the sounds. *(internal)* | 181 |

### Parameter details

#### `controller_pneumatics.init(jbeamData)`

Builds the beam groups from the jbeam tables and the pressure levels.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics.initSounds(jbeamData)`

Creates the rise/fall sound sources of each group. Called by the controller manager.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_pneumatics.isBeamGroupAtPressureLevel(groupName, levelName)`

Indicates whether all beams of a group are exactly at the named pressure level.

- `groupName` (*string*) : Group name.
- `levelName` (*string*) : Level name (e.g. "maxPressure").
- **returns**: boolean True if the group is at this level; also false if the group does not exist.

#### `controller_pneumatics.setBeamDefault(groupNames)`

Targets the default pressure (defaultPressure) of the groups.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).

#### `controller_pneumatics.setBeamMax(groupNames)`

Targets the maximum pressure (maxPressure) of the groups.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).

#### `controller_pneumatics.setBeamMin(groupNames)`

Targets the minimum pressure (minPressure) of the groups.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).

#### `controller_pneumatics.setBeamMomentaryDecrease(groupNames, enabled)`

Enables/disables the continuous pressure decrease of the groups; disables the increase.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).
- `enabled` (*boolean*) : True to decrease.

#### `controller_pneumatics.setBeamMomentaryIncrease(groupNames, enabled)`

Enables/disables the continuous pressure increase of the groups (as long as enabled is true); disables the decrease.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).
- `enabled` (*boolean*) : True to increase.

#### `controller_pneumatics.setBeamPressure(groupNames, pressure)`

Directly sets the target pressure of the groups, bounded by the min and max of each beam.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).
- `pressure` (*number*) : Target pressure in PSI.

#### `controller_pneumatics.setBeamPressureLevel(groupNames, pressureName)`

Targets a named pressure level (beam key, e.g. "maxPressure" or a level defined in pressureLevels).

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).
- `pressureName` (*string*) : Name of the pressure level.

#### `controller_pneumatics.toggleBeamMinMax(groupNames)`

For each group: switches to the minimum if everything is at the maximum, otherwise to the maximum.

- `groupNames` (*string[]*) : Beam group names (groupName of the pressurized beams table).

#### `controller_pneumatics.updateGFX(dt)`

Every frame: applies the momentary increases/decreases, advances the current pressure toward the target at a limited speed and handles stopping the sounds.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `createSFXSource`, `cutSFX`, `getBeamVelocity`, `playSFX`, `setBeamPressureRel`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/pneumatics.lua`.*
