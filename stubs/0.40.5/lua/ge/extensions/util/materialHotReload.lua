---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/materialHotReload.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hot-reloads *.materials.json files on disk change: re-parses the file (patching
---  the in-memory Material objects) and reloads each affected material instance.
--- Accès : extension `util_materialHotReload` : `extensions.load("util_materialHotReload")`, puis la globale `util_materialHotReload`
---@class util_materialHotReload
util_materialHotReload = {}

---Source : lua/ge/extensions/util/materialHotReload.lua:30
---@param filename any
---@param type any
function util_materialHotReload.onFileChanged(filename, type) end

---Source : lua/ge/extensions/util/materialHotReload.lua:36
function util_materialHotReload.onInit() end

