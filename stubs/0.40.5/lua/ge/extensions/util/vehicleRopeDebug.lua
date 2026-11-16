---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/vehicleRopeDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui debug tool "Rope Visual Sandbox" for the player vehicle's visual ropes (rope visuals). It lists the ropes of `be:getPlayerVehicle(0).ropeIds` (via `getRopeVisual`), draws their nodes and directions with `debugDrawer`, lets you hover and drag nodes with the mouse, edit the positions of anchors A and B, and displays performance statistics (simulation and render time per rope, spikes). Loaded manually from the console.
--- Access: extension `util_vehicleRopeDebug`: `extensions.load("util_vehicleRopeDebug")`, then the global `util_vehicleRopeDebug`
---@class util_vehicleRopeDebug
util_vehicleRopeDebug = {}

--- Per-frame update: updates the performance statistics, handles hovering and dragging of rope nodes with the mouse (if debugNodes is active), draws the nodes of the player vehicle's ropes, then builds the ImGui window "Rope Visual Sandbox".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/vehicleRopeDebug.lua:572
---@param dt number frame time step, in seconds (onUpdate hook)
function util_vehicleRopeDebug.onUpdate(dt) end

