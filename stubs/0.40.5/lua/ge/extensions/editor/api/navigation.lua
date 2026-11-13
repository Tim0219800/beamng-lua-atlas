---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/navigation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_navigation` : `extensions.load("editor_api_navigation")`, puis la globale `editor_api_navigation`
---@class editor_api_navigation
editor_api_navigation = {}

---Source : lua/ge/extensions/editor/api/navigation.lua:43
---@param editorInstance any
function editor_api_navigation.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/navigation.lua
---@class editor_api_navigation_editor
local editor_api_navigation_editor = {}

---Source : lua/ge/extensions/editor/api/navigation.lua:23
---@param coverInfo any
function editor_api_navigation_editor.createCover(coverInfo) end

---Source : lua/ge/extensions/editor/api/navigation.lua:7
---@param navMeshInfo any
function editor_api_navigation_editor.createNavMesh(navMeshInfo) end

---Source : lua/ge/extensions/editor/api/navigation.lua:15
---@param navMeshObjectId any
---@param linkInfo any
function editor_api_navigation_editor.createOffMeshLink(navMeshObjectId, linkInfo) end

---Source : lua/ge/extensions/editor/api/navigation.lua:27
---@param coverObjectId any
function editor_api_navigation_editor.deleteCover(coverObjectId) end

---Source : lua/ge/extensions/editor/api/navigation.lua:11
---@param navMeshObjectId any
function editor_api_navigation_editor.deleteNavMesh(navMeshObjectId) end

---Source : lua/ge/extensions/editor/api/navigation.lua:19
---@param linkId any
function editor_api_navigation_editor.deleteOffMeshLink(linkId) end

---Source : lua/ge/extensions/editor/api/navigation.lua:35
---@param navMeshObjectId any
function editor_api_navigation_editor.getCovers(navMeshObjectId) end

---Source : lua/ge/extensions/editor/api/navigation.lua:31
function editor_api_navigation_editor.getNavMeshes() end

---Source : lua/ge/extensions/editor/api/navigation.lua:39
function editor_api_navigation_editor.getOffMeshLinks() end

