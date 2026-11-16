---@meta
-- tim19Atlas stub generated from lua/vehicle/aiDebugDraw.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug drawing for the vehicle AI (spheres, cylinders, texts via obj.debugDrawProxy). Loaded by ai.lua (require 'aiDebugDraw'); ai.setVehicleDebugMode enables or disables it depending on ai.debugMode. It reads a context (ego, twt, current route, map, scriptai...) provided by ai.lua via setContextBinder, and only writes to ai.debugDraw (function called by the main loop to draw). A modder does not normally call it directly.
--- Access: `require("aiDebugDraw")`
---@class aiDebugDraw
local aiDebugDraw = {}

--- Disables debug drawing (ai.debugDraw = nop).
---Source: lua/vehicle/aiDebugDraw.lua:442
function aiDebugDraw.disable() end

--- Enables debug drawing: binds the context if necessary then puts the drawing function in ai.debugDraw.
---Source: lua/vehicle/aiDebugDraw.lua:435
function aiDebugDraw.enable() end

--- Stores the context used by the drawing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/aiDebugDraw.lua:409
---@param context table Table with ego, twt, lastCommand, player (function), getCurrentRoute, getMapData, getScriptai, roadNaturalContinuation, castRay, populateOBBinRange.
function aiDebugDraw.init(context) end

--- Hook called by ai.setVehicleDebugMode when the debug mode changes: empties the drawing histories (trajectory, route) that no longer match the chosen mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/aiDebugDraw.lua:413
---@param debugMode string New ai.debugMode ('off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all').
function aiDebugDraw.onDebugModeChanged(debugMode) end

--- Empties the drawing histories (trajectory and route). Called by ai.setMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/aiDebugDraw.lua:428
function aiDebugDraw.reset() end

--- Registers the function that will build the context (ego, twt, route/map/scriptai access, castRay...) at the first enable().
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/aiDebugDraw.lua:405
---@param fn function Function with no argument that calls aiDebugDraw.init(context).
function aiDebugDraw.setContextBinder(fn) end

return aiDebugDraw
