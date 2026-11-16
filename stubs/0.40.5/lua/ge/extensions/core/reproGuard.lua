---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/reproGuard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Security guard for the v1/runRepro schema command: decides whether a decoded command line may be passed to run_repro.bat, based on an allowlist of glob patterns. The pure logic (isAllowed) is separated from reading the allowlist file (loadPatterns).
--- Access: extension `core_reproGuard`: `extensions.load("core_reproGuard")`, then the global `core_reproGuard`
---@class core_reproGuard
core_reproGuard = {}

--- Pure function: tests whether command satisfies the pattern list. Refuses an empty command, one with a forbidden character, an empty list, or one with a segment matching no pattern.
---Source: lua/ge/extensions/core/reproGuard.lua:64
---@param command string Decoded command line.
---@param patterns string[] Allowed glob patterns.
---@return boolean  true if allowed.
---@return string  'ok' or the reason for the refusal (empty command, forbidden shell metacharacter, empty allowlist, no command segments, segment not allowed: ...).
function core_reproGuard.isAllowed(command, patterns) end

--- Shortcut: loads the patterns from disk then calls isAllowed.
---Source: lua/ge/extensions/core/reproGuard.lua:106
---@param command string Command line.
---@return boolean  true if allowed.
---@return string  Reason.
function core_reproGuard.isCommandAllowed(command) end

--- Reads the allowed patterns from the allowlist JSON file. Logs an error and returns {} if the file is missing or malformed.
---Source: lua/ge/extensions/core/reproGuard.lua:95
---@return string[]  permissions.allow patterns, or {}.
function core_reproGuard.loadPatterns() end

