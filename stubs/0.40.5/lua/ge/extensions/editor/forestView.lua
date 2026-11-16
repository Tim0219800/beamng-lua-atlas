---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor "Forest View" window, intended to list the forest's ForestItemData ("theForest") as buttons sorted by name. The module is largely unfinished: the edit mode activation/deactivation hooks are commented out at export, so the list is never filled and the window stays empty.
--- Access: extension `editor_forestView`: `extensions.load("editor_forestView")`, then the global `editor_forestView`
---@class editor_forestView
editor_forestView = {}

--- Hook called when the editor is activated; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestView.lua:15
function editor_forestView.onEditorActivated() end

--- Hook called every frame by the editor: draws the "Forest View" window with one button per forestItemsInfo entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestView.lua:86
function editor_forestView.onEditorGui() end

--- Hook called at editor initialization: registers the "forestEditorView" window (220x320).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestView.lua:11
function editor_forestView.onEditorInitialized() end

