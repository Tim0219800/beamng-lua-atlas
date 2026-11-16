---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/documentationHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small editor extension that adds to the global `editor` table two functions to open BeamNG's online documentation in the browser. The other editor tools use it for their help buttons.
--- Access: extension `editor_documentationHelper`: `extensions.load("editor_documentationHelper")`, then the global `editor_documentationHelper`
---@class editor_documentationHelper
editor_documentationHelper = {}

--- Hook called by the editor when it is initialized. Installs editor.openHelp and editor.openCodingHelp.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/documentationHelper.lua:16
function editor_documentationHelper.onEditorInitialized() end

--- Functions added to the global `editor` table by onEditorInitialized.
---@class editor_documentationHelper_editor
local editor_documentationHelper_editor = {}

--- Opens the editor API reference in the browser: https://documentation.beamng.com/world_editor/api_reference/<page>.html.
---Source: lua/ge/extensions/editor/documentationHelper.lua:12
---@param contextPageName string|nil Page name without extension; "index" if nil.
function editor_documentationHelper_editor.openCodingHelp(contextPageName) end

--- Opens https://documentation.beamng.com/world_editor/<page>.html in the browser.
---Source: lua/ge/extensions/editor/documentationHelper.lua:8
---@param contextPageName string|nil Page name without extension; "index" if nil.
function editor_documentationHelper_editor.openHelp(contextPageName) end

