---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/stats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Usage statistics displayed in the Easy Object Select tool panel: number of selections, transformed distance, number of translations/rotations/scalings, breakdown of world/local operations and rotations by R key/wheel, plus the cumulative volume (m^3) of the selection. draw() displays them in ImGui with a "Reset Stats" button.
--- Access: extension `editor_ezObjectSelect_stats`: `extensions.load("editor_ezObjectSelect_stats")`, then the global `editor_ezObjectSelect_stats`
---@class editor_ezObjectSelect_stats
editor_ezObjectSelect_stats = {}

--- Initializes the coordinate mode and invalidates the volume cache.
---Source: lua/ge/extensions/editor/ezObjectSelect/stats.lua:63
---@param isLocal boolean true if the coordinate space is local.
function editor_ezObjectSelect_stats.activate(isLocal) end

--- Displays the "Stats" block in ImGui (selected volume, counters, World/Local and R/Wheel progress bars, Reset Stats button).
---Source: lua/ge/extensions/editor/ezObjectSelect/stats.lua:108
---@param selectedIds integer[]|nil IDs of the selected objects, for the volume computation.
function editor_ezObjectSelect_stats.draw(selectedIds) end

--- Forces recomputation of the selection volume at the next draw.
---Source: lua/ge/extensions/editor/ezObjectSelect/stats.lua:99
function editor_ezObjectSelect_stats.invalidateVolume() end

--- Records a transform operation: increments the world/local counter, then transforms (and the cumulative distance), rotates (with source "r" or "wheel") or scales.
---Source: lua/ge/extensions/editor/ezObjectSelect/stats.lua:77
---@param operation string "transform", "rotate" or "scale".
---@param source string|nil For a rotation: "r" (R key) or "wheel" (mouse wheel).
---@param distance number|nil Distance traveled (m), counted for "transform".
function editor_ezObjectSelect_stats.recordOperation(operation, source, distance) end

--- Increments the selection counter and invalidates the volume.
---Source: lua/ge/extensions/editor/ezObjectSelect/stats.lua:72
function editor_ezObjectSelect_stats.recordSelection() end

--- Changes the coordinate mode used to classify operations (world or local).
---Source: lua/ge/extensions/editor/ezObjectSelect/stats.lua:68
---@param isLocal boolean true for local.
function editor_ezObjectSelect_stats.setCoordinateMode(isLocal) end

