---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/nodePreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de l'aperçu (windowKind = 'nodePreview').
---@class editor_flowgraph_nodePreview_C
local editor_flowgraph_nodePreview_C = {}

--- Associe le manager et crée le graphe factice 'nodePreview'.
---Source : lua/ge/extensions/editor/flowgraph/nodePreview.lua:13
---@param mgr table|nil Manager flowgraph.
function editor_flowgraph_nodePreview_C:attach(mgr) end

--- Dessine l'infobulle d'aperçu si un élément est survolé, en sauvegardant/restaurant l'éditeur courant.
---Source : lua/ge/extensions/editor/flowgraph/nodePreview.lua:47
function editor_flowgraph_nodePreview_C:draw() end

--- Initialise l'état (survol, mode « node », taille d'aperçu 200x200).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/nodePreview.lua:20
function editor_flowgraph_nodePreview_C:init() end

--- Définit l'élément survolé comme graphe (mode graph).
---Source : lua/ge/extensions/editor/flowgraph/nodePreview.lua:41
---@param graph table Graphe.
function editor_flowgraph_nodePreview_C:setGraph(graph) end

--- Définit l'élément survolé comme macro (mode macro).
---Source : lua/ge/extensions/editor/flowgraph/nodePreview.lua:36
---@param macro table Macro.
function editor_flowgraph_nodePreview_C:setMacro(macro) end

--- Définit l'élément survolé comme nœud de bibliothèque (mode node).
---Source : lua/ge/extensions/editor/flowgraph/nodePreview.lua:30
---@param node table Entrée de bibliothèque (path, node, create).
function editor_flowgraph_nodePreview_C:setNode(node) end

