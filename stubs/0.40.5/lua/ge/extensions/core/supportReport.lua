---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/supportReport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sends a support report to the BeamNG server from the UI. send triggers Engine.SupportReport.send; the engine calls back onSupportReportSent with the support identifier (or an error). The identifier is kept for 15 minutes in settings/lastSupportReport.json, then forgotten. The state is published to the UI through the guihook 'SupportReportState'.
--- Access: extension `core_supportReport`: `extensions.load("core_supportReport")`, then the global `core_supportReport`
---@class core_supportReport
core_supportReport = {}

--- Load hook: re-reads the last saved report and forgets it if expired.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/supportReport.lua:60
function core_supportReport.onExtensionLoaded() end

--- Engine callback when sending finishes. If supportId is not empty, stores it (JSON file); otherwise stores the error and the outdated flag. Republishes the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/supportReport.lua:48
---@param supportId string Support identifier, '' on failure.
---@param err string Error message on failure.
---@param outdated boolean True if the game is too old to send a report (inferred from code).
function core_supportReport.onSupportReportSent(supportId, err, outdated) end

--- Forgets the expired report (deletes the file), then sends the current state to the UI (guihook SupportReportState).
---Source: lua/ge/extensions/core/supportReport.lua:28
function core_supportReport.requestState() end

--- Starts sending the report (Engine.SupportReport.send) if none is already in progress, then publishes the state.
---Source: lua/ge/extensions/core/supportReport.lua:39
function core_supportReport.send() end

