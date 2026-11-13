---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/multiSpawnManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_multiSpawnManager` : `extensions.load("editor_multiSpawnManager")`, puis la globale `editor_multiSpawnManager`
---@class editor_multiSpawnManager
---@field filePaths table
editor_multiSpawnManager = {}

---Source : lua/ge/extensions/editor/multiSpawnManager.lua:192
---@param filePath any
function editor_multiSpawnManager.loadGroup(filePath) end

---Source : lua/ge/extensions/editor/multiSpawnManager.lua:757
---@param dt any
function editor_multiSpawnManager.onEditorGui(dt) end

---Source : lua/ge/extensions/editor/multiSpawnManager.lua:863
function editor_multiSpawnManager.onEditorInitialized() end

--- public interface
---Source : lua/ge/extensions/editor/multiSpawnManager.lua:853
function editor_multiSpawnManager.onVehicleGroupSpawned() end

---Source : lua/ge/extensions/editor/multiSpawnManager.lua:857
function editor_multiSpawnManager.onWindowMenuItem() end

---Source : lua/ge/extensions/editor/multiSpawnManager.lua:223
---@param file any
---@param filePath any
function editor_multiSpawnManager.saveGroup(file, filePath) end

