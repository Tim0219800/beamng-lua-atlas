---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/biomeTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Biome Tool" (edit mode "Edit Biome") of the level editor: generates vegetation (Forest objects) and paints terrain materials in layers. Two layer types (terrain = 0, area = 1); "area" layers contain lasso zones (inclusion/exclusion) or zones by terrain material. Each layer has fields (forest density, slope influence and range, falloff and border density, Add/Replace/Delete blending method, field placement with distance/rows/orientation, random area by RA_* noise, edge placement EP_*). The tool relies on ForestBrushTool and the forest brushes. Layers are read from <level>/art/biomeTool/biomeTool.json at initialization and rewritten after each level save.
--- Access: extension `editor_biomeTool`: `extensions.load("editor_biomeTool")`, then the global `editor_biomeTool`
---@class editor_biomeTool
---@field onExtensionLoaded nil Is nil: reference to a variable never defined in the file.
editor_biomeTool = {}

--- Hook called after the level is saved: writes the layers (var.layers) to <level>/art/biomeTool/biomeTool.json (old file deleted first). Does nothing if there is no layer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/biomeTool.lua:3962
function editor_biomeTool.onEditorAfterSaveLevel() end

--- Called every editor frame. Does nothing outside the "Edit Biome" mode. Otherwise checks for the presence of a Forest object (creation dialog otherwise) and draws the interface (Level Biome / Biome Areas tabs), the lasso, the zones and the highlight animations.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/biomeTool.lua:3623
function editor_biomeTool.onEditorGui() end

--- Initialization: loads the level's biomeTool.json if it exists, fills the list of forest brushes and materials, registers the biomeEditMode edit mode (biome_tool icon), the "biomeTool" window (500x560), the NoForestObjDialog modal window and the custom field editors (TerrainMaterial, BlendingMethod, SlopeRange, VegetationFalloff, FieldPlacement, RA_Map).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/biomeTool.lua:3903
function editor_biomeTool.onEditorInitialized() end

--- Hook: when the "biomeTool" window gets focus, activates the biomeEditMode edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/biomeTool.lua:3956
---@param windowName string Name of the window that got focus.
function editor_biomeTool.onEditorToolWindowGotFocus(windowName) end

--- Hook: when the "biomeTool" window is hidden, switches back to the objectSelect edit mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/biomeTool.lua:3950
---@param windowName string Name of the hidden window.
function editor_biomeTool.onEditorToolWindowHide(windowName) end

--- Internal state table of the tool (layers, zones, lasso, forest brushes, generation queue). Only a few accessor methods for the "edge placement" fields and the bounds are defined on it; layerType is 0 (terrain), 1 (area) or 2 (any, in the field templates).
---@class editor_biomeTool_var
local editor_biomeTool_var = {}

--- Returns the border falloff (EP_BorderFalloff, -10 to 10) of a layer; creates the field with the default value (0.0) if missing.
---Source: lua/ge/extensions/editor/biomeTool.lua:1473
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID.
---@return number|nil  Current value, nil if the field is unknown.
function editor_biomeTool_var.getEPFalloff(layerType, layerID) end

--- Returns the distance between objects for edge placement (EP_ItemDistance, -10 to 10, default 1); creates the field if missing.
---Source: lua/ge/extensions/editor/biomeTool.lua:1516
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID.
---@return number|nil  Current value.
function editor_biomeTool_var.getEPItemDistance(layerType, layerID) end

--- Returns the random tilt range (EP_RandomTilt field) of a layer; {-5, 5} by default if the layer does not have this field.
---Source: lua/ge/extensions/editor/biomeTool.lua:1431
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID.
---@return table<integer, number>  {min, max} in degrees (inferred from code, range -40 to 40).
function editor_biomeTool_var.getEPRandomTiltRange(layerType, layerID) end

--- Returns the {min, max} bounds of a field of the fieldInfoTemplate template for this layer type; {0, 0} if not found.
---Source: lua/ge/extensions/editor/biomeTool.lua:1421
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID (not used in the computation).
---@param fieldName string Field name, e.g. "EP_ItemDistance".
---@return table<integer, number>  {minValue, maxValue}.
function editor_biomeTool_var.getFieldMinMax(layerType, layerID, fieldName) end

--- Sets EP_BorderFalloff of a layer, clamped to the field's minValue/maxValue; creates the field if missing.
---Source: lua/ge/extensions/editor/biomeTool.lua:1494
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID.
---@param val number New value.
function editor_biomeTool_var.setEPFalloff(layerType, layerID, val) end

--- Sets EP_ItemDistance of a layer, clamped to -10..10; creates the field if missing.
---Source: lua/ge/extensions/editor/biomeTool.lua:1537
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID.
---@param val number New value.
function editor_biomeTool_var.setEPItemDistance(layerType, layerID, val) end

--- Sets the EP_RandomTilt range of a layer, clamped to -40..40; creates the field if missing. The passed table is modified.
---Source: lua/ge/extensions/editor/biomeTool.lua:1447
---@param layerType integer 0 terrain, 1 area.
---@param layerID integer Layer ID.
---@param range table<integer, number> Requested {min, max}.
function editor_biomeTool_var.setEPRandomTiltRange(layerType, layerID, range) end

