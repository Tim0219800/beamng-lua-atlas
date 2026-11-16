---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the livery UI with the catalog of dynamic decal textures, classified by tags (digit, gradient, letter, logo, noise, pattern, shape, textureFill, Team Offroad) plus an "others" category for untagged textures. The texture scan runs in a job (editor_api_dynamicDecals_textures.setupAsync) with a progress stream, and the results are sent to the UI via guihooks. Also stores the item chosen in the selector.
--- Access: extension `ui_liveries_textures`: `extensions.load("ui_liveries_textures")`, then the global `ui_liveries_textures`
---@class ui_liveries_textures
---@field dependencies table<integer, string> Extensions loaded before: editor_api_dynamicDecals_textures.
ui_liveries_textures = {}

--- Forgets the chosen item.
---Source: lua/ge/extensions/ui/liveries/textures.lua:227
function ui_liveries_textures.clearSelectedItem() end

--- Returns the item stored by setSelectorItem.
---Source: lua/ge/extensions/ui/liveries/textures.lua:223
---@return table|nil  Chosen item or nil.
function ui_liveries_textures.getSelectedItem() end

--- Builds the selector metadata: default category "all", then sorted list of categories (known tags, "others" if untagged textures exist), "all" first.
---Source: lua/ge/extensions/ui/liveries/textures.lua:165
---@return table  {defaultCategory = "all", categories = {{value, label}, ...}}.
function ui_liveries_textures.getSelectorMetadata() end

--- Returns the translation key (ui.liveries.edit.decalCategories.*) associated with a texture tag.
---Source: lua/ge/extensions/ui/liveries/textures.lua:98
---@param tag string Tag identifier, for example "logo".
---@return string|nil  Translation key, nil if the tag is unknown.
function ui_liveries_textures.getTagLabel(tag) end

--- Launches in a job (rate 1/30) the asynchronous texture scan if they are not already loaded, publishes the progress, then triggers liveries_textureSelectorDataLoaded with getSelectorMetadata().
---Source: lua/ge/extensions/ui/liveries/textures.lua:139
---@return string  "startLoading", "alreadyLoading" (job running, progress is returned) or "unavailable" (API missing).
function ui_liveries_textures.loadTextures() end

--- Prepares the texture groups of a category ("all": all tags plus "others"; "others": untagged textures; or a specific tag) and sends them to the UI via the liveries_textureCategoryData event. Each item has name, label, value (file name) and preview (path).
---Source: lua/ge/extensions/ui/liveries/textures.lua:190
---@param category string Requested category; a non-string value is replaced by "all".
---@param requestId number Identifier returned as is in the event (0 by default).
function ui_liveries_textures.requestSelectorCategory(category, requestId) end

--- Stores the chosen catalog item, kept while navigating to the transform screen.
---Source: lua/ge/extensions/ui/liveries/textures.lua:219
---@param item table|nil Chosen item.
function ui_liveries_textures.setSelectorItem(item) end

