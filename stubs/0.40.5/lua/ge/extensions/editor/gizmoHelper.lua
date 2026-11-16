---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/gizmoHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small utility to know whether the editor's axis gizmo is drawn. A tool calls gizmoDrawCalled() every frame it draws the gizmo; on the next frame, if nobody drew it any more, the module deselects the gizmo element on the engine side (setAxisGizmoSelectedElement(-1)).
--- Access: extension `editor_gizmoHelper`: `extensions.load("editor_gizmoHelper")`, then the global `editor_gizmoHelper`
---@class editor_gizmoHelper
editor_gizmoHelper = {}

--- To be called from a tool every frame it draws the axis gizmo; marks the gizmo as drawn for the current frame.
---Source: lua/ge/extensions/editor/gizmoHelper.lua:17
function editor_gizmoHelper.gizmoDrawCalled() end

--- Indicates whether the gizmo was drawn in the previous frame.
---Source: lua/ge/extensions/editor/gizmoHelper.lua:21
---@return boolean  true if gizmoDrawCalled was called in the previous frame
function editor_gizmoHelper.isGizmoVisible() end

--- Hook called every frame by the editor: if the gizmo was drawn in the previous frame but not in this one, deselects the gizmo element (-1); then shifts the frame flag and resets it to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/gizmoHelper.lua:9
function editor_gizmoHelper.onEditorGui() end

