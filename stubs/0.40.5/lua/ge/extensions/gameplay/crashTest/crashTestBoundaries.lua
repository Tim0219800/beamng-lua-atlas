---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the zone bounds of the collision test scenario (crash test). Loads a .sites.json file of the mission (bounds.sites.json, or boundsStep<id>.sites.json if the step has its own file) and checks every frame whether the player's vehicle is outside all the zones. If so, it calls gameplay_crashTest_scenarioManager.onPlayerOutOfBounds(). Also draws the zones in white, or in flashing red when the player is outside.
--- Access: extension `gameplay_crashTest_crashTestBoundaries`: `extensions.load("gameplay_crashTest_crashTestBoundaries")`, then the global `gameplay_crashTest_crashTestBoundaries`
---@class gameplay_crashTest_crashTestBoundaries
gameplay_crashTest_crashTestBoundaries = {}

--- Disables the bounds (equivalent to setParameters without filePath).
---Source: lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:96
function gameplay_crashTest_crashTestBoundaries.deactivateBounds() end

--- Hook called at the start of a crash test step: loads this step's bounds file (or bounds.sites.json by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:92
---@param stepData table Step data: id, hasStepBoundsFile.
function gameplay_crashTest_crashTestBoundaries.onNewCrashTestStep(stepData) end

--- Hook called every frame: tests whether the player vehicle is out of bounds, notifies scenarioManager if so and draws the bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:64
function gameplay_crashTest_crashTestBoundaries.onUpdate() end

--- Stores a debug flag (not used elsewhere in the file).
---Source: lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:75
---@param debug boolean Debug flag.
function gameplay_crashTest_crashTestBoundaries.setDebug(debug) end

--- Loads the bounds zones from a sites file and finalizes them. Without filePath, removes the bounds and sets isPlayerOutOfBounds back to false.
---Source: lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:16
---@param params table|nil Table with filePath (string): path of the .sites.json file; drawBoundsWhenNear_ (see notes).
function gameplay_crashTest_crashTestBoundaries.setParameters(params) end

