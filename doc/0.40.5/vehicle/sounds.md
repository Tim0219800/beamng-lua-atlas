# `sounds`

*File: `lua/vehicle/sounds.lua` · VM: Vehicle · 1462 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `sounds`

Vehicle sounds other than the engine: tire rolling and skidding noises (depending on the ground material: asphalt, dirt, gravel, grass, ice...), gravel kickup, body impacts and breaks, scrapes, per-beam suspension squeaks (soundFile in the jbeam), wind, soundscape sounds, .sbeam sound bank driven by electrics, cabin filter. Also provides utility functions to create and play FMOD sources from a controller or an engine (createSoundObj, playSoundOnceAtNode...) as well as Hz <-> FMOD scale conversions.

## Example

```lua
-- create a 3D loop on node 0 and drive it
local snd = sounds.createSoundObj('event:>Vehicle>Aero>windbuffet', 'AudioDefaultLoop3D', 'MySound', 0)
snd:setVolumePitch(0.5, 0.3)
-- one-shot sound
sounds.playSoundOnceAtNode('event:>Destruction>Vehicle>vehicle_part_impact', 0, 0.8)
```

## Notes

- The volume/pitch/color/texture values sent to the audio engine are normalized parameters (FMOD RTPC, generally 0..1), not Hz or dB. soundObj:setVolumePitch ignores updates that are too small (volume < 0.01 becomes 0; pitch difference < 0.0025 and volume/color/texture < 0.01 -> no call).
- How the .sbeam bank works: init() loads all the *.sbeam files from the vehicle's 'sounds/' folder (otherwise 'vehicles/common/sounds/'), multiplies minVolume/maxVolume by 1.5 (sbeamVolumeFactor), replaces the value 'MAXRPM' with the largest maxSoundRPM of the engine, and enables the sounds whose group is 'default' or v.data.engine.soundGroup. At each updateGFX the source (field source: name of an electrics value, or 'gear' for drivetrain.gear) is transformed into volume/pitch via factor/offset, volumeBlendIn/Out*, pitchBlendIn*, minVolume/maxVolume, minPitch/maxPitch and the volumeModifiers/pitchModifiers.
- jbeam keys read in the 'sounds' section: impactGeneric, impactMetal, impactPlastic, impactSoundVolumeCoef, breakGeneric, wind, windNode, scrapeMetal, scrapePlastic, cabinFilterCoef. Keys read on beams: soundFile, soundType, volumeFactor (1), pitchFactor (0), maxStress (35000), colorFactor (0.5), attackFactor (10), decayFactor (10), noiseFactor (0). Keys read on nodes: impactPlasticEvent, impactMetalEvent, impactGenericEvent, breakPlasticEvent, breakGenericEvent. On the wheel: tireSoundVolumeCoef (0 mutes the tire noises).
- Soundscape: v.data.soundscape[name] = {src, descriptor, node}. The 'horn' sound serves as the wind node if it exists.
- Tire sounds are created for each wheel of wheels.wheels (events 'event:>Surfaces>roll_rigid_v2', 'skid_rigid_v2', 'roll_loose_v2', 'skid_loose_v2'); static parameters c_tirPrpVolRol, c_tirPrpPitch, c_tirPrpSizTrd, c_tirPrpVolSkd, c_tirPrpSoft; c_objType is 0 for seated player, 1 AI, 2 traffic (updateObjType).
- Bug/inconsistency: soundObj:setParameter is declared with (keyName, value) (the engine calls setSFXparameter(obj, keyName, value)). The dummySoundObj returned by createSoundObj when the source cannot be created only has setVolumePitch: calling setParameter on it raises an error.
- Bug/inconsistency: createSFXSource (module) replaces M.update, M.playSoundOnceAtNode and M.playSoundOnceFollowNode with nop on failure; M.update does not exist elsewhere in this file (the real hook is updateGFX).
- Minor bug: breakPlasticEvent is used (node or default value) but no jbeam key 'breakPlastic' in the 'sounds' section overrides it, unlike breakGeneric.
- Numeric values of the surfaces (ground materials): 2 metal, 3 plastic, 4 rubber, 6 wood, 10 asphalt, 11 wet asphalt, 14 dusty dirt, 15 dirt, 16 sand, 18 mud, 19 gravel, 20 grass, 21 ice, 22 snow, 29 rumble strip, 30 cobblestones, 13 rock.
- FMOD Hz: the internal table maps 11 frequencies (20, 40, 80, 160, 330, 660, 1300, 2700, 5400, 11000, 22000 Hz) to steps of 100 (0..1000); hzToFMODHz interpolates linearly per segment. This code is duplicated in C++ (trueforceDSP.cpp): any change must be mirrored.
- M.objType is reset to -1 on deserialization (onDeserialized) to force the c_objType parameters to be sent again.

