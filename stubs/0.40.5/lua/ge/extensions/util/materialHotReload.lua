---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/materialHotReload.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Hot reload of *.materials.json and *.material.json files: when one of them is modified on disk, the extension rereads it (loadJsonMaterialsFile, which updates the Material objects in memory) then calls reload() on each "Material" class material declared in the file. Useful to a material/texture creator to see changes without restarting the level.
--- Access: extension `util_materialHotReload`: `extensions.load("util_materialHotReload")`, then the global `util_materialHotReload`
---@class util_materialHotReload
util_materialHotReload = {}

--- Hook called when a watched file changes on disk. If it is a modification of a materials file, reloads the file and the affected materials, then logs the number of materials reloaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/materialHotReload.lua:30
---@param filename string Path of the modified file
---@param type string Change type; only "modified" is handled
function util_materialHotReload.onFileChanged(filename, type) end

--- Called at extension initialization: requests that it stay loaded across level or mode changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/materialHotReload.lua:36
function util_materialHotReload.onInit() end

