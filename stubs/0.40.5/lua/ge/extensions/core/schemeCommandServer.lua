---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/schemeCommandServer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Old local UDP server (127.0.0.1:22137) that received the commands of the 'beamng:' URL scheme and passed them to commandhandler.onSchemeCommand. The code is marked OBSOLETE: the default scheme handler is now a Windows pipe.
--- Access: extension `core_schemeCommandServer`: `extensions.load("core_schemeCommandServer")`, then the global `core_schemeCommandServer`
---@class core_schemeCommandServer
core_schemeCommandServer = {}

--- First-update hook: opens the UDP socket 127.0.0.1:22137 (non-blocking). Logs a warning if the opening fails.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/schemeCommandServer.lua:11
---@return boolean|nil  false if the socket could not be opened.
function core_schemeCommandServer.onFirstUpdate() end

--- Update hook: reads a UDP packet; if the text starts with 'beamng:', calls commandhandler.onSchemeCommand with the rest.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/schemeCommandServer.lua:22
function core_schemeCommandServer.onUpdate() end

