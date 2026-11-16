---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/testTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test tab instance, created by the constructor returned by the module (calls init). Has windowDescription = 'Test'.
---@class editor_rallyEditor_testTab
local editor_rallyEditor_testTab = {}

--- Draws the three test buttons (imgui). Does nothing without a notebook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:42
function editor_rallyEditor_testTab:draw() end

--- 3D view debug drawing entry point; empty here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:71
function editor_rallyEditor_testTab:drawDebugEntrypoint() end

--- Constructor: stores rallyEditor, path = nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:13
---@param rallyEditor table Parent rally editor module.
function editor_rallyEditor_testTab:init(rallyEditor) end

--- Called by the rally editor when the tab is selected; re-emits the onEditorEditModeChanged(nil, nil) hook to redraw the shortcut legend.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:25
function editor_rallyEditor_testTab:selected() end

--- Sets the current notebook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:20
---@param path table|nil Notebook (rally object).
function editor_rallyEditor_testTab:setPath(path) end

--- Prints to the console the name of a random system pacenote of type 'precountdown' (path:getRandomSystemPacenote).
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:64
function editor_rallyEditor_testTab:test1() end

--- Called when the tab is left; also emits onEditorEditModeChanged(nil, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/testTab.lua:36
function editor_rallyEditor_testTab:unselect() end

