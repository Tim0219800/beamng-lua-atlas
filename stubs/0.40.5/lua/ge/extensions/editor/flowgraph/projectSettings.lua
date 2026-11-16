---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/projectSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Window class (windowName 'projectSettings', windowDescription 'Project Settings').
---@class editor_flowgraph_projectSettings_C
local editor_flowgraph_projectSettings_C = {}

--- Window deserialization hook: empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/projectSettings.lua:123
---@param data table Restored data (ignored).
function editor_flowgraph_projectSettings_C:_onDeserialized(data) end

--- Window serialization hook: empty, nothing is saved.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/projectSettings.lua:119
---@param data table Save table (unchanged).
function editor_flowgraph_projectSettings_C:_onSerialize(data) end

--- Stores the manager and prepares the ImGui fields (name 64 chars, authors 128 chars, difficulty pointer) from mgr.name, mgr.authors and mgr.difficulty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/projectSettings.lua:14
---@param mgr table Current flowgraph manager.
function editor_flowgraph_projectSettings_C:attach(mgr) end

--- Draws the project fields and the Save / Save as... buttons. Save calls fgEditor.save(), Save as opens the file dialog then fgEditor.saveAsFile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/projectSettings.lua:25
function editor_flowgraph_projectSettings_C:draw() end

--- Registers the window in the editor (150x300, hidden by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/projectSettings.lua:21
function editor_flowgraph_projectSettings_C:init() end

