# `controller_sound_AVAS`

*File: `lua/vehicle/controller/sound/AVAS.lua` · VM: Vehicle · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `sound/AVAS` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary controller for the pedestrian acoustic vehicle alerting system (AVAS) of electric vehicles. Plays a "forward" loop in D/S modes, a "reverse" loop in R, and nothing otherwise or above the maximum speed (+1 m/s); the pitch/volume parameter depends on speed.

## Notes

- jbeam keys read in initSounds: forwardSoundEvent ("event:>Engine>Pedestrian Warning>Forward_01"), reverseSoundEvent ("..._Reverse_01"), forwardSoundNode_nodes and reverseSoundNode_nodes (first element = node, 0 otherwise), warningMaxSpeed (50/3.6 m/s), warningVolume (0.5).
- Reads electrics.values.gear (gear name) and wheelspeed. The speed CT (ControlTrigger) parameter is linear from 0 to warningMaxSpeed.
- reset calls obj:stopSFX on sources that are only created in initSounds (possibly nil if reset is called before).

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_sound_AVAS.init(jbeamData)` | Does nothing (the configuration is read in initSounds). *(internal)* | 62 |
| `controller_sound_AVAS.initSounds(jbeamData)` | Creates the two looping sound sources and reads the maximum speed and volume. Called by the engine at sound initialization. *(internal)* | 65 |
| `controller_sound_AVAS.reset()` | Stops both sounds and resets the state to "stopped". *(internal)* | 56 |
| `controller_sound_AVAS.updateGFX(dt)` | Every frame: chooses the state (forward/reverse/stopped) depending on the gear and speed, plays/stops the sounds and adjusts the speed parameter. *(internal)* | 22 |

### Parameter details

#### `controller_sound_AVAS.init(jbeamData)`

Does nothing (the configuration is read in initSounds).

- `jbeamData` (*table*) : Jbeam data.

#### `controller_sound_AVAS.initSounds(jbeamData)`

Creates the two looping sound sources and reads the maximum speed and volume. Called by the engine at sound initialization.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_sound_AVAS.updateGFX(dt)`

Every frame: chooses the state (forward/reverse/stopped) depending on the gear and speed, plays/stops the sounds and adjusts the speed parameter.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `playSFX`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/sound/AVAS.lua`.*
