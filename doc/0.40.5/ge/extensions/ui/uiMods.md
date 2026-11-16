# `ui_uiMods`

*File: `lua/ge/extensions/ui/uiMods.lua` · VM: Game Engine (GE) · 381 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_uiMods`: `extensions.load("ui_uiMods")`, then the global `ui_uiMods`

Provides the interface (Vue) with the list of UI mods, UI apps and image lists, and watches file changes to notify the UI live (hot reload). It also tracks revisions of runtime files served to the UI for development. onFilesChanged triggers the events UiModsChanged, UiAppsChanged, UiImageListChanged and UiRuntimeFileChanged, and calls sendUIModules() again when /ui/modModules/ changes.

## Notes

- The extension stays loaded (setExtensionUnloadMode "manual" in onExtensionLoaded).
- getImageList registers the folder as watched: later changes there trigger UiImageListChanged. `name_blur.ext` images are attached to `name` in the `blur` field.
- Recognized image extensions: jpg, jpeg, jfif, png, gif, webp, avif.
- The "runtime" functions do nothing until setUiRuntimeBundled has been called with a valid config (non-empty `includes`).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_uiMods.bumpUiRuntimeRevision(path)` | Increments the revision of a path to force a manual reload. Returns 0 if the runtime service is not configured or if path is not a string. | 341 |
| `ui_uiMods.getImageList(path)` | Lists the images in a folder (recursive), sorted by name, associating the normal image and its _blur variant. The folder is added to the watch list. | 108 |
| `ui_uiMods.getUiApps()` | Returns, from extensions.ui_apps.getUIAppsData(), a filtered copy of the UI apps metadata (appName, directive, folder, appJsonPath, jsSource, vueFile, types, category, version, essential, devonly, official, preview = first preview, etc.). Empty table if ui_apps is unavailable. | 53 |
| `ui_uiMods.getUiRuntimeFileList(withMtime)` | Lists the served runtime files (under the `includes` folders, of a tracked type, and not built into the bundle except styles). | 347 |
| `ui_uiMods.getUiRuntimeRevisions()` | Returns the path -> revision number table of runtime files (direct reference, not a copy). | 336 |
| `ui_uiMods.getVueMods()` | Walks /ui/ui-vue/mods and groups files by mod (first folder under mods/). | 31 |
| `ui_uiMods.onExtensionLoaded()` | Hook called when the extension loads: sets the unload mode to "manual". *(internal)* *(hook)* | 7 |
| `ui_uiMods.onFilesChanged(files)` | Hook called by the engine when files change. For each file: calls sendUIModules() for /ui/modModules/, triggers UiModsChanged for /ui/ui-vue/mods/, UiAppsChanged (with the affected files and apps) for /ui/modules/apps/, UiImageListChanged for watched image folders, and UiRuntimeFileChanged {path, rev, change} for served runtime files. *(internal)* *(hook)* | 274 |
| `ui_uiMods.setUiRuntimeBundled(cfg)` | Configures the UI runtime file service: included folders, excluded folders, tracked extensions (statExts) and style extensions (styleExts). Ignored if cfg is not a table or if cfg.includes is empty. | 208 |

### Parameter details

#### `ui_uiMods.bumpUiRuntimeRevision(path)`

Increments the revision of a path to force a manual reload. Returns 0 if the runtime service is not configured or if path is not a string.

- `path` (*string*) : File path.
- **returns**: integer New revision.

#### `ui_uiMods.getImageList(path)`

Lists the images in a folder (recursive), sorted by name, associating the normal image and its _blur variant. The folder is added to the watch list.

- `path` (*string*) : Virtual game folder; '\' are normalized to '/'.
- **returns**: {normal: string|nil, blur: string|nil}[] Image entries; {} if the path is empty.

#### `ui_uiMods.getUiApps()`

Returns, from extensions.ui_apps.getUIAppsData(), a filtered copy of the UI apps metadata (appName, directive, folder, appJsonPath, jsSource, vueFile, types, category, version, essential, devonly, official, preview = first preview, etc.). Empty table if ui_apps is unavailable.

- **returns**: table<string, table> Apps by name.

#### `ui_uiMods.getUiRuntimeFileList(withMtime)`

Lists the served runtime files (under the `includes` folders, of a tracked type, and not built into the bundle except styles).

- `withMtime` (*boolean|nil*) : If true, adds `mtime` to each entry (and stores the mtimes).
- **returns**: {path: string, mtime: number|nil}[] Served files; {} if not configured.

#### `ui_uiMods.getUiRuntimeRevisions()`

Returns the path -> revision number table of runtime files (direct reference, not a copy).

- **returns**: table<string, integer> Revisions.

#### `ui_uiMods.getVueMods()`

Walks /ui/ui-vue/mods and groups files by mod (first folder under mods/).

- **returns**: table<string, {path: string, files: string[]}> By mod name: folder and relative file paths.

#### `ui_uiMods.onFilesChanged(files)`

Hook called by the engine when files change. For each file: calls sendUIModules() for /ui/modModules/, triggers UiModsChanged for /ui/ui-vue/mods/, UiAppsChanged (with the affected files and apps) for /ui/modules/apps/, UiImageListChanged for watched image folders, and UiRuntimeFileChanged {path, rev, change} for served runtime files.

- `files` (*table[]*) : List of {filename, type} objects (type "deleted" for a deletion).

#### `ui_uiMods.setUiRuntimeBundled(cfg)`

Configures the UI runtime file service: included folders, excluded folders, tracked extensions (statExts) and style extensions (styleExts). Ignored if cfg is not a table or if cfg.includes is empty.

- `cfg` (*table*) : { includes = string[], excludes = string[]|nil, statExts = string[]|nil, styleExts = string[]|nil }

**UI events (guihooks.trigger):** `UiAppsChanged`, `UiImageListChanged`, `UiModsChanged`, `UiRuntimeFileChanged`

## Calls into the engine (C++)

- `FS:` `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/uiMods.lua`.*
