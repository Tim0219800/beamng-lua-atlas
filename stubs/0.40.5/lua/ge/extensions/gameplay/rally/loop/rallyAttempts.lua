---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_loop_rallyAttempts` : `extensions.load("gameplay_rally_loop_rallyAttempts")`, puis la globale `gameplay_rally_loop_rallyAttempts`
---@class gameplay_rally_loop_rallyAttempts
gameplay_rally_loop_rallyAttempts = {}

--- Public API: Create and save an abandon attempt
---  @param dnfType: Type of DNF - "restart" or "abandon"
---  @return totalChange: The aggregate change result from the attempt
---Source : lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua:85
---@param mgr any
---@param dnfType any
function gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForDnf(mgr, dnfType) end

--- Public API: Create and save a normal attempt
---  @return totalChange: The aggregate change result from the attempt
---  @return attempt: The created attempt object
---Source : lua/ge/extensions/gameplay/rally/loop/rallyAttempts.lua:66
---@param mgr any
function gameplay_rally_loop_rallyAttempts.createRallyLoopAttemptForFinish(mgr) end

