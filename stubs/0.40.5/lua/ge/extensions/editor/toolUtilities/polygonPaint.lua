---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polygonPaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Freehand polygon tool for the editor: the user holds the left click and drags over the terrain to lay points, releases to finish (closing is implicit between the last and the first point). The stroke is simplified by RDP to obtain a clean editable polygon. Draws a preview (blue spheres and lines) and the cursor.
--- Access: extension `editor_toolUtilities_polygonPaint`: `extensions.load("editor_toolUtilities_polygonPaint")`, then the global `editor_toolUtilities_polygonPaint`
---@class editor_toolUtilities_polygonPaint
editor_toolUtilities_polygonPaint = {}

--- Disarms the tool and clears the points.
---Source: lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:61
function editor_toolUtilities_polygonPaint.cancel() end

--- Retrieves the finished simplified polygon and clears the finished flag. Returns nil if nothing is finished.
---Source: lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:75
---@param out table|nil Reusable output table, emptied then filled; created if nil.
---@return table|nil  List of vec3 of the polygon.
function editor_toolUtilities_polygonPaint.consumePolygon(out) end

--- Tells whether a finished polygon is waiting to be retrieved by consumePolygon.
---Source: lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:71
---@return boolean  true if a polygon is ready.
function editor_toolUtilities_polygonPaint.hasFinished() end

--- Tells whether the tool is armed.
---Source: lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:67
---@return boolean  true if armed.
function editor_toolUtilities_polygonPaint.isActive() end

--- Arms the tool and resets the tables. stepMeters (default 2.0) is the minimum distance between two captured points, rdpTolMeters (default 6.0) the simplification tolerance.
---Source: lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:50
---@param opts table|nil { stepMeters = number, rdpTolMeters = number }
function editor_toolUtilities_polygonPaint.start(opts) end

--- To be called every frame while painting must be possible: draws the preview and the cursor, captures points while the left click is held down on the terrain, finishes on release.
---Source: lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:128
---@return boolean  true if a polygon finished during this frame.
function editor_toolUtilities_polygonPaint.update() end

