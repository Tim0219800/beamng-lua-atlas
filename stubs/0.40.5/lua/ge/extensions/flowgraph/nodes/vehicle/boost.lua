---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_boost_C
local flowgraph_nodes_vehicle_boost_C = {}

--- Remet `loaded = false` pour recharger `core_booster` au prochain démarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua:34
function flowgraph_nodes_vehicle_boost_C:_executionStopped() end

--- Constructeur ; `loaded = false` (l'extension n'est pas encore chargée côté véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua:30
function flowgraph_nodes_vehicle_boost_C:init() end

--- Charge `core_booster` dans la VM véhicule la première fois, puis envoie `core_booster.boost({power,0,0}, dtSim)` à chaque frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/boost.lua:38
function flowgraph_nodes_vehicle_boost_C:work() end

