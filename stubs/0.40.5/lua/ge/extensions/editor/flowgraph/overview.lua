---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/overview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_treeview', windowDescription 'Overview').
---@class editor_flowgraph_overview_C
local editor_flowgraph_overview_C = {}

--- Dessine le contenu de la fenêtre : filtre, bouton debug, liste triée des graphes racines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:210
function editor_flowgraph_overview_C:TreeView() end

--- Mémorise le manager courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:21
---@param mgr table Manager flowgraph.
function editor_flowgraph_overview_C:attach(mgr) end

--- Dessine la fenêtre si elle est visible (appelle TreeView).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:289
function editor_flowgraph_overview_C:draw() end

--- Dessine un graphe de l'arbre (et récursivement ses enfants).
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:79
---@param graph table Graphe à dessiner.
function editor_flowgraph_overview_C:drawGraph(graph) end

--- Dessine le popup « nodeOverviewPopup » : Focus (sélectionne le nœud et navigue vers lui) et Delete (graph:deleteNode).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:25
function editor_flowgraph_overview_C:drawPopups() end

--- Remplit self.passedGraphIds avec les ids des graphes et macros dont le nom (ou un nœud, selon la préférence) passe le filtre.
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:175
function editor_flowgraph_overview_C:fillPassedGraphsArray() end

--- Crée le filtre texte et enregistre la fenêtre (150x300, masquée par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:15
function editor_flowgraph_overview_C:init() end

--- Sélectionne un nœud dans l'éditeur (fge.SelectNode).
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:299
---@param node table Nœud (utilise node.id).
---@param append boolean Ajouter à la sélection.
function editor_flowgraph_overview_C:selectNode(node, append) end

--- Indique si un graphe doit être masqué : faux s'il (ou un de ses parents) passe le filtre, sinon vrai sauf pour le graphe courant.
---Source : lua/ge/extensions/editor/flowgraph/overview.lua:47
---@param graph table Graphe testé.
---@return boolean  true si le graphe doit être sauté.
function editor_flowgraph_overview_C:skipDrawing(graph) end

