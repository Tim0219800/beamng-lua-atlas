---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setWind.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setWind_C
local flowgraph_nodes_environment_setWind_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setWind.lua:26
function flowgraph_nodes_environment_setWind_C:_executionStopped() end

--- Appelle onNodeReset (vent nul pour tous).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setWind.lua:22
function flowgraph_nodes_environment_setWind_C:init() end

--- Envoie obj:setWind(0, 0, 0) à tous les véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setWind.lua:30
function flowgraph_nodes_environment_setWind_C:onNodeReset() end

--- Calcule windDir * windSpeed et l'envoie par queueLuaCommand à chaque véhicule concerné.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setWind.lua:37
function flowgraph_nodes_environment_setWind_C:work() end

