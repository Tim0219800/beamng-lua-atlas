---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_goToStartLine_C
local flowgraph_nodes_mission_goToStartLine_C = {}

--- Recupere le vehicule via self.mgr.modules.vehicle:getVehicle(vehId).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua:31
function flowgraph_nodes_mission_goToStartLine_C:_executionStarted() end

--- vehicle = nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua:35
function flowgraph_nodes_mission_goToStartLine_C:init() end

--- Sur reset : tout a false. Sinon met inLine/outLineForward/outLineBackward selon distance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua:39
function flowgraph_nodes_mission_goToStartLine_C:work() end

