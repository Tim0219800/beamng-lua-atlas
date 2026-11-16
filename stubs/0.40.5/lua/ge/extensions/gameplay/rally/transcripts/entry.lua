---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/entry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transcription. Fields: path, id, name, sortOrder (999999), show (true), text, success, src, file, beamng_file, timestamp, vehicle_data, grouped_captures.
---@class gameplay_rally_transcripts_entry
local gameplay_rally_transcripts_entry = {}

--- Associated steering capture data (vehicle_data.capture_data).
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:61
---@return table|nil  {captures, cornerAnglesStyle} or nil.
function gameplay_rally_transcripts_entry:capture_data() end

--- Text displayed above the debug car: text, followed by "(click to copy)" on hover.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:43
---@param hovered boolean true if the mouse hovers the entry.
---@return string  Text to draw.
function gameplay_rally_transcripts_entry:debugDrawText(hovered) end

--- Draws the debug car then, if hovered or selected, the steering captures.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:249
---@param is_hovered boolean Hovered.
---@param is_selected boolean Selected.
function gameplay_rally_transcripts_entry:drawDebug(is_hovered, is_selected) end

--- For a hovered or selected entry: sphere of radius 0.5 colored by angle for each capture and corner call label per group.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:331
---@param is_hovered boolean Hovered.
---@param is_selected boolean Selected.
function gameplay_rally_transcripts_entry:drawDebugCaptureData(is_hovered, is_selected) end

--- Draws a stylized car (square prism + 4 wheel spheres) at the recorded position/orientation, with the transcription text.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:254
---@param is_hovered boolean Hovered.
---@param is_selected boolean Selected.
function gameplay_rally_transcripts_entry:drawDebugVehicleData(is_hovered, is_selected) end

--- Groups consecutive captures that have the same corner call (e.g. "3L", "C"). Sorts the angles of the chosen style, assigns them a red-yellow-green gradient (white for the center), computes for each capture a calc field {angle_pct, angle_data, cornerCallStr}, and sets a label point at the middle of each group. Result cached.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:95
---@return table[]|nil  List of groups {captures, label_point, calc}; nil without capture_data.
function gameplay_rally_transcripts_entry:get_grouped_captures() end

--- Constructor: forced id or one provided by path:getNextUniqueIdentifier(), default name `t_<id>`, display enabled.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:11
---@param path table Parent transcriptions path.
---@param name string|nil Name; default `t_<id>`.
---@param forceId integer|nil Forced id.
function gameplay_rally_transcripts_entry:init(path, name, forceId) end

--- True if the transcription has vehicle data and is displayed.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:39
---@return boolean|nil  Truthy value if usable.
function gameplay_rally_transcripts_entry:isUsable() end

--- Centers the editor camera on the vehicle position (rallyUtil.setCameraTarget).
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:523
function gameplay_rally_transcripts_entry:lookAtMe() end

--- Restores the fields with default values (empty strings, 0.0, empty table). show is forced to false if the vehicle position is absent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:233
---@param data table Saved data.
---@param oldIdMap table Mapping of the old ids (unused).
function gameplay_rally_transcripts_entry:onDeserialized(data, oldIdMap) end

--- Returns {oldId, name, show, text, success, src, file, beamng_file, timestamp, vehicle_data}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:215
---@return table  Serializable data.
function gameplay_rally_transcripts_entry:onSerialize() end

--- Builds a camera path (1 m above each capture, FOV 60, time relative to the first ts, fixes the sign of the quaternions) and plays it via core_paths.playPath.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:517
function gameplay_rally_transcripts_entry:playCameraPath() end

--- Sets the display flag.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:35
---@param val boolean true to show.
function gameplay_rally_transcripts_entry:setShow(val) end

--- Toggles the show display flag.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:31
function gameplay_rally_transcripts_entry:toggleShow() end

--- Vehicle position at the time of the transcription.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:51
---@return vec3|nil  World position, or nil if absent.
function gameplay_rally_transcripts_entry:vehiclePos() end

--- Vehicle orientation at the time of the transcription.
---Source: lua/ge/extensions/gameplay/rally/transcripts/entry.lua:56
---@return quat|nil  Quaternion, or nil if absent.
function gameplay_rally_transcripts_entry:vehicleQuat() end

