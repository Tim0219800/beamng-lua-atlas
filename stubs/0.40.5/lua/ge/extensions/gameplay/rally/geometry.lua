---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/geometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prototype for automatic generation of rally notes from the road geometry. When a ground marker is active, it computes an optimized path between start and finish (map.optimizePath), saves it to temp/, then estimates for each node the curvature radius, the cornering speed (slick tires, friction 1.7) and a severity (Hairpin, Medium, Fast, Easy, Flat, Straight), groups the nodes into notes (e.g. 'Medium left long tightens') and draws them with debugDrawer. While driving, it displays the upcoming notes and sends the text to the UI via the guihooks 'ScenarioRealtimeDisplay'. Without a marker, it reloads the last saved route.
--- Access: extension `gameplay_rally_geometry`: `extensions.load("gameplay_rally_geometry")`, then the global `gameplay_rally_geometry`
---@class gameplay_rally_geometry
gameplay_rally_geometry = {}

--- Hook called every frame. (Re)generates the notes if the source changes (active ground marker or file cache), then reads the player vehicle's position and speed and draws the notes: all of them if the vehicle is stopped, otherwise the notes for the next 4 seconds (at least 2), and sends the 2nd note (if it is not a straight) to the ScenarioRealtimeDisplay UI message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/geometry.lua:502
---@param dt number Real-time delta (s).
---@param dtSim number Simulation time delta (s); below 0.001 = game paused (then shows the node details).
function gameplay_rally_geometry.onUpdate(dt, dtSim) end

