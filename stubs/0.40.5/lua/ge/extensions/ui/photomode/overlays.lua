---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/overlays.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Management of photo mode "overlays": image overlays (frames, watermarks, UI apps) described by a folder containing overlay.json, an optional overlay.png thumbnail and images. The module discovers overlays under /ui/ui-vue/src/modules/pause/views/photomode/overlays, caches them, lets you create, clone, rename, save and delete them (only those in the user folder) and broadcasts the UI event PhotomodeOverlaysChanged on each change. It also provides the list of UI apps and livery textures usable as layers.
--- Access: extension `ui_photomode_overlays`: `extensions.load("ui_photomode_overlays")`, then the global `ui_photomode_overlays`
---@class ui_photomode_overlays
ui_photomode_overlays = {}

--- Copies an overlay (overlay.json, thumbnail and images) to a new folder. Also works for non-editable overlays.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:288
---@param sourceId string Identifier of the overlay to copy
---@param destId string Identifier of the copy (valid and not existing)
---@return table  {ok = true, id = destId} or {ok = false, reason = ...}
function ui_photomode_overlays.cloneOverlay(sourceId, destId) end

--- Creates a new overlay folder with an overlay.json (version 1, name = destId, empty author, empty layers by default, overridden by the payload's version, name, author and layers).
---Source: lua/ge/extensions/ui/photomode/overlays.lua:251
---@param destId string Identifier of the new overlay (must be valid and not exist)
---@param payload table|nil Optional initial values
---@return table  {ok = true, id = destId} or {ok = false, reason = ...}
function ui_photomode_overlays.createOverlay(destId, payload) end

--- Deletes an editable overlay's folder (overlay.json, thumbnail, images) then invalidates the cache and broadcasts PhotomodeOverlaysChanged.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:494
---@param id string Overlay identifier
---@return table  {ok = true} or {ok = false, reason = ...}
function ui_photomode_overlays.deleteOverlay(id) end

--- Forces a new discovery of the overlays (recursive search for overlay.json), replaces the cache and returns the list sorted by name. Each entry contains the overlay.json fields plus id, images, editable, folderPath, hasThumbnail, ts.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:206
---@return table[]  List of overlays
function ui_photomode_overlays.discover() end

--- Returns the cached overlays, starting discovery if the cache is empty.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:211
---@return table[]  List of overlays
function ui_photomode_overlays.getOverlays() end

--- Scans /art/dynamicDecals/textures (png, jpg, jpeg) and groups the images by tags read from the companion file <image>.dynDecalTexture.json. Images without a tag go into the "others" category. Categories and images are sorted case-insensitively.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:443
---@return table[]  Categories {value, label, items = {{name, label, path}}}
function ui_photomode_overlays.listLiveryGraphics() end

--- Lists the UI apps available as layers via ui_apps.getUIAppsData(): appName, displayName, description, category, first preview, photomode (boolean) and css (left, top, width, height as strings, default values 0px, 0px, 320px, 48px). Photo mode compatible apps come first, then sorted by name. Returns an empty list if ui_apps is unavailable.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:401
---@return table[]  Sorted apps
function ui_photomode_overlays.listUiApps() end

--- Hook called when the extension is loaded: empties the cache and re-arms the initial discovery.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/overlays.lua:536
function ui_photomode_overlays.onExtensionLoaded() end

--- Hook called on unload: empties the cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/overlays.lua:541
function ui_photomode_overlays.onExtensionUnloaded() end

--- Hook called by the engine when files change. If one of the paths is under the overlays folder, invalidates the cache and broadcasts PhotomodeOverlaysChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/overlays.lua:525
---@param files table List of items {filename = ...}
function ui_photomode_overlays.onFilesChanged(files) end

--- Hook called when the UI is ready: runs the overlay discovery once to prefill the cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/photomode/overlays.lua:545
function ui_photomode_overlays.onUiReady() end

--- Renames an editable overlay: changes its display name and/or its identifier (hence its folder). With a new identifier, copies the files, updates name in the new overlay.json and deletes the old folder.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:316
---@param sourceId string Current identifier
---@param destId string New identifier (may be identical to sourceId)
---@param newName string|nil New display name; ignored if empty, the old name is then kept
---@return table  {ok = true, id = ...} or {ok = false, reason = ...}
function ui_photomode_overlays.renameOverlay(sourceId, destId, newName) end

--- Writes the payload into the overlay.json of an existing, editable overlay, then invalidates the cache and broadcasts PhotomodeOverlaysChanged.
---Source: lua/ge/extensions/ui/photomode/overlays.lua:215
---@param id string Identifier (folder name) of the overlay
---@param payload table New content of overlay.json (version, name, author, layers...)
---@return table  {ok = true} or {ok = false, reason = ...}
function ui_photomode_overlays.saveOverlay(id, payload) end

