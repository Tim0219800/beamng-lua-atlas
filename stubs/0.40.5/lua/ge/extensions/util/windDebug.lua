---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/windDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Visualizes the shared wind field: samples `be:getWindAt()` on a 21 x 21 grid of points spaced 5 m apart centered on the camera, and draws one arrow per point (direction = wind, length and color = speed, from blue to red at 20 m/s). Text in the center shows the wind speed in m/s and km/h. Gusts are animated because the field varies over time.
--- Access: extension `util_windDebug`: `extensions.load("util_windDebug")`, then the global `util_windDebug`
---@class util_windDebug
---@field enabled boolean True when the wind visualization is active.
util_windDebug = {}

--- Pre-render hook: if enabled, draws the grid of wind arrows around the camera and the speed text in the center.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/windDebug.lua:43
---@param dtReal number real time elapsed, in seconds
---@param dtSim number simulated time elapsed, in seconds
function util_windDebug.onPreRender(dtReal, dtSim) end

--- Enables or disables the display.
---Source: lua/ge/extensions/util/windDebug.lua:66
---@param v any any value; converted to a boolean (true if truthy)
function util_windDebug.setEnabled(v) end

--- Toggles the display state.
---Source: lua/ge/extensions/util/windDebug.lua:67
function util_windDebug.toggle() end

