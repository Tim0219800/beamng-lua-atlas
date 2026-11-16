---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_onBigmapStateChange_C
local flowgraph_nodes_ui_onBigmapStateChange_C = {}

--- Initializes the flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:24
function flowgraph_nodes_ui_onBigmapStateChange_C:init() end

--- Hook: end of the map opening.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:45
function flowgraph_nodes_ui_onBigmapStateChange_C:onActivateBigMapCallback() end

--- Hook: start of transition; activate true = enter, false = exit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:40
---@param activate boolean true if the big map opens, false if it closes.
---@param esc boolean Closing via the Escape key (inferred from code, unused).
function flowgraph_nodes_ui_onBigmapStateChange_C:onBigmapStartTransition(activate, esc) end

--- Hook: end of the map closing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:48
function flowgraph_nodes_ui_onBigmapStateChange_C:onDeactivateBigMapCallback() end

--- Resets the pulses to false and applies the received flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua:29
---@param args any Optional argument (unused).
function flowgraph_nodes_ui_onBigmapStateChange_C:work(args) end

