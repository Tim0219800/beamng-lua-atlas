---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_decalCircle_C
local flowgraph_nodes_gameplay_decalCircle_C = {}

--- Réinitialise le pool de décalques et les caches de couleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua:59
function flowgraph_nodes_gameplay_decalCircle_C:_executionStarted() end

--- Définit data.snapToTerrain = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua:41
function flowgraph_nodes_gameplay_decalCircle_C:init() end

--- Met à jour les caches de couleurs, calcule position, direction, couleur et échelle de chaque décalque sur le cercle et les soumet au renderer.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/decalCircle.lua:74
function flowgraph_nodes_gameplay_decalCircle_C:work() end

