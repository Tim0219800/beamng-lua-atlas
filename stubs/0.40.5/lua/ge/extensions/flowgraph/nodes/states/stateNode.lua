---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/stateNode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_states_stateNode_C
local flowgraph_nodes_states_stateNode_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:146
function flowgraph_nodes_states_stateNode_C:EndPin() end

--- Mémorise targetGraphId pour _postDeserialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:159
---@param data any données sauvegardées
function flowgraph_nodes_states_stateNode_C:_onDeserialized(data) end

--- Sauvegarde l'id du graphe cible (res.targetGraphId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:151
---@param res any table de sauvegarde
function flowgraph_nodes_states_stateNode_C:_onSerialize(res) end

--- Sérialise noeud + graphe cible pour l'export d'état (res.type = 'state').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:185
function flowgraph_nodes_states_stateNode_C:_onSerializeState() end

--- Après chargement de tous les graphes, retrouve le graphe cible (id + décalage getGraphNodeOffset) et l'associe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:163
function flowgraph_nodes_states_stateNode_C:_postDeserialize() end

--- Sélectionne le graphe cible dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:113
function flowgraph_nodes_states_stateNode_C:doubleClicked() end

--- Liste déroulante « Target Graph » (graphes racine hors graphe d'états) et bouton « Export State » (sauvegarde JSON via editor_fileDialog).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:64
function flowgraph_nodes_states_stateNode_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:121
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_states_stateNode_C:drawMiddle(builder, style) end

--- Renvoie la liste triée des noms de pins de sortie (transitions possibles).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:104
function flowgraph_nodes_states_stateNode_C:getTransitionNames() end

--- allowCustomOutPins = true, savePins = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:37
---@param mgr any gestionnaire flowgraph
function flowgraph_nodes_states_stateNode_C:init(mgr) end

--- Renomme le graphe cible et renvoie un message d'historique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:176
---@param name any nouveau nom
function flowgraph_nodes_states_stateNode_C:onCustomNameChanged(name) end

--- Renvoie le graphe cible représenté par ce noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:31
function flowgraph_nodes_states_stateNode_C:representsGraph() end

--- Vide (non utilisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:57
---@param val any ignoré
function flowgraph_nodes_states_stateNode_C:setAutoStart(val) end

--- Associe un graphe cible, reprend son nom et prend la couleur « groupstate » s'il s'agit d'un graphe d'états ; sinon nom « No Target! ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateNode.lua:43
---@param graph any graphe cible ou nil
function flowgraph_nodes_states_stateNode_C:setTargetGraph(graph) end

