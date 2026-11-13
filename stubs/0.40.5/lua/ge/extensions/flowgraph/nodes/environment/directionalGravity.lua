---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_directionalGravity_C
local flowgraph_nodes_environment_directionalGravity_C = {}

--- Supprime les planètes du véhicule (obj:setPlanets({})).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:37
function flowgraph_nodes_environment_directionalGravity_C:_executionStopped() end

--- Éditeur : affichage de debug (ligne, force) et gravité de surface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:82
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_environment_directionalGravity_C:drawMiddle(builder, style) end

--- Active showDebug et crée la table planet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:31
function flowgraph_nodes_environment_directionalGravity_C:init() end

--- Calcule origine, rayon et masse de la planète et envoie obj:setPlanets au véhicule. Ne fait rien si direction ou magnitude est nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:55
function flowgraph_nodes_environment_directionalGravity_C:setDirectionalGravity() end

--- Si dynamicMode vaut 'repeat', réapplique la gravité à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:49
function flowgraph_nodes_environment_directionalGravity_C:work() end

--- Applique la gravité directionnelle une fois.
---Source : lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua:45
function flowgraph_nodes_environment_directionalGravity_C:workOnce() end

