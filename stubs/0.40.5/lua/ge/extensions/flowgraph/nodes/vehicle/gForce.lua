---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_gForce_C
local flowgraph_nodes_vehicle_gForce_C = {}

--- Appelé par le gestionnaire quand l'exécution du projet flowgraph démarre ; remet l'état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:33
function flowgraph_nodes_vehicle_gForce_C:_executionStarted() end

--- Appelé par le gestionnaire quand l'exécution du projet s'arrête ; nettoie l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:37
function flowgraph_nodes_vehicle_gForce_C:_executionStopped() end

--- Constructeur du nœud, appelé à sa création par l'éditeur/gestionnaire de flowgraph ; initialise l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:29
function flowgraph_nodes_vehicle_gForce_C:init() end

--- Fonction vide (le code d'initialisation est commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:41
function flowgraph_nodes_vehicle_gForce_C:onNodeReset() end

--- Lit les accélérations lissées (s'abonne aux valeurs au premier appel), les divise par la gravité et remplit les sorties en g.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/gForce.lua:45
function flowgraph_nodes_vehicle_gForce_C:work() end

