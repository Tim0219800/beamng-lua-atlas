---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/history.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- History window class (windowName = 'fg_history').
---@class editor_flowgraph_history_C
local editor_flowgraph_history_C = {}

--- Deserialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/history.lua:85
---@param data table Data.
function editor_flowgraph_history_C:_onDeserialized(data) end

--- Serialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/history.lua:81
---@param data table Data.
function editor_flowgraph_history_C:_onSerialize(data) end

--- Associates the flowgraph manager.
---Source: lua/ge/extensions/editor/flowgraph/history.lua:12
---@param mgr table Manager.
function editor_flowgraph_history_C:attach(mgr) end

--- Draws the window if visible: Undo, Redo and clickable Idx/Action table.
---Source: lua/ge/extensions/editor/flowgraph/history.lua:20
function editor_flowgraph_history_C:draw() end

--- Registers the editor window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/history.lua:16
function editor_flowgraph_history_C:init() end

