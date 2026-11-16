---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Path mode. Fields: ctrlPoint, camT (current time in s), customData, path, pathName, fovOffset.
---@class core_cameraModes_path
local core_cameraModes_path = {}

--- Absolute time of marker index since the start of the path.
---Source: lua/ge/extensions/core/cameraModes/path.lua:174
---@param path table path
---@param index integer marker index
---@param looped boolean|nil looped path (marker 1 then equals the last one's time + loop duration, JSON mode)
---@return number  seconds
function core_cameraModes_path:getGlobalTime(path, index, looped) end

--- Duration between marker index and the next (last marker: loop duration or 2 s in JSON mode).
---Source: lua/ge/extensions/core/cameraModes/path.lua:165
---@param path table path
---@param index integer marker index
---@return number  seconds
function core_cameraModes_path:getTimeToNext(path, index) end

--- isGlobal = true, hidden = true, initial state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/path.lua:16
function core_cameraModes_path:init() end

--- Resets time, control point, FOV offset and path names to zero (calls customData:reset if it exists).
---Source: lua/ge/extensions/core/cameraModes/path.lua:560
function core_cameraModes_path:reset() end

--- Resets the mode and sets the course data; start time = customData.offset. If the path has a replay, loads it (or ignores it if it does not exist).
---Source: lua/ge/extensions/core/cameraModes/path.lua:545
---@param data table customData: getNextPath, path, offset, useJsonVersion, useDtReal, onNextControlPoint, finishedPath, reset
function core_cameraModes_path:setCustomData(data) end

--- Advances time, interpolates the camera and writes data.res (pos, rot, fov, nearClip), calls the customData callbacks and handles the end/loop of the path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/cameraModes/path.lua:221
---@param data table camData
---@return boolean|nil  true; nil if no valid path
function core_cameraModes_path:update(data) end

