---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceMetrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_performanceMetrics` : `extensions.load("telemetry_performanceMetrics")`, puis la globale `telemetry_performanceMetrics`
---@class telemetry_performanceMetrics
telemetry_performanceMetrics = {}

--- A ceiling the player chose. Without it a reading held at 60 looks like a machine that
---  cannot reach it.
---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:23
function telemetry_performanceMetrics.getLimitedBy() end

---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:17
function telemetry_performanceMetrics.isFocused() end

---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:12
---@param name any
function telemetry_performanceMetrics.readAvailable(name) end

---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:7
---@param name any
function telemetry_performanceMetrics.readNumber(name) end

