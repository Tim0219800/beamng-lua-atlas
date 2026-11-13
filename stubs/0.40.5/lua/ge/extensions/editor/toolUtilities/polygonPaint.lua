---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polygonPaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_polygonPaint` : `extensions.load("editor_toolUtilities_polygonPaint")`, puis la globale `editor_toolUtilities_polygonPaint`
---@class editor_toolUtilities_polygonPaint
editor_toolUtilities_polygonPaint = {}

---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:61
function editor_toolUtilities_polygonPaint.cancel() end

---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:75
---@param out any
function editor_toolUtilities_polygonPaint.consumePolygon(out) end

---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:71
function editor_toolUtilities_polygonPaint.hasFinished() end

---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:67
function editor_toolUtilities_polygonPaint.isActive() end

--- Public interface.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:50
---@param opts any
function editor_toolUtilities_polygonPaint.start(opts) end

--- Call every frame while painting should be possible.
---  Returns true if a polygon finished THIS frame.
---Source : lua/ge/extensions/editor/toolUtilities/polygonPaint.lua:128
function editor_toolUtilities_polygonPaint.update() end

