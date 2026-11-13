---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre principale Flowgraph (windowName = 'fg_main').
---@class editor_flowgraph_main_C
local editor_flowgraph_main_C = {}

--- Désérialisation de l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/main.lua:1126
---@param data table Données.
function editor_flowgraph_main_C:_onDeserialized(data) end

--- Sérialisation de l'état de la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/main.lua:1122
---@param data table Données.
function editor_flowgraph_main_C:_onSerialize(data) end

--- Associe le manager, prépare les couleurs de bordure et définit focusGraph sur le graphe principal.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:26
---@param mgr table Manager flowgraph.
function editor_flowgraph_main_C:attach(mgr) end

--- Gère l'ouverture et le dessin des menus contextuels (nœud, pin, lien, fond) en suspendant l'éditeur de nœuds.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:1047
function editor_flowgraph_main_C:doContextMenus() end

--- Point d'entrée par frame ; appelle drawSelf.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:810
function editor_flowgraph_main_C:draw() end

--- Dessine un graphe (nœuds et liens) avec un builder et un style donnés.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:206
---@param graph table Graphe à dessiner.
---@param builder table Builder créé par flowgraph/builder.
---@param style table Style ImGui.
function editor_flowgraph_main_C:drawGraph(graph, builder, style) end

--- Dessine la barre de menus de la fenêtre (File, etc.).
---Source : lua/ge/extensions/editor/flowgraph/main.lua:73
function editor_flowgraph_main_C:drawMenu() end

--- Corps principal du dessin : fenêtre, canevas, interactions, menus contextuels.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:293
function editor_flowgraph_main_C:drawSelf() end

--- Initialise les identifiants de contexte (nœud/pin/lien), tailles de colonnes, lissage de FPS, et enregistre la fenêtre 600x600.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/main.lua:38
function editor_flowgraph_main_C:init() end

--- Indique si la souris est dans le rectangle de la fenêtre.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:1037
---@return boolean  true si survolée.
function editor_flowgraph_main_C:isMouseHovering() end

--- Traite un glisser-déposer terminé : crée le nœud, la macro ou le nœud de variable à la position de la souris, aligné sur la grille.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:1003
function editor_flowgraph_main_C:resolveDragDropPayload() end

--- Affiche le menu de création de nœud (bibliothèque de nœuds) dans un enfant 300x300 (× échelle UI), ou « Disabled. » si l'édition est interdite.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:988
---@param menuPos ImVec2 Position du menu.
function editor_flowgraph_main_C:showNewNodeContextMenu(menuPos) end

--- Affiche le sous-menu « Quick Connect » listant les pins compatibles (quickAccess, direction opposée) du graphe.
---Source : lua/ge/extensions/editor/flowgraph/main.lua:817
---@param menuPos ImVec2 Position du menu.
---@param pin table Pin source.
function editor_flowgraph_main_C:showQuickAccessSubmenu(menuPos, pin) end

