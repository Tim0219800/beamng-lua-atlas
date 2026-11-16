---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tab instance (windowDescription = 'System Pacenotes').
---@class editor_rallyEditor_systemPacenotesTab
local editor_rallyEditor_systemPacenotesTab = {}

--- Forgets the notebook and the displayed system pacenotes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:18
function editor_rallyEditor_systemPacenotesTab:clearState() end

--- Draws the tab (message if the mission is not rallyStage, otherwise refresh button and 4-column table).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:122
---@param mouseInfo table Mouse information (not used).
function editor_rallyEditor_systemPacenotesTab:draw(mouseInfo) end

--- Constructor: stores rallyEditor, empty list of system pacenotes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:11
---@param rallyEditor table Parent rally editor.
function editor_rallyEditor_systemPacenotesTab:init(rallyEditor) end

--- Called when the tab is selected: loads path:getSystemPacenotesForAudioMode() then emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:36
function editor_rallyEditor_systemPacenotesTab:selected() end

--- Sets the current notebook (the code comment specifies that "path" refers to the notebook); enables the display only if path:getMissionType() == 'rallyStage'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:25
---@param path table|nil Notebook.
function editor_rallyEditor_systemPacenotesTab:setPath(path) end

--- Called when the tab is left: emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:50
function editor_rallyEditor_systemPacenotesTab:unselect() end

