# `controller_propAnimation_sequentialLever`

*File: `lua/vehicle/controller/propAnimation/sequentialLever.lua` · VM: Vehicle · 106 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `propAnimation/sequentialLever` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary sequential lever animation controller: at each gear change of the "gearbox" device (upshift = lever pushed, downshift = lever pulled), it makes a smoothed value oscillate between -1, 0 and 1 published in electrics.values.sequentialLeverY, and plays a lever sound (up / down) with the shift aggression as a parameter.

## Notes

- jbeam keys read: electricsNameYAxis ("sequentialLeverY"), supportedGearboxTypes (list, {"sequentialGearbox"}), relevantGearboxName ("gearbox"), shiftSoundNode_nodes (first element = sound node, otherwise 0 + log W), shiftSoundEventSequentialGearUp ("event:>Vehicle>Interior>Gearshift>sequential_01_in"), shiftSoundEventSequentialGearDown ("..._01_out"), shiftSoundVolumeSequentialGearUp / Down (0.5).
- Reads controller.mainController.shiftingAggression for the sound parameter.
- If the device does not exist or is not of a supported type, logs E and updateGFX becomes nop.
- Lever direction: impulse = {-1 -> 1, 0 -> 0, 1 -> -1} depending on the sign of (gearIndex - previousGearIndex); the "down" sound is played as soon as the impulse is non-zero (the name value "shiftOut" corresponds to any gear change, up or down), the "up" sound when it returns to 0.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_propAnimation_sequentialLever.init(jbeamData)` | Gets the gearbox device, checks its type and reads the sounds. *(internal)* | 59 |
| `controller_propAnimation_sequentialLever.reset(jbeamData)` | Resets the lever state and the smoother to zero. *(internal)* | 52 |
| `controller_propAnimation_sequentialLever.updateGFX(dt)` | Every frame: detects the gear change, smooths the impulse, plays the sound and publishes the value. *(internal)* | 28 |

### Parameter details

#### `controller_propAnimation_sequentialLever.init(jbeamData)`

Gets the gearbox device, checks its type and reads the sounds.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_propAnimation_sequentialLever.reset(jbeamData)`

Resets the lever state and the smoother to zero.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_propAnimation_sequentialLever.updateGFX(dt)`

Every frame: detects the gear change, smooths the impulse, plays the sound and publishes the value.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/propAnimation/sequentialLever.lua`.*
