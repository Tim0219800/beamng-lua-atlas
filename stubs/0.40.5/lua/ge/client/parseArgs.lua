---@meta
-- tim19Atlas stub generated from lua/ge/client/parseArgs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Parses the game's command-line arguments ($Game::argc / $Game::argv0…) and applies or stores the recognized options. Useful to launch BeamNG with -level, -vehicle, -lua, -luafile, etc.
--- Access: global `parseArgs`
---@class parseArgs
---@field args table Parsing result: keys vehicleConfig (string), useDefaultPc, translationScrambleDebug, enableAiRecordingForMissions (booleans). Reset to {} on each call of defaultParseArgs.
parseArgs = {}

--- Resets M.args then goes through all command-line arguments and applies each recognized option.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/parseArgs.lua:29
function parseArgs.defaultParseArgs() end

