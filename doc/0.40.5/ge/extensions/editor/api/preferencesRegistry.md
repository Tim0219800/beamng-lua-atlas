# `editor_api_preferencesRegistry`

*Fichier : `lua/ge/extensions/editor/api/preferencesRegistry.lua` · VM : Game Engine (GE) · 554 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/preferencesRegistry")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("editor_api_preferencesRegistry")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addNonPersistentItemPath(subCategoryPath)` |  | 128 |
| `C:broadcastPreferenceValueChanged()` | call the preference changed hooks and return true if we had any changed items | 288 |
| `C:callHookForSetValue()` |  | 412 |
| `C:clear()` |  | 69 |
| `C:findCategory(name)` |  | 189 |
| `C:findItem(itemPath)` |  | 201 |
| `C:findItemInSubCategory(subCateg, itemName)` |  | 217 |
| `C:findSubCategory(category, name)` |  | 195 |
| `C:get(itemPath)` | use this to get a preference item's value by path<br> you can also use also more directly: editor.getPreference("someCategory.someSubCategory.someItemName") | 301 |
| `C:getAsString(itemPath)` |  | 314 |
| `C:init()` |  | 77 |
| `C:itemValueFromString(item, itemVal)` |  | 11 |
| `C:itemValueToString(item, itemVal)` |  | 41 |
| `C:loadCategory(categoryName, filename)` |  | 424 |
| `C:loadPreferences(filename)` |  | 319 |
| `C:migratePreferences(deleteDeprecatedItems)` |  | 224 |
| `C:registerCategory(categName, categLabel)` |  | 81 |
| `C:registerPreferences(categName, subCategName, prefs)` |  | 136 |
| `C:registerSubCategory(categName, subCategName, subCategLabel, prefs)` |  | 99 |
| `C:removeNonPersistentItemPath(subCategoryPath)` |  | 132 |
| `C:resetItemToDefault(itemPath)` |  | 542 |
| `C:resetToDefaults(categoryName)` |  | 523 |
| `C:saveCategory(categoryName, filename)` | Save a single category from the preferences, it will save all the preferences in the category, regardless if default values or not<br> @param categoryName the category (along with all the subcategories) to be saved<br> @param filename the json filename to save to | 452 |
| `C:savePreferences(filename)` |  | 475 |
| `C:set(itemPath, value)` |  | 255 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorDeprecatedPreferencesItem`
- `onEditorPreferenceValueChanged` — écouté par 15 module(s)
- `onEditorPreferenceVersionChanged`

## Appels vers le moteur (C++)

- `ColorF.` `fromString`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/preferencesRegistry.lua`.*
