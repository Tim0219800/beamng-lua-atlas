---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/paint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Reads and modifies the paint (RGBA color, metallic, roughness) of a livery editor layer, found by its uid in editor_api_dynamicDecals. It also provides the current vehicle model's preset paints. It is used by the UI's paint screen and by the decals editor.
--- Access: extension `ui_liveries_paint`: `extensions.load("ui_liveries_paint")`, then the global `ui_liveries_paint`
---@class ui_liveries_paint
---@field EDITABLE_COLOR_PALETTE_MAP_ID integer Equals 0. This is the only mode where a layer displays its own color; any other id takes the color from a vehicle palette slot and ignores the layer's.
---@field dependencies string[] Extensions loaded before this one: editor_api_dynamicDecals.
ui_liveries_paint = {}

--- Returns the paint of the layer with the given uid: layerUid, color {r, g, b, a} (white by default), metallic, roughness and presets. Returns nil, with a warning, if the uid is not a string or the layer does not exist.
---Source: lua/ge/extensions/ui/liveries/paint.lua:59
---@param layerUid string Layer uid.
---@return table|nil  Paint table.
function ui_liveries_paint.getLayerPaint(layerUid) end

--- Returns the model.paints list of player 0's vehicle model (via core_vehicles.getModel), or an empty table if there is no vehicle. Shared with the decals editor.
---Source: lua/ge/extensions/ui/liveries/paint.lua:12
---@return table  Model preset paints.
function ui_liveries_paint.getVehiclePaintPresets() end

--- Converts value to a number and clamps it between 0 and 1; returns fallback if the conversion fails.
---Source: lua/ge/extensions/ui/liveries/paint.lua:21
---@param value any Value received from the UI.
---@param fallback number Value returned if value is not numeric.
---@return number  Value in [0, 1] or fallback.
function ui_liveries_paint.readNormalized(value, fallback) end

--- Applies color, metallic and roughness to the layer with the given uid, via a copy of the layer passed to editor_api_dynamicDecals.setLayer. Returns false if the layer is not found or paint is not a table.
---Source: lua/ge/extensions/ui/liveries/paint.lua:67
---@param layerUid string Layer uid.
---@param paint table Optional fields color {r, g, b, a}, metallic, roughness, all normalized between 0 and 1.
---@return boolean  true if the update was done.
function ui_liveries_paint.setLayerPaint(layerUid, paint) end

