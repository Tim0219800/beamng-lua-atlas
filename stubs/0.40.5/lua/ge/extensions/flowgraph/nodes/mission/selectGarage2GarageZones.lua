---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_selectGarage2GarageZones_C
local flowgraph_nodes_mission_selectGarage2GarageZones_C = {}

--- Remet la selection et les sorties a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:41
function flowgraph_nodes_mission_selectGarage2GarageZones_C:_executionStarted() end

--- Melange les places d'arrivee possibles et renvoie la premiere dont la distance a la place de depart est dans [minDist, maxDist] ; sinon la plus proche de maxDist par le bas (meilleur candidat).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:95
---@param startSpot table place de depart
---@param possibleEndSpots table liste de {name, spot}
---@return table|nil  donnees de la place d'arrivee
function flowgraph_nodes_mission_selectGarage2GarageZones_C:findEndSpotForStartingSpot(startSpot, possibleEndSpots) end

--- Initialise l'etat, les places utilisees et les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:28
function flowgraph_nodes_mission_selectGarage2GarageZones_C:init() end

--- Remet la selection, state=1 et les sorties a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:53
function flowgraph_nodes_mission_selectGarage2GarageZones_C:resetData() end

--- state 1 : calcule les places possibles, vide les listes d'utilisation quand elles sont epuisees, choisit depart et arrivee, trie les zones par prio, ecrit les sorties et loaded=true, passe a state 2. state 2 : loaded=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:138
function flowgraph_nodes_mission_selectGarage2GarageZones_C:work() end

--- Appelle resetData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarage2GarageZones.lua:65
function flowgraph_nodes_mission_selectGarage2GarageZones_C:workOnce() end

