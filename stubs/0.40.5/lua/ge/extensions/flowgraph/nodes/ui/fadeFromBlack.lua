---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_fadeFromBlack_C
local flowgraph_nodes_ui_fadeFromBlack_C = {}

--- Resets the 'inactive' state and isFadeScreenActive = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:38
function flowgraph_nodes_ui_fadeFromBlack_C:_executionStopped() end

--- Duration state 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:28
function flowgraph_nodes_ui_fadeFromBlack_C:init() end

--- Resets the 'inactive' state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:44
function flowgraph_nodes_ui_fadeFromBlack_C:onNodeReset() end

--- Hook called by ui_fadeScreen with the fade state; state 3 ends the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:63
---@param state integer Screen fade state (1 = black reached, 3 = fade finished).
function flowgraph_nodes_ui_fadeFromBlack_C:onScreenFadeState(state) end

--- Duration template: 0.75 (default duration of mission fades).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:32
function flowgraph_nodes_ui_fadeFromBlack_C:postInit() end

--- Starts the fade from black (or ends loading) and updates the duration state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeFromBlack.lua:48
function flowgraph_nodes_ui_fadeFromBlack_C:workOnce() end

