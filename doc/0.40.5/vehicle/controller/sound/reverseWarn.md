# `controller_sound_reverseWarn`

*File: `lua/vehicle/controller/sound/reverseWarn.lua` · VM: Vehicle · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `sound/reverseWarn` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary reverse beep controller. Every 0.5 s, it tests an electric (default "reverse"): if it is > 0, it starts a looping beep sound; otherwise it stops it.

## Notes

- jbeam keys read: electricsName ("reverse"), beepLoopName ("event:>Vehicle>Electrics>Reverse>Beep_01"), beepVolume (1), soundNode_nodes (first element = node, 0 otherwise).
- The sound source is created on first activation (obj:createSFXSource2, AudioDefaultLoop3D); the test only happens every 0.5 s so the reaction can be delayed by up to 0.5 s.
- reset does not cut the sound: isWarning is reset to false but the already started loop is not stopped.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_sound_reverseWarn.init(jbeamData)` | Reads the jbeam configuration. *(internal)* | 42 |
| `controller_sound_reverseWarn.reset()` | Resets the state and the timer to zero. *(internal)* | 37 |
| `controller_sound_reverseWarn.updateGFX(dt)` | Every frame: starts or stops the beep depending on the electric. *(internal)* | 18 |

### Parameter details

#### `controller_sound_reverseWarn.init(jbeamData)`

Reads the jbeam configuration.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_sound_reverseWarn.updateGFX(dt)`

Every frame: starts or stops the beep depending on the electric.

- `dt` (*number*) : Time step in seconds.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `cutSFX`, `playSFX`, `setVolume`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/sound/reverseWarn.lua`.*
