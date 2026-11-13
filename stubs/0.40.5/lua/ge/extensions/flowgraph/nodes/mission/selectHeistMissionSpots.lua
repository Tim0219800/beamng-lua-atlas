---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_selectHeistMissionSpots_C
local flowgraph_nodes_mission_selectHeistMissionSpots_C = {}

--- Appelle resetData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:56
function flowgraph_nodes_mission_selectHeistMissionSpots_C:_executionStarted() end

--- Initialise les listes de lieux et les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:36
function flowgraph_nodes_mission_selectHeistMissionSpots_C:init() end

--- Remet les listes, la machine a etats et les sorties a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:60
function flowgraph_nodes_mission_selectHeistMissionSpots_C:resetData() end

--- Sur reset : resetData. Si flow, avance la machine a etats : 1 tri des places par tag et melange, 2 valide le depart, 3 valide le lieu de braquage, 4 valide l'evasion, 5 ecrit les zones et loaded=true, 6 loaded=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/selectHeistMissionSpots.lua:80
function flowgraph_nodes_mission_selectHeistMissionSpots_C:work() end

