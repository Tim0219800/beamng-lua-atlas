---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loader of a rally's recce "cuts". A cut is a position marker where the co-driver made a voice recording during the recce. The module reads the mission's cuts file and attaches to it, if they exist, the transcriptions from the transcripts file. It is an extension (gameplay_rally_recce_cutsRecording), used by the recce class.
--- Access: extension `gameplay_rally_recce_cutsRecording`: `extensions.load("gameplay_rally_recce_cutsRecording")`, then the global `gameplay_rally_recce_cutsRecording`
---@class gameplay_rally_recce_cutsRecording
gameplay_rally_recce_cutsRecording = {}

--- Loads the mission's cuts with their transcriptions. Each line of the cuts file becomes an object whose pos is converted to vec3 and quat to quat, with a transcript field added ({error, text} if a transcription exists, otherwise an empty table).
---Source: lua/ge/extensions/gameplay/rally/recce/cutsRecording.lua:36
---@param missionDir string Mission folder containing the recce files
---@return table[]  Array of cut objects; empty array (not nil) if the cuts file does not exist
function gameplay_rally_recce_cutsRecording.load(missionDir) end

