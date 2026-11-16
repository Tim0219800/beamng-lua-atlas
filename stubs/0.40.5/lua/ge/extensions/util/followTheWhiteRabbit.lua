---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/followTheWhiteRabbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small easter egg (Matrix reference): once loaded, the extension creates a "neo" console context, activates it and displays a mini text adventure. In this context, the "throttle" command answers "You crash. Game over."; other commands are ignored.
--- Access: extension `util_followTheWhiteRabbit`: `extensions.load("util_followTheWhiteRabbit")`, then the global `util_followTheWhiteRabbit`
---@class util_followTheWhiteRabbit
util_followTheWhiteRabbit = {}

--- Hook called when a command is run in the console. Ignores any context other than 'neo'; for the 'throttle' command, prints "You crash. Game over.".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/followTheWhiteRabbit.lua:18
---@param context string Active console context
---@param cmd string Command entered
function util_followTheWhiteRabbit.onConsoleExecuteCommand(context, cmd) end

--- Called when the extension loads: disables console log timestamps, adds and activates the 'neo' context then displays the intro text.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/followTheWhiteRabbit.lua:9
function util_followTheWhiteRabbit.onExtensionLoaded() end

