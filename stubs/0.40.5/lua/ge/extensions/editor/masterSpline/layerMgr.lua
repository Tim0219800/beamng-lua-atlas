---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manager of the layers of a Master Spline. A layer links the Master Spline to a child spline of another tool (mesh, assembly, decal, road, tree) and sends it a laterally offset copy of the discretized geometry, simplified by RDP (tolerance 0.25). This module creates, updates, deletes, copies and (de)serializes the layers.
--- Access: extension `editor_masterSpline_layerMgr`: `extensions.load("editor_masterSpline_layerMgr")`, then the global `editor_masterSpline_layerMgr`
---@class editor_masterSpline_layerMgr
editor_masterSpline_layerMgr = {}

--- Adds a "New Layer N" layer (generated UUID, isDirty true, unlinked, default link type = mesh, default position).
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:189
---@param spline table Master Spline that receives the layer.
function editor_masterSpline_layerMgr.addNewLayer(spline) end

--- Deep copy of an array of layers.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:72
---@param layers table Array of layers.
---@return table  Independent copy.
function editor_masterSpline_layerMgr.deepCopyAllLayers(layers) end

--- Deep copy of a layer (via string.buffer encode/decode).
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:69
---@param layer table Layer to copy.
---@return table  Independent copy.
function editor_masterSpline_layerMgr.deepCopyLayer(layer) end

--- Rebuilds a layer from serialized data; isDirty is set to true, a UUID is generated if id is missing, defaults otherwise.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:219
---@param data table Table produced by serializeLayer.
---@return table  Layer.
function editor_masterSpline_layerMgr.deserializeLayer(data) end

--- Returns the table of the slider default values, for the tool's interface.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:66
---@return table<string, number>  Default values (defaultDOI, defaultTerraMargin, defaultBankStrength...).
function editor_masterSpline_layerMgr.getSliderDefaults() end

--- Deletes all the layers and their linked splines.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:177
---@param masterSpline table Master Spline.
function editor_masterSpline_layerMgr.removeAllLayers(masterSpline) end

--- Deletes the layer at index idx; if it has a linked spline, that spline is deleted in its tool.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:167
---@param idx integer Layer index (1-based).
---@param masterSpline table Owning Master Spline.
function editor_masterSpline_layerMgr.removeLayer(idx, masterSpline) end

--- Converts a layer to a plain table (name, id, isLink, linkType, linkedSplineId, linkedSplineName, isFlip, isTrackWidth, position), without the internal buffers.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:204
---@param layer table Layer.
---@return table  Serializable data.
function editor_masterSpline_layerMgr.serializeLayer(layer) end

--- Sends the Master Spline's geometry to the linked spline of each layer, dirty or not, and sets isDirty back to false.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:148
---@param masterSpline table Master Spline (nodes, divPoints, divWidths, binormals, normals, layers, isLoop, isConformToTerrain).
function editor_masterSpline_layerMgr.updateAllLayers(masterSpline) end

--- Like updateAllLayers but only for layers with isDirty true.
---Source: lua/ge/extensions/editor/masterSpline/layerMgr.lua:155
---@param masterSpline table Master Spline.
function editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline) end

