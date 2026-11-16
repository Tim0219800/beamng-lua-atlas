---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/audio/fade.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_audio_fade_C
local flowgraph_nodes_audio_fade_C = {}

--- When the graph stops: restores the channel's base volume then reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fade.lua:49
function flowgraph_nodes_audio_fade_C:_executionStopped() end

--- Calls reset().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fade.lua:45
function flowgraph_nodes_audio_fade_C:init() end

--- Resets the timer, mode, volumes and channel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/fade.lua:37
function flowgraph_nodes_audio_fade_C:reset() end

--- Every frame, if flow is active: reads the channel volume, detects a mode change (down/up), advances the timer and applies Engine.Audio.setChannelVolume by linear interpolation; sets fadeDone to true at the end.
---Source: lua/ge/extensions/flowgraph/nodes/audio/fade.lua:56
function flowgraph_nodes_audio_fade_C:work() end

