---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_placeablesUI` : `extensions.load("editor_heroRoadEditor_placeablesUI")`, puis la globale `editor_heroRoadEditor_placeablesUI`
---@class editor_heroRoadEditor_placeablesUI
editor_heroRoadEditor_placeablesUI = {}

--- Returns whether a live slider was held last frame, and resets the flag (the tool window is drawn after the drag pipeline
---  runs, so heroRoadEditor reads this at the top of the next frame -- same 1-frame pipeline as its own liveSliderDragging).
---Source : lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua:31
function editor_heroRoadEditor_placeablesUI.consumeLiveDrag() end

--- Draws the whole Features tab for the selected road: the unified placeables list, the Add-button row (crossing / repair /
---  pothole / widening / junction / barrier), then the selected item's controls.
---Source : lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua:377
---@param selGroup any
---@param selectedGroupIdx any
function editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx) end

