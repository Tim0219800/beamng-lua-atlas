# `controller_sound_airbrakes`

*File: `lua/vehicle/controller/sound/airbrakes.lua` · VM: Vehicle · 77 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `sound/airbrakes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for a simple pneumatic brake release sound (no air simulation, unlike pneumatics/airbrakes). Monitors electrics.values[electricsBrakeName]; if the brake is released by more than 0.2 per second over a 0.25 s window, plays a "pssht" whose intensity depends on the release speed, then waits for a cooldown.

## Notes

- jbeam keys read: soundNode_nodes (first element = sound node, 0 otherwise), soundEvent ("event:>Vehicle>Pneumatics>Air_Brakes"), soundCoolDown (0.5 s), electricsBrakeName ("brake").
- The intensity passed to the sound is -dBrake x 0.25 (not capped, unlike pneumatics/airbrakes which caps at 0.99).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_sound_airbrakes.init(jbeamData)` | Reads the jbeam configuration and resets the state to zero. *(internal)* | 56 |
| `controller_sound_airbrakes.reset()` | Resets the sampling state to zero. *(internal)* | 49 |
| `controller_sound_airbrakes.updateGFX(dt)` | Every frame: detects a quick brake release and plays the sound. *(internal)* | 23 |

### Parameter details

#### `controller_sound_airbrakes.init(jbeamData)`

Reads the jbeam configuration and resets the state to zero.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_sound_airbrakes.updateGFX(dt)`

Every frame: detects a quick brake release and plays the sound.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `playSFXOnce`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/sound/airbrakes.lua`.*
