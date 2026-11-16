---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui overlay drawing (full screen, no inputs) of the Easy Object Select selection: outlines/convex hulls and fills of the candidates (green for the active pick, yellow for the rest of the stack, white for discovery, orange for selected objects, magenta during drag), discovery circle around the cursor, labels, and a debug window with a performance curve (180 samples).
--- Access: extension `editor_ezObjectSelect_selectionScreenDebug`: `extensions.load("editor_ezObjectSelect_selectionScreenDebug")`, then the global `editor_ezObjectSelect_selectionScreenDebug`
---@class editor_ezObjectSelect_selectionScreenDebug
editor_ezObjectSelect_selectionScreenDebug = {}

--- Draws the overlay for a snapshot from selectionModel.update and records the frame's performance time. Exits immediately if the snapshot has no camera.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua:299
---@param snapshot table|nil Snapshot produced by editor_ezObjectSelect_selectionModel.update.
---@param options table|nil Display options: debugEnabled, showHoverRing, outlineMode (1 = no convex hulls), discoveryPixels, maxDiscoveryOutlines... (inferred from code).
function editor_ezObjectSelect_selectionScreenDebug.draw(snapshot, options) end

--- Resets the performance history (samples and counters).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua:51
function editor_ezObjectSelect_selectionScreenDebug.reset() end

