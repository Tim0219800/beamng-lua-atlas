---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteAssets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The "shelves" (on-disk library) that placed sites come from: buildings, open spaces, parking lots. Three editors bake their sites there and one placer reads them all; this module fixes once where they live and how their files are named. A site is a folder named after its slug, containing the manifest (<kind>.json: bounds, kit transforms, ground plan, lamps, plants), model.json (the editable document, to reopen the site in the editor that created it) and shell.dae (unique geometry, LODs and collision).
--- Access: extension `editor_toolUtilities_siteAssets`: `extensions.load("editor_toolUtilities_siteAssets")`, then the global `editor_toolUtilities_siteAssets`
---@class editor_toolUtilities_siteAssets
---@field kinds table[] List of shelves: { id, noun, label, icon, root, manifest, editor }.
---@field modelFile string File name of the editable document: 'model.json'.
---@field shellFile string File name of the unique geometry: 'shell.dae'.
editor_toolUtilities_siteAssets = {}

--- Ensures the shelf folder exists. The file dialog only LISTS the given path without creating it: without this call, the first bake on a fresh install would open the dialog on a nonexistent folder.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:64
---@param kind string|nil Shelf.
---@return string  Root path.
function editor_toolUtilities_siteAssets.ensureRoot(kind) end

--- Is the name already taken? This is what Save As asks before overwriting someone's work.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:108
---@param kind string|nil Shelf.
---@param slug string Slug.
---@return boolean  true if the folder exists.
function editor_toolUtilities_siteAssets.exists(kind, slug) end

--- Folder of a site: root + slug + '/'.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:56
---@param kind string|nil Shelf.
---@param slug string Site slug.
---@return string  Folder path.
function editor_toolUtilities_siteAssets.folderFor(kind, slug) end

--- Returns the shelf definition for an identifier (building by default).
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:40
---@param kind string|nil 'building', 'openSpace' or 'carPark'.
---@return table  Entry of kinds.
function editor_toolUtilities_siteAssets.kindOf(kind) end

--- Everything already on a shelf, sorted by name. Reads only the manifests (one small json read per site, no mesh). Each entry is the manifest augmented with dir (its folder) and kind (its shelf), which is enough for the placer to stand it up.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:126
---@param kind string|nil Shelf.
---@return table[]  Manifests (with slug), augmented with dir and kind.
function editor_toolUtilities_siteAssets.list(kind) end

--- Path of a site's manifest in its folder dir.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:58
---@param kind string|nil Shelf.
---@param dir string Site folder (with trailing slash).
---@return string  Manifest path.
function editor_toolUtilities_siteAssets.manifestPath(kind, dir) end

--- Path of model.json in dir.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:59
---@param dir string Site folder.
---@return string  Path.
function editor_toolUtilities_siteAssets.modelPath(dir) end

--- Registers an observer called each time a site is written to a shelf. Observers are never removed.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:95
---@param fn function fn(kind, slug).
function editor_toolUtilities_siteAssets.onWritten(fn) end

--- Creates the site folder if needed, empties it and returns it ready to write. Every bake starts here.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:80
---@param kind string|nil Shelf.
---@param slug string Site slug.
---@return string  Site folder.
function editor_toolUtilities_siteAssets.prepare(kind, slug) end

--- Removes a site from the shelf, folder included. A rename is a save under the new name followed by this call on the old one, which keeps the name stored in the manifest honest.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:114
---@param kind string|nil Shelf.
---@param slug string Slug.
---@return boolean  true if deleted, false if absent.
---@return string  Deleted folder, or 'not in the library'.
function editor_toolUtilities_siteAssets.remove(kind, slug) end

--- Root folder of a shelf (for example /assets/openSpaces/).
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:54
---@param kind string|nil Shelf.
---@return string  Root path with trailing slash.
function editor_toolUtilities_siteAssets.rootOf(kind) end

--- Path of shell.dae in dir.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:60
---@param dir string Site folder.
---@return string  Path.
function editor_toolUtilities_siteAssets.shellPath(dir) end

--- Folder name derived from the object's name: lowercase, everything that is not alphanumeric becomes an underscore, edge underscores removed. A new bake of a renamed but identical site therefore overwrites its own folder. An empty name gives the kind's common name.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:46
---@param kind string|nil Shelf.
---@param name string|nil Site name.
---@return string  Slug.
function editor_toolUtilities_siteAssets.slugify(kind, name) end

--- Empties a folder before rewriting, so that a smaller bake leaves nothing stale; also deletes the .cdae caches.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:72
---@param dir string Folder to empty.
function editor_toolUtilities_siteAssets.wipe(dir) end

--- Writes the manifest (compact), then notifies the observers registered by onWritten with (kind, manifest.slug).
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:101
---@param kind string|nil Shelf.
---@param dir string Site folder.
---@param manifest table Manifest with at least the slug field.
---@return boolean  false if the write failed, true otherwise.
function editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest) end

--- Writes the editable document next to its meshes: { version = 1, tool, state }. tool is the editor that wrote it, so that a folder opened by the wrong one reports it.
---Source: lua/ge/extensions/editor/toolUtilities/siteAssets.lua:90
---@param dir string Site folder.
---@param tool string Editor identifier.
---@param state table Serialized state of the document.
---@return boolean  true if the write succeeded.
function editor_toolUtilities_siteAssets.writeModel(dir, tool, state) end

---@type number
i = nil
