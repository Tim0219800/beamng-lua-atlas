---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_fadeSequence_C
local flowgraph_nodes_ui_fadeSequence_C = {}

--- Resets the state and the faded pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:47
function flowgraph_nodes_ui_fadeSequence_C:_executionStopped() end

--- Duration state 'inactive', fadedTriggered = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:33
function flowgraph_nodes_ui_fadeSequence_C:init() end

--- Resets the state and the faded pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:54
function flowgraph_nodes_ui_fadeSequence_C:onNodeReset() end

--- Hook: state 1 -> faded = true; state 3 -> finished.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:73
---@param state integer Screen fade state (1 = black reached, 3 = fade finished).
function flowgraph_nodes_ui_fadeSequence_C:onScreenFadeState(state) end

--- Duration templates at 0.75 for startDuration and endDuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:38
function flowgraph_nodes_ui_fadeSequence_C:postInit() end

--- Turns 'faded' into a pulse (reset to false on the next frame).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:65
function flowgraph_nodes_ui_fadeSequence_C:work() end

--- Starts the sequence with the three durations (defaults 1, 0, 1 if nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/fadeSequence.lua:60
function flowgraph_nodes_ui_fadeSequence_C:workOnce() end

