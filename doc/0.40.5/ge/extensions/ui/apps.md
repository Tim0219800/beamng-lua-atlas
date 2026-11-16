# `ui_apps`

*File: `lua/ge/extensions/ui/apps.lua` · VM: Game Engine (GE) · 252 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps`: `extensions.load("ui_apps")`, then the global `ui_apps`

Catalog of installed interface apps (Vue/JS). getUIAppsData walks /ui/modules/apps/ looking for app.json, app.vue and the app.<directive>.vue variants, and builds a table keyed by app name (translated types, previews, vue/js files, interactive/essential/photomode flags…). The module also watches /settings/ui_apps/ and notifies the interface when a layout changes.

## Notes

- An app.json without domElement or without directive is ignored with an error in the log.
- Apps without app.json but with an app.vue (or app.<variant>.vue) are added as "sourceOnly" apps (Embedded category, auxiliary, hidden from the app browser).
- The css position keys allowed in app.json are left, right, top, bottom, width, height and margin; the others are removed.
- An app whose simplemenu field does not match Engine.UI.isSimpleMenu() is excluded.
- A warning is logged if getUIAppsData takes more than 100 ms.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps.getUIAppsData()` | Builds and returns the catalog of available apps, keyed by appName. | 214 |
| `ui_apps.notifyLayoutsChanged()` | Sends the UI event 'UiAppLayoutsChanged' so that the interface rereads the layouts. | 222 |
| `ui_apps.onFilesChanged(files)` | Hook called when files change: if a file is under /settings/ui_apps/, schedules a layout refresh 0.2 s later. *(internal)* *(hook)* | 228 |
| `ui_apps.onUpdate()` | Frame hook: triggers notifyLayoutsChanged when the delay scheduled by onFilesChanged has elapsed. *(internal)* *(hook)* | 238 |

### Parameter details

#### `ui_apps.getUIAppsData()`

Builds and returns the catalog of available apps, keyed by appName.

- **returns**: table<string, table> Data of each app (appName, directive, types, typesTranslated, folder, vueFile, hasAppVue, hasAppJs, interactive, essential, isAuxiliary, photomode, official, previews…).

#### `ui_apps.onFilesChanged(files)`

Hook called when files change: if a file is under /settings/ui_apps/, schedules a layout refresh 0.2 s later.

- `files` (*table<integer, table>*) : List of entries with a filename field.

**UI events (guihooks.trigger):** `UiAppLayoutsChanged`

## Calls into the engine (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps.lua`.*
