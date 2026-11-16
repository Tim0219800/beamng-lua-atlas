---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_audio_fadeIn_C
local flowgraph_nodes_audio_fadeIn_C = {}

--- Calls reset() when the graph stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:23
function flowgraph_nodes_audio_fadeIn_C:_executionStopped() end

--- Sets the timer to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:19
function flowgraph_nodes_audio_fadeIn_C:init() end

--- Calls reset() when the node is reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:27
function flowgraph_nodes_audio_fadeIn_C:onNodeReset() end

--- Sets the timer back to 0, the duration state to 'inactive' and the parameters g_FadeTimeMS and g_GameLoading to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:31
function flowgraph_nodes_audio_fadeIn_C:reset() end

--- Every frame: advances the timer (mgr.dtReal) and sets the state to 'finished' once duration is reached.
---Source: lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:44
function flowgraph_nodes_audio_fadeIn_C:work() end

--- On the first flow: g_FadeTimeMS = duration*1000, g_GameLoading = 0, duration state 'started'.
---Source: lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:38
function flowgraph_nodes_audio_fadeIn_C:workOnce() end

