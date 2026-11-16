---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_audio_playOnce_C
local flowgraph_nodes_audio_playOnce_C = {}

--- Builds the data (volume, pitch, fades, unique, sampleSource, channel) from the pins and calls Engine.Audio.playOnce(channel, source, data).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:58
function flowgraph_nodes_audio_playOnce_C:playSound() end

--- Configures the editor: file filter of the file pin and a 0-1 slider for volume.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:35
function flowgraph_nodes_audio_playOnce_C:postInit() end

--- If dynamicMode is 'repeat', replays the sound every frame.
---Source: lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:52
function flowgraph_nodes_audio_playOnce_C:work() end

--- Plays the sound once (playSound).
---Source: lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:48
function flowgraph_nodes_audio_playOnce_C:workOnce() end

