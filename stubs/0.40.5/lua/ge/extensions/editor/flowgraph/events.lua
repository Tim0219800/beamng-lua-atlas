---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/events.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Event Log window class (windowName = 'fg_events').
---@class editor_flowgraph_events_C
local editor_flowgraph_events_C = {}

--- Deserialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/events.lua:151
---@param data table Data.
function editor_flowgraph_events_C:_onDeserialized(data) end

--- Serialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/events.lua:147
---@param data table Data.
function editor_flowgraph_events_C:_onSerialize(data) end

--- Associates the flowgraph manager.
---Source: lua/ge/extensions/editor/flowgraph/events.lua:17
---@param mgr table Flowgraph manager.
function editor_flowgraph_events_C:attach(mgr) end

--- Draws the "Event Log" window if it is visible.
---Source: lua/ge/extensions/editor/flowgraph/events.lua:116
function editor_flowgraph_events_C:draw() end

--- Draws the controls (Hide Duplicates, Time Format, Auto Scroll) and the columned list of events.
---Source: lua/ge/extensions/editor/flowgraph/events.lua:29
function editor_flowgraph_events_C:drawContent() end

--- Handles the tooltip and double-click of an entry that has metadata (node or graph): selects the graph and centers the view.
---Source: lua/ge/extensions/editor/flowgraph/events.lua:123
---@param e table Event with e.meta {type = 'node'|'graph', node/graph}.
function editor_flowgraph_events_C:handleMeta(e) end

--- Registers the editor window (150x300).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/events.lua:21
function editor_flowgraph_events_C:init() end

