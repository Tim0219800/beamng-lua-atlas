---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/suspensionAudioDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small editor debug window (Audio menu) that plots the player vehicle's suspension sounds. Every frame it asks the vehicle (queueLuaCommand) to send sounds.getBeamSounds() back to the GE in editor_suspensionAudioDebug.beamSounds, then displays, for each wheel (front/rear, left/right), curves over 200 samples of the impulse, pitch and volume. The wheel position is inferred from the position of the beam's node id1.
--- Access: extension `editor_suspensionAudioDebug`: `extensions.load("editor_suspensionAudioDebug")`, then the global `editor_suspensionAudioDebug`
---@class editor_suspensionAudioDebug
editor_suspensionAudioDebug = {}

--- Draw hook called every frame: fetches the vehicle's beam sounds, updates the histories and draws the curves per wheel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/suspensionAudioDebug.lua:19
function editor_suspensionAudioDebug.onEditorGui() end

--- Editor initialization hook: registers the window (500x200) and the menu entry in the Audio group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/suspensionAudioDebug.lua:134
function editor_suspensionAudioDebug.onEditorInitialized() end

--- Extension load hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/suspensionAudioDebug.lua:127
function editor_suspensionAudioDebug.onExtensionLoaded() end

--- Extension unload hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/suspensionAudioDebug.lua:131
function editor_suspensionAudioDebug.onExtensionUnloaded() end

--- Hook called when the vehicle changes: clears the histories and resets the counter to 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/suspensionAudioDebug.lua:139
---@param oldVehicle any Old vehicle.
---@param newVehicle any New vehicle.
---@param player any Player concerned.
function editor_suspensionAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Shows the 'Suspension Audio Debug' window.
---Source: lua/ge/extensions/editor/suspensionAudioDebug.lua:122
function editor_suspensionAudioDebug.open() end

