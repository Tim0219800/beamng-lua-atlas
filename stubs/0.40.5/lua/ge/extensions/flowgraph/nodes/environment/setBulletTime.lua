---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setBulletTime_C
local flowgraph_nodes_environment_setBulletTime_C = {}

--- Appelé à l'arrêt du graphe : remet simTimeAuthority.set(1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua:21
function flowgraph_nodes_environment_setBulletTime_C:_executionStopped() end

--- Configure le pin value comme curseur flottant de 0 à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua:25
function flowgraph_nodes_environment_setBulletTime_C:postInit() end

--- Si le flux est actif : pause si value == 0, sinon règle la vitesse (setInstant si instant, sinon set) et lève la pause.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setBulletTime.lua:34
function flowgraph_nodes_environment_setBulletTime_C:work() end

