---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_setScatterSky_C
local flowgraph_nodes_environment_setScatterSky_C = {}

--- Mémorise la luminosité et les six fichiers de gradient actuels.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:30
function flowgraph_nodes_environment_setScatterSky_C:_executionStarted() end

--- Restaure les valeurs mémorisées si data.restoreScatterSky est vrai.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:42
function flowgraph_nodes_environment_setScatterSky_C:_executionStopped() end

--- Définit data.restoreScatterSky = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:26
---@param mgr table Gestionnaire du flowgraph
function flowgraph_nodes_environment_setScatterSky_C:init(mgr) end

--- Appelle les setters core_environment (setSkyBrightness, set*GradientFile) puis réapplique l'heure courante.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:65
function flowgraph_nodes_environment_setScatterSky_C:setScatterSkyParameters() end

--- En mode repeat, applique les paramètres à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:59
function flowgraph_nodes_environment_setScatterSky_C:work() end

--- Applique les paramètres une fois.
---Source : lua/ge/extensions/flowgraph/nodes/environment/setScatterSky.lua:55
function flowgraph_nodes_environment_setScatterSky_C:workOnce() end

