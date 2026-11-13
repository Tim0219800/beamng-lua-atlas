---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_apps_minimap_utils` : `extensions.load("ui_apps_minimap_utils")`, puis la globale `ui_apps_minimap_utils`
---@class ui_apps_minimap_utils
---@field centerPointer any
---@field colors table
---@field dpi number
ui_apps_minimap_utils = {}

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:152
---@param pos any
---@param buffer any
function ui_apps_minimap_utils.clampToMinimapBounds(pos, buffer) end

--- Edge pointer function: returns false if the position is inside of the minimap (nothing drawn)
---  the border color is always clrNavBg and the stroke is always white, strikeClr is unused
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:213
---@param pos any
---@param fill any
---@param strikeClr any
---@param radius any
---@param maxDistance any
function ui_apps_minimap_utils.drawEdgePointer(pos, fill, strikeClr, radius, maxDistance) end

--- Grid drawing function
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:251
function ui_apps_minimap_utils.drawGrid() end

--- Getter for current style colors
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:385
function ui_apps_minimap_utils.getCurrentStyleColors() end

--- Getter for default style color set index
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:380
function ui_apps_minimap_utils.getDefaultStyleColorSet() end

--- Getter for StyleColorSet
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:375
function ui_apps_minimap_utils.getStyleColorSet() end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:108
function ui_apps_minimap_utils.getWorldToMapTransform() end

--- Utility functions
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:144
---@param pos any
---@param buffer any
function ui_apps_minimap_utils.isInsideMinimapBounds(pos, buffer) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:135
---@param p any
function ui_apps_minimap_utils.mapToWorld(p) end

--- Returns the clamped position and a flag indicating whether clamping happened
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:159
---@param pos any
---@param inset any
---@param maxDistance any
function ui_apps_minimap_utils.setClampToBounds(pos, inset, maxDistance) end

--- Setter function to update state from main minimap
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:37
---@param w any
---@param h any
---@param cx any
---@param cy any
---@param cp any
---@param cr any
---@param cri any
---@param s any
---@param si any
---@param textureDraw any
---@param ox any
---@param oy any
---@param minimapMode any
---@param dpi any
function ui_apps_minimap_utils.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, ox, oy, minimapMode, dpi) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:203
---@param pos any
---@param fill any
---@param strikeClr any
---@param radius any
function ui_apps_minimap_utils.simpleCircle(pos, fill, strikeClr, radius) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:217
---@param pos any
---@param fill any
---@param strikeClr any
---@param radius any
function ui_apps_minimap_utils.simpleCircleWithEdgePointer(pos, fill, strikeClr, radius) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:207
---@param pos1 any
---@param pos2 any
---@param fill any
---@param strikeClr any
function ui_apps_minimap_utils.simpleLine(pos1, pos2, fill, strikeClr) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:224
---@param pos1 any
---@param pos2 any
---@param fill any
---@param strikeClr any
function ui_apps_minimap_utils.simpleLineWithEdgePointer(pos1, pos2, fill, strikeClr) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:101
---@param x1 any
---@param y1 any
---@param x2 any
---@param y2 any
function ui_apps_minimap_utils.worldLineToMapXY(x1, y1, x2, y2) end

--- Transform functions
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:73
---@param p any
function ui_apps_minimap_utils.worldToMap(p) end

---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:96
---@param x any
---@param y any
function ui_apps_minimap_utils.worldToMapXY(x, y) end

--- local x = (source.x - camPos.x) * scaleInverse * camFwd.x + (source.y - camPos.y) * scaleInverse * camRight.x
--- local y = (source.x - camPos.x) * scaleInverse * camFwd.y + (source.y - camPos.y) * scaleInverse * camRight.y
---Source : lua/ge/extensions/ui/apps/minimap/utils.lua:87
---@param target any
---@param source any
function ui_apps_minimap_utils.worldToMapXYZ(target, source) end

