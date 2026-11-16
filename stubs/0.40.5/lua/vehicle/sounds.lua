---@meta
-- tim19Atlas stub generated from lua/vehicle/sounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle sounds other than the engine: tire rolling and skidding noises (depending on the ground material: asphalt, dirt, gravel, grass, ice...), gravel kickup, body impacts and breaks, scrapes, per-beam suspension squeaks (soundFile in the jbeam), wind, soundscape sounds, .sbeam sound bank driven by electrics, cabin filter. Also provides utility functions to create and play FMOD sources from a controller or an engine (createSoundObj, playSoundOnceAtNode...) as well as Hz <-> FMOD scale conversions.
--- Access: global `sounds`
---@class sounds
---@field engineNode integer Emission node of the engine sounds: first torqueReactionNodes of the first engine, otherwise the ref node. The initial declaration is nil, then init() gives it 0 or a cid.
---@field objType integer Current audio object type: 0 seated player, 1 AI only, 2 traffic; -1 forces an update.
---@field refNode integer Reference node of the vehicle (refNodes[0].ref or leftCorner), 0 by default. Declared nil initially, set by init().
---@field scrapeLoosenessMap table<integer, number> Material -> friction 'looseness' (0..0.9) table: rubber 0.05, rock 0.1, gravel 0.2, grass 0.3, foliage 0.4, fine foliage 0.5, dusty dirt 0.6, dirt 0.7, mud 0.8, sand 0.9. Metal and wood are 0 by default (absent).
---@field uiDebugging boolean True if the audio debug report to the UI is enabled (setUIDebug).
---@field usesOldCustomSounds boolean True if the vehicle has its own .sbeam files (old custom sound system).
sounds = {}

--- Inverse conversion of hzToFMODHz: FMOD value 0..1000 to Hz.
---Source: lua/vehicle/sounds.lua:1329
---@param fmodHzValue number Value on the FMOD scale (clamped to 0..1000).
---@return number  Frequency in Hz.
function sounds.FMODHzToHz(fmodHzValue) end

--- Handles the scrape sound of a body node during a contact: chooses the event according to the material (metal or plastic), ignores it on absorbing materials (rubber, cloth, sand and mud for wheel nodes) and sets volume, pitch, color and texture of the source.
---Source: lua/vehicle/sounds.lua:1045
---@param p table Engine collision data (id1, slipVel, normalForce, materialID1, materialID2).
function sounds.bodyCollision(p) end

--- Creates a raw audio source (obj:createSFXSource) without a soundObj wrapper. On failure, disables playSoundOnceAtNode/FollowNode and logs a warning.
---Source: lua/vehicle/sounds.lua:195
---@param filename string File or event.
---@param description string Audio descriptor.
---@param SFXProfileName string SFX profile name.
---@param nodeID integer Attachment node.
---@return any|nil  Source identifier or nil on failure.
function sounds.createSFXSource(filename, description, SFXProfileName, nodeID) end

--- Creates an FMOD audio source (obj:createSFXSource) and returns it wrapped in a soundObj, with a cache of the latest values to avoid useless calls. If creation fails, returns a dummy object whose setVolumePitch does nothing.
---Source: lua/vehicle/sounds.lua:209
---@param filename string FMOD file or event (e.g. 'event:>Surfaces>roll_rigid_v2').
---@param description string Audio descriptor name (e.g. 'AudioDefaultLoop3D').
---@param SFXProfileName string SFX profile name (can be empty for an FMOD event).
---@param nodeID integer Node to which the source is attached.
---@return table  soundObj (methods setVolumePitch, setParameter) or dummy object.
function sounds.createSoundObj(filename, description, SFXProfileName, nodeID) end

--- Creates the source of a soundscape sound defined in v.data.soundscape. Uses the soundscape's node if it is numeric, otherwise refNode.
---Source: lua/vehicle/sounds.lua:104
---@param name string Soundscape name in the jbeam.
---@return any|nil  Audio source, or nil if the soundscape does not exist.
function sounds.createSoundscapeSound(name) end

--- Empties the .sbeam sound bank and prevents it from reloading: called by engines that use the new engine sound system.
---Source: lua/vehicle/sounds.lua:1308
function sounds.disableOldEngineSounds() end

--- Debug: returns the list of per-beam suspension sounds (with impulse, pitch, volume of the last frame).
---Source: lua/vehicle/sounds.lua:1404
---@return table  List of tables {beam, clip, volumeFactor, pitchFactor, impulse, pitch, volume...}.
function sounds.getBeamSounds() end

--- Debug (sound editor): iterates over the engines that have getSoundConfiguration and returns their sound configurations.
---Source: lua/vehicle/sounds.lua:1408
---@return table  0-based table: {reference, data, fundamentalFrequencyRPMCoef, engineIndex}.
---@return table  List of labels 'name (engine) -> blend file'.
function sounds.getEngineSoundData() end

