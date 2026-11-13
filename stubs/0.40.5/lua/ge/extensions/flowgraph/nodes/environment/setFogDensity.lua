---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setFogDensity_C
local flowgraph_nodes_environment_setFogDensity_C = {}

--- Mémorise la densité et la hauteur de brouillard actuelles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:40
function flowgraph_nodes_environment_setFogDensity_C:_executionStarted() end

--- Restaure les valeurs mémorisées si data.restoreTod est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:46
function flowgraph_nodes_environment_setFogDensity_C:_executionStopped() end

--- Définit data.restoreTod = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:27
---@param mgr table Gestionnaire du flowgraph
function flowgraph_nodes_environment_setFogDensity_C:init(mgr) end

--- Configure le pin density comme curseur 0 à 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:31
function flowgraph_nodes_environment_setFogDensity_C:postInit() end

--- Appelle core_environment.setFogDensity et setFogAtmosphereHeight avec les valeurs des pins.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:64
function flowgraph_nodes_environment_setFogDensity_C:setFogParameters() end

--- En mode repeat, applique les paramètres à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:58
function flowgraph_nodes_environment_setFogDensity_C:work() end

--- Applique les paramètres une fois.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setFogDensity.lua:54
function flowgraph_nodes_environment_setFogDensity_C:workOnce() end

