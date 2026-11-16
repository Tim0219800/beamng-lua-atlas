---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/recce.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Recce object returned by the module's constructor.
---@class gameplay_rally_recce
local gameplay_rally_recce = {}

--- Sets self.driveline and self.cuts back to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/recce.lua:50
function gameplay_rally_recce:_resetState() end

--- Converts the cuts into pacenote tables for a notebook: creates a Snaproad on the driveline, places for each cut a "corner end" waypoint as close as possible to the cut and a "corner start" set back by about 2 times the default radius, names the note (Import_<id> ... or Pacenote ...) and puts the transcription in it in the default co-driver language.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:165
---@param notebook table Target notebook (nextImportIdent, getNextUniqueIdentifier)
---@return table[]|nil  List of pacenote tables; nil if driveline/cuts not loaded
function gameplay_rally_recce:createPacenotesData(notebook) end

--- Draws each cut as a small car, with its transcription text.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:95
function gameplay_rally_recce:drawDebugCuts() end

--- Draws the driveline (via PointList:drawDebug) then the cuts. Does nothing without a driveline.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:89
---@param drawLabels boolean Show the labels of the driveline points
---@param mouseInfo any Not used in the function body
function gameplay_rally_recce:drawDebugRecce(drawLabels, mouseInfo) end

--- Draws with debugDrawer a schematic car (4.4 x 1.8 x 1.6 m, four wheels as spheres, body as a prism) centered on pos and oriented by quat; displays txt behind it if provided.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:106
---@param pos vec3 Center of the car
---@param quat quat Orientation (the front is the local +Y axis)
---@param txt string|nil Text to display (transcription)
function gameplay_rally_recce:drawLittleCar(pos, quat, txt) end

--- Indicates whether driveline and cuts were successfully loaded by loadDrivelineAndCuts.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:46
---@return boolean  true if both are loaded
function gameplay_rally_recce:drivelineAndCutsLoaded() end

--- Initializes the object: stores missionDir, marks driveline/cuts as not loaded and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/recce.lua:36
---@param missionDir string Mission folder
function gameplay_rally_recce:init(missionDir) end

--- Loads the cuts with their transcriptions into self.cuts.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:75
---@return boolean  true if there is at least one cut
function gameplay_rally_recce:loadCuts() end

--- Loads the driveline (PointList) into self.driveline.
---Source: lua/ge/extensions/gameplay/rally/recce.lua:80
---@return boolean  false if the file is absent or invalid
function gameplay_rally_recce:loadDriveline() end

--- Loads the driveline then the cuts, logs a warning for each if missing (normal for a new recce).
---Source: lua/ge/extensions/gameplay/rally/recce.lua:55
---@return boolean  always true
function gameplay_rally_recce:loadDrivelineAndCuts() end

