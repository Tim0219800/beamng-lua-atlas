---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cefHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small tool intended to hide the CEF interface (scenetree.maincef) when the imgui editor is active. In version 0.40.5 the code is commented out ("disabled for release due to bugs with the track editor"), so the module does nothing.
--- Access: extension `editor_cefHelper`: `extensions.load("editor_cefHelper")`, then the global `editor_cefHelper`
---@class editor_cefHelper
editor_cefHelper = {}

--- Called when the editor is activated. Should hide the CEF UI but is disabled (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cefHelper.lua:14
function editor_cefHelper.onEditorActivated() end

--- Called when the editor is deactivated. Should show the CEF UI again but is disabled (body commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/cefHelper.lua:9
function editor_cefHelper.onEditorDeactivated() end

