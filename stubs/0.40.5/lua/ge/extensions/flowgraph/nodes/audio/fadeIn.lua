---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_audio_fadeIn_C
local flowgraph_nodes_audio_fadeIn_C = {}

--- Appelle reset() à l'arrêt du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:23
function flowgraph_nodes_audio_fadeIn_C:_executionStopped() end

--- Met le minuteur à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:19
function flowgraph_nodes_audio_fadeIn_C:init() end

--- Appelle reset() quand le nœud est réinitialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:27
function flowgraph_nodes_audio_fadeIn_C:onNodeReset() end

--- Remet le minuteur à 0, l'état de durée à 'inactive' et les paramètres g_FadeTimeMS et g_GameLoading à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:31
function flowgraph_nodes_audio_fadeIn_C:reset() end

--- Chaque frame : fait avancer le minuteur (mgr.dtReal) et passe l'état à 'finished' une fois duration atteinte.
---Source : lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:44
function flowgraph_nodes_audio_fadeIn_C:work() end

--- Au premier flux : g_FadeTimeMS = duration*1000, g_GameLoading = 0, état de durée 'started'.
---Source : lua/ge/extensions/flowgraph/nodes/audio/fadeIn.lua:38
function flowgraph_nodes_audio_fadeIn_C:workOnce() end

