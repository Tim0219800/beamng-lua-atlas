---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_blacklistParkingSpots_C
local flowgraph_nodes_mission_blacklistParkingSpots_C = {}

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:33
function flowgraph_nodes_mission_blacklistParkingSpots_C:_executionStopped() end

--- Relit count et recree les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:148
---@param res any
function flowgraph_nodes_mission_blacklistParkingSpots_C:_onDeserialized(res) end

--- Sauvegarde count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:144
---@param res any
function flowgraph_nodes_mission_blacklistParkingSpots_C:_onSerialize(res) end

--- Panneau : nombre de pins de position (Count).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:56
function flowgraph_nodes_mission_blacklistParkingSpots_C:drawCustomProperties() end

--- count=1, bannedSpots vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:24
function flowgraph_nodes_mission_blacklistParkingSpots_C:init() end

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:37
function flowgraph_nodes_mission_blacklistParkingSpots_C:onNodeReset() end

--- Cree les pins pos_1..pos_count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:29
function flowgraph_nodes_mission_blacklistParkingSpots_C:postInit() end

--- Retire le tag 'banned' des places bannies par ce noeud et vide la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:41
function flowgraph_nodes_mission_blacklistParkingSpots_C:reset() end

--- Cree ou supprime les pins pos_i.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:73
---@param old integer ancien nombre
---@param new integer nouveau nombre
function flowgraph_nodes_mission_blacklistParkingSpots_C:updatePins(old, new) end

--- Rassemble les positions, cherche les places dans le rayon (defaut 5 m) avec gameplay_parking.findParkingSpots, ajoute le tag 'banned' et force la teleportation des vehicules qui les occupent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua:94
function flowgraph_nodes_mission_blacklistParkingSpots_C:workOnce() end

