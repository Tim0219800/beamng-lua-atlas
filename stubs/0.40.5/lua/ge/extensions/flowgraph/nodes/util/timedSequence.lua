---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_timedSequence_C
local flowgraph_nodes_util_timedSequence_C = {}

--- Remet index, endTime, time et current à zéro (la fonction est définie deux fois dans le fichier, à l'identique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:35
function flowgraph_nodes_util_timedSequence_C:_executionStarted() end

--- Restaure mode (« loop » par défaut) et count puis recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:161
---@param res any
function flowgraph_nodes_util_timedSequence_C:_onDeserialized(res) end

--- Sauvegarde mode et count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:156
---@param res any
function flowgraph_nodes_util_timedSequence_C:_onSerialize(res) end

--- Dessine le champ « Count » ; le modifier appelle updatePins. Renvoie la raison du changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:48
function flowgraph_nodes_util_timedSequence_C:drawCustomProperties() end

--- Affiche le temps écoulé et la section courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:145
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_util_timedSequence_C:drawMiddle(builder, style) end

--- Initialise count, index, endTime, time et current.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:23
function flowgraph_nodes_util_timedSequence_C:init() end

--- Remet le temps à zéro et l'état à « inactive ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:98
function flowgraph_nodes_util_timedSequence_C:onNodeReset() end

--- Crée les pins de la première partie (updatePins(0, 1)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:31
function flowgraph_nodes_util_timedSequence_C:postInit() end

--- Ajoute ou retire les pins duration_/start_/active_/complete_ pour passer de old à new parties et met à jour count.
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:65
---@param old integer Nombre actuel de parties.
---@param new integer Nouveau nombre de parties.
function flowgraph_nodes_util_timedSequence_C:updatePins(old, new) end

--- Tant que l'état est started, avance le temps, active start/active/complete selon la partie courante ; quand le temps total est écoulé, passe à « finished » et active complete de la dernière partie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:103
function flowgraph_nodes_util_timedSequence_C:work() end

--- Passe l'état de durée à « started ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:94
function flowgraph_nodes_util_timedSequence_C:workOnce() end

