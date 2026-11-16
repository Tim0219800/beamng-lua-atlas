---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audioForest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension (core_audioForest): runtime coordinator of forest audio emitters. From the level's Forest trees/objects, it builds a thinned cloud of audio nodes (audioForestCommon), then every frame computes the weighted average position of the nodes around the listener (radius 150 m) and moves a single SFX emitter (the 'main emitter') to that point while setting its FMOD parameters (RTPC). An independent 'roomtone' emitter can also play an ambience. Per-level settings are read from levels/<level>/dynamicAudioEmitters/forestData.audioSFX.json (created by the editor). The RTPCs: volume = intensity, pitch = node density, color = vegetation size, texture = unused; the global parameter g_ForestHeight = listener height relative to the forest centroid (or the terrain).
--- Access: extension `core_audioForest`: `extensions.load("core_audioForest")`, then the global `core_audioForest`
---@class core_audioForest
core_audioForest = {}

--- Resets the whole runtime state (emitters, nodes, tool state, settings).
---Source: lua/ge/extensions/core/audioForest.lua:582
function core_audioForest.clear() end

--- Removes only the main audio path (emitter and event name).
---Source: lua/ge/extensions/core/audioForest.lua:550
function core_audioForest.clearMainAudio() end

--- For the editor: returns the table {[1] = id of the nearest representative node} and size 1.
---Source: lua/ge/extensions/core/audioForest.lua:540
---@return table<integer, integer>  Array of node ids (0 if none)
---@return integer  Number of emitters (always 1)
function core_audioForest.getEmitterNodeIds() end

--- For editor visualization: current state of the main emitter.
---Source: lua/ge/extensions/core/audioForest.lua:545
---@return boolean  true if the emitter is active (nodes are within the radius)
---@return number  x (m)
---@return number  y (m)
---@return number  z (m)
---@return integer  id of the representative node
function core_audioForest.getMainEmitterDebugState() end

--- Returns the currently loaded tool state.
---Source: lua/ge/extensions/core/audioForest.lua:180
---@return table|nil  Tool state (see setPersistedToolState)
function core_audioForest.getPersistedToolState() end

--- Hook called when the level objects are created: loads the level configuration and starts the prepass.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioForest.lua:517
function core_audioForest.onClientCustomObjectSpawning() end

--- Hook called at the end of a level: resets the whole state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioForest.lua:587
function core_audioForest.onClientEndMission() end

--- Hook after Lua reload: re-reads the level configuration and rebuilds the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioForest.lua:526
---@param data table Data from onSerialize (ignored)
function core_audioForest.onDeserialized(data) end

--- Hook called by the editor before the level is saved: writes the stored tool state to levels/<level>/dynamicAudioEmitters/forestData.audioSFX.json.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioForest.lua:531
function core_audioForest.onEditorBeforeSaveLevel() end

--- Serialization hook before Lua reload: returns an empty table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioForest.lua:522
---@return table  {}
function core_audioForest.onSerialize() end

--- Hook called every frame by the extension system: advances the loading prepass, then moves the main emitter and sets its RTPCs according to the nodes near the listener (SFXSystem.getPositionXYZ).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioForest.lua:299
---@param dtReal number Real time step (s)
---@param dtSim number Simulation time step (s)
---@param dtRaw number Raw time step (s)
function core_audioForest.onUpdate(dtReal, dtSim, dtRaw) end

--- Enables or disables the system. On enable, creates the main emitter if there is an event and nodes; on disable, removes it.
---Source: lua/ge/extensions/core/audioForest.lua:395
---@param v boolean true to enable
function core_audioForest.setEnabled(v) end

--- Sets the FMOD event of the main emitter (without touching the roomtone). Empty string: removes the emitter. Otherwise updates the existing emitter or creates it if the system is enabled and has nodes.
---Source: lua/ge/extensions/core/audioForest.lua:284
---@param eventName string|nil FMOD event name
function core_audioForest.setMainEvent(eventName) end

--- Installs a node cloud produced by audioForestCommon.buildNodeCloudFromForest (used by the editor or the runtime). Fetches the terrain (core_terrain.getTerrain) and the global audio parameters; returns false and clears the state if the cloud is invalid or there is no terrain.
---Source: lua/ge/extensions/core/audioForest.lua:253
---@param cloud table Cloud: nodeCount, nodeX, nodeY, nodeZ, nodeDepth, nodeAvgNormVol, nodeSourceCount, pitchDensityInv, kdNodes
---@return boolean  true if installed
function core_audioForest.setNodeCloud(cloud) end

--- Stores the editing tool state for saving the level.
---Source: lua/ge/extensions/core/audioForest.lua:175
---@param st table|nil State: version, mainEvent, roomtoneEnabled, roomtoneEvent, roomtoneZ, includeByShape, classSelByShape, classOverrideByShape, nodeVisDrawRadius, nodeVisSphereRadius, showNodes, selectedRow
function core_audioForest.setPersistedToolState(st) end

--- Overrides the automatic pitch normalization (inverse of the number of reference sources). nil or value <= 0: reverts to automatic.
---Source: lua/ge/extensions/core/audioForest.lua:407
---@param v number|nil Factor 1 / number of sources
function core_audioForest.setPitchDensityInv(v) end

--- Enables or disables the independent 'roomtone' emitter (creates it if there is a roomtone event).
---Source: lua/ge/extensions/core/audioForest.lua:416
---@param v boolean true to enable
function core_audioForest.setRoomtoneEnabled(v) end

--- Sets the roomtone event. No visible effect until the roomtone is enabled; empty string: removes the emitter.
---Source: lua/ge/extensions/core/audioForest.lua:426
---@param eventName string|nil FMOD event name
function core_audioForest.setRoomtoneEvent(eventName) end

--- Sets the altitude of the roomtone emitter (positioned at x=0, y=0).
---Source: lua/ge/extensions/core/audioForest.lua:446
---@param v number|nil Altitude in meters, 0 by default
function core_audioForest.setRoomtoneZ(v) end

