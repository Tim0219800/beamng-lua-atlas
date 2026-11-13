---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/audio/fade.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_audio_fade_C
local flowgraph_nodes_audio_fade_C = {}

--- À l'arrêt du graphe : restaure le volume de base du canal puis reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fade.lua:49
function flowgraph_nodes_audio_fade_C:_executionStopped() end

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fade.lua:45
function flowgraph_nodes_audio_fade_C:init() end

--- Remet à zéro minuteur, mode, volumes et canal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fade.lua:37
function flowgraph_nodes_audio_fade_C:reset() end

--- Chaque frame, si flow est actif : lit le volume du canal, détecte un changement de mode (descente/montée), avance le minuteur et applique Engine.Audio.setChannelVolume par interpolation linéaire ; met fadeDone à vrai à la fin.
---Source : lua/ge/extensions/flowgraph/nodes/audio/fade.lua:56
function flowgraph_nodes_audio_fade_C:work() end

