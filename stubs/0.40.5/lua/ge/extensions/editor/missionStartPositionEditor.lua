---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionStartPositionEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Edit Mission Start Position" edit mode of the World Editor (flag icon). It draws with debugDrawer a sphere and the name for each mission whose startTrigger.level is the current level, and lets you move the start point of the selected mission: click-drag, or Ctrl+click to place directly at the mouse position (camera raycast). Each move is recorded in the editor's undo history (editor.history). A button also moves all the missions located within 10 m of the selected mission to its position.
--- Access: extension `editor_missionStartPositionEditor`: `extensions.load("editor_missionStartPositionEditor")`, then the global `editor_missionStartPositionEditor`
---@class editor_missionStartPositionEditor
editor_missionStartPositionEditor = {}

--- Hook called at editor initialization: declares the missionStartPositionEditMode edit mode (action map "MissionStartPositionEditor", onActivate, onDeactivate, onUpdate, onToolbar).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionStartPositionEditor.lua:267
function editor_missionStartPositionEditor.onEditorInitialized() end

--- Sets the selected mission in this edit mode (useful for the mission editor).
---Source: lua/ge/extensions/editor/missionStartPositionEditor.lua:284
---@param mission table|nil Mission (with startTrigger.pos) or nil to deselect.
function editor_missionStartPositionEditor.setSelectedMission(mission) end

