---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/driveline/util.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editing constants of the rally driveline (editable spline built from the recce recording). Used by drivelineV3: default node width, RDP simplification tolerance, minimum number of subdivisions and minimum spline spacing.
--- Access: extension `gameplay_rally_driveline_util`: `extensions.load("gameplay_rally_driveline_util")`, then the global `gameplay_rally_driveline_util`
---@class gameplay_rally_driveline_util
---@field defaultSimplificationTolerance number RDP algorithm tolerance when simplifying the recorded points: 1.0 (m).
---@field defaultSplineWidth number Default width of a spline node: 10.0 m.
---@field minSplineDivisions number Minimum number of spline subdivisions: 10.
---@field minSplineSpacing number Minimum spacing between subdivided points: 2.0 m.
gameplay_rally_driveline_util = {}

