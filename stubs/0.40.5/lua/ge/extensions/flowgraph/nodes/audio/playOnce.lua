---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_audio_playOnce_C
local flowgraph_nodes_audio_playOnce_C = {}

--- Construit les données (volume, pitch, fades, unique, sampleSource, channel) depuis les pins et appelle Engine.Audio.playOnce(channel, source, data).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:58
function flowgraph_nodes_audio_playOnce_C:playSound() end

--- Configure l'éditeur : filtre de fichiers du pin file et curseur 0-1 pour volume.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:35
function flowgraph_nodes_audio_playOnce_C:postInit() end

--- Si dynamicMode vaut 'repeat', rejoue le son à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:52
function flowgraph_nodes_audio_playOnce_C:work() end

--- Joue le son une fois (playSound).
---Source : lua/ge/extensions/flowgraph/nodes/audio/playOnce.lua:48
function flowgraph_nodes_audio_playOnce_C:workOnce() end

