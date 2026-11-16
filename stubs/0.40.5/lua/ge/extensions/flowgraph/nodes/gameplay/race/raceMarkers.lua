---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_race_raceMarkers_C
local flowgraph_nodes_gameplay_race_raceMarkers_C = {}

--- Destroys the markers (markers.onClientEndMission) and empties the route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:156
function flowgraph_nodes_gameplay_race_raceMarkers_C:_executionStopped() end

--- Node destruction: calls _executionStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:169
function flowgraph_nodes_gameplay_race_raceMarkers_C:destroy() end

--- Initializes markers, minimapMarkers and route.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:45
function flowgraph_nodes_gameplay_race_raceMarkers_C:init() end

--- Mission end hook: calls _executionStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:164
function flowgraph_nodes_gameplay_race_raceMarkers_C:onClientEndMission() end

--- Minimap hook: draws a line (pathnode with normal) or a circle for each non-hidden marker, with an edge pointer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:135
---@param td any Minimap drawing data (not used directly).
function flowgraph_nodes_gameplay_race_raceMarkers_C:onDrawOnMinimap(td) end

--- Minimap hook: adds to routeOverrides a copy of the race's detailed path aiDetailedPath (closed again if it is closed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:dyn
---@param routeOverrides table List of routes to complete.
function flowgraph_nodes_gameplay_race_raceMarkers_C:onMinimapRouteOverride(routeOverrides) end

--- Render hook: calls markers.render(dt, dtSim).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:149
---@param dt number Real time delta (s).
---@param dtSim number Simulation time delta (s).
function flowgraph_nodes_gameplay_race_raceMarkers_C:onPreRender(dt, dtSim) end

--- Handles clear; creates the markers if needed and updates their modes on race events.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceMarkers.lua:50
function flowgraph_nodes_gameplay_race_raceMarkers_C:work() end

