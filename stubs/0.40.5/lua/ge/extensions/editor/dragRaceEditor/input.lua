---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handles mouse input of the drag race editor for zone editing: on each update, computes the camera-mouse ray, the scene raycast and the left button click/hold/release states. The result is read by the zone editor via getMouseInfo.
--- Access: extension `editor_dragRaceEditor_input`: `extensions.load("editor_dragRaceEditor_input")`, then the global `editor_dragRaceEditor_input`
---@class editor_dragRaceEditor_input
editor_dragRaceEditor_input = {}

--- Returns the current mouseInfo table.
---Source: lua/ge/extensions/editor/dragRaceEditor/input.lua:44
---@return table|nil  nil until updateMouseInfo has been called at least once.
function editor_dragRaceEditor_input.getMouseInfo() end

--- Recomputes the mouseInfo table: camPos, ray, rayDir, rayCast, valid, down, hold, up and the positions/normals _downPos, _holdPos, _upPos, _downNormal, _holdNormal, _upNormal.
---Source: lua/ge/extensions/editor/dragRaceEditor/input.lua:6
function editor_dragRaceEditor_input.updateMouseInfo() end

