---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_recording_recordCamera_C
local flowgraph_nodes_recording_recordCamera_C = {}

--- Remet l'etat inactif, vide le trajet et memorise l'heure de depart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:30
function flowgraph_nodes_recording_recordCamera_C:_executionStarted() end

--- Affiche l'etat et le nombre de cles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:88
---@param builder any
---@param style any
function flowgraph_nodes_recording_recordCamera_C:drawMiddle(builder, style) end

--- Cree le SimPath et les Marker (maker_N) depuis le trajet enregistre, renseigne timeToNext et ecrit filename.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:36
function flowgraph_nodes_recording_recordCamera_C:finishUp() end

--- Etat de duree 'inactive' et trajet vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:25
function flowgraph_nodes_recording_recordCamera_C:init() end

--- Etat inactive : snap demarre l'enregistrement. Etat started : snap ajoute une cle ; stop passe a 'finished' et appelle finishUp.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/recording/recordCamera.lua:69
function flowgraph_nodes_recording_recordCamera_C:work() end

