---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/cutCapture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capture object returned by the module constructor. Attributes: vehicle, fname, fname_transcripts, cut_id.
---@class gameplay_rally_cutCapture
local gameplay_rally_cutCapture = {}

--- Captures the vehicle's current state (incremental id, timestamp rallyUtil.getTime(), pos {x,y,z}, quat {x,y,z,w} computed from the direction/up vectors, steering) and writes it via writeCut.
---Source: lua/ge/extensions/gameplay/rally/cutCapture.lua:40
---@return integer  Identifier of the created cut.
function gameplay_rally_cutCapture:capture() end

--- Initializes: stores the vehicle, subscribes to changes of the 'steering' value (core_vehicleBridge) and computes the cuts.json and transcripts.json paths. The cut identifier restarts at 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/cutCapture.lua:12
---@param vehicle table Vehicle object (getId, getPosition, getDirectionVector...).
---@param missionDir string Mission folder, passed to rallyUtil.missionReccePath.
function gameplay_rally_cutCapture:init(vehicle, missionDir) end

--- Empties the cuts.json file (opens it for writing).
---Source: lua/ge/extensions/gameplay/rally/cutCapture.lua:22
function gameplay_rally_cutCapture:truncateCapturesFile() end

--- Empties the transcripts.json file.
---Source: lua/ge/extensions/gameplay/rally/cutCapture.lua:27
function gameplay_rally_cutCapture:truncateTranscriptsFile() end

--- Appends a JSON-encoded capture, followed by a newline, to cuts.json.
---Source: lua/ge/extensions/gameplay/rally/cutCapture.lua:32
---@param cutCapture table Serializable table (id, ts, pos, quat, steering).
function gameplay_rally_cutCapture:writeCut(cutCapture) end

