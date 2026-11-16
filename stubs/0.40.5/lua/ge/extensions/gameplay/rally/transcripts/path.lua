---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transcriptions path. Fields: fname, selection_sphere_r (4), _draw_debug_hover_tsc_id, transcripts (sortedList of entries).
---@class gameplay_rally_transcripts_path
local gameplay_rally_transcripts_path = {}

--- Entry point of the debug drawing; calls drawDebugTranscripts.
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:75
---@param selected_id integer|nil Id of the selected entry.
function gameplay_rally_transcripts_path:drawDebug(selected_id) end

--- Calls drawDebug(is_hovered, is_selected) on each entry of the sorted list.
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:119
---@param selected_id integer|nil Id of the selected entry.
function gameplay_rally_transcripts_path:drawDebugTranscripts(selected_id) end

--- Returns an increasing integer (1, 2, 3…) used as the entries' id.
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:11
---@return integer  New identifier.
function gameplay_rally_transcripts_path:getNextUniqueIdentifier() end

--- Constructor: stores the file name and creates the `transcripts` sortedList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:19
---@param fname string|nil Transcriptions JSON file.
function gameplay_rally_transcripts_path:init(fname) end

--- Loads the JSON file (jsonReadFile) and deserializes. Logs a warning and returns false if fname is nil or the file is absent, an error if reading fails.
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:32
---@return boolean  true if loading succeeded.
function gameplay_rally_transcripts_path:load() end

--- Empties the list and reloads it from data.transcripts. Does nothing if data is nil.
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:67
---@param data table|nil Data read from the file.
function gameplay_rally_transcripts_path:onDeserialized(data) end

--- Returns {transcripts = <serialized list>}.
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:59
---@return table  Serializable data.
function gameplay_rally_transcripts_path:onSerialize() end

--- Serializes and writes the JSON file (jsonWriteFile with the compact parameter set to false).
---Source: lua/ge/extensions/gameplay/rally/transcripts/path.lua:53
function gameplay_rally_transcripts_path:save() end

