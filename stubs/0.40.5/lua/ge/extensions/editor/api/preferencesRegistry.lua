---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/preferencesRegistry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/api/preferencesRegistry.lua (instanciée par la fonction renvoyée par le module)
---@class editor_api_preferencesRegistry
local editor_api_preferencesRegistry = {}

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:128
---@param subCategoryPath any
function editor_api_preferencesRegistry:addNonPersistentItemPath(subCategoryPath) end

--- call the preference changed hooks and return true if we had any changed items
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:288
function editor_api_preferencesRegistry:broadcastPreferenceValueChanged() end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:412
function editor_api_preferencesRegistry:callHookForSetValue() end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:69
function editor_api_preferencesRegistry:clear() end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:189
---@param name any
function editor_api_preferencesRegistry:findCategory(name) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:201
---@param itemPath any
function editor_api_preferencesRegistry:findItem(itemPath) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:217
---@param subCateg any
---@param itemName any
function editor_api_preferencesRegistry:findItemInSubCategory(subCateg, itemName) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:195
---@param category any
---@param name any
function editor_api_preferencesRegistry:findSubCategory(category, name) end

--- use this to get a preference item's value by path
---  you can also use also more directly: editor.getPreference("someCategory.someSubCategory.someItemName")
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:301
---@param itemPath any
function editor_api_preferencesRegistry:get(itemPath) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:314
---@param itemPath any
function editor_api_preferencesRegistry:getAsString(itemPath) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:77
function editor_api_preferencesRegistry:init() end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:11
---@param item any
---@param itemVal any
function editor_api_preferencesRegistry:itemValueFromString(item, itemVal) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:41
---@param item any
---@param itemVal any
function editor_api_preferencesRegistry:itemValueToString(item, itemVal) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:424
---@param categoryName any
---@param filename any
function editor_api_preferencesRegistry:loadCategory(categoryName, filename) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:319
---@param filename any
function editor_api_preferencesRegistry:loadPreferences(filename) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:224
---@param deleteDeprecatedItems any
function editor_api_preferencesRegistry:migratePreferences(deleteDeprecatedItems) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:81
---@param categName any
---@param categLabel any
function editor_api_preferencesRegistry:registerCategory(categName, categLabel) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:136
---@param categName any
---@param subCategName any
---@param prefs any
function editor_api_preferencesRegistry:registerPreferences(categName, subCategName, prefs) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:99
---@param categName any
---@param subCategName any
---@param subCategLabel any
---@param prefs any
function editor_api_preferencesRegistry:registerSubCategory(categName, subCategName, subCategLabel, prefs) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:132
---@param subCategoryPath any
function editor_api_preferencesRegistry:removeNonPersistentItemPath(subCategoryPath) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:542
---@param itemPath any
function editor_api_preferencesRegistry:resetItemToDefault(itemPath) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:523
---@param categoryName any
function editor_api_preferencesRegistry:resetToDefaults(categoryName) end

--- Save a single category from the preferences, it will save all the preferences in the category, regardless if default values or not
---  @param categoryName the category (along with all the subcategories) to be saved
---  @param filename the json filename to save to
---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:452
---@param categoryName any
---@param filename any
function editor_api_preferencesRegistry:saveCategory(categoryName, filename) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:475
---@param filename any
function editor_api_preferencesRegistry:savePreferences(filename) end

---Source : lua/ge/extensions/editor/api/preferencesRegistry.lua:255
---@param itemPath any
---@param value any
function editor_api_preferencesRegistry:set(itemPath, value) end

