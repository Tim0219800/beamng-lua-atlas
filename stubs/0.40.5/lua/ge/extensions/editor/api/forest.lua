---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/forest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_forest` : `extensions.load("editor_api_forest")`, puis la globale `editor_api_forest`
---@class editor_api_forest
editor_api_forest = {}

---Source : lua/ge/extensions/editor/api/forest.lua:104
---@param editorInstance any
function editor_api_forest.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/forest.lua
---@class editor_api_forest_editor
local editor_api_forest_editor = {}

--- Add a new forest item to the forest data.
---  @param forestData the ForestData C++ class where to add the item
---  @param item the C++ ForestItem to be added
---Source : lua/ge/extensions/editor/api/forest.lua:47
---@param forestData any
---@param item any
function editor_api_forest_editor.addForestItem(forestData, item) end

--- Add and transform a forest item, by using an existing item as a template
---  @param forestData the ForestData C++ class from where to remove the item
---  @param itemData the stored data of an existing C++ ForestItem
---  @param transform the new transform (MatrixF)
---  @param scale the new scale (number)
---  @return the newly created forest item
---Source : lua/ge/extensions/editor/api/forest.lua:68
---@param forestData any
---@param itemData any
---@param transform any
---@param scale any
function editor_api_forest_editor.createForestItem(forestData, itemData, transform, scale) end

--- Remove a forest item
---  @param forestData the ForestData C++ class from where to remove the item
---  @param item the C++ ForestItem to be removed
---Source : lua/ge/extensions/editor/api/forest.lua:56
---@param forestData any
---@param item any
function editor_api_forest_editor.removeForestItem(forestData, item) end

--- Rotate forest items selection.
---  @param forestData the ForestData C++ class where the forest items are held
---  @param deltaEulerRotation eurler rotation to be added
---  @param centerPoint center point around where rotation will happen
---  @param originalTransforms the previous transforms of the forest items
---Source : lua/ge/extensions/editor/api/forest.lua:16
---@param forestData any
---@param deltaEulerRotation any
---@param centerPoint any
---@param originalTransforms any
function editor_api_forest_editor.rotateForestSelection(forestData, deltaEulerRotation, centerPoint, originalTransforms) end

--- Set the opaque per-instance custom data of a forest item
---  @param forestData the ForestData C++ class that contains the item
---  @param key the key of the item
---  @param customData the packed custom data value (-1 = none)
---  @return the forest item
---Source : lua/ge/extensions/editor/api/forest.lua:94
---@param forestData any
---@param key any
---@param customData any
function editor_api_forest_editor.setForestItemCustomData(forestData, key, customData) end

---Source : lua/ge/extensions/editor/api/forest.lua:100
---@param forestData any
---@param key any
---@param selected any
function editor_api_forest_editor.setForestItemSelected(forestData, key, selected) end

--- Update a forest item instance information
---  @param forestData the ForestData C++ class that contains the item
---  @param key the key of the item
---  @param keyPos the original position of the item
---  @param newData the stored data of the item
---  @param newTrans the new transform (MatrixF)
---  @param newScale the new scale (number)
---  @param newUid unique id
---  @return the forest item
---Source : lua/ge/extensions/editor/api/forest.lua:83
---@param forestData any
---@param key any
---@param keyPos any
---@param newData any
---@param newTrans any
---@param newScale any
---@param newUid any
function editor_api_forest_editor.updateForestItem(forestData, key, keyPos, newData, newTrans, newScale, newUid) end

