---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/headlessEditorTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development example of the editor's "headless" mode (hides menus and toolbars to show only its own tool). The module only exports its hooks if shipping_build is false: in a production build, it is empty. It shows how to enter/exit the mode (editor.enableHeadless), draw your own menu bar via onEditorHeadlessMainMenuBar and open a tool window and a floating toolbar.
--- Access: extension `editor_headlessEditorTest`: `extensions.load("editor_headlessEditorTest")`, then the global `editor_headlessEditorTest`
---@class editor_headlessEditorTest
editor_headlessEditorTest = {}

