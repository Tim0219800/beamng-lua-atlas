---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_raceMarkers_C
local flowgraph_nodes_gameplay_race_raceMarkers_C = {}

--- Détruit les marqueurs (markers.onClientEndMission) et vide la route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:156
function flowgraph_nodes_gameplay_race_raceMarkers_C:_executionStopped() end

--- Destruction du nœud : appelle _executionStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:169
function flowgraph_nodes_gameplay_race_raceMarkers_C:destroy() end

--- Initialise markers, minimapMarkers et route.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:45
function flowgraph_nodes_gameplay_race_raceMarkers_C:init() end

--- Hook de fin de mission : appelle _executionStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:164
function flowgraph_nodes_gameplay_race_raceMarkers_C:onClientEndMission() end

--- Hook minimap : dessine ligne (pathnode avec normale) ou cercle de chaque marqueur non caché, avec pointeur de bord.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:135
---@param td any Données de dessin de la minimap (non utilisées directement).
function flowgraph_nodes_gameplay_race_raceMarkers_C:onDrawOnMinimap(td) end

--- Hook minimap : ajoute à routeOverrides une copie du chemin détaillé aiDetailedPath de la course (refermé s'il est fermé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:dyn
---@param routeOverrides table Liste de routes à compléter.
function flowgraph_nodes_gameplay_race_raceMarkers_C:onMinimapRouteOverride(routeOverrides) end

--- Hook de rendu : appelle markers.render(dt, dtSim).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:149
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps simulation (s).
function flowgraph_nodes_gameplay_race_raceMarkers_C:onPreRender(dt, dtSim) end

--- Gère clear ; crée les marqueurs au besoin et met à jour leurs modes sur évènement de course.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:50
function flowgraph_nodes_gameplay_race_raceMarkers_C:work() end

