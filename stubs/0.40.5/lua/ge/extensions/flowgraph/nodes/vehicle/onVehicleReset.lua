---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_onVehicleReset_C
local flowgraph_nodes_vehicle_onVehicleReset_C = {}

--- Appelé par le gestionnaire après le déclenchement du nœud ; remet le drapeau d'événement à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua:64
function flowgraph_nodes_vehicle_onVehicleReset_C:_afterTrigger() end

--- Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua:36
function flowgraph_nodes_vehicle_onVehicleReset_C:_executionStarted() end

--- Constructeur vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua:32
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_onVehicleReset_C:init(mgr, ...) end

--- Hook appelé quand un véhicule est reset ; filtre éventuellement par `vehId` puis lève le drapeau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua:41
---@param id integer Id du véhicule reseté.
function flowgraph_nodes_vehicle_onVehicleReset_C:onVehicleResetted(id) end

--- Si le drapeau est levé, remplit `vehId` et met `flow` à true une frame, sinon false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/onVehicleReset.lua:53
---@param args any
function flowgraph_nodes_vehicle_onVehicleReset_C:work(args) end

