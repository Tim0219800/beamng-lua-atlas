---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Camera path player returned by the module constructor.
---@class gameplay_rally_cameraPathPlayer
local gameplay_rally_cameraPathPlayer = {}

--- Stores the snaproad used to produce the path points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua:11
---@param snaproad table Object providing pointsForCameraPath(metersBefore, metersAfter).
function gameplay_rally_cameraPathPlayer:init(snaproad) end

--- Requests the points from the snaproad (40 m before, 20 m after), builds the camera path and starts it with core_paths.playPath. Does nothing if no points are returned.
---Source: lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua:146
function gameplay_rally_cameraPathPlayer:play() end

--- Stops the current camera path (core_paths.stopCurrentPath).
---Source: lua/ge/extensions/gameplay/rally/cameraPathPlayer.lua:162
function gameplay_rally_cameraPathPlayer:stop() end

