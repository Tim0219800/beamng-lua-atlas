---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestTsstaticMover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor tool "Forest TSStatic Mover" (Window > Terrain menu) that converts instances between the forest (ForestItem) and TSStatic objects. Two buttons: "Move selected ForestItems -> TSStatic" (Forest Tools mode required) and "Move selected TSStatic -> ForestItems" (Object Select mode required). Options: select the created objects, move all instances of the same mesh, put the created TSStatics in a new SimGroup. The action is recorded in the history (undo/redo).
--- Access: extension `editor_forestTsstaticMover`: `extensions.load("editor_forestTsstaticMover")`, then the global `editor_forestTsstaticMover`
---@class editor_forestTsstaticMover
---@field dependencies string[] Extensions loaded before this module: {"core_forest"}.
editor_forestTsstaticMover = {}

--- Hook called every frame by the editor: draws the "Forest TSStatic Mover" window (current edit mode, selected shape, checkboxes, conversion buttons grayed out depending on the mode, last error).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestTsstaticMover.lua:492
function editor_forestTsstaticMover.onEditorGui() end

--- Hook called at editor initialization: adds the "Forest TSStatic Mover" menu entry (Terrain group) and registers the window (560x260).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/forestTsstaticMover.lua:556
function editor_forestTsstaticMover.onEditorInitialized() end

