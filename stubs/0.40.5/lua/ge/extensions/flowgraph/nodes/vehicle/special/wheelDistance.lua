---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_wheelDistance_C
local flowgraph_nodes_vehicle_special_wheelDistance_C = {}

--- Calcule la distance signée entre `target` et les roues les plus proches du véhicule `vehicle`.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:64
---@param vehicle userdata Objet véhicule.
---@param target vec3 Point cible.
function flowgraph_nodes_vehicle_special_wheelDistance_C:calculateDistanceFromStart(vehicle, target) end

--- Affichage central vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:135
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_special_wheelDistance_C:drawMiddle(builder, style) end

--- Constructeur ; `data.debug = false`, `data.onlyUseFrontWheels = true`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:32
function flowgraph_nodes_vehicle_special_wheelDistance_C:init() end

--- Lit le véhicule et la position puis écrit `distance`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/wheelDistance.lua:122
function flowgraph_nodes_vehicle_special_wheelDistance_C:work() end

