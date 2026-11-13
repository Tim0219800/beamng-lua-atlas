---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/setVariable.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_setVariable_C
local flowgraph_nodes_types_setVariable_C = {}

--- Restaure portée et variable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:145
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_setVariable_C:_onDeserialized(nodeData) end

--- Sauvegarde l'état du noeud dans la table donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:140
---@param res any table de sauvegarde
function flowgraph_nodes_types_setVariable_C:_onSerialize(res) end

--- Case de portée, liste des variables et éditeur de variable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:43
function flowgraph_nodes_types_setVariable_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:127
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_types_setVariable_C:drawMiddle(builder, style) end

--- varName = nil, target = variables du graphe, useSuffix = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:22
function flowgraph_nodes_types_setVariable_C:init() end

--- Hook : met à jour noeud et pin si la variable est renommée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:88
---@param source any table de variables concernée
---@param name any ancien nom
---@param newName any nouveau nom
function flowgraph_nodes_types_setVariable_C:renameVariable(source, name, newName) end

--- Change la portée (projet/graphe), la couleur et retire le pin courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:28
---@param global any boolean : variables du projet
function flowgraph_nodes_types_setVariable_C:setGlobal(global) end

--- Choisit la variable : recrée le pin d'entrée et refait les liens.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:62
---@param name any nom de la variable
function flowgraph_nodes_types_setVariable_C:setVar(name) end

--- Hook : recrée le pin quand le type de la variable change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:109
---@param source any table de variables concernée
---@param name any nom
---@param newType any nouveau type
function flowgraph_nodes_types_setVariable_C:typeUpdated(source, name, newType) end

--- Appelle target:change(varName, valeur du pin) et recopie flow.
---Source : lua/ge/extensions/flowgraph/nodes/types/setVariable.lua:104
function flowgraph_nodes_types_setVariable_C:work() end

