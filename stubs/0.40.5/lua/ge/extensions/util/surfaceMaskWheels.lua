---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/surfaceMaskWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Makes the player vehicle's wheels leave a trace in the "surface mask" (SurfaceMaskClipmap, a C++ object that keeps a dynamic mask of the terrain surface, for example flattened grass). Every 0.05 s, for each wheel, it converts the position (wheel axle node) to world and calls maskCircleWorld (first contact) or maskLineWorld (segment since the last position) with a width of 1.8 m (3.2 m in mower mode). It also owns the clipmap lifecycle: tile storage under /temp/levels/<level>/dynamicTiles, recentering on the vehicle, clearing. It offers a mower mode (cut grass particles) and debug tools (console line, "SurfaceMask Pages" ImGui window, 3D outlines of the 16 m pages). Other extensions (for example util_lawnMower) use it as a service via isReady, setCenter, maskCircleWorld and maskLineWorld.
--- Access: extension `util_surfaceMaskWheels`: `extensions.load("util_surfaceMaskWheels")`, then the global `util_surfaceMaskWheels`
---@class util_surfaceMaskWheels
---@field dependencies string[] Extension loaded before: ui_imgui.
---@field enabled boolean true when wheel marking is active (changed by setEnabled/toggle).
util_surfaceMaskWheels = {}

--- Clears the whole surface mask (SurfaceMaskClipmap:clear()).
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:448
function util_surfaceMaskWheels.clear() end

--- Switches to the next debug mode (0, 1, 2, then back to 0).
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:538
function util_surfaceMaskWheels.cycleDebug() end

--- Returns a copy of the Lua-side performance statistics.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:512
---@return table  {maskTicks, lastLuaFrameMs, avgLuaFrameMs, lastLuaMaskMs, avgLuaMaskMs, lastWheelCount, lastMovedWheels, lastSkippedWheels, lastMaskCalls, lastParticleCalls}.
function util_surfaceMaskWheels.getPerformanceStats() end

--- Indicates whether the SurfaceMaskClipmap object exists. Lets consumer modules skip their work.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:455
---@return boolean  true if SurfaceMaskClipmap is available.
function util_surfaceMaskWheels.isReady() end

--- Stamps a disc into the mask.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:463
---@param x number World X of the center (m).
---@param y number World Y of the center (m).
---@param radius number Radius (m).
---@param flatten number Grass flattening strength (0 to 1 based on the values used).
---@param mark number Marking strength (0 to 1 based on the values used).
function util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark) end

--- Stamps a thick segment into the mask.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:467
---@param x1 number World X of the start (m).
---@param y1 number World Y of the start (m).
---@param x2 number World X of the end (m).
---@param y2 number World Y of the end (m).
---@param width number Line width (m).
---@param flatten number Flattening strength.
---@param mark number Marking strength.
function util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark) end

--- Hook called when a level starts: repoints the clipmap's tile storage to the current level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:427
function util_surfaceMaskWheels.onClientStartMission() end

--- Hook called after reload with the serialized state; restores the parameters (debug tile size limited to 36).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:492
---@param data table|nil Serialized state.
function util_surfaceMaskWheels.onDeserialized(data) end

--- Hook called on extension load: enables the module, turns off debugging and initializes the tile storage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:421
function util_surfaceMaskWheels.onExtensionLoaded() end

--- Hook called every frame before rendering: accumulates the simulated time, runs the player vehicle's wheel marking every maskInterval, then the debug if any.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:391
---@param dtReal number Real frame time (s).
---@param dtSim number Simulated duration (s), takes priority over dtReal.
function util_surfaceMaskWheels.onPreRender(dtReal, dtSim) end

--- Serialization hook before extension reload: returns the state and the parameters (enabled, widths, strengths, thresholds, debug mode, mower, particles).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:471
---@return table  State to restore.
function util_surfaceMaskWheels.onSerialize() end

--- Hook called when a vehicle is destroyed: removes its wheel data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:431
---@param vehId integer Vehicle identifier.
function util_surfaceMaskWheels.onVehicleDestroyed(vehId) end

--- Hook called after a vehicle reset: removes its wheel data so it is rebuilt.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:435
---@param vehId integer Vehicle identifier.
function util_surfaceMaskWheels.onVehicleResetted(vehId) end

--- Recenters the clipmap: the C++ side saves the modified tiles that leave and loads those that enter.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:459
---@param x number World X coordinate (m).
---@param y number World Y coordinate (m).
function util_surfaceMaskWheels.setCenter(x, y) end

--- Compatibility: true enables mode 2, false mode 0.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:534
---@param enabled boolean Enable full debugging.
function util_surfaceMaskWheels.setDebug(enabled) end

--- Chooses the debug mode (0 none, 1 console, 2 window + 3D); the value is clamped to 0..2 and the first console line is emitted right away.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:527
---@param mode integer|nil Debug mode.
function util_surfaceMaskWheels.setDebugMode(mode) end

--- Sets the radius (in pages) of the debug grid displayed around the vehicle (0 = current page only).
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:554
---@param radius integer|nil Radius in pages, minimum 0.
function util_surfaceMaskWheels.setDebugPageRadius(radius) end

--- Enables or disables wheel marking and resets the timer.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:439
---@param enabled boolean true to enable.
function util_surfaceMaskWheels.setEnabled(enabled) end

--- Sets the mower's cutting width.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:550
---@param width number|nil Width in meters; nil keeps the current value.
function util_surfaceMaskWheels.setMowerWidth(width) end

--- Enables or disables mower mode (width 3.2 m, marking 1, grass particles).
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:542
---@param enabled boolean true to enable.
function util_surfaceMaskWheels.setMowingEnabled(enabled) end

--- Toggles the enabled state.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:444
function util_surfaceMaskWheels.toggle() end

--- Toggles mower mode.
---Source: lua/ge/extensions/util/surfaceMaskWheels.lua:546
function util_surfaceMaskWheels.toggleMowing() end

