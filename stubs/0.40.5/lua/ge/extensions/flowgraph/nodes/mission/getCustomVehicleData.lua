---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_getCustomVehicleData_C
local flowgraph_nodes_mission_getCustomVehicleData_C = {}

--- Decoupe une chaine separee par des virgules en table de chaines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua:39
---@param str string chaine a decouper
---@return table  liste de sous-chaines
function flowgraph_nodes_mission_getCustomVehicleData_C:convertStringToTable(str) end

--- Active savePins et allowCustomOutPins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua:33
function flowgraph_nodes_mission_getCustomVehicleData_C:init() end

--- Cherche le vehicule par id et copie routeSpeed et risk (convertis en nombre) vers les pins de sortie du meme nom ; la partie waypoints est cassee (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/getCustomVehicleData.lua:56
function flowgraph_nodes_mission_getCustomVehicleData_C:workOnce() end

