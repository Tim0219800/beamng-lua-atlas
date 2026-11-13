---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_spawnVehicle_C
local flowgraph_nodes_vehicle_spawnVehicle_C = {}

--- Réinitialise l'état et les sorties au démarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:93
function flowgraph_nodes_vehicle_spawnVehicle_C:_executionStarted() end

--- Réinitialise l'état et la référence au véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:85
function flowgraph_nodes_vehicle_spawnVehicle_C:_executionStopped() end

--- Affichage central du nœud, vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:237
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_spawnVehicle_C:drawMiddle(builder, style) end

--- Construit une commande Lua pour appeler `buttonPushed(action)` sur ce nœud depuis une autre VM (déduit du code).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:233
---@param action string|nil Action transmise à `buttonPushed`.
function flowgraph_nodes_vehicle_spawnVehicle_C:getCmd(action) end

--- Constructeur ; état 1, sortie `flow` false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:55
function flowgraph_nodes_vehicle_spawnVehicle_C:init() end

--- Appelé quand le spawn échoue : programme un nouvel essai (1 s) ou abandonne après 10 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:62
function flowgraph_nodes_vehicle_spawnVehicle_C:onSpawnFailed() end

--- Marque le pin `color` avec `colorSetup = {vehicleColor = true}`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:79
function flowgraph_nodes_vehicle_spawnVehicle_C:postInit() end

--- Remet à zéro le minuteur et le temps cumulé d'échecs de spawn.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:50
function flowgraph_nodes_vehicle_spawnVehicle_C:resetSpawnRetry() end

--- Machine à états du spawn (voir module) ; gère aussi le `reset`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/spawnVehicle.lua:103
function flowgraph_nodes_vehicle_spawnVehicle_C:work() end

