---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/skidpadTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Skidpad test extension: teleports a vehicle to the "skidpadSpawn" start point then makes the AI follow the circuit defined by the waypoints skidpadWP1 to skidpadWP4 (2 laps). Uses util_stepHandler to chain the steps. The level must contain these scene objects.
--- Access: extension `gameplay_skidpadTest`: `extensions.load("gameplay_skidpadTest")`, then the global `gameplay_skidpadTest`
---@class gameplay_skidpadTest
gameplay_skidpadTest = {}

--- Raises the cancel flag (no real effect, see notes).
---Source: lua/ge/extensions/gameplay/skidpadTest.lua:53
function gameplay_skidpadTest.cancelTest() end

--- Returns the test results (testResults).
---Source: lua/ge/extensions/gameplay/skidpadTest.lua:49
---@return table|nil  Always nil in this version (never filled).
function gameplay_skidpadTest.getData() end

--- Starts the sequence: safe teleport of the vehicle onto skidpadSpawn (orientation flipped 180°), wait 0.2 s, then ai.driveUsingPath on the waypoints skidpadWP1..4, WP1 with noOfLaps = 2 and aggression = 1.
---Source: lua/ge/extensions/gameplay/skidpadTest.lua:44
---@param vehId integer Identifier of the vehicle to test.
function gameplay_skidpadTest.startTest(vehId) end

