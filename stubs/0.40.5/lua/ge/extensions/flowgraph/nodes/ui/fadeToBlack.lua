---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_fadeToBlack_C
local flowgraph_nodes_ui_fadeToBlack_C = {}

--- Resets the 'inactive' state and isFadeScreenActive = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:38
function flowgraph_nodes_ui_fadeToBlack_C:_executionStopped() end

--- Duration state 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:28
function flowgraph_nodes_ui_fadeToBlack_C:init() end

--- Resets the 'inactive' state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:44
function flowgraph_nodes_ui_fadeToBlack_C:onNodeReset() end

--- Hook: state 1 (black reached) -> finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:58
---@param state integer Screen fade state (1 = black reached, 3 = fade finished).
function flowgraph_nodes_ui_fadeToBlack_C:onScreenFadeState(state) end

--- Duration template at 0.75.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:32
function flowgraph_nodes_ui_fadeToBlack_C:postInit() end

--- Starts ui_fadeScreen.fadeToBlack (unless already black).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeToBlack.lua:48
function flowgraph_nodes_ui_fadeToBlack_C:workOnce() end

