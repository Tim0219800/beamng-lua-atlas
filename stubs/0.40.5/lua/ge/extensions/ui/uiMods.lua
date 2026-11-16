---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiMods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the interface (Vue) with the list of UI mods, UI apps and image lists, and watches file changes to notify the UI live (hot reload). It also tracks revisions of runtime files served to the UI for development. onFilesChanged triggers the events UiModsChanged, UiAppsChanged, UiImageListChanged and UiRuntimeFileChanged, and calls sendUIModules() again when /ui/modModules/ changes.
--- Access: extension `ui_uiMods`: `extensions.load("ui_uiMods")`, then the global `ui_uiMods`
---@class ui_uiMods
ui_uiMods = {}

--- Increments the revision of a path to force a manual reload. Returns 0 if the runtime service is not configured or if path is not a string.
---Source: lua/ge/extensions/ui/uiMods.lua:341
---@param path string File path.
---@return integer  New revision.
function ui_uiMods.bumpUiRuntimeRevision(path) end

--- Lists the images in a folder (recursive), sorted by name, associating the normal image and its _blur variant. The folder is added to the watch list.
---Source: lua/ge/extensions/ui/uiMods.lua:108
---@param path string Virtual game folder; '\' are normalized to '/'.
---@return {normal: string|nil, blur: string|nil}[]  Image entries; {} if the path is empty.
function ui_uiMods.getImageList(path) end

--- Returns, from extensions.ui_apps.getUIAppsData(), a filtered copy of the UI apps metadata (appName, directive, folder, appJsonPath, jsSource, vueFile, types, category, version, essential, devonly, official, preview = first preview, etc.). Empty table if ui_apps is unavailable.
---Source: lua/ge/extensions/ui/uiMods.lua:53
---@return table<string, table>  Apps by name.
function ui_uiMods.getUiApps() end

--- Lists the served runtime files (under the `includes` folders, of a tracked type, and not built into the bundle except styles).
---Source: lua/ge/extensions/ui/uiMods.lua:347
---@param withMtime boolean|nil If true, adds `mtime` to each entry (and stores the mtimes).
---@return {path: string, mtime: number|nil}[]  Served files; {} if not configured.
function ui_uiMods.getUiRuntimeFileList(withMtime) end

--- Returns the path -> revision number table of runtime files (direct reference, not a copy).
---Source: lua/ge/extensions/ui/uiMods.lua:336
---@return table<string, integer>  Revisions.
function ui_uiMods.getUiRuntimeRevisions() end

--- Walks /ui/ui-vue/mods and groups files by mod (first folder under mods/).
---Source: lua/ge/extensions/ui/uiMods.lua:31
---@return table<string, {path: string, files: string[]}>  By mod name: folder and relative file paths.
function ui_uiMods.getVueMods() end

--- Hook called when the extension loads: sets the unload mode to "manual".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiMods.lua:7
function ui_uiMods.onExtensionLoaded() end

--- Hook called by the engine when files change. For each file: calls sendUIModules() for /ui/modModules/, triggers UiModsChanged for /ui/ui-vue/mods/, UiAppsChanged (with the affected files and apps) for /ui/modules/apps/, UiImageListChanged for watched image folders, and UiRuntimeFileChanged {path, rev, change} for served runtime files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiMods.lua:274
---@param files table[] List of {filename, type} objects (type "deleted" for a deletion).
function ui_uiMods.onFilesChanged(files) end

--- Configures the UI runtime file service: included folders, excluded folders, tracked extensions (statExts) and style extensions (styleExts). Ignored if cfg is not a table or if cfg.includes is empty.
---Source: lua/ge/extensions/ui/uiMods.lua:208
---@param cfg table { includes = string[], excludes = string[]|nil, statExts = string[]|nil, styleExts = string[]|nil }
function ui_uiMods.setUiRuntimeBundled(cfg) end

