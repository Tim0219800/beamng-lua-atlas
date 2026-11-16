---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/pointsBar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Feeds the pointsBar interface app (points bar with thresholds). It keeps the point count and the thresholds (100, 200, 300 by default) and publishes in the 'pointsBar' stream the fill percentage, the label, the thresholds reached and the position of the thresholds as a percentage.
--- Access: extension `ui_apps_pointsBar`: `extensions.load("ui_apps_pointsBar")`, then the global `ui_apps_pointsBar`
---@class ui_apps_pointsBar
ui_apps_pointsBar = {}

--- Resets the default thresholds {100, 200, 300} and the points to 0.
---Source: lua/ge/extensions/ui/apps/pointsBar.lua:55
function ui_apps_pointsBar.clearData() end

--- Initialization hook: sets the extension to manual unload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/pointsBar.lua:6
function ui_apps_pointsBar.onInit() end

--- Republishes thresholds and current points (useful when the app mounts).
---Source: lua/ge/extensions/ui/apps/pointsBar.lua:60
function ui_apps_pointsBar.requestAllData() end

--- Updates the current points and the label, recomputes fill and thresholds reached, then publishes in the 'pointsBar' stream.
---Source: lua/ge/extensions/ui/apps/pointsBar.lua:26
---@param points number Current points.
---@param pointsLabel string|nil Displayed text; defaults to tostring(points).
function ui_apps_pointsBar.setPoints(points, pointsLabel) end

--- Sets the threshold list (if provided), recomputes their position as a percentage and publishes in the stream.
---Source: lua/ge/extensions/ui/apps/pointsBar.lua:41
---@param thresholds table<integer, number>|nil Increasing thresholds; the last one sets the scale.
function ui_apps_pointsBar.setThresholds(thresholds) end

