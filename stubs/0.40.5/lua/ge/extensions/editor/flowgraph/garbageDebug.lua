---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/garbageDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Garbage Debug window class (windowName = 'fg_garbage').
---@class editor_flowgraph_garbageDebug_C
local editor_flowgraph_garbageDebug_C = {}

--- Deserialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:303
---@param data table Data.
function editor_flowgraph_garbageDebug_C:_onDeserialized(data) end

--- Serialization (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:299
---@param data table Data.
function editor_flowgraph_garbageDebug_C:_onSerialize(data) end

--- Associates the flowgraph manager.
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:12
---@param mgr table Manager.
function editor_flowgraph_garbageDebug_C:attach(mgr) end

--- Computes once the stats of all graphs/nodes and their sum, then sorts them by descending value.
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:95
function editor_flowgraph_garbageDebug_C:computeAllStats() end

--- Completes and computes the statistics of an entry (histories, average, quantiles, min/max, activity percentage).
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:26
---@param entry table garbageData entry (graph, node or sum) with history, totalHistory, total.
function editor_flowgraph_garbageDebug_C:computeStats(entry) end

--- Draws the window: Debug Garbage checkbox, sort, whole project, graphs then nodes.
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:244
function editor_flowgraph_garbageDebug_C:draw() end

--- Draws the statistics block and curves of an entry; skips entries with no value or inactive.
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:151
---@param label string Label.
---@param entry table|nil Entry.
function editor_flowgraph_garbageDebug_C:drawStats(label, entry) end

--- Displays a "View Node" or "View Graph" button that selects and centers the element.
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:220
---@param e table Entry with e.meta.
function editor_flowgraph_garbageDebug_C:handleMeta(e) end

--- Registers the window and prepares a color palette by magnitude (20 levels).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:18
function editor_flowgraph_garbageDebug_C:init() end

--- Sets entry.value (according to the current sort key) and its magnitude as a power of 2.
---Source: lua/ge/extensions/editor/flowgraph/garbageDebug.lua:71
---@param entry table Entry.
function editor_flowgraph_garbageDebug_C:setSortingValue(entry) end

