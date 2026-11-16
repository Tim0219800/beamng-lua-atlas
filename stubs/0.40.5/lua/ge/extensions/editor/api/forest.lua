---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/forest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for manipulating forest items (trees, rocks, etc. instanced via ForestData). initialize(editor) adds functions to editor to add, remove, update, rotate and select ForestItems. Functions that modify the forest set editor.forestDirty = true and call editor.setDirty().
--- Access: extension `editor_api_forest`: `extensions.load("editor_api_forest")`, then the global `editor_api_forest`
---@class editor_api_forest
editor_api_forest = {}

--- Installs this module's functions on the editor object.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/forest.lua:104
---@param editorInstance table editor object
function editor_api_forest.initialize(editorInstance) end

--- Functions added to the editor object by initialize.
---@class editor_api_forest_editor
local editor_api_forest_editor = {}

--- Adds an existing ForestItem to the forest.
---Source: lua/ge/extensions/editor/api/forest.lua:47
---@param forestData userdata ForestData
---@param item userdata ForestItem to add
function editor_api_forest_editor.addForestItem(forestData, item) end

--- Creates a new item using an existing item as a template, with a transform and a scale.
---Source: lua/ge/extensions/editor/api/forest.lua:68
---@param forestData userdata ForestData
---@param itemData userdata Stored data of an existing ForestItem
---@param transform MatrixF New transform
---@param scale number New scale
---@return userdata  The created ForestItem
function editor_api_forest_editor.createForestItem(forestData, itemData, transform, scale) end

--- Removes a ForestItem from the forest.
---Source: lua/ge/extensions/editor/api/forest.lua:56
---@param forestData userdata ForestData
---@param item userdata ForestItem to remove
function editor_api_forest_editor.removeForestItem(forestData, item) end

--- Applies a delta rotation to the selected forest items from their original transforms.
---Source: lua/ge/extensions/editor/api/forest.lua:16
---@param forestData userdata ForestData (C++) containing the items
---@param deltaEulerRotation vec3 Euler rotation to add
---@param centerPoint vec3 Rotation center (multiple selection)
---@param originalTransforms table<integer, MatrixF> Transforms before rotation, in selection order
function editor_api_forest_editor.rotateForestSelection(forestData, deltaEulerRotation, centerPoint, originalTransforms) end

--- Sets an item's opaque custom data.
---Source: lua/ge/extensions/editor/api/forest.lua:94
---@param forestData userdata ForestData
---@param key any Item key
---@param customData number Packed value (-1 = none)
---@return userdata  The ForestItem
function editor_api_forest_editor.setForestItemCustomData(forestData, key, customData) end

--- Marks an item as selected or not (does not mark the forest as modified).
---Source: lua/ge/extensions/editor/api/forest.lua:100
---@param forestData userdata ForestData
---@param key any Item key
---@param selected boolean Selection state (inferred from code)
---@return any  Result of forestData:setItemSelected
function editor_api_forest_editor.setForestItemSelected(forestData, key, selected) end

--- Updates an instance's information (data, transform, scale, uid).
---Source: lua/ge/extensions/editor/api/forest.lua:83
---@param forestData userdata ForestData
---@param key any Item key
---@param keyPos vec3 Original position of the item
---@param newData userdata Stored data of the item
---@param newTrans MatrixF New transform
---@param newScale number New scale
---@param newUid any Unique identifier
---@return userdata  The updated ForestItem
function editor_api_forest_editor.updateForestItem(forestData, key, keyPos, newData, newTrans, newScale, newUid) end

