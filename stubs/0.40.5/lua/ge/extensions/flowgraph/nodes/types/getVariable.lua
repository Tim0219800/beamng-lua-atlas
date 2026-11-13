---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/getVariable.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_getVariable_C
local flowgraph_nodes_types_getVariable_C = {}

--- Restaure portée et variable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:136
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_getVariable_C:_onDeserialized(nodeData) end

--- Sauvegarde l'état du noeud dans la table donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:131
---@param res any table de sauvegarde
function flowgraph_nodes_types_getVariable_C:_onSerialize(res) end

--- Case de portée, liste des variables et éditeur de variable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:25
function flowgraph_nodes_types_getVariable_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:118
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_types_getVariable_C:drawMiddle(builder, style) end

--- varName = nil, global = false, target = variables du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:19
function flowgraph_nodes_types_getVariable_C:init() end

--- Hook : met à jour nom du noeud et du pin si la variable suivie est renommée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:85
---@param source any table de variables concernée
---@param name any ancien nom
---@param newName any nouveau nom
function flowgraph_nodes_types_getVariable_C:renameVariable(source, name, newName) end

--- Change la portée (projet/graphe), la couleur du noeud et retire le pin courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:44
---@param global any boolean : variables du projet
function flowgraph_nodes_types_getVariable_C:setGlobal(global) end

--- Choisit la variable : recrée le pin de sortie avec le bon type et refait les liens compatibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:59
---@param name any nom de la variable
function flowgraph_nodes_types_getVariable_C:setVar(name) end

--- Hook : recrée le pin quand le type de la variable change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:101
---@param source any table de variables concernée
---@param name any nom
---@param newType any nouveau type
function flowgraph_nodes_types_getVariable_C:typeUpdated(source, name, newType) end

--- Écrit target:get(varName) sur le pin.
---Source : lua/ge/extensions/flowgraph/nodes/types/getVariable.lua:97
function flowgraph_nodes_types_getVariable_C:work() end

