---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_recording_recordReplay_C
local flowgraph_nodes_recording_recordReplay_C = {}

--- Etat de duree 'inactive'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:28
function flowgraph_nodes_recording_recordReplay_C:_executionStarted() end

--- Affiche l'etat de duree.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:63
---@param builder any
---@param style any
function flowgraph_nodes_recording_recordReplay_C:drawMiddle(builder, style) end

--- state = 'none'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:24
function flowgraph_nodes_recording_recordReplay_C:init() end

--- Hook appele par le systeme de replay quand son etat change ; en enregistrement, memorise le fichier charge dans 'filename'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:32
---@param state table etat du replay (state.state, state.loadedFile)
function flowgraph_nodes_recording_recordReplay_C:onReplayStateChanged(state) end

--- Construit un nom de fichier (prefix ou 'Recording_<id>' suivi d'un numero) mais ne l'utilise pas : la fonction ne fait rien d'utile.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:38
function flowgraph_nodes_recording_recordReplay_C:saveFile() end

--- Etat inactive : 'start' lance toggleRecording et passe a 'started'. Etat started : 'stop' relance toggleRecording et passe a 'finished'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordReplay.lua:45
function flowgraph_nodes_recording_recordReplay_C:work() end

