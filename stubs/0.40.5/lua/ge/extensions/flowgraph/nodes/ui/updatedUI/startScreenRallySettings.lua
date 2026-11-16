---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C
local flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C = {}

--- Clears pendingValue and pendingSettings.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:115
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:_executionStarted() end

--- Applies the co-driver choice: records rallyVoicepackPick (loop) or reloads the voicepack assets via rm:reloadVoicepackAssets; logs an error on failure.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:290
---@param value string Value of the chosen co-driver.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:applyPick(value) end

--- Returns the mission's boolean settings kept in settingKeys, with the pending value if it exists.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:154
---@param mission table|nil Mission whose getUserSettingsData() is read.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildBoolSettings(mission) end

--- Builds the list of co-drivers for a rally loop mission (label, value, shortLabel, detail) and the selected value; returns nil if nothing is available.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:125
---@param loopManager table Rally loop manager.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildLoopOptions(loopManager) end

--- Same for a standard rally special stage from the rally manager.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:140
---@param rm table Rally manager (gameplay_rally.getRallyManager()).
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:buildStageOptions(rm) end

--- Returns the rally mission of the loop (loopManager:getRallyLoopMission()) or, without a loop, the manager's activity.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:120
---@param loopManager table|nil Rally loop manager or nil.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:getMission(loopManager) end

--- Creates the panel {type='coDriverSelector', ...} and clears the pending choices.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:102
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:init() end

--- Called by the panel when a co-driver is chosen: stores the choice and plays a sample (composed, recorded or intercom test).
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:236
---@param value string Chosen value.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onCoDriverSelectedByPanel(value) end

--- Called when a boolean setting changes: updates pendingSettings, mission.lastUserSettings and the panel. Accepts either (key, value) or a table {key, value}.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:252
---@param key string|table Setting key or payload table.
---@param value boolean|nil New value.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onRallyStartSettingChanged(key, value) end

--- Hook called on clicking Start: stops the audio, writes the pending settings via settings.setValue and applies the chosen co-driver (applyPick).
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:276
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onUIStartButtonClicked() end

--- Called every frame as an extension; advances the sample audio queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:232
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onUpdate(dtReal, dtSim, dtRaw) end

--- Called when the visual notes checkbox changes; stores rallyVisualPacenotes as pending.
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:243
---@param value boolean New state.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:onVisualPacenotesChangedByPanel(value) end

--- Resets the sample audio queue then puts the given audio objects in it (voicepack timing of the entry).
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:224
---@param entry table|nil Voicepack entry.
---@param audioObjs table|nil Audio objects to play; nil to stop.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:playSample(entry, audioObjs) end

--- Finds the voicepack entry matching the chosen value (loop or special stage mode).
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:214
---@param value string Co-driver setting value.
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:resolveEntry(value) end

--- Builds the panel (co-driver options, selection, visual notes, boolean settings, loop note) and adds it to the UI, then plays the intercom test of the selected co-driver. Without a rally manager or without options, logs a warning and skips the panel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua:173
function flowgraph_nodes_ui_updatedUI_startScreenRallySettings_C:work() end

