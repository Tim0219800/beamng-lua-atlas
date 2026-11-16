# `ui_liveries_textures`

*File: `lua/ge/extensions/ui/liveries/textures.lua` · VM: Game Engine (GE) · 232 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries_textures`: `extensions.load("ui_liveries_textures")`, then the global `ui_liveries_textures`

Provides the livery UI with the catalog of dynamic decal textures, classified by tags (digit, gradient, letter, logo, noise, pattern, shape, textureFill, Team Offroad) plus an "others" category for untagged textures. The texture scan runs in a job (editor_api_dynamicDecals_textures.setupAsync) with a progress stream, and the results are sent to the UI via guihooks. Also stores the item chosen in the selector.

## Notes

- guihooks events emitted: liveries_textureSelectorDataLoaded (metadata, end of scan), liveries_textureCategoryData ({requestId, category, groups}), stream liveries_textureLoadProgress ({count, total, percent, inProgress}).
- percent is -1 while the total number of files is unknown (indeterminate progress).
- A texture with several tags appears in each of their groups (intended, according to the code comment).
- If the editor_api_dynamicDecals_textures API is missing, loadTextures returns "unavailable".

**Dependencies (loaded first):** `editor_api_dynamicDecals_textures`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries_textures.clearSelectedItem()` | Forgets the chosen item. | 227 |
| `ui_liveries_textures.getSelectedItem()` | Returns the item stored by setSelectorItem. | 223 |
| `ui_liveries_textures.getSelectorMetadata()` | Builds the selector metadata: default category "all", then sorted list of categories (known tags, "others" if untagged textures exist), "all" first. | 165 |
| `ui_liveries_textures.getTagLabel(tag)` | Returns the translation key (ui.liveries.edit.decalCategories.*) associated with a texture tag. | 98 |
| `ui_liveries_textures.loadTextures()` | Launches in a job (rate 1/30) the asynchronous texture scan if they are not already loaded, publishes the progress, then triggers liveries_textureSelectorDataLoaded with getSelectorMetadata(). | 139 |
| `ui_liveries_textures.requestSelectorCategory(category, requestId)` | Prepares the texture groups of a category ("all": all tags plus "others"; "others": untagged textures; or a specific tag) and sends them to the UI via the liveries_textureCategoryData event. Each item has name, label, value (file name) and preview (path). | 190 |
| `ui_liveries_textures.setSelectorItem(item)` | Stores the chosen catalog item, kept while navigating to the transform screen. | 219 |

### Parameter details

#### `ui_liveries_textures.getSelectedItem()`

Returns the item stored by setSelectorItem.

- **returns**: table|nil Chosen item or nil.

#### `ui_liveries_textures.getSelectorMetadata()`

Builds the selector metadata: default category "all", then sorted list of categories (known tags, "others" if untagged textures exist), "all" first.

- **returns**: table {defaultCategory = "all", categories = {{value, label}, ...}}.

#### `ui_liveries_textures.getTagLabel(tag)`

Returns the translation key (ui.liveries.edit.decalCategories.*) associated with a texture tag.

- `tag` (*string*) : Tag identifier, for example "logo".
- **returns**: string|nil Translation key, nil if the tag is unknown.

#### `ui_liveries_textures.loadTextures()`

Launches in a job (rate 1/30) the asynchronous texture scan if they are not already loaded, publishes the progress, then triggers liveries_textureSelectorDataLoaded with getSelectorMetadata().

- **returns**: string "startLoading", "alreadyLoading" (job running, progress is returned) or "unavailable" (API missing).

#### `ui_liveries_textures.requestSelectorCategory(category, requestId)`

Prepares the texture groups of a category ("all": all tags plus "others"; "others": untagged textures; or a specific tag) and sends them to the UI via the liveries_textureCategoryData event. Each item has name, label, value (file name) and preview (path).

- `category` (*string*) : Requested category; a non-string value is replaced by "all".
- `requestId` (*number*) : Identifier returned as is in the event (0 by default).

#### `ui_liveries_textures.setSelectorItem(item)`

Stores the chosen catalog item, kept while navigating to the transform screen.

- `item` (*table|nil*) : Chosen item.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: editor_api_dynamicDecals_textures. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries/textures.lua`.*
