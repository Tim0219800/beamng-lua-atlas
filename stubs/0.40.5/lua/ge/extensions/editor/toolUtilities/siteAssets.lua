---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteAssets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteAssets` : `extensions.load("editor_toolUtilities_siteAssets")`, puis la globale `editor_toolUtilities_siteAssets`
---@class editor_toolUtilities_siteAssets
---@field kinds table
---@field modelFile string
---@field shellFile string
editor_toolUtilities_siteAssets = {}

--- Make sure the shelf's folder is really there. The file dialog only LISTS the path it is given - it will not create one -
--- so without this the first bake on a fresh install opens the dialog on a folder that does not exist, showing nothing.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:64
---@param kind any
function editor_toolUtilities_siteAssets.ensureRoot(kind) end

--- Is this name already taken? What Save As asks before it writes over somebody else's work.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:108
---@param kind any
---@param slug any
function editor_toolUtilities_siteAssets.exists(kind, slug) end

---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:56
---@param kind any
---@param slug any
function editor_toolUtilities_siteAssets.folderFor(kind, slug) end

---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:40
---@param kind any
function editor_toolUtilities_siteAssets.kindOf(kind) end

--- Everything already on one shelf. Reads only the manifests, so listing a folder of fifty costs fifty small json reads and
--- not one mesh. Each comes back knowing its own folder and its own kind, which is all the placer needs to stand it up.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:126
---@param kind any
function editor_toolUtilities_siteAssets.list(kind) end

---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:58
---@param kind any
---@param dir any
function editor_toolUtilities_siteAssets.manifestPath(kind, dir) end

---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:59
---@param dir any
function editor_toolUtilities_siteAssets.modelPath(dir) end

--- Be told whenever a site is written to a shelf.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:95
---@param fn any
function editor_toolUtilities_siteAssets.onWritten(fn) end

--- Clear the folder out and hand it back ready to be written into. Every bake starts here, so a rebake never leaves half of
--- the last one lying about.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:80
---@param kind any
---@param slug any
function editor_toolUtilities_siteAssets.prepare(kind, slug) end

--- Off the shelf, folder and all. A rename is a save under the new name followed by this on the old one, which keeps the name
--- stored in the manifest honest - moving the folder alone would leave the old name inside it.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:114
---@param kind any
---@param slug any
function editor_toolUtilities_siteAssets.remove(kind, slug) end

---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:54
---@param kind any
function editor_toolUtilities_siteAssets.rootOf(kind) end

---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:60
---@param dir any
function editor_toolUtilities_siteAssets.shellPath(dir) end

--- A folder name from the thing's own name. Anything a filesystem would argue about becomes an underscore, so a rebake of a
--- renamed-but-same site overwrites its own folder instead of quietly growing a second one beside it.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:46
---@param kind any
---@param name any
function editor_toolUtilities_siteAssets.slugify(kind, name) end

--- Clear a folder before rewriting it, so a rebake producing less than the last one leaves nothing stale behind. The engine
--- writes a .cdae cache beside a .dae, which has to go too or it is loaded in preference to the new file.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:72
---@param dir any
function editor_toolUtilities_siteAssets.wipe(dir) end

--- Written compact, unlike the model beside it. Nobody opens a manifest by hand -- it is thousands of instance transforms
--- and a thousand mark runs -- and indenting it doubles a file the library has to read in full just to list the shelf.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:101
---@param kind any
---@param dir any
---@param manifest any
function editor_toolUtilities_siteAssets.writeManifest(kind, dir, manifest) end

--- The editable document, beside its meshes. `tool` is the editor that wrote it, so a folder opened by the wrong one says so
--- instead of quietly producing nonsense.
---Source : lua/ge/extensions/editor/toolUtilities/siteAssets.lua:90
---@param dir any
---@param tool any
---@param state any
function editor_toolUtilities_siteAssets.writeModel(dir, tool, state) end

---@type number
i = nil
