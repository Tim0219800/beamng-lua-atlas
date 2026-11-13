---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/variables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_variables', windowDescription 'Variables').
---@class editor_flowgraph_variables_C
local editor_flowgraph_variables_C = {}

--- Hook de désérialisation : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:363
---@param data table Données restaurées.
function editor_flowgraph_variables_C:_onDeserialized(data) end

--- Hook de sérialisation : vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:359
---@param data table Table de sauvegarde.
function editor_flowgraph_variables_C:_onSerialize(data) end

--- Dessine l'en-tête « Current Graph Variables », le bouton d'ajout (popup addVariablePopup), les variables du graphe puis celles du projet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:30
function editor_flowgraph_variables_C:draw() end

--- Dessine les variables d'un graphe, avec « (current) » si c'est le graphe courant.
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:326
---@param graph table Graphe.
function editor_flowgraph_variables_C:drawGraph(graph) end

--- Dessine un graphe dans un TreeNode puis ses enfants triés par id.
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:330
---@param graph table Graphe racine.
function editor_flowgraph_variables_C:drawRecursive(graph) end

--- Dessine récursivement les graphes racines (sans parentId) d'une table, triés par id.
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:346
---@param source table<integer, table> Table de graphes.
function editor_flowgraph_variables_C:drawSortedGraphs(source) end

--- Dessine toutes les variables d'un conteneur dans l'ordre customVariableOrder et gère le dépôt pour changer l'ordre.
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:288
---@param target table Conteneur de variables.
---@param name string Nom affiché.
---@param id string|nil Identifiant (défaut target.id).
---@param global boolean|nil true pour variables de projet.
function editor_flowgraph_variables_C:drawTarget(target, name, id, global) end

--- Dessine la carte d'une variable : icône de type, nom, valeur, boutons getter/setter, poignée de glisser et éditeur déplié.
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:200
---@param target table Conteneur de variables (graphe ou projet).
---@param varName string Nom de la variable.
---@param global boolean|nil true pour une variable de projet.
function editor_flowgraph_variables_C:drawVariableCard(target, varName, global) end

--- Déduit un type de variable à partir d'un nom via ui_flowgraph_editor.getAutoTypeFromName.
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:195
---@param name string Nom de variable.
---@return string|nil  Type deviné (déduit du code).
function editor_flowgraph_variables_C:getAutoTypeFromName(name) end

--- Initialise les champs de saisie, le payload de glisser-déposer et enregistre la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/variables.lua:21
function editor_flowgraph_variables_C:init() end

