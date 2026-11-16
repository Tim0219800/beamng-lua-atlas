---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/scriptAIEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ScriptAI scenario editor: 'Edit ScriptAI Scenario' edit mode (BNGMicrochip toolbar icon) to create, edit and run scripted vehicle trajectories and a camera path. It opens several windows: Script AI Editor (play/pause/loop timeline), Scene Vehicles (vehicles and recording), Scene Trajectories (list), up to three individual trajectory windows, Camera Trajectory and Draw Trajectory. Trajectories are either time-based (nodes x, y, z, t) or speed-based (nodes x, y, z, v). At run time, each trajectory is sent to the vehicle by ai.startFollowing(...) and the camera path is played by core_paths.playPath.
--- Access: extension `editor_scriptAIEditor`: `extensions.load("editor_scriptAIEditor")`, then the global `editor_scriptAIEditor`
---@class editor_scriptAIEditor
editor_scriptAIEditor = {}

--- Restoration hook after Lua reload: decodes data.d and restores trajectories, camera, time, unique identifiers and window state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIEditor.lua:3203
---@param dataIn table Table returned by onSerialize ({d = ...}).
function editor_scriptAIEditor.onDeserialized(dataIn) end

--- Drawing hook called every editor UI frame: handles mouse and gizmos (selection, drag, free drawing), draws the trajectories and all the tool's windows (main, vehicles, list, trajectories, camera, drawing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIEditor.lua:1989
function editor_scriptAIEditor.onEditorGui() end

--- Hook called when the editor world initializes: creates the scriptAIEditMode edit mode (onActivate/onDeactivate, icon, hideObjectIcons) and registers the eight windows; shows again those that were visible before a reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIEditor.lua:3128
function editor_scriptAIEditor.onEditorInitialized() end

--- Serialization hook (Lua reload): returns {d = lpack.encode{...}} with trajectories, camera, time, selections and button alphas; the windows are noted as not visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIEditor.lua:3186
---@return table  Table {d = encoded string}.
function editor_scriptAIEditor.onSerialize() end

--- Hook called when a vehicle is replaced: updates the text and jBeam of the trajectories linked to this id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIEditor.lua:3169
---@param vid integer Id of the replaced vehicle.
function editor_scriptAIEditor.onVehicleReplaced(vid) end

--- Hook called when a vehicle's recording stops (ai.stopRecording returned to the GE): detaches the vehicle's old trajectory and creates a new trajectory 'recorded_N' from data.path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/scriptAIEditor.lua:3153
---@param vid integer Id of the recorded vehicle.
---@param data table Recording containing path (nodes with t or v).
function editor_scriptAIEditor.onVehicleSubmitRecording(vid, data) end

