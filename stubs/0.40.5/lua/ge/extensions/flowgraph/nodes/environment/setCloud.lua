---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setCloud_C
local flowgraph_nodes_environment_setCloud_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:37
function flowgraph_nodes_environment_setCloud_C:_executionStarted() end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:45
function flowgraph_nodes_environment_setCloud_C:_executionStopped() end

--- Définit data.restoreCloud = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:24
---@param mgr table Gestionnaire du flowgraph
function flowgraph_nodes_environment_setCloud_C:init(mgr) end

--- Configure le pin coverage comme curseur 0 à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:28
function flowgraph_nodes_environment_setCloud_C:postInit() end

--- Appelle core_environment.setCloudCoverByID/ExposureByID/WindByID/HeightByID si objectId est fourni, sinon setCloudCover et setWindSpeed.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:64
function flowgraph_nodes_environment_setCloud_C:setCloudParameters() end

--- En mode repeat, applique les paramètres à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:58
function flowgraph_nodes_environment_setCloud_C:work() end

--- Applique les paramètres une seule fois.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua:54
function flowgraph_nodes_environment_setCloud_C:workOnce() end

