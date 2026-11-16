---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/missionTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab object returned by the constructor (new(rallyEditor)). Fields: rallyEditor, path, windowDescription = 'Mission'.
---@class editor_rallyEditor_missionTab
local editor_rallyEditor_missionTab = {}

--- Draws the tab's imgui interface (mission info, list of local voicepacks).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/missionTab.lua:45
---@param mouseInfo table Mouse information (not used here).
function editor_rallyEditor_missionTab:draw(mouseInfo) end

--- Internal constructor: stores the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/missionTab.lua:14
---@param rallyEditor table Editor instance (getCurrentMissionDir/Name/Id, getCurrentVoicepackPick).
function editor_rallyEditor_missionTab:init(rallyEditor) end

--- Called when the tab is selected: emits the hook onEditorEditModeChanged(nil, nil) to leave any edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/missionTab.lua:22
function editor_rallyEditor_missionTab:selected() end

--- Stores the current notebook (called by the editor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/missionTab.lua:18
---@param path table Current notebook.
function editor_rallyEditor_missionTab:setPath(path) end

--- Called when the tab is left: emits the hook onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/missionTab.lua:26
function editor_rallyEditor_missionTab:unselect() end

