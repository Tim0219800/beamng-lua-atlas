---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/assets.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for drag-and-drop of assets (file paths as strings) between ImGui windows. On initialization, adds to the editor instance: editor.dragDropAsset (internal state), editor.dragDropSource and editor.dragDropTarget. A source and a target match if they use the same dragDropId; the data is carried in a 2048-character buffer.
--- Access: extension `editor_api_assets`: `extensions.load("editor_api_assets")`, then the global `editor_api_assets`
---@class editor_api_assets
editor_api_assets = {}

--- Initializes the module: stores the editor and installs dragDropAsset, dragDropSource and dragDropTarget on it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/assets.lua:39
---@param editorInstance table Editor instance.
function editor_api_assets.initialize(editorInstance) end

--- Methods added to the editor instance by this module.
---@class editor_api_assets_editor
local editor_api_assets_editor = {}

--- To be called while drawing the ImGui element that serves as the source: if a drag begins, creates the payload (data, 2048-character buffer), stores the callback and displays the text during the drag.
---Source: lua/ge/extensions/editor/api/assets.lua:13
---@param dragDropId string Payload type identifier; targets only accept the same identifier.
---@param data string String carried (e.g. asset path).
---@param callback function|nil Called with the string when the drop succeeded.
function editor_api_assets_editor.dragDropSource(dragDropId, data, callback) end

--- To be called after the ImGui element that serves as the target: accepts a payload with the same dragDropId, calls the source's callback with the received string then resets the state.
---Source: lua/ge/extensions/editor/api/assets.lua:25
---@param dragDropId string Accepted payload type identifier.
function editor_api_assets_editor.dragDropTarget(dragDropId) end

