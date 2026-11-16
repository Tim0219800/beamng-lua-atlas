---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/testJSONFilesSyntax.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Diagnostic tool: on load, it walks the game's whole virtual file system (root '/') looking for *.jbeam, *.pc and *.json files, then decodes them one by one with the jsonDebug library. Syntax errors and warnings are written to the log. Useful to a modder to find an invalid JSON or jbeam.
--- Access: extension `util_testJSONFilesSyntax`: `extensions.load("util_testJSONFilesSyntax")`, then the global `util_testJSONFilesSyntax`
---@class util_testJSONFilesSyntax
util_testJSONFilesSyntax = {}

--- Called on extension load. Recursively lists the .jbeam, .pc and .json files, reads them with readFile and decodes them with jsonDebug.decode under xpcall; logs errors (E) and warnings (W) under the tag 'jsonDecode'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/testJSONFilesSyntax.lua:22
function util_testJSONFilesSyntax.onExtensionLoaded() end

