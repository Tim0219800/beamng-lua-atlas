---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loader of the "driveline" file recorded during a rally recce. A driveline is a sequence of timestamped points (position, orientation) of the driven route. The module reads the mission's JSONL file and builds a PointList with relationships between points and normals. Extension gameplay_rally_recce_drivelineRecording, used by the recce class.
--- Access: extension `gameplay_rally_recce_drivelineRecording`: `extensions.load("gameplay_rally_recce_drivelineRecording")`, then the global `gameplay_rally_recce_drivelineRecording`
---@class gameplay_rally_recce_drivelineRecording
gameplay_rally_recce_drivelineRecording = {}

--- Loads the mission's driveline file and returns a ready-to-use PointList (setupPointRelationships and setupPointNormals already called).
---Source: lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua:17
---@param missionDir string Mission folder containing the driveline file (rallyUtil.drivelineFile)
---@return table|nil  PointList, or nil if the file is absent, unreadable or has fewer than 3 points
function gameplay_rally_recce_drivelineRecording.load(missionDir) end

