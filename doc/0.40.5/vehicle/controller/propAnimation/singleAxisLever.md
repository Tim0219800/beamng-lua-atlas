# `controller_propAnimation_singleAxisLever`

*File: `lua/vehicle/controller/propAnimation/singleAxisLever.lua` · VM: Vehicle · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `propAnimation/singleAxisLever` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller animating a single-axis gear lever (automatic gearbox lever). Converts electrics.values.gearModeIndex into a smoothed lever position (output electric) using a coordinate table keyed by mode index, and plays a lever sound at the start of each movement.

## Notes

- jbeam keys read: gearCoordinates (header table with columns gearIndex, value), electricsNamePosition ("gearModeIndex" by default: note that the default overwrites the electric read as input), shiftSoundNode_nodes (first element = sound node; otherwise node 0 and log W), shiftSoundEventSingleAxisLever ("event:>Vehicle>Interior>Gearshift>automatic_01_in"), shiftSoundVolumeSingleAxisLever (0.5).
- Reads electrics.values.gearModeIndex (fed by vehicleController from getGearPosition of the gearbox module).
- An index missing from the table uses the coordinate of the largest or smallest existing index.
- Pitfall: with the default electricsNamePosition identical to the input, the controller overwrites gearModeIndex with the lever position, which disturbs its own reading on the next frame. Define another name in the jbeam.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_propAnimation_singleAxisLever.init(jbeamData)` | Reads the coordinate table, the sound node/event and the output electric name. *(internal)* | 55 |
| `controller_propAnimation_singleAxisLever.reset(jbeamData)` | Resets the lever position to 0 and the smoother to zero. *(internal)* | 47 |
| `controller_propAnimation_singleAxisLever.updateGFX(dt)` | Every frame: smooths the position toward the coordinate of the current mode, plays the sound at the start of the movement and publishes the position. *(internal)* | 28 |

### Parameter details

#### `controller_propAnimation_singleAxisLever.init(jbeamData)`

Reads the coordinate table, the sound node/event and the output electric name.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_propAnimation_singleAxisLever.reset(jbeamData)`

Resets the lever position to 0 and the smoother to zero.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_propAnimation_singleAxisLever.updateGFX(dt)`

Every frame: smooths the position toward the coordinate of the current mode, plays the sound at the start of the movement and publishes the position.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/propAnimation/singleAxisLever.lua`.*
