---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_decalPath_C
local flowgraph_nodes_gameplay_decalPath_C = {}

--- Réinitialise le pool de décalques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:44
function flowgraph_nodes_gameplay_decalPath_C:_executionStarted() end

--- Crée un décalque (texture arrow_groundmarkers_1, échelle 8x12x4, fade 400 à 500).
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:30
---@return table  Décalque prêt à être rempli
function flowgraph_nodes_gameplay_decalPath_C:getNewDecal() end

--- Agrandit le pool de décalques jusqu'à max.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:49
---@param max integer Nombre minimum de décalques
function flowgraph_nodes_gameplay_decalPath_C:increaseDecalPool(max) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:27
function flowgraph_nodes_gameplay_decalPath_C:init() end

--- Calcule la route, positionne les marqueurs espacés le long du chemin et les soumet à Engine.Render.DynamicDecalMgr.addDecals.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalPath.lua:58
function flowgraph_nodes_gameplay_decalPath_C:work() end

