---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab instance (windowDescription = 'Voicepacks').
---@class editor_rallyEditor_voicepacksTab
local editor_rallyEditor_voicepacksTab = {}

--- Draws the tab; message if no mission is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:255
---@param mouseInfo table Mouse information (not used).
function editor_rallyEditor_voicepacksTab:draw(mouseInfo) end

--- Draws the list of global voicepacks (voicepack.scan()).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:241
---@param missionDir string Mission folder.
function editor_rallyEditor_voicepacksTab:drawGlobalVoicepacks(missionDir) end

--- Draws the list of the mission's voicepacks (voicepack.scanMission).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:248
---@param missionDir string Mission folder.
function editor_rallyEditor_voicepacksTab:drawMissionLocalVoicepacks(missionDir) end

--- Draws the "Voicepack" and "Notebook" menus; changing the selection calls the editor's setVoicepackPick or loadNotebook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:130
---@param missionDir string Mission folder.
function editor_rallyEditor_voicepacksTab:drawPickers(missionDir) end

--- Constructor: stores rallyEditor and creates the audio validation cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:20
---@param rallyEditor table Parent rally editor.
function editor_rallyEditor_voicepacksTab:init(rallyEditor) end

--- Called when the tab is selected: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:29
function editor_rallyEditor_voicepacksTab:selected() end

--- Sets the current notebook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:25
---@param path table|nil Notebook.
function editor_rallyEditor_voicepacksTab:setPath(path) end

--- Called when the tab is left: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:33
function editor_rallyEditor_voicepacksTab:unselect() end

