---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_selectGarage2GarageVehicle_C
local flowgraph_nodes_mission_selectGarage2GarageVehicle_C = {}

--- Remet la selection et les sorties a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:37
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:_executionStarted() end

--- Initialise la selection, state=1 et usedConfigs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:23
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:init() end

--- Remet la selection, state=1 et les sorties a zero (usedConfigs est conserve).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:51
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:resetData() end

--- state 1 : choisit une config non utilisee, l'enregistre dans usedConfigs, ecrit model/config/name, loaded=true, passe a state 2. state 2 : loaded=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:90
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:work() end

--- Appelle resetData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageVehicle.lua:65
function flowgraph_nodes_mission_selectGarage2GarageVehicle_C:workOnce() end

