---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/preferencesRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registry object. Fields: categories, nonPersistentItemPaths, preferences (current values per category), changedItems, dirty.
---@class editor_api_preferencesRegistry
local editor_api_preferencesRegistry = {}

--- Marks a path as non-persistent: it is not written to the preferences files.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:128
---@param subCategoryPath string full path of the item (despite the parameter name)
function editor_api_preferencesRegistry:addNonPersistentItemPath(subCategoryPath) end

--- Emits onEditorPreferenceValueChanged for each queued change then clears the queue.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:288
---@return boolean  true if there were changes
function editor_api_preferencesRegistry:broadcastPreferenceValueChanged() end

--- Emits onEditorPreferenceValueChanged for ALL registered items with their current value (useful after a load).
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:412
function editor_api_preferencesRegistry:callHookForSetValue() end

--- Clears categories, non-persistent paths, preferences and changed items, and resets dirty to false.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:69
function editor_api_preferencesRegistry:clear() end

--- Looks up a category by name.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:189
---@param name string name
---@return table|nil  category
function editor_api_preferencesRegistry:findCategory(name) end

--- Looks up an item by path "cat.subcat.item"; nil if fewer than 3 segments or not found.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:201
---@param itemPath string path
---@return table|nil  registry item
function editor_api_preferencesRegistry:findItem(itemPath) end

--- Looks up an item by name in a subcategory.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:217
---@param subCateg table|nil subcategory
---@param itemName string name
---@return table|nil  item
function editor_api_preferencesRegistry:findItemInSubCategory(subCateg, itemName) end

--- Looks up a subcategory by name in a category.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:195
---@param category table category
---@param name string name
---@return table|nil  subcategory
function editor_api_preferencesRegistry:findSubCategory(category, name) end

--- Returns the value of a preference by path (equivalent of editor.getPreference).
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:301
---@param itemPath string "cat.subcat.item"
---@return any  value, or nil if unknown
function editor_api_preferencesRegistry:get(itemPath) end

--- Returns the value of a preference serialized as text according to its type.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:314
---@param itemPath string path
---@return any  serialized value
function editor_api_preferencesRegistry:getAsString(itemPath) end

--- Calls clear(). Called by the constructor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:77
function editor_api_preferencesRegistry:init() end

--- Converts a text value (read from the file) into a Lua value according to item.type (number, bool, JSON table, vec3, Point2F, ColorF...).
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:11
---@param item table registry item (type field)
---@param itemVal string text value
---@return any  converted value (unchanged for unlisted types)
function editor_api_preferencesRegistry:itemValueFromString(item, itemVal) end

--- Converts a value to text for the file: tostring for numbers/bool, JSON for table (unchanged if already a string), tostring without commas for vectors/colors.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:41
---@param item table registry item
---@param itemVal any value
---@return any  serialized value
function editor_api_preferencesRegistry:itemValueToString(item, itemVal) end

--- Loads a single category from a file in saveCategory's format and applies its values; marks dirty.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:424
---@param categoryName string category
---@param filename string json file
function editor_api_preferencesRegistry:loadCategory(categoryName, filename) end

--- Reads the preferences file (default settings/editor/preferences.json), rejects a different format version, then fills each registered item with the file value or the default value. Handles old (non-table) values and calls onEditorPreferenceVersionChanged if an item's version changed. No change hook during loading.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:319
---@param filename string|nil json file
function editor_api_preferencesRegistry:loadPreferences(filename) end

--- Walks the loaded preferences and, for each item absent from the registry, emits onEditorDeprecatedPreferencesItem; deletes the item if deleteDeprecatedItems is true or if the hook returns true. Also fixes categories/subcategories that are not tables.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:224
---@param deleteDeprecatedItems boolean|nil true = delete all obsolete items
function editor_api_preferencesRegistry:migratePreferences(deleteDeprecatedItems) end

--- Creates (or finds) a top-level category. If it exists with a different label, warns and replaces the label.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:81
---@param categName string internal name
---@param categLabel string|nil displayed label (default sentenceCase of the name)
---@return table  the category {name, label, subcategories}
function editor_api_preferencesRegistry:registerCategory(categName, categLabel) end

--- Adds items to an existing subcategory. A name already present is refused with a logged error.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:136
---@param categName string category
---@param subCategName string subcategory
---@param prefs table list of one-pair tables {name = {type, default, description, label, min, max, hidden, advanced, customUiFunc, enumLabels, version}}
function editor_api_preferencesRegistry:registerPreferences(categName, subCategName, prefs) end

--- Creates (or finds) a subcategory in an already registered category and optionally registers preferences in it. Logs an error and returns nil if the category does not exist.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:99
---@param categName string parent category
---@param subCategName string internal name
---@param subCategLabel string|nil displayed label
---@param prefs table|nil list of {name = {type, default, ...}} (see notes)
---@return table|nil  the subcategory {name, label, items}
function editor_api_preferencesRegistry:registerSubCategory(categName, subCategName, subCategLabel, prefs) end

--- Removes a path from the non-persistent list.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:132
---@param subCategoryPath string item path
function editor_api_preferencesRegistry:removeNonPersistentItemPath(subCategoryPath) end

--- Resets an item to its default value.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:542
---@param itemPath string item path
---@return boolean  true
function editor_api_preferencesRegistry:resetItemToDefault(itemPath) end

--- Resets all the items of a category, or of all categories if categoryName is nil, to their default value.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:523
---@param categoryName string|nil category or nil for all
---@return boolean  false if the category does not exist
function editor_api_preferencesRegistry:resetToDefaults(categoryName) end

--- Saves all the preferences of a category (even those at the default value, excluding non-persistent paths) to a json file.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:452
---@param categoryName string category and its subcategories
---@param filename string target json file
function editor_api_preferencesRegistry:saveCategory(categoryName, filename) end

--- Writes the preferences to the file (default settings/editor/preferences.json) omitting values equal to the default and non-persistent paths; resets dirty to false. Keeps values of unloaded extensions.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:475
---@param filename string|nil json file
---@return boolean|nil  false if no preferences are loaded
function editor_api_preferencesRegistry:savePreferences(filename) end

--- Sets the value of a preference by path (clamped for a number), marks dirty and queues the change for the hook.
---Source: lua/ge/extensions/editor/api/preferencesRegistry.lua:255
---@param itemPath string "cat.subcat.item"
---@param value any new value
function editor_api_preferencesRegistry:set(itemPath, value) end

