---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/navigation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API module intended to manage navigation meshes (NavMesh), off-mesh links and covers for AI. In 0.40.5 it is an empty shell: all the functions are `--TODO` with no body. `initialize` attaches them to the `editor` object (editor.createNavMesh, etc.).
--- Access: extension `editor_api_navigation`: `extensions.load("editor_api_navigation")`, then the global `editor_api_navigation`
---@class editor_api_navigation
editor_api_navigation = {}

--- Remembers the editor instance and installs the nine navmesh/cover/offmeshlink functions on it (not implemented).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/navigation.lua:43
---@param editorInstance table `editor` object on which to place the functions
function editor_api_navigation.initialize(editorInstance) end

--- Functions added to the `editor` object by `initialize`. All are empty stubs (TODO).
---@class editor_api_navigation_editor
local editor_api_navigation_editor = {}

--- Stub: should create a cover.
---Source: lua/ge/extensions/editor/api/navigation.lua:23
---@param coverInfo any cover description
function editor_api_navigation_editor.createCover(coverInfo) end

--- Stub: should create a navmesh.
---Source: lua/ge/extensions/editor/api/navigation.lua:7
---@param navMeshInfo any navmesh description (inferred from the name)
function editor_api_navigation_editor.createNavMesh(navMeshInfo) end

--- Stub: should create an off-mesh link.
---Source: lua/ge/extensions/editor/api/navigation.lua:15
---@param navMeshObjectId integer navmesh id (inferred from the name)
---@param linkInfo any link description
function editor_api_navigation_editor.createOffMeshLink(navMeshObjectId, linkInfo) end

--- Stub: should delete a cover.
---Source: lua/ge/extensions/editor/api/navigation.lua:27
---@param coverObjectId integer cover object id (inferred from the name)
function editor_api_navigation_editor.deleteCover(coverObjectId) end

--- Stub: should delete a navmesh.
---Source: lua/ge/extensions/editor/api/navigation.lua:11
---@param navMeshObjectId integer navmesh object id (inferred from the name)
function editor_api_navigation_editor.deleteNavMesh(navMeshObjectId) end

--- Stub: should delete an off-mesh link.
---Source: lua/ge/extensions/editor/api/navigation.lua:19
---@param linkId any link identifier
function editor_api_navigation_editor.deleteOffMeshLink(linkId) end

--- Stub: should list the covers of a navmesh.
---Source: lua/ge/extensions/editor/api/navigation.lua:35
---@param navMeshObjectId integer navmesh id
function editor_api_navigation_editor.getCovers(navMeshObjectId) end

--- Stub: should list the navmeshes.
---Source: lua/ge/extensions/editor/api/navigation.lua:31
function editor_api_navigation_editor.getNavMeshes() end

--- Stub: should list the off-mesh links.
---Source: lua/ge/extensions/editor/api/navigation.lua:39
function editor_api_navigation_editor.getOffMeshLinks() end