## Functions

| Function | Description | Line |
|---|---|---|
| `sounds.FMODHzToHz(fmodHzValue)` | Inverse conversion of hzToFMODHz: FMOD value 0..1000 to Hz. | 1329 |
| `sounds.bodyCollision(p)` | Handles the scrape sound of a body node during a contact: chooses the event according to the material (metal or plastic), ignores it on absorbing materials (rubber, cloth, sand and mud for wheel nodes) and sets volume, pitch, color and texture of the source. | 1045 |
| `sounds.createSFXSource(filename, description, SFXProfileName, nodeID)` | Creates a raw audio source (obj:createSFXSource) without a soundObj wrapper. On failure, disables playSoundOnceAtNode/FollowNode and logs a warning. | 195 |
| `sounds.createSoundObj(filename, description, SFXProfileName, nodeID)` | Creates an FMOD audio source (obj:createSFXSource) and returns it wrapped in a soundObj, with a cache of the latest values to avoid useless calls. If creation fails, returns a dummy object whose setVolumePitch does nothing. | 209 |
| `sounds.createSoundscapeSound(name)` | Creates the source of a soundscape sound defined in v.data.soundscape. Uses the soundscape's node if it is numeric, otherwise refNode. | 104 |
| `sounds.disableOldEngineSounds()` | Empties the .sbeam sound bank and prevents it from reloading: called by engines that use the new engine sound system. | 1308 |
| `sounds.getBeamSounds()` | Debug: returns the list of per-beam suspension sounds (with impulse, pitch, volume of the last frame). | 1404 |
| `sounds.getEngineSoundData()` | Debug (sound editor): iterates over the engines that have getSoundConfiguration and returns their sound configurations. | 1408 |
| `sounds.hzToFMODHz(hzValue)` | Converts a real frequency in Hz (clamped to 20..22000) to the FMOD 0..1000 scale (interpolation by segments of 100). Code duplicated in C++ (trueforceDSP.cpp). | 1315 |
| `sounds.init()` | Resets all the vehicle's audio sources (deleteSFXSources), loads the .sbeam banks, creates the per-beam suspension sounds, the scrape sounds, the tire sounds and reads the 'sounds' jbeam section. Called when the vehicle loads. *(internal)* | 1075 |
| `sounds.onDeserialized()` | Deserialization hook after the vehicle Lua reload: resets objType to -1 (all of M is serialized and restored). *(internal)* *(hook)* | 1304 |
| `sounds.playSoundOnceAtNode(soundName, nodeID, volume, pitch, color, texture)` | Plays a sound once at the (static) position of a node. Ignored if the volume is < 0.01 or the pitch < 0.0039. | 162 |
| `sounds.playSoundOnceFollowNode(soundName, nodeID, volume, pitch, color, texture)` | Like playSoundOnceAtNode but the sound follows the node during playback. | 169 |
| `sounds.playSoundSkipAI(sound, volume)` | Replays an existing source (volume then cut + play), unless no player is seated and the AI is driving (the sound is then skipped). | 150 |
| `sounds.reset()` | Resets the wind and suspension sounds, sends the static tire parameters again (the GE cache is emptied at each reset) and updates c_objType. Called when the vehicle resets. *(internal)* | 1341 |
| `sounds.setUIDebug(enabled, data)` | Enables or disables the audio debug report to the UI (costly in performance, reserve for debugging). The data parameter is not used. | 1299 |
| `sounds.updateCabinFilter()` | Sends to the game (GE) the strength of this vehicle's cabin filter (cabinFilterCoef clamped to 0..1) via core_sounds.setCabinFilterStrength. | 1069 |
| `sounds.updateGFX(dt)` | Main sound loop (each graphics frame): impact/break detection every 0.04 s (obj:getImpactDeformEnergyNode), .sbeam bank, suspension sounds, wind (above 3 m/s speed relative to the wind) and rolling/skidding/kickup sounds of each wheel. *(internal)* | 219 |
| `sounds.updateObjType()` | Determines the audio object type (0 seated player, 1 AI, 2 traffic) and, if it changed, sends the c_objType parameter again to all tire sounds. *(internal)* | 1380 |

