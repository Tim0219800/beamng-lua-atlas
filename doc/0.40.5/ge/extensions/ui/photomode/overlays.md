# `ui_photomode_overlays`

*File: `lua/ge/extensions/ui/photomode/overlays.lua` · VM: Game Engine (GE) · 553 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_photomode_overlays`: `extensions.load("ui_photomode_overlays")`, then the global `ui_photomode_overlays`

Management of photo mode "overlays": image overlays (frames, watermarks, UI apps) described by a folder containing overlay.json, an optional overlay.png thumbnail and images. The module discovers overlays under /ui/ui-vue/src/modules/pause/views/photomode/overlays, caches them, lets you create, clone, rename, save and delete them (only those in the user folder) and broadcasts the UI event PhotomodeOverlaysChanged on each change. It also provides the list of UI apps and livery textures usable as layers.

## Example

```lua
local res = ui_photomode_overlays.createOverlay("my_frame", {name = "My frame", author = "me", layers = {}})
if not res.ok then log('W', 'x', res.reason) end
```

## Notes

- The write functions always return a table {ok = boolean, reason = string, id = string}. Possible reasons: invalid_id, invalid_payload, invalid_source_id, invalid_dest_id, dest_id_exists, not_found, source_not_found, not_editable, write_failed, copy_overlay_json_failed, copy_asset_failed:<image>, clone_failed, rename_failed.
- A valid overlay identifier contains only letters, digits, hyphen and underscore (^[%w%-_]+$): it becomes the folder name.
- An overlay is editable (editable = true) only if it does not come from an archive (zip) and its real path is in the user folder; overlays provided by the game are therefore neither editable nor deletable, but can be cloned.
- overlay.json must contain a numeric version and a non-empty name, otherwise the overlay is ignored with a warning; layers becomes {} if absent. name is passed to _tr when read.
- The cache is invalidated by onFilesChanged as soon as a file under the overlays folder changes. Each entry carries a ts field (cache timestamp) and hasThumbnail added on read.
- saveOverlay removes id, images, editable and folderPath from the payload before writing, but not hasThumbnail or ts: if the UI sends back a full entry, these two fields are written into overlay.json (renameOverlay, for its part, removes them).
- renameOverlay with a new identifier copies the folder, rewrites overlay.json then deletes the old folder; if the identifier is unchanged, only the name is rewritten.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_photomode_overlays.cloneOverlay(sourceId, destId)` | Copies an overlay (overlay.json, thumbnail and images) to a new folder. Also works for non-editable overlays. | 288 |
| `ui_photomode_overlays.createOverlay(destId, payload)` | Creates a new overlay folder with an overlay.json (version 1, name = destId, empty author, empty layers by default, overridden by the payload's version, name, author and layers). | 251 |
| `ui_photomode_overlays.deleteOverlay(id)` | Deletes an editable overlay's folder (overlay.json, thumbnail, images) then invalidates the cache and broadcasts PhotomodeOverlaysChanged. | 494 |
| `ui_photomode_overlays.discover()` | Forces a new discovery of the overlays (recursive search for overlay.json), replaces the cache and returns the list sorted by name. Each entry contains the overlay.json fields plus id, images, editable, folderPath, hasThumbnail, ts. | 206 |
| `ui_photomode_overlays.getOverlays()` | Returns the cached overlays, starting discovery if the cache is empty. | 211 |
| `ui_photomode_overlays.listLiveryGraphics()` | Scans /art/dynamicDecals/textures (png, jpg, jpeg) and groups the images by tags read from the companion file <image>.dynDecalTexture.json. Images without a tag go into the "others" category. Categories and images are sorted case-insensitively. | 443 |
| `ui_photomode_overlays.listUiApps()` | Lists the UI apps available as layers via ui_apps.getUIAppsData(): appName, displayName, description, category, first preview, photomode (boolean) and css (left, top, width, height as strings, default values 0px, 0px, 320px, 48px). Photo mode compatible apps come first, then sorted by name. Returns an empty list if ui_apps is unavailable. | 401 |
| `ui_photomode_overlays.onExtensionLoaded()` | Hook called when the extension is loaded: empties the cache and re-arms the initial discovery. *(internal)* *(hook)* | 536 |
| `ui_photomode_overlays.onExtensionUnloaded()` | Hook called on unload: empties the cache. *(internal)* *(hook)* | 541 |
| `ui_photomode_overlays.onFilesChanged(files)` | Hook called by the engine when files change. If one of the paths is under the overlays folder, invalidates the cache and broadcasts PhotomodeOverlaysChanged. *(internal)* *(hook)* | 525 |
| `ui_photomode_overlays.onUiReady()` | Hook called when the UI is ready: runs the overlay discovery once to prefill the cache. *(internal)* *(hook)* | 545 |
| `ui_photomode_overlays.renameOverlay(sourceId, destId, newName)` | Renames an editable overlay: changes its display name and/or its identifier (hence its folder). With a new identifier, copies the files, updates name in the new overlay.json and deletes the old folder. | 316 |
| `ui_photomode_overlays.saveOverlay(id, payload)` | Writes the payload into the overlay.json of an existing, editable overlay, then invalidates the cache and broadcasts PhotomodeOverlaysChanged. | 215 |

### Parameter details

#### `ui_photomode_overlays.cloneOverlay(sourceId, destId)`

Copies an overlay (overlay.json, thumbnail and images) to a new folder. Also works for non-editable overlays.

- `sourceId` (*string*) : Identifier of the overlay to copy
- `destId` (*string*) : Identifier of the copy (valid and not existing)
- **returns**: table {ok = true, id = destId} or {ok = false, reason = ...}

#### `ui_photomode_overlays.createOverlay(destId, payload)`

Creates a new overlay folder with an overlay.json (version 1, name = destId, empty author, empty layers by default, overridden by the payload's version, name, author and layers).

- `destId` (*string*) : Identifier of the new overlay (must be valid and not exist)
- `payload` (*table|nil*) : Optional initial values
- **returns**: table {ok = true, id = destId} or {ok = false, reason = ...}

#### `ui_photomode_overlays.deleteOverlay(id)`

Deletes an editable overlay's folder (overlay.json, thumbnail, images) then invalidates the cache and broadcasts PhotomodeOverlaysChanged.

- `id` (*string*) : Overlay identifier
- **returns**: table {ok = true} or {ok = false, reason = ...}

#### `ui_photomode_overlays.discover()`

Forces a new discovery of the overlays (recursive search for overlay.json), replaces the cache and returns the list sorted by name. Each entry contains the overlay.json fields plus id, images, editable, folderPath, hasThumbnail, ts.

- **returns**: table[] List of overlays

#### `ui_photomode_overlays.getOverlays()`

Returns the cached overlays, starting discovery if the cache is empty.

- **returns**: table[] List of overlays

#### `ui_photomode_overlays.listLiveryGraphics()`

Scans /art/dynamicDecals/textures (png, jpg, jpeg) and groups the images by tags read from the companion file <image>.dynDecalTexture.json. Images without a tag go into the "others" category. Categories and images are sorted case-insensitively.

- **returns**: table[] Categories {value, label, items = {{name, label, path}}}

#### `ui_photomode_overlays.listUiApps()`

Lists the UI apps available as layers via ui_apps.getUIAppsData(): appName, displayName, description, category, first preview, photomode (boolean) and css (left, top, width, height as strings, default values 0px, 0px, 320px, 48px). Photo mode compatible apps come first, then sorted by name. Returns an empty list if ui_apps is unavailable.

- **returns**: table[] Sorted apps

#### `ui_photomode_overlays.onFilesChanged(files)`

Hook called by the engine when files change. If one of the paths is under the overlays folder, invalidates the cache and broadcasts PhotomodeOverlaysChanged.

- `files` (*table*) : List of items {filename = ...}

#### `ui_photomode_overlays.renameOverlay(sourceId, destId, newName)`

Renames an editable overlay: changes its display name and/or its identifier (hence its folder). With a new identifier, copies the files, updates name in the new overlay.json and deletes the old folder.

- `sourceId` (*string*) : Current identifier
- `destId` (*string*) : New identifier (may be identical to sourceId)
- `newName` (*string|nil*) : New display name; ignored if empty, the old name is then kept
- **returns**: table {ok = true, id = ...} or {ok = false, reason = ...}

#### `ui_photomode_overlays.saveOverlay(id, payload)`

Writes the payload into the overlay.json of an existing, editable overlay, then invalidates the cache and broadcasts PhotomodeOverlaysChanged.

- `id` (*string*) : Identifier (folder name) of the overlay
- `payload` (*table*) : New content of overlay.json (version, name, author, layers...)
- **returns**: table {ok = true} or {ok = false, reason = ...}

**UI events (guihooks.trigger):** `PhotomodeOverlaysChanged`

## Calls into the engine (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryRemove`, `fileExists`, `findFiles`, `getFileRealPath`, `getOriginArchivePathRelative`, `getUserPath`, `removeFile`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/photomode/overlays.lua`.*
