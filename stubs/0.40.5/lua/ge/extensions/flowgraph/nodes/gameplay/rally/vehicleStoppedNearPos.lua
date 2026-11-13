---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C
local flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C = {}

--- Remet à zéro chrono, état et cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:40
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:_executionStarted() end

--- Dessine la sphère de la zone d'arrêt si le drapeau de debug stopZones est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:130
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:drawDebugStopZone() end

--- Dessine le point directeur du véhicule (couleur selon dedans/dehors) si stopZones est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:136
---@param inside boolean Véhicule dans la zone.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:drawDebugVehiclePoint(inside) end

--- Affiche une barre de progression du chrono.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:56
---@param builder table Constructeur de nœud.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:drawMiddle(builder, style) end

--- Initialise chrono, cible et intervalle de hook (0,1 s, non utilisé ensuite).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:31
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:init(mgr, ...) end

--- Teste si le centre avant du véhicule est dans le rayon de la position cible.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:111
---@return boolean  Dans la zone.
---@return number|nil  Distance en m.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:isNearPosition() end

--- Vrai si la vitesse du véhicule est inférieure à 0,1 m/s.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:103
---@return boolean  Véhicule à l'arrêt.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:isStopped() end

--- Avance le chrono (dtReal) ; à la durée atteinte, arrête le chrono et émet l'impulsion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:47
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:updateTimer() end

--- Met à jour position avant et vitesse du véhicule suivi depuis map.objects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:84
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:updateVehicleData2() end

--- Gère reset et chrono, diffuse la proximité à l'UI et met à jour flow/impulse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPos.lua:144
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPos_C:work(args) end

