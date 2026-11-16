---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Draws the labels (dark panels with colored border) of the Easy Select tool with the imgui drawList. "followMouse" labels are stacked near the cursor (18 px offset, left side if they exit the viewport); the others are anchored above their screen position. Priority labels (label.priority == true) come first.
--- Access: extension `editor_ezObjectSelect_selectionLabelOverlay`: `extensions.load("editor_ezObjectSelect_selectionLabelOverlay")`, then the global `editor_ezObjectSelect_selectionLabelOverlay`
---@class editor_ezObjectSelect_selectionLabelOverlay
editor_ezObjectSelect_selectionLabelOverlay = {}

--- Draws all labels of the list.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionLabelOverlay.lua:68
---@param drawList ImDrawList* imgui draw list
---@param labels table List of labels {text, color (U32), followMouse, priority, position (ImVec2, if not followMouse)}
---@param mouse ImVec2 Mouse position
---@param viewport ImGuiViewport Viewport (Pos and Size) used to keep labels visible
function editor_ezObjectSelect_selectionLabelOverlay.draw(drawList, labels, mouse, viewport) end

