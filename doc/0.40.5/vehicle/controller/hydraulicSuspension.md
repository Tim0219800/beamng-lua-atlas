# `controller_hydraulicSuspension`

*File: `lua/vehicle/controller/hydraulicSuspension.lua` · VM: Vehicle · 328 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `hydraulicSuspension` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary hydraulic suspension controller (type "auxiliary"): drives the reference length of beams (suspension cylinders) grouped into named groups. A virtual pump limits the extension speed; lowering is done at a fixed speed; in "bleed" mode the beam is released (zero spring, variable damping) and follows freely. It also plays the pump and release sounds. A modder calls setGroupsPosition / setGroupsBleed / setGroupsMomentaryIncrease from inputs or other controllers.

## Example

```lua
local hs = controller.getControllerSafe('hydraulicSuspension')
hs.setGroupsPosition({"front", "rear"}, 1)   -- all the way up
hs.setGroupsBleed({"front"}, 1)              -- releases the front
```

## Notes

- Controller jbeam keys: hydraulicBeams (name of the v.data table describing the beams, default "hydraulicsData"; each entry contains beamName, groupName, min, max), basePumpSpeed (0.5, length ratio change per second), maxPumpSpeed (default basePumpSpeed*20), pumpSample (sound event, default "event:>Vehicle>Hydraulics>Pump_01"), releaseSample (default "event:>Vehicle>Hydraulics>Release_01"), pumpNode (sound emission node).
- jbeam keys carried by the beams: name (required to be found), hydraulicsMinDamp (0, minimum damping in bleed mode), defaultBleedCoef (1, bounded 0..1). Positions are ratios of the beam's reference length (obj:setBeamLengthRefRatio).
- A beam in bleed mode (bleedCoef > 0) has a spring of 0; at bleedCoef = 0 it regains its original spring and original damping. Raising is limited by min(basePumpSpeed*speedCoef, maxPumpSpeed); lowering is done at 10 (ratio/s).
- On reset all beams return to their original position with bleedCoef = 1 (released).
- Non-existent group names are ignored with a warning in the log.
- getState/setState save per beam: currentPosition, targetPosition, bleedCoef, speedCoef.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_hydraulicSuspension.getState()` | Returns the state of all beams for saving/synchronization. | 238 |
| `controller_hydraulicSuspension.init(jbeamData)` | Builds the beam groups from the jbeam hydraulic table, stores the pump parameters. *(internal)* | 166 |
| `controller_hydraulicSuspension.initSounds(jbeamData)` | Creates the pump and release sound sources on pumpNode. Called by the controller manager during sound initialization. *(internal)* | 289 |
| `controller_hydraulicSuspension.reset()` | Returns all beams to their original position and to released mode. *(internal)* | 153 |
| `controller_hydraulicSuspension.resetSounds()` | Resets the state of the pump and release sounds. *(internal)* | 305 |
| `controller_hydraulicSuspension.setGroupsBleed(groupNames, bleedCoef)` | Releases the groups: bleedCoef > 0 removes the spring and lets the beam follow freely; the damping depends on 1 - bleedCoef. | 61 |
| `controller_hydraulicSuspension.setGroupsMomentaryIncrease(groupNames, enabled, speedCoef)` | Enables/disables the continuous increase of the groups' target (at the pump's base speed) as long as enabled is true, within the min/max limits of each beam. | 77 |
| `controller_hydraulicSuspension.setGroupsPosition(groupNames, position, speedCoef)` | Sets the target position of all named groups: position 0 = min extension, 1 = max extension of each beam. Disables the bleed of these beams. | 42 |
| `controller_hydraulicSuspension.setState(data)` | Restores the state returned by getState (valid numeric values only). | 248 |
| `controller_hydraulicSuspension.updateFixedStep(dt)` | Every physics step: advances each beam toward its target position at the pump speed and applies the length and the spring/damping. *(internal)* | 132 |
| `controller_hydraulicSuspension.updateGFX(dt)` | Every frame: handles the pump sound (volume 0.5, pitch depending on the flow) and the release sound according to the released beams that shorten. *(internal)* | 95 |

### Parameter details

#### `controller_hydraulicSuspension.getState()`

Returns the state of all beams for saving/synchronization.

- **returns**: table<string, number> State table (reused).

#### `controller_hydraulicSuspension.init(jbeamData)`

Builds the beam groups from the jbeam hydraulic table, stores the pump parameters.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulicSuspension.initSounds(jbeamData)`

Creates the pump and release sound sources on pumpNode. Called by the controller manager during sound initialization.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_hydraulicSuspension.setGroupsBleed(groupNames, bleedCoef)`

Releases the groups: bleedCoef > 0 removes the spring and lets the beam follow freely; the damping depends on 1 - bleedCoef.

- `groupNames` (*string[]*) : Group names.
- `bleedCoef` (*number*) : 0 (no release) to 1 (full release), bounded.

#### `controller_hydraulicSuspension.setGroupsMomentaryIncrease(groupNames, enabled, speedCoef)`

Enables/disables the continuous increase of the groups' target (at the pump's base speed) as long as enabled is true, within the min/max limits of each beam.

- `groupNames` (*string[]*) : Group names.
- `enabled` (*boolean*) : True to raise continuously.
- `speedCoef` (*number|nil*) : Speed multiplier (1 by default).

#### `controller_hydraulicSuspension.setGroupsPosition(groupNames, position, speedCoef)`

Sets the target position of all named groups: position 0 = min extension, 1 = max extension of each beam. Disables the bleed of these beams.

- `groupNames` (*string[]*) : Group names (groupName in the hydraulic table).
- `position` (*number*) : 0..1, interpolation between min and max of each beam.
- `speedCoef` (*number|nil*) : Pump speed multiplier (1 by default).

#### `controller_hydraulicSuspension.setState(data)`

Restores the state returned by getState (valid numeric values only).

- `data` (*table|nil*) : State table.

#### `controller_hydraulicSuspension.updateFixedStep(dt)`

Every physics step: advances each beam toward its target position at the pump speed and applies the length and the spring/damping.

- `dt` (*number*) : Time step (s).

#### `controller_hydraulicSuspension.updateGFX(dt)`

Every frame: handles the pump sound (volume 0.5, pitch depending on the flow) and the release sound according to the released beams that shorten.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `createSFXSource`, `createSFXSource2`, `cutSFX`, `getBeamCurLengthRefRatio`, `getBeamLengthRefRatio`, `playSFX`, `setBeamLengthRefRatio`, `setBeamSpringDamp`, `setVolumePitch`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/hydraulicSuspension.lua`.*
