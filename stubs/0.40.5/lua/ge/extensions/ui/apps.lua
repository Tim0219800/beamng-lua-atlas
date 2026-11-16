---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catalog of installed interface apps (Vue/JS). getUIAppsData walks /ui/modules/apps/ looking for app.json, app.vue and the app.<directive>.vue variants, and builds a table keyed by app name (translated types, previews, vue/js files, interactive/essential/photomode flags…). The module also watches /settings/ui_apps/ and notifies the interface when a layout changes.
--- Access: extension `ui_apps`: `extensions.load("ui_apps")`, then the global `ui_apps`
---@class ui_apps
ui_apps = {}

--- Builds and returns the catalog of available apps, keyed by appName.
---Source: lua/ge/extensions/ui/apps.lua:214
---@return table<string, table>  Data of each app (appName, directive, types, typesTranslated, folder, vueFile, hasAppVue, hasAppJs, interactive, essential, isAuxiliary, photomode, official, previews…).
function ui_apps.getUIAppsData() end

--- Sends the UI event 'UiAppLayoutsChanged' so that the interface rereads the layouts.
---Source: lua/ge/extensions/ui/apps.lua:222
function ui_apps.notifyLayoutsChanged() end

--- Hook called when files change: if a file is under /settings/ui_apps/, schedules a layout refresh 0.2 s later.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps.lua:228
---@param files table<integer, table> List of entries with a filename field.
function ui_apps.onFilesChanged(files) end

--- Frame hook: triggers notifyLayoutsChanged when the delay scheduled by onFilesChanged has elapsed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps.lua:238
function ui_apps.onUpdate() end

