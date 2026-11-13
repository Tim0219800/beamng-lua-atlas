---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/paint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_liveries_paint` : `extensions.load("ui_liveries_paint")`, puis la globale `ui_liveries_paint`
---@class ui_liveries_paint
---@field EDITABLE_COLOR_PALETTE_MAP_ID number
---@field dependencies table
ui_liveries_paint = {}

---Source : lua/ge/extensions/ui/liveries/paint.lua:59
---@param layerUid any
function ui_liveries_paint.getLayerPaint(layerUid) end

--- shared with the decal editor, which paints the live projection instead of a committed layer
---Source : lua/ge/extensions/ui/liveries/paint.lua:12
function ui_liveries_paint.getVehiclePaintPresets() end

--- ui values are normalized, so anything out of range or non-numeric falls back to the layer's own
---Source : lua/ge/extensions/ui/liveries/paint.lua:21
---@param value any
---@param fallback any
function ui_liveries_paint.readNormalized(value, fallback) end

--- the new values are applied to a copy of the layer, so the api's history don't get affected
---Source : lua/ge/extensions/ui/liveries/paint.lua:67
---@param layerUid any
---@param paint any
function ui_liveries_paint.setLayerPaint(layerUid, paint) end

