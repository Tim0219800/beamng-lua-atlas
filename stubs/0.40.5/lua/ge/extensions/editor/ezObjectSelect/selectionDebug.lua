---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug and visual feedback drawing of the Easy Select tool in the 3D world (debugDrawer): boxes of discovered objects, of the candidate stack, of the chosen object, of selected or dragged objects, objects filtered out for being too large, selection axes (X red, Y green, Z blue) and maximum distance ring around the camera. The 2D debug drawing is delegated to the selectionScreenDebug module.
--- Access: extension `editor_ezObjectSelect_selectionDebug`: `extensions.load("editor_ezObjectSelect_selectionDebug")`, then the global `editor_ezObjectSelect_selectionDebug`
---@class editor_ezObjectSelect_selectionDebug
editor_ezObjectSelect_selectionDebug = {}

--- Delegates the 2D overlay debug to selectionScreenDebug.draw(snapshot, options).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua:275
---@param snapshot table|nil Snapshot
---@param options table Options
function editor_ezObjectSelect_selectionDebug.drawScreen(snapshot, options) end

--- Draws in the world the boxes and axes described by the selection snapshot and the options. Boxes are drawn as lines if options.outlineMode == 1 (otherwise filled).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua:177
---@param snapshot table|nil Selection state: discovery, candidates, pick, filteredLarge, camera
---@param options table outlineMode, selectedIds, draggingIds, depthTest, dragDepthTest, selectedDepthTest, showFilteredLarge, debugEnabled, maxDiscoveryOutlines, maxStackOutlines, showSelectionAxes, axisLocal, axisLengthScale, axisLineWidth, showDistanceRing, maxDistance
function editor_ezObjectSelect_selectionDebug.drawWorld(snapshot, options) end

--- Resets the state of selectionScreenDebug.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionDebug.lua:279
function editor_ezObjectSelect_selectionDebug.reset() end