--- Converts a real frequency in Hz (clamped to 20..22000) to the FMOD 0..1000 scale (interpolation by segments of 100). Code duplicated in C++ (trueforceDSP.cpp).
---Source: lua/vehicle/sounds.lua:1315
---@param hzValue number Frequency in Hz.
---@return number  Value on the FMOD scale (0..1000).
function sounds.hzToFMODHz(hzValue) end

--- Resets all the vehicle's audio sources (deleteSFXSources), loads the .sbeam banks, creates the per-beam suspension sounds, the scrape sounds, the tire sounds and reads the 'sounds' jbeam section. Called when the vehicle loads.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sounds.lua:1075
function sounds.init() end

--- Deserialization hook after the vehicle Lua reload: resets objType to -1 (all of M is serialized and restored).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sounds.lua:1304
function sounds.onDeserialized() end

--- Plays a sound once at the (static) position of a node. Ignored if the volume is < 0.01 or the pitch < 0.0039.
---Source: lua/vehicle/sounds.lua:162
---@param soundName string FMOD event.
---@param nodeID integer Emission node.
---@param volume number Volume 0..1.
---@param pitch number|nil Normalized pitch (1 by default).
---@param color number|nil 'color' parameter (0 by default).
---@param texture number|nil 'texture' parameter (0 by default).
function sounds.playSoundOnceAtNode(soundName, nodeID, volume, pitch, color, texture) end

--- Like playSoundOnceAtNode but the sound follows the node during playback.
---Source: lua/vehicle/sounds.lua:169
---@param soundName string FMOD event.
---@param nodeID integer Followed node.
---@param volume number Volume 0..1.
---@param pitch number|nil Pitch (1 by default).
---@param color number|nil 'color' parameter (0 by default).
---@param texture number|nil 'texture' parameter (0 by default).
function sounds.playSoundOnceFollowNode(soundName, nodeID, volume, pitch, color, texture) end

--- Replays an existing source (volume then cut + play), unless no player is seated and the AI is driving (the sound is then skipped).
---Source: lua/vehicle/sounds.lua:150
---@param sound any Audio source obtained by createSFXSource (inferred from code).
---@param volume number|nil Volume (1 by default).
function sounds.playSoundSkipAI(sound, volume) end

--- Resets the wind and suspension sounds, sends the static tire parameters again (the GE cache is emptied at each reset) and updates c_objType. Called when the vehicle resets.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sounds.lua:1341
function sounds.reset() end

--- Enables or disables the audio debug report to the UI (costly in performance, reserve for debugging). The data parameter is not used.
---Source: lua/vehicle/sounds.lua:1299
---@param enabled boolean Enable the report.
---@param data any Unused (todo in the code).
function sounds.setUIDebug(enabled, data) end

--- Sends to the game (GE) the strength of this vehicle's cabin filter (cabinFilterCoef clamped to 0..1) via core_sounds.setCabinFilterStrength.
---Source: lua/vehicle/sounds.lua:1069
function sounds.updateCabinFilter() end

--- Main sound loop (each graphics frame): impact/break detection every 0.04 s (obj:getImpactDeformEnergyNode), .sbeam bank, suspension sounds, wind (above 3 m/s speed relative to the wind) and rolling/skidding/kickup sounds of each wheel.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sounds.lua:219
---@param dt number Frame time step (s).
function sounds.updateGFX(dt) end

--- Determines the audio object type (0 seated player, 1 AI, 2 traffic) and, if it changed, sends the c_objType parameter again to all tire sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sounds.lua:1380
function sounds.updateObjType() end

--- Wrapper of an audio source returned by createSoundObj. Fields: obj (raw source), lastVol, lastPitch, lastColor, lastTexture.
---@class sounds_soundObj
local sounds_soundObj = {}

--- Sets a named FMOD parameter (obj:setSFXparameter). For low-frequency use only. The automatic page only lists 'value' but the function takes (keyName, value).
---Source: lua/vehicle/sounds.lua:146
---@param keyName string FMOD parameter name (e.g. 'c_objType').
---@param value number Parameter value.
function sounds_soundObj:setParameter(keyName, value) end

--- Sets volume, pitch, color and texture (RTPC) of the source while avoiding redundant calls (volume < 0.01 becomes 0).
---Source: lua/vehicle/sounds.lua:122
---@param vol number Volume 0..1.
---@param pitch number Normalized pitch.
---@param color number|nil Color parameter (0 by default).
---@param texture number|nil Texture parameter (0 by default).
---@return boolean  true if a value was sent to the audio engine, false if ignored.
function sounds_soundObj:setVolumePitch(vol, pitch, color, texture) end