### Parameter details

#### `sounds.FMODHzToHz(fmodHzValue)`

Inverse conversion of hzToFMODHz: FMOD value 0..1000 to Hz.

- `fmodHzValue` (*number*) : Value on the FMOD scale (clamped to 0..1000).
- **returns**: number Frequency in Hz.

#### `sounds.bodyCollision(p)`

Handles the scrape sound of a body node during a contact: chooses the event according to the material (metal or plastic), ignores it on absorbing materials (rubber, cloth, sand and mud for wheel nodes) and sets volume, pitch, color and texture of the source.

- `p` (*table*) : Engine collision data (id1, slipVel, normalForce, materialID1, materialID2).

#### `sounds.createSFXSource(filename, description, SFXProfileName, nodeID)`

Creates a raw audio source (obj:createSFXSource) without a soundObj wrapper. On failure, disables playSoundOnceAtNode/FollowNode and logs a warning.

- `filename` (*string*) : File or event.
- `description` (*string*) : Audio descriptor.
- `SFXProfileName` (*string*) : SFX profile name.
- `nodeID` (*integer*) : Attachment node.
- **returns**: any|nil Source identifier or nil on failure.

#### `sounds.createSoundObj(filename, description, SFXProfileName, nodeID)`

Creates an FMOD audio source (obj:createSFXSource) and returns it wrapped in a soundObj, with a cache of the latest values to avoid useless calls. If creation fails, returns a dummy object whose setVolumePitch does nothing.

- `filename` (*string*) : FMOD file or event (e.g. 'event:>Surfaces>roll_rigid_v2').
- `description` (*string*) : Audio descriptor name (e.g. 'AudioDefaultLoop3D').
- `SFXProfileName` (*string*) : SFX profile name (can be empty for an FMOD event).
- `nodeID` (*integer*) : Node to which the source is attached.
- **returns**: table soundObj (methods setVolumePitch, setParameter) or dummy object.

#### `sounds.createSoundscapeSound(name)`

Creates the source of a soundscape sound defined in v.data.soundscape. Uses the soundscape's node if it is numeric, otherwise refNode.

- `name` (*string*) : Soundscape name in the jbeam.
- **returns**: any|nil Audio source, or nil if the soundscape does not exist.

#### `sounds.getBeamSounds()`

Debug: returns the list of per-beam suspension sounds (with impulse, pitch, volume of the last frame).

- **returns**: table List of tables {beam, clip, volumeFactor, pitchFactor, impulse, pitch, volume...}.

#### `sounds.getEngineSoundData()`

Debug (sound editor): iterates over the engines that have getSoundConfiguration and returns their sound configurations.

- **returns**: table 0-based table: {reference, data, fundamentalFrequencyRPMCoef, engineIndex}.
- **returns**: table List of labels 'name (engine) -> blend file'.

#### `sounds.hzToFMODHz(hzValue)`

Converts a real frequency in Hz (clamped to 20..22000) to the FMOD 0..1000 scale (interpolation by segments of 100). Code duplicated in C++ (trueforceDSP.cpp).

- `hzValue` (*number*) : Frequency in Hz.
- **returns**: number Value on the FMOD scale (0..1000).

#### `sounds.playSoundOnceAtNode(soundName, nodeID, volume, pitch, color, texture)`

Plays a sound once at the (static) position of a node. Ignored if the volume is < 0.01 or the pitch < 0.0039.

