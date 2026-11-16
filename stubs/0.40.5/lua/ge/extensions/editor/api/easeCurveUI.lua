---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/easeCurveUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor ImGui widget for editing an easing curve (engine EaseF type). The value is a "dir type param0 param1" string. The widget shows two combos (direction InOut/In/Out, type Linear..Bounce), a clickable curve preview opening a thumbnail picker, and parameter sliders for Elastic (Amplitude, Period) and Back (Overshoot).
--- Access: extension `editor_api_easeCurveUI`: `extensions.load("editor_api_easeCurveUI")`, then the global `editor_api_easeCurveUI`
---@class editor_api_easeCurveUI
editor_api_easeCurveUI = {}

--- Draws the curve editing widget. Calls opts.setValue(valueString, editEnded) on each change; editEnded is true for combo/picker choices and at the end of a slider drag.
---Source: lua/ge/extensions/editor/api/easeCurveUI.lua:147
---@param opts table id (unique string), value (string "dir type param0 param1"), setValue(valueString, editEnded)
function editor_api_easeCurveUI.draw(opts) end

