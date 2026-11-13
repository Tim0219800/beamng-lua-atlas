---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_pursuitMode_C
local flowgraph_nodes_gameplay_traffic_pursuitMode_C = {}

--- Affiche « Traffic not active! » si le trafic n'est pas actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua:34
---@param builder table constructeur de nœud de l'éditeur (builder:Middle())
---@param style table style de dessin du nœud
function flowgraph_nodes_gameplay_traffic_pursuitMode_C:drawMiddle(builder, style) end

--- Si le trafic est 'on', insère la cible dans le trafic au besoin puis appelle gameplay_police.setPursuitMode(mode, vehId, policeId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua:23
function flowgraph_nodes_gameplay_traffic_pursuitMode_C:workOnce() end

