---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_disable_C
local flowgraph_nodes_vehicle_ai_disable_C = {}

--- Initialise les trois données du nœud à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua:20
function flowgraph_nodes_vehicle_ai_disable_C:init() end

--- Envoie au véhicule ai:scriptStop(handBrake, straightenWheels) si useScriptStop, sinon ai.setState({mode = "disabled"}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua:26
function flowgraph_nodes_vehicle_ai_disable_C:work() end

