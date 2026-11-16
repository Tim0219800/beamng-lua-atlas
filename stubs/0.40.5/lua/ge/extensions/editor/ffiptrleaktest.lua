---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ffiptrleaktest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Internal editor test extension (FFI pointer leaks with ImGui). It opens a "ffi ptr leak test" window with test widgets (checkbox, sliders, text field, image) and the ImGui demo window. It is disabled in this version: the file runs `do return M end` right after `local M = {}`, so the hooks are never exported.
--- Access: extension `editor_ffiptrleaktest`: `extensions.load("editor_ffiptrleaktest")`, then the global `editor_ffiptrleaktest`
---@class editor_ffiptrleaktest
editor_ffiptrleaktest = {}

--- Editor hook called every GUI frame: draws the ImGui test window. Not exported while the file is disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ffiptrleaktest.lua:22
function editor_ffiptrleaktest.onEditorGui() end

--- Hook called at editor initialization: registers the "ffi ptr leak test" window, its Window menu entry and loads the test texture. Not exported while the file is disabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/ffiptrleaktest.lua:48
function editor_ffiptrleaktest.onEditorInitialized() end

