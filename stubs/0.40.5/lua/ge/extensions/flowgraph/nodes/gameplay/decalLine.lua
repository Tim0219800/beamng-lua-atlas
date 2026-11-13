---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_decalLine_C
local flowgraph_nodes_gameplay_decalLine_C = {}

--- Réinitialise le pool de décalques et les caches de couleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua:59
function flowgraph_nodes_gameplay_decalLine_C:_executionStarted() end

--- Définit data.snapToTerrain = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua:41
function flowgraph_nodes_gameplay_decalLine_C:init() end

--- Place les décalques par interpolation entre posA et posB, choisit leur couleur selon filling1/filling2 et les soumet au renderer.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalLine.lua:75
function flowgraph_nodes_gameplay_decalLine_C:work() end

