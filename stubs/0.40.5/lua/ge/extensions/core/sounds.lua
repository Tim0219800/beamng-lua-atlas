---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/sounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bridge between the game and the FMOD audio engine on the GE side. On each render (onPreRender), it pushes global parameters (camera speed and rotation, time of day, wind, player vehicle speed, interior camera, underwater, height above ground and sea, audio blur). It also provides functions to initialize and drive a vehicle's engine/exhaust sounds, and handles the audio blur when a mission menu is open.
--- Access: extension `core_sounds`: `extensions.load("core_sounds")`, then the global `core_sounds`
---@class core_sounds
---@field cabinFilterStrength number Cabin filter/reverb strength (0 to 1, clamped when sent) for the interior camera of the player vehicle. Default 1. Written by setCabinFilterStrength.
---@field dependencies string[] core_camera, core_settings_settings, core_input_bindings.
core_sounds = {}

--- Initializes a vehicle's engine sound: vehicle:engineSoundInit, then sets wet_level = 0 and dry_level = 1. Does nothing if the vehicle does not exist.
---Source: lua/ge/extensions/core/sounds.lua:95
---@param vehicleId integer Vehicle object id.
---@param engineId integer Engine identifier (inferred from code).
---@param jsonPath string Path of the sound description file.
---@param nodeIdArray integer|integer[] Emitter node(s); a single number is wrapped into a table.
---@param noloadVol number|nil Volume at no load, 1 by default.
---@param loadVol number|nil Volume under load, 1 by default.
function core_sounds.initEngineSound(vehicleId, engineId, jsonPath, nodeIdArray, noloadVol, loadVol) end

--- Like initEngineSound but for the exhaust, with node pairs. Also calls vehicle:engineSoundInit (same engine call).
---Source: lua/ge/extensions/core/sounds.lua:106
---@param vehicleId integer Vehicle id.
---@param engineId integer Engine identifier.
---@param jsonPath string Path of the sound file.
---@param nodeIdPairArray table|integer Table of node pairs; a single number becomes {{n, n}}.
---@param noloadVol number|nil Volume at no load, 1 by default.
---@param loadVol number|nil Volume under load, 1 by default.
function core_sounds.initExhaustSound(vehicleId, engineId, jsonPath, nodeIdPairArray, noloadVol, loadVol) end

--- Hook called when an activity gathers its acceptance data. Remembers whether any of the items is of type "mission".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:202
---@param elemData table[] List of items with a type field.
---@param activityData any Unused (log only).
function core_sounds.onActivityAcceptGatherData(elemData, activityData) end

--- Hook called after Lua extensions are reloaded: reruns sounds.updateCabinFilter() on all vehicles to restore cabinFilterStrength.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:232
---@param data any Not used.
function core_sounds.onDeserialized(data) end

--- Hook: if data.missionCount is 0, disables the mission interaction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:214
---@param data table|nil Table with missionCount.
function core_sounds.onMissionAvailabilityChanged(data) end

--- Hook called when the mission info window changes state: switching to 'opened' enables the interaction; 'opened' to 'closed' disables it and resets the blur to 0. No effect if no mission marker is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:186
---@param fromState string Old state.
---@param toState string New state.
---@param content any Not used.
function core_sounds.onMissionInfoChangedState(fromState, toState, content) end

--- Render hook. Updates the global FMOD parameters (Engine.Audio.getGlobalParams) if available. See notes for the list of parameters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:32
---@param dtReal number Real frame duration (s).
---@param dtSim number Simulated duration (s); if 0, camera speeds are not updated.
---@param dtRaw number Raw duration (unused).
function core_sounds.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook called when settings change: re-reads AudioInsideModifier.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:143
function core_sounds.onSettingsChanged() end

--- Hook called when the UI state changes. If a mission marker is active, handles gameAudioBlurValue: 1 while interacting with the mission UI, reset to 0 for transitions to play (from scenario.start, menu, fadeScreen, blank) or to scenario.end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:147
---@param toState string New UI state.
---@param fromState string Old UI state.
function core_sounds.onUiChangedState(toState, fromState) end

--- Hook: when player 0's vehicle changes, runs sounds.updateCabinFilter() in the new vehicle's VM.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/sounds.lua:225
---@param oldId integer Old id.
---@param newId integer New id.
---@param player integer Player index; ignored if different from 0.
function core_sounds.onVehicleSwitched(oldId, newId, player) end

--- Manually sets the value of the global audio blur (parameter g_GameAudioBlur).
---Source: lua/ge/extensions/core/sounds.lua:255
---@param value number 0 = no blur, 1 = maximum blur (inferred from code).
function core_sounds.setAudioBlur(value) end

--- Sets cabinFilterStrength, but only if objId is player vehicle 0. Typically called from the vehicle VM.
---Source: lua/ge/extensions/core/sounds.lua:220
---@param objId integer Id of the emitting vehicle.
---@param value number Strength 0 to 1.
function core_sounds.setCabinFilterStrength(objId, value) end

--- Sets an engine sound parameter (vehicle:engineSoundParameter).
---Source: lua/ge/extensions/core/sounds.lua:124
---@param vehicleId integer Vehicle id.
---@param engineId integer Engine identifier.
---@param paramName string Parameter name.
---@param paramValue number Value.
function core_sounds.setEngineSoundParameter(vehicleId, engineId, paramName, paramValue) end

--- Sets several engine sound parameters at once.
---Source: lua/ge/extensions/core/sounds.lua:130
---@param vehicleId integer Vehicle id.
---@param engineId integer Engine identifier.
---@param parameters table<string, number> Name -> value (inferred from code).
function core_sounds.setEngineSoundParameterList(vehicleId, engineId, parameters) end

--- Changes the exhaust sound emitter nodes (vehicle:engineSoundNodes).
---Source: lua/ge/extensions/core/sounds.lua:136
---@param vehicleId integer Vehicle id.
---@param engineId integer Engine identifier.
---@param nodeIdPairArray table Table of node pairs.
function core_sounds.setExhaustSoundNodes(vehicleId, engineId, nodeIdPairArray) end

--- Updates the engine sound (vehicle:engineSoundUpdate).
---Source: lua/ge/extensions/core/sounds.lua:118
---@param vehicleId integer Vehicle id.
---@param engineId integer Engine identifier.
---@param rpm number Engine speed (RPM).
---@param onLoad number Engine load (inferred from code).
---@param engineVolume number Engine volume.
function core_sounds.updateEngineSound(vehicleId, engineId, rpm, onLoad, engineVolume) end

