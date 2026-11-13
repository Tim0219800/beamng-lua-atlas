---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_touchingStatic_C
local flowgraph_nodes_vehicle_touchingStatic_C = {}

--- Crée les 8 points et les vecteurs de travail.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:42
function flowgraph_nodes_vehicle_touchingStatic_C:_executionStarted() end

--- Libère les points et réinitialise les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:47
function flowgraph_nodes_vehicle_touchingStatic_C:_executionStopped() end

--- Constructeur ; appelle `reset`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:38
function flowgraph_nodes_vehicle_touchingStatic_C:init() end

--- Hook de rendu : dessine les sphères de debug si `debugMode` est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:101
function flowgraph_nodes_vehicle_touchingStatic_C:onPreRender() end

--- Met toutes les sorties à false et désactive le nœud.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:52
function flowgraph_nodes_vehicle_touchingStatic_C:reset() end

--- Calcule les 8 points, lance les rayons et remplit les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/touchingStatic.lua:59
function flowgraph_nodes_vehicle_touchingStatic_C:work() end

