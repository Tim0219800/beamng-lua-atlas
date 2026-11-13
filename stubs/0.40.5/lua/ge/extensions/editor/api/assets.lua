---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/assets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_assets` : `extensions.load("editor_api_assets")`, puis la globale `editor_api_assets`
---@class editor_api_assets
editor_api_assets = {}

--- Initialize the module.
---Source : lua/ge/extensions/editor/api/assets.lua:39
---@param editorInstance any
function editor_api_assets.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/assets.lua
---@class editor_api_assets_editor
local editor_api_assets_editor = {}

--- Function that gets invoked when a payload has been successfully dropped on a drag and drop target.
---  @param dragDropId the drag and drop id. An arbitrary id that is created by the user. Drag and drop targets only accept payloads from drag and drop sources with the same dragDropId.
---  @param data payload of the drag and drop action. The actual data that gets transferred from a drag and drop source to a drag and drop target.
---  @param callback callback function.
---Source : lua/ge/extensions/editor/api/assets.lua:13
---@param dragDropId any
---@param data any
---@param callback any
function editor_api_assets_editor.dragDropSource(dragDropId, data, callback) end

--- Drag and drop targets only accept payloads from drag and drop sources with the same dragDropId.
---  @param dragDropId the drag and drop id. An arbitrary id that is created by the user.
---Source : lua/ge/extensions/editor/api/assets.lua:25
---@param dragDropId any
function editor_api_assets_editor.dragDropTarget(dragDropId) end

