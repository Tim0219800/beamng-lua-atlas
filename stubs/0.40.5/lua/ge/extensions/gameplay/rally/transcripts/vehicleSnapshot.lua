---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vehicle snapshot. Initialized fields: path, id, name, sortOrder, pos, quat, steering, timestamp, cornerCall (the last five nil).
---@class gameplay_rally_transcripts_vehicleSnapshot
local gameplay_rally_transcripts_vehicleSnapshot = {}

--- Constructor called by the function returned by the module. Stores the parent path, takes the provided id or a new id via path:getNextUniqueIdentifier(), and names the object `t_<id>` by default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua:7
---@param path table Transcriptions path object (must provide getNextUniqueIdentifier).
---@param name string|nil Name; default `t_<id>`.
---@param forceId integer|nil Forced id (for example during a load).
function gameplay_rally_transcripts_vehicleSnapshot:init(path, name, forceId) end

--- Restoration from the saved data. Does nothing in this version.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua:33
---@param data table Saved data.
---@param oldIdMap table Mapping table of the old ids.
function gameplay_rally_transcripts_vehicleSnapshot:onDeserialized(data, oldIdMap) end

--- Returns a table {oldId, name, text} for saving.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/vehicleSnapshot.lua:22
---@return table  Serializable data (text is nil, see notes).
function gameplay_rally_transcripts_vehicleSnapshot:onSerialize() end

