---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui interface of the Features tab of the Hero Road Editor, for the elements that can be placed on the road: crosswalks, repair patch clusters, potholes, widenings, intersections and barriers. It displays a unified list (rename, "go to" button that moves the camera, delete), a row of placement buttons (mode via roadPlaceables.setPlaceMode) then the sliders of the selected element. Changes go through groupMgr (deep copy of the group) and editor.history for undo.
--- Access: extension `editor_heroRoadEditor_placeablesUI`: `extensions.load("editor_heroRoadEditor_placeablesUI")`, then the global `editor_heroRoadEditor_placeablesUI`
---@class editor_heroRoadEditor_placeablesUI
editor_heroRoadEditor_placeablesUI = {}

--- Indicates whether a 'live' slider was held in the previous frame and resets the flag to false. The tool window is drawn after the drag pipeline, so heroRoadEditor calls it at the start of the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua:31
---@return boolean  true if a live slider was held.
function editor_heroRoadEditor_placeablesUI.consumeLiveDrag() end

--- Draws the whole Features tab for the selected road: unified list of placeable elements (crossings, repairs, potholes, widenings, junctions, barriers), row of add buttons, then the controls of the selected element.
---Source: lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua:377
---@param selGroup table|nil Selected Hero Road group; nil displays an empty list ('No features yet.').
---@param selectedGroupIdx integer Index of the selected group, compared with the roadPlaceables selection.
function editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx) end

