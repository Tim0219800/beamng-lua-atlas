---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/testing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Race test window (windowDescription = 'General'). Instantiated with init(raceEditor). Fields: race (gameplay/race/race object), state ('setup', 'race' or 'stopped'), path.
---@class editor_raceEditor_testing
local editor_raceEditor_testing = {}

--- Draws the UI according to the state (setup, race with race update, stopped).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:44
---@param dt number Simulation time delta (seconds).
function editor_raceEditor_testing:draw(dt) end

--- Displays the first vehicle's event log via race:inDrawEventlog.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:154
function editor_raceEditor_testing:drawEventLog() end

--- In-race UI: Stop button (aborts the race for all vehicles and reopens the editor), State (state dump), Recover (requestRecover), then times and log.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:110
---@param dt number|nil Not used.
function editor_raceEditor_testing:drawRace(dt) end

--- Setup UI: lap count, "Move to <start>" buttons, Start, Start Rolling, move all vehicles to the start positions, AI tests.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:55
function editor_raceEditor_testing:drawSetup() end

--- After-stop UI: Restart button (back to setup), times and log.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:131
function editor_raceEditor_testing:drawStopped() end

--- Displays the first vehicle's times via race:inDrawTimes; a click toggles the detailed display.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:142
function editor_raceEditor_testing:drawTimes() end

--- Stores raceEditor, startIndex = -1 and the 'setup' state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:9
---@param raceEditor table Module editor_raceEditor (uses show()).
function editor_raceEditor_testing:init(raceEditor) end

--- Sets the race path to test.
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:15
---@param path table gameplay/race/path object.
function editor_raceEditor_testing:setPath(path) end

--- Creates a new race object for the path (keeping the previous lap count, otherwise 1), enables useDebugDraw, assigns the player vehicle and switches to the 'setup' state.
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:19
function editor_raceEditor_testing:setupRace() end

--- Starts the race: applies config.rollingStart to the path, assigns the vehicles, calls race:startRace(), switches to the 'race' state and, if enableAi, starts the AI on each vehicle (relative speed 0.8).
---Source: lua/ge/extensions/editor/raceEditor/testing.lua:29
---@param vehIds table<integer, integer>|nil Vehicle IDs; by default the player vehicle (be:getPlayerVehicleID(0)).
---@param enableAi boolean true to have the AI drive the vehicles.
---@param rollingStart boolean true for a rolling start (rollingStart).
function editor_raceEditor_testing:startRace(vehIds, enableAi, rollingStart) end

