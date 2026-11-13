---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C
local flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C = {}

--- Oublie le chemin mémorisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua:40
function flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C:_executionStarted() end

--- Initialise self.path et désactive clearOutPinsOnStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua:35
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C:init(mgr, ...) end

--- Choisit la position de départ, appelle sp:moveResetVehicleTo(vehId, lowPrecision, repair) et écrit pos/rot en sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua:44
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_race_moveVehicleToStartposition_C:work(args) end

