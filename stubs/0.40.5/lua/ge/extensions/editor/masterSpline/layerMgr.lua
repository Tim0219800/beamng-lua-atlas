---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/layerMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_masterSpline_layerMgr` : `extensions.load("editor_masterSpline_layerMgr")`, puis la globale `editor_masterSpline_layerMgr`
---@class editor_masterSpline_layerMgr
editor_masterSpline_layerMgr = {}

--- Adds a new layer.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:189
---@param spline any
function editor_masterSpline_layerMgr.addNewLayer(spline) end

--- Deep copies all layers.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:72
---@param layers any
function editor_masterSpline_layerMgr.deepCopyAllLayers(layers) end

--- Deep copies a layer.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:69
---@param layer any
function editor_masterSpline_layerMgr.deepCopyLayer(layer) end

--- Deserialises a layer from a table.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:219
---@param data any
function editor_masterSpline_layerMgr.deserializeLayer(data) end

--- Returns the default values for the slider properties, for use in the tool's front end.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:66
function editor_masterSpline_layerMgr.getSliderDefaults() end

--- Removes all layers and their linked splines.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:177
---@param masterSpline any
function editor_masterSpline_layerMgr.removeAllLayers(masterSpline) end

--- Removes a layer at the given index.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:167
---@param idx any
---@param masterSpline any
function editor_masterSpline_layerMgr.removeLayer(idx, masterSpline) end

--- Serialises a layer to a table.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:204
---@param layer any
function editor_masterSpline_layerMgr.serializeLayer(layer) end

--- Updates the properties of all layers.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:148
---@param masterSpline any
function editor_masterSpline_layerMgr.updateAllLayers(masterSpline) end

--- Updates the properties of only the dirty layers.
---Source : lua/ge/extensions/editor/masterSpline/layerMgr.lua:155
---@param masterSpline any
function editor_masterSpline_layerMgr.updateOnlyDirtyLayers(masterSpline) end

