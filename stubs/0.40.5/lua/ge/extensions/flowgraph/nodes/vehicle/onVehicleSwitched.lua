---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_onVehicleSwitched_C
local flowgraph_nodes_vehicle_onVehicleSwitched_C = {}

--- Appelé par le gestionnaire après le déclenchement du nœud ; remet le drapeau d'événement à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:49
function flowgraph_nodes_vehicle_onVehicleSwitched_C:_afterTrigger() end

--- Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:31
function flowgraph_nodes_vehicle_onVehicleSwitched_C:_executionStarted() end

--- Constructeur vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:27
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_onVehicleSwitched_C:init(mgr, ...) end

--- Hook appelé quand le joueur change de véhicule ; `oid` ancien id, `nid` nouvel id, `player` id du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:53
---@param oid integer Ancien véhicule.
---@param nid integer Nouveau véhicule.
---@param player integer Id du joueur.
function flowgraph_nodes_vehicle_onVehicleSwitched_C:onVehicleSwitched(oid, nid, player) end

--- Si un changement a été signalé, remplit `oldID`, `newID`, `player` et met `flow` à true une frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleSwitched.lua:37
---@param args any
function flowgraph_nodes_vehicle_onVehicleSwitched_C:work(args) end

