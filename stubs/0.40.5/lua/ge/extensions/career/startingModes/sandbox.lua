---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/startingModes/sandbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career starting mode "sandbox" (tier minor, order 400): 50 million money, "everything unlocked" according to its description. Description table loaded by career/career.lua, not an extension. The field ignore = true indicates that this mode is ignored (not offered) in this version.
--- Access: extension `career_startingModes_sandbox`: `extensions.load("career_startingModes_sandbox")`, then the global `career_startingModes_sandbox`
---@class career_startingModes_sandbox
---@field description string "Start with 50 million bucks and everthing unlocked." (spelling mistake in the code).
---@field id string "sandbox".
---@field ignore boolean true.
---@field image string images/career/start_sandbox.jpg.
---@field order number 400.
---@field tier string "minor".
---@field title string "Sandbox".
career_startingModes_sandbox = {}

--- Initializes money to 50,000,000.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/sandbox.lua:9
---@param playerAttributes table Module career_modules_playerAttributes.
function career_startingModes_sandbox.initPlayerAttributes(playerAttributes) end

--- Teleports the player to (-808.56, 898.56, 75.51) and sets their orientation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/startingModes/sandbox.lua:12
function career_startingModes_sandbox.setupInventory() end

