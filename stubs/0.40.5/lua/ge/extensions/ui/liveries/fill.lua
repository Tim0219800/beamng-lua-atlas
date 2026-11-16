---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/fill.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the base fill layer ("fill layer") of a livery in the livery editor. It relies on editor_api_dynamicDecals to create or find the bottom layer of the stack, and on ui_liveries_paint to read and change its color. The UI's paint screen uses it to display and change the vehicle's background color.
--- Access: extension `ui_liveries_fill`: `extensions.load("ui_liveries_fill")`, then the global `ui_liveries_fill`
---@class ui_liveries_fill
---@field dependencies string[] Extensions loaded before this one: editor_api_dynamicDecals and ui_liveries_paint.
ui_liveries_fill = {}

--- After loading an existing livery, looks in the layer stack for the first layer of type fill and stores its uid. Logs a warning and returns false if none exists (the paint screen then stays inactive).
---Source: lua/ge/extensions/ui/liveries/fill.lua:21
---@return boolean  true if a fill layer was found.
function ui_liveries_fill.bindLoadedLayer() end

--- Returns the base layer's paint (via ui_liveries_paint.getLayerPaint) completed with paint.vehicleColor = {r, g, b, a} read from player 0's vehicle color. Returns nil, with a warning, if no base layer is bound.
---Source: lua/ge/extensions/ui/liveries/fill.lua:45
---@return table|nil  Table layerUid, color, metallic, roughness, presets and vehicleColor.
function ui_liveries_fill.getPaint() end

--- Applies a paint to the base layer by delegating to ui_liveries_paint.setLayerPaint. Returns false, with a warning, if no base layer is bound.
---Source: lua/ge/extensions/ui/liveries/fill.lua:67
---@param paint table Table with color {r, g, b, a} normalized between 0 and 1 (metallic and roughness are ignored for a fill layer).
---@return boolean  true if the layer was updated.
function ui_liveries_fill.setPaint(paint) end

--- Creates the base fill layer of a new livery: sets the palette id and the default color of fill layers, then adds the layer and stores its uid. Returns false if the decals API is not loaded or vehicleColor is missing.
---Source: lua/ge/extensions/ui/liveries/fill.lua:10
---@param vehicleColor Point4F|table Vehicle color passed to setFillLayerColor (type inferred from code).
---@return boolean  true if a layer was created and its uid stored.
function ui_liveries_fill.setup(vehicleColor) end

--- Forgets the base layer's uid. Does not delete the layer itself.
---Source: lua/ge/extensions/ui/liveries/fill.lua:41
function ui_liveries_fill.teardown() end

