---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/scriptAIManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Script AI Manager' window (Gameplay menu): records, replays and saves the driving of the scene's vehicles for level designers. For each vehicle, it drives the vehicle's ai module via queueLuaCommand (ai.startRecording, ai.stopRecording, ai.startFollowing, ai.stopFollowing, ai.scriptStop) and receives the recordings and the script state through hooks. It displays the state, the progress, a 3D plot of the recorded path and manages the *.track.json files.
--- Access: extension `editor_scriptAIManager`: `extensions.load("editor_scriptAIManager")`, then the global `editor_scriptAIManager`
---@class editor_scriptAIManager
editor_scriptAIManager = {}

--- Returns the table of in-memory recordings, keyed by vehicle id (each recording notably contains the path).
---Source: lua/ge/extensions/editor/scriptAIManager.lua:576
---@return table<integer, table>  Recordings by vehicle id.
function editor_scriptAIManager.getCurrentRecordings() end

--- Restore hook after a Lua reload: reinstalls recordings and vehState.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:561
---@param data table Data returned by onSerialize.
function editor_scriptAIManager.onDeserialized(data) end

--- Debug drawing hook: plots the recorded path of each vehicle as colored square prisms (if Display Path is checked and the window is visible), limited to points near the camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:464
---@param lastDebugFocusPos any Not used: the code reads Lua.lastDebugFocusPos.
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw) end

--- Drawing hook called every frame: requests the script state of all vehicles and draws the table (name, state, progress, record/play/stop/save/load/More buttons) and the debug options (Fast forward, Display IDs, Display Path).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:130
function editor_scriptAIManager.onEditorGui() end

--- Editor initialization hook: registers the window (640x200) and the 'Script AI Manager' menu entry (Gameplay group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:571
function editor_scriptAIManager.onEditorInitialized() end

--- Serialization hook (Lua reload): returns {recordings, vehState}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:557
---@return table  Data to restore.
function editor_scriptAIManager.onSerialize() end

--- Called by the vehicle (via extensions.hook) with ai.scriptState(): computes the percentage (time / endScriptTime), detects the sleeping state (time < startDelay) and the switch to 'idle' when the script is finished (data nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:515
---@param vehId integer Vehicle id.
---@param data table|nil Script state (status, time, scriptTime, endScriptTime, posError...) or nil if there is no script anymore.
function editor_scriptAIManager.onVehicleSubmitInfo(vehId, data) end

--- Called by the vehicle (via extensions.hook) when a recording is finished: stores the data in recordings[vehId]. Do not call directly.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:509
---@param vehId integer Vehicle id.
---@param data table Recording returned by ai.stopRecording().
function editor_scriptAIManager.onVehicleSubmitRecording(vehId, data) end

--- Hook called when the player vehicle changes: updates the active vehicle in the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:567
---@param oldVehicle integer Old vehicle (inferred from code).
---@param newVehicle integer New vehicle, id used to find the index.
---@param player integer Player concerned.
function editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player) end

--- Called by the menu entry: finds the active player vehicle and displays the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIManager.lua:552
function editor_scriptAIManager.onWindowMenuItem() end

