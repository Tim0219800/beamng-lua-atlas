---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/imguiCDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor extension that adds the "ImGui Demo" menu entry (Debug group of the Window menu). It opens the built-in Dear ImGui demo window (ui_imgui.ShowDemoWindow), useful to a modder to see all the available ImGui widgets. It writes no data.
--- Access: extension `editor_imguiCDemo`: `extensions.load("editor_imguiCDemo")`, then the global `editor_imguiCDemo`
---@class editor_imguiCDemo
editor_imguiCDemo = {}

--- Called every frame by the editor; if the window is open, displays the ImGui demo window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/imguiCDemo.lua:9
function editor_imguiCDemo.onEditorGui() end

--- Called at editor initialization; registers the "ImGui Demo" menu in the Debug group via editor.addWindowMenuItem.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/imguiCDemo.lua:19
function editor_imguiCDemo.onEditorInitialized() end