- `soundName` (*string*) : FMOD event.
- `nodeID` (*integer*) : Emission node.
- `volume` (*number*) : Volume 0..1.
- `pitch` (*number|nil*) : Normalized pitch (1 by default).
- `color` (*number|nil*) : 'color' parameter (0 by default).
- `texture` (*number|nil*) : 'texture' parameter (0 by default).

#### `sounds.playSoundOnceFollowNode(soundName, nodeID, volume, pitch, color, texture)`

Like playSoundOnceAtNode but the sound follows the node during playback.

- `soundName` (*string*) : FMOD event.
- `nodeID` (*integer*) : Followed node.
- `volume` (*number*) : Volume 0..1.
- `pitch` (*number|nil*) : Pitch (1 by default).
- `color` (*number|nil*) : 'color' parameter (0 by default).
- `texture` (*number|nil*) : 'texture' parameter (0 by default).

#### `sounds.playSoundSkipAI(sound, volume)`

Replays an existing source (volume then cut + play), unless no player is seated and the AI is driving (the sound is then skipped).

- `sound` (*any*) : Audio source obtained by createSFXSource (inferred from code).
- `volume` (*number|nil*) : Volume (1 by default).

#### `sounds.setUIDebug(enabled, data)`

Enables or disables the audio debug report to the UI (costly in performance, reserve for debugging). The data parameter is not used.

- `enabled` (*boolean*) : Enable the report.
- `data` (*any*) : Unused (todo in the code).

#### `sounds.updateGFX(dt)`

Main sound loop (each graphics frame): impact/break detection every 0.04 s (obj:getImpactDeformEnergyNode), .sbeam bank, suspension sounds, wind (above 3 m/s speed relative to the wind) and rolling/skidding/kickup sounds of each wheel.

- `dt` (*number*) : Frame time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `engineNode` | integer | Emission node of the engine sounds: first torqueReactionNodes of the first engine, otherwise the ref node. The initial declaration is nil, then init() gives it 0 or a cid. |
| `objType` | integer | Current audio object type: 0 seated player, 1 AI only, 2 traffic; -1 forces an update. |
| `refNode` | integer | Reference node of the vehicle (refNodes[0].ref or leftCorner), 0 by default. Declared nil initially, set by init(). |
| `scrapeLoosenessMap` | table<integer, number> | Material -> friction 'looseness' (0..0.9) table: rubber 0.05, rock 0.1, gravel 0.2, grass 0.3, foliage 0.4, fine foliage 0.5, dusty dirt 0.6, dirt 0.7, mud 0.8, sand 0.9. Metal and wood are 0 by default (absent). |
| `uiDebugging` | boolean | True if the audio debug report to the UI is enabled (setUIDebug). |
| `usesOldCustomSounds` | boolean | True if the vehicle has its own .sbeam files (old custom sound system). |

## Class `soundObj`

Wrapper of an audio source returned by createSoundObj. Fields: obj (raw source), lastVol, lastPitch, lastColor, lastTexture.

| Method | Description | Line |
|---|---|---|
| `soundObj:setParameter(keyName, value)` | Sets a named FMOD parameter (obj:setSFXparameter). For low-frequency use only. The automatic page only lists 'value' but the function takes (keyName, value). | 146 |
| `soundObj:setVolumePitch(vol, pitch, color, texture)` | Sets volume, pitch, color and texture (RTPC) of the source while avoiding redundant calls (volume < 0.01 becomes 0). | 122 |

**UI events (guihooks.trigger):** `AudioDebug`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`
- `obj:` `createSFXSource`, `createSFXSource2`, `cutSFX`, `deleteSFXSources`, `getAirflowSpeed`, `getBeamStress`, `getBeamVelocity`, `getGroundSpeed`, `getID`, `getImpactDeformEnergyNode`, `inWater`, `playSFX`, `playSFXOnceCT`, `playSFXOnceStaticCT`, `queueGameEngineLua`, `setNodeVolumePitchCT`, `setSFXparameter`, `setVolume`, `setVolumePitchCT`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/sounds.lua`.*
