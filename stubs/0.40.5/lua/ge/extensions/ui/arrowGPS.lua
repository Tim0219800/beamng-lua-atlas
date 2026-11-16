---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/arrowGPS.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Displays a 3D GPS arrow (TSStatic art/shapes/interface/s_mm_arrow_floating.dae) floating in front of the camera, at the location of the arrowGPS interface app, and oriented toward a world target. Several sources can register a target with a priority (setTarget); the highest-priority one (smallest number) is followed. The arrow is created on demand, hidden if there is no target or no player vehicle, and deleted on unload.
--- Access: extension `ui_arrowGPS`: `extensions.load("ui_arrowGPS")`, then the global `ui_arrowGPS`
---@class ui_arrowGPS
---@field dependencies table<integer, string> { "core_camera" }: loaded before this module.
ui_arrowGPS = {}

--- Unload hook: deletes the arrow object and empties all registrations.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.lua:179
function ui_arrowGPS.onExtensionUnloaded() end

--- Hook called before each render: creates the arrow if needed, computes its screen-to-world position, orients it toward the active target (quatFromDir) and shows it; hides it if there is no target or no player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.lua:144
---@param dt number Elapsed time (not used).
function ui_arrowGPS.onPreRender(dt) end

--- Removes a source's target and recomputes the active target (the arrow hides if none remains).
---Source: lua/ge/extensions/ui/arrowGPS.lua:68
---@param key string Source identifier.
function ui_arrowGPS.removeTarget(key) end

--- Sets the app's screen position (fractions from 0 to 1) where the arrow is drawn; called from the interface side.
---Source: lua/ge/extensions/ui/arrowGPS.lua:128
---@param sx number Horizontal position, 0 left, 1 right.
---@param sy number Vertical position, 0 top, 1 bottom.
function ui_arrowGPS.setAppScreenPos(sx, sy) end

--- Changes the distance in front of the camera at which the arrow is placed (0.15 by default).
---Source: lua/ge/extensions/ui/arrowGPS.lua:140
---@param depth number Distance in meters.
function ui_arrowGPS.setDepth(depth) end

--- Changes the arrow's scale (0.04 by default).
---Source: lua/ge/extensions/ui/arrowGPS.lua:133
---@param scale number Uniform scale factor.
function ui_arrowGPS.setScale(scale) end

--- Registers or replaces a source's target (key) with its priority, then recomputes the active target and the arrow's color.
---Source: lua/ge/extensions/ui/arrowGPS.lua:54
---@param key string Source identifier.
---@param priority number Priority; the smallest value wins.
---@param data table|nil {pos=vec3|{x,y,z}, color={r,g,b}|nil}.
function ui_arrowGPS.setTarget(key, priority, data) end

