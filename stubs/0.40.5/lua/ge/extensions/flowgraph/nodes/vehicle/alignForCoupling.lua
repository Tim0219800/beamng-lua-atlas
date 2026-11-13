---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_alignForCoupling_C
local flowgraph_nodes_vehicle_alignForCoupling_C = {}

--- Efface done, waitForCouple et coupled.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua:33
function flowgraph_nodes_vehicle_alignForCoupling_C:_executionStarted() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua:30
function flowgraph_nodes_vehicle_alignForCoupling_C:init() end

--- Gère reset. Une fois : retrouve les deux véhicules, lit leurs couplerOffset (modules.vehicle), calcule la matrice d'alignement, puis (si ignoreCouple est faux) déplace la remorque (setTransform), réinitialise sa physique et son flexmesh et active beamstate.activateAutoCoupling() sur le tracteur. Ensuite attend l'attelage (modules.vehicle:isCoupledTo) et active flow.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/alignForCoupling.lua:38
function flowgraph_nodes_vehicle_alignForCoupling_C:work() end

