---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/stateView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre (windowName 'fg_stateView', windowDescription 'State View'). Les méthodes sont celles appelées par flowgraphEditor via basewindow.
---@class editor_flowgraph_stateView_C
local editor_flowgraph_stateView_C = {}

--- Mémorise le manager flowgraph courant dans self.mgr. Appelé à chaque changement de manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/stateView.lua:18
---@param mgr table Manager flowgraph à afficher.
function editor_flowgraph_stateView_C:attach(mgr) end

--- Dessine la fenêtre « States View » si elle est visible, à partir de self.mgr.stateGraph. Appelée à chaque frame par drawEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/stateView.lua:63
function editor_flowgraph_stateView_C:draw() end

--- Dessine sur deux colonnes le nom du graphe (entre crochets, précédé de ' - ' par niveau de profondeur) puis ses états avec l'icône play_circle_filled (en cours) ou pause_circle_outline (à l'arrêt), puis descend dans les graphes enfants.
---Source : lua/ge/extensions/editor/flowgraph/stateView.lua:22
---@param graph table Graphe à parcourir.
---@param depth integer Profondeur d'indentation (0 pour la racine).
function editor_flowgraph_stateView_C:drawStategraphRecursive(graph, depth) end

--- Crée le filtre texte ImGui et enregistre la fenêtre dans l'éditeur (taille 150x300, masquée par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/stateView.lua:13
function editor_flowgraph_stateView_C:init() end

--- Sélectionne un nœud dans l'éditeur de graphes (fge.SelectNode).
---Source : lua/ge/extensions/editor/flowgraph/stateView.lua:75
---@param node table Nœud flowgraph (utilise node.id).
---@param append boolean Ajouter à la sélection existante.
function editor_flowgraph_stateView_C:selectNode(node, append) end

