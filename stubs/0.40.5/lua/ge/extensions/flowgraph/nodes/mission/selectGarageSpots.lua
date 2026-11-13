---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_selectGarageSpots_C
local flowgraph_nodes_mission_selectGarageSpots_C = {}

--- Appelle resetData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:52
function flowgraph_nodes_mission_selectGarageSpots_C:_executionStarted() end

--- Choisit une place d'arrivee a distance acceptable de la place de depart (voir Select Garage Sites), sinon le meilleur candidat.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:77
---@param startSpot table place de depart
---@return table|nil  place d'arrivee
function flowgraph_nodes_mission_selectGarageSpots_C:findEndSpotForStartingSpot(startSpot) end

--- Initialise les listes, state=1 et les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:37
function flowgraph_nodes_mission_selectGarageSpots_C:init() end

--- Vide les places utilisees et remet tout a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:56
function flowgraph_nodes_mission_selectGarageSpots_C:resetData() end

--- Si flow : state 1 selectionne depart et arrivee, ecrit les sorties, flow et loaded a true ; state 2 garde flow=true et loaded=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:119
function flowgraph_nodes_mission_selectGarageSpots_C:work() end

--- Appelle resetData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectGarageSpots.lua:72
function flowgraph_nodes_mission_selectGarageSpots_C:workOnce() end

