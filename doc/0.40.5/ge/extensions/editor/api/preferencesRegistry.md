# `editor_api_preferencesRegistry`

*File: `lua/ge/extensions/editor/api/preferencesRegistry.lua` · VM: Game Engine (GE) · 554 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/preferencesRegistry")` (file under extensions/ but not a regular extension)

Editor preferences registry: organizes preferences as category > subcategory > item (path "category.subcategory.item"), with type, default value, description, label, bounds, hidden/advanced flags, custom UI function, enum labels and version. Handles loading/saving in `settings/editor/preferences.json` (format version 2, only values differing from the default are written) and emission of the `onEditorPreferenceValueChanged` hook. Editor extensions declare their settings there; it is also accessed via `editor.getPreference(path)`. The module returns a constructor with no arguments.

## Example

```lua
local reg = require("editor/api/preferencesRegistry")()
reg:registerCategory("myTool", "My Tool")
reg:registerSubCategory("myTool", "general", "General", {
  {speed = {"float", 1.0, "Speed", nil, 0, 10}},
})
reg:loadPreferences()
local v = reg:get("myTool.general.speed")
```

## Notes

- Format of an item in registerPreferences (positional table): [1] type, [2] defaultValue, [3] description, [4] label (otherwise sentenceCase of the name), [5] minValue, [6] maxValue, [7] hidden, [8] advanced, [9] customUiFunc, [10] enumLabels (list of strings, generated enum {name, value=index}), [11] version (default 0). Each element of `prefs` is a table with ONE single {name = infos} pair to keep the order.
- Types handled for string (de)serialization: float, int, double, char, bool, table (JSON), Point3F/vec3, Point2F, Point2I, Point4F, ColorI, ColorF, RectF. Vectors are written without commas.
- `set` clamps numbers between minValue and maxValue and marks `dirty`; an unregistered path is logged once then ignored. `get` crashes if `loadPreferences` has not been called yet (self.preferences nil).
- Changes are accumulated in `changedItems` and broadcast by `broadcastPreferenceValueChanged` (to be called from the editor loop), not immediately.
- If the file has a format version other than 2, it is ignored (default values) and overwritten at the next save.
- Emitted hooks: onEditorPreferenceValueChanged(itemPath, value), onEditorPreferenceVersionChanged(itemPath, fileValue, item), onEditorDeprecatedPreferencesItem(itemPath, value) (returning true deletes the item).
- `getAsString` and `resetItemToDefault` crash if the path is not registered (item nil).
- `loadCategory` crashes if the file contains an unregistered item (findItem returns nil then itemValueFromString(nil, ...)).

## Class `C`

Registry object. Fields: categories, nonPersistentItemPaths, preferences (current values per category), changedItems, dirty.

The module returns a constructor: `local obj = require("editor_api_preferencesRegistry")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:addNonPersistentItemPath(subCategoryPath)` | Marks a path as non-persistent: it is not written to the preferences files. | 128 |
| `C:broadcastPreferenceValueChanged()` | Emits onEditorPreferenceValueChanged for each queued change then clears the queue. | 288 |
| `C:callHookForSetValue()` | Emits onEditorPreferenceValueChanged for ALL registered items with their current value (useful after a load). | 412 |
| `C:clear()` | Clears categories, non-persistent paths, preferences and changed items, and resets dirty to false. | 69 |
| `C:findCategory(name)` | Looks up a category by name. | 189 |
| `C:findItem(itemPath)` | Looks up an item by path "cat.subcat.item"; nil if fewer than 3 segments or not found. | 201 |
| `C:findItemInSubCategory(subCateg, itemName)` | Looks up an item by name in a subcategory. | 217 |
| `C:findSubCategory(category, name)` | Looks up a subcategory by name in a category. | 195 |
| `C:get(itemPath)` | Returns the value of a preference by path (equivalent of editor.getPreference). | 301 |
| `C:getAsString(itemPath)` | Returns the value of a preference serialized as text according to its type. | 314 |
| `C:init()` | Calls clear(). Called by the constructor. | 77 |
| `C:itemValueFromString(item, itemVal)` | Converts a text value (read from the file) into a Lua value according to item.type (number, bool, JSON table, vec3, Point2F, ColorF...). | 11 |
| `C:itemValueToString(item, itemVal)` | Converts a value to text for the file: tostring for numbers/bool, JSON for table (unchanged if already a string), tostring without commas for vectors/colors. | 41 |
| `C:loadCategory(categoryName, filename)` | Loads a single category from a file in saveCategory's format and applies its values; marks dirty. | 424 |
| `C:loadPreferences(filename)` | Reads the preferences file (default settings/editor/preferences.json), rejects a different format version, then fills each registered item with the file value or the default value. Handles old (non-table) values and calls onEditorPreferenceVersionChanged if an item's version changed. No change hook during loading. | 319 |
| `C:migratePreferences(deleteDeprecatedItems)` | Walks the loaded preferences and, for each item absent from the registry, emits onEditorDeprecatedPreferencesItem; deletes the item if deleteDeprecatedItems is true or if the hook returns true. Also fixes categories/subcategories that are not tables. | 224 |
| `C:registerCategory(categName, categLabel)` | Creates (or finds) a top-level category. If it exists with a different label, warns and replaces the label. | 81 |
| `C:registerPreferences(categName, subCategName, prefs)` | Adds items to an existing subcategory. A name already present is refused with a logged error. | 136 |
| `C:registerSubCategory(categName, subCategName, subCategLabel, prefs)` | Creates (or finds) a subcategory in an already registered category and optionally registers preferences in it. Logs an error and returns nil if the category does not exist. | 99 |
| `C:removeNonPersistentItemPath(subCategoryPath)` | Removes a path from the non-persistent list. | 132 |
| `C:resetItemToDefault(itemPath)` | Resets an item to its default value. | 542 |
| `C:resetToDefaults(categoryName)` | Resets all the items of a category, or of all categories if categoryName is nil, to their default value. | 523 |
| `C:saveCategory(categoryName, filename)` | Saves all the preferences of a category (even those at the default value, excluding non-persistent paths) to a json file. | 452 |
| `C:savePreferences(filename)` | Writes the preferences to the file (default settings/editor/preferences.json) omitting values equal to the default and non-persistent paths; resets dirty to false. Keeps values of unloaded extensions. | 475 |
| `C:set(itemPath, value)` | Sets the value of a preference by path (clamped for a number), marks dirty and queues the change for the hook. | 255 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorDeprecatedPreferencesItem`
- `onEditorPreferenceValueChanged` — listened to by 15 module(s)
- `onEditorPreferenceVersionChanged`

## Calls into the engine (C++)

- `ColorF.` `fromString`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/preferencesRegistry.lua`.*
