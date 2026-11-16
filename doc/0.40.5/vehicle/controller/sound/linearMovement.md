# `controller_sound_linearMovement`

*File: `lua/vehicle/controller/sound/linearMovement.lua` · VM: Vehicle · 283 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `sound/linearMovement` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary sound controller for a linear movement (cylinder, seat, platform, kickstand...). It measures the length of a "position sensor" beam (found by tag), derives a smoothed velocity from it and plays: a movement loop (volume/pitch depending on velocity, CT parameter = direction), segment sounds at each segmentLength step (up/down) and end-stop sounds (min/max position).

## Notes

- jbeam keys read in init: hasSegments (false), hasEndstops (false), positionSensorBeamTag (required: beam whose length gives the position), segmentLength, minPosition (0), maxPosition (0), positionCalibration (0), velocitySmoothing (5), absVelocitySmoothing (5), absVelocitySmoothingIn / absVelocitySmoothingOut (= absVelocitySmoothing), debugMode (false).
- Keys read in initSounds: movementSoundVolume (1), movementSoundEvent (loop, optional), segmentIncSoundEvent / segmentDecSoundEvent (default segmentSoundEvent), minPositionSoundEvent, maxPositionSoundEvent, movementSoundNode_nodes (first element, otherwise 0), movementSoundPitchMinVelocity (0), movementSoundPitchMaxVelocity (2), movementSoundMinPitch (0), movementSoundMaxPitch (1), movementSoundVolumeCoefMinVelocity (0.05), movementSoundVolumeCoefMaxVelocity (0.1), movementSoundPlayingThresholdVelocity (0.05), movementSoundPlayingThresholdVolume (0.05).
- The three values movementSoundVolumeCoefMinVelocity, movementSoundPlayingThresholdVelocity and movementSoundPlayingThresholdVolume must be > 0, otherwise logs E and updateGFX becomes nop.
- Velocities and positions are in m and m/s (beam length).
- If the sensor beam is not found, init stops with a log E and updateGFX stays nop.
- Inconsistency: the call order assumes initSounds after init (positionSensorBeamCid is used by initEndstops in initSounds, and reset reads the beam length without a nil check if init failed).
- Debug values (debugMode) print one line per frame.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_sound_linearMovement.init(jbeamData)` | Finds the sensor beam by tag, reads the segment/end-stop configuration and creates the velocity smoothers. *(internal)* | 236 |
| `controller_sound_linearMovement.initSounds(jbeamData)` | Creates the movement loop and reads the sound events and settings; validates the thresholds. Called by the engine at sound initialization. *(internal)* | 178 |
| `controller_sound_linearMovement.reset(jbeamData)` | Resets the last length, the segment and the smoothers to their initial state. *(internal)* | 171 |
| `controller_sound_linearMovement.resetSounds(jbeamData)` | Stops the loop and rearms the end-stop sounds according to the current position. *(internal)* | 163 |

### Parameter details

#### `controller_sound_linearMovement.init(jbeamData)`

Finds the sensor beam by tag, reads the segment/end-stop configuration and creates the velocity smoothers.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_sound_linearMovement.initSounds(jbeamData)`

Creates the movement loop and reads the sound events and settings; validates the thresholds. Called by the engine at sound initialization.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_sound_linearMovement.reset(jbeamData)`

Resets the last length, the segment and the smoothers to their initial state.

- `jbeamData` (*table*) : Jbeam data.

#### `controller_sound_linearMovement.resetSounds(jbeamData)`

Stops the loop and rearms the end-stop sounds according to the current position.

- `jbeamData` (*table*) : Jbeam data.

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function | nop at load, then internal updateGFX after a successful init. |

## Calls into the engine (C++)

- `obj:` `createSFXSource2`, `getBeamLength`, `playSFX`, `playSFXOnceCT`, `setVolumePitchCT`, `stopSFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/sound/linearMovement.lua`.*
