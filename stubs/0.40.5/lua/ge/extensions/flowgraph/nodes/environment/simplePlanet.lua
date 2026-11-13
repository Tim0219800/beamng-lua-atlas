---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_environment_simplePlanet_C
local flowgraph_nodes_environment_simplePlanet_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:62
function flowgraph_nodes_environment_simplePlanet_C:_executionStopped() end

--- Initialise self.vehicle à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:29
function flowgraph_nodes_environment_simplePlanet_C:init() end

--- Si un véhicule a été ciblé, lui envoie obj:setPlanets({}) et oublie la référence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:33
function flowgraph_nodes_environment_simplePlanet_C:onNodeReset() end

--- Construit la commande obj:setPlanets({x,y,z,radius,mass}) et l'envoie au véhicule ciblé.
---Source : lua/ge/extensions/flowgraph/nodes/environment/simplePlanet.lua:40
function flowgraph_nodes_environment_simplePlanet_C:workOnce() end

