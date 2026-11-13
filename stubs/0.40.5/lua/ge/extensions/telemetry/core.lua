---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_core` : `extensions.load("telemetry_core")`, puis la globale `telemetry_core`
---@class telemetry_core
---@field dependencies table
telemetry_core = {}

--- Answers whether the event was stored, so a caller that keeps its own record of what it
---  sent can tell a dropped event from a delivered one
---Source : lua/ge/extensions/telemetry/core.lua:75
---@param event any
function telemetry_core.addEvent(event) end

---Source : lua/ge/extensions/telemetry/core.lua:479
---@param activityName any
---@param data any
function telemetry_core.endActivity(activityName, data) end

--- A local only run keeps its sessions and survey state apart, so the reporter of a normal
---  run never uploads them and they never stand in for a survey that was really sent
---Source : lua/ge/extensions/telemetry/core.lua:30
function telemetry_core.getDataFolder() end

--- The telemetry runs this session collects for. Set before any tracker loads.
---Source : lua/ge/extensions/telemetry/core.lua:457
function telemetry_core.getRunIds() end

--- Seconds since the game started, used by trackers to measure durations
---Source : lua/ge/extensions/telemetry/core.lua:452
function telemetry_core.getRunTime() end

--- The file of the running session. The reporter must not upload or delete this one.
---Source : lua/ge/extensions/telemetry/core.lua:40
function telemetry_core.getSessionFile() end

--- Identifies this run inside the report. Unrelated to the account session token, it is
---  a timestamp plus random bytes and carries no identity. Reported so a re-upload after
---  a lost response can be recognized as a duplicate instead of counted twice.
---Source : lua/ge/extensions/telemetry/core.lua:47
function telemetry_core.getSessionId() end

---Source : lua/ge/extensions/telemetry/core.lua:123
---@param platform any
function telemetry_core.isPlatformSupported(platform) end

---Source : lua/ge/extensions/telemetry/core.lua:461
function telemetry_core.isSessionContinued() end

---Source : lua/ge/extensions/telemetry/core.lua:436
function telemetry_core.onExit() end

--- callbacks
---Source : lua/ge/extensions/telemetry/core.lua:403
---@param previousSession any
function telemetry_core.onExtensionLoaded(previousSession) end

---Source : lua/ge/extensions/telemetry/core.lua:436
function telemetry_core.onExtensionUnloaded() end

---Source : lua/ge/extensions/telemetry/core.lua:443
---@param reason any
function telemetry_core.onSerialize(reason) end

---Source : lua/ge/extensions/telemetry/core.lua:421
function telemetry_core.onSettingsChanged() end

--- Duration tracking
---Source : lua/ge/extensions/telemetry/core.lua:473
---@param activityName any
---@param data any
function telemetry_core.startActivity(activityName, data) end

--- Flush buffered events to disk, so they survive a crash from this point on
---Source : lua/ge/extensions/telemetry/core.lua:466
function telemetry_core.triggerReportWrite() end

