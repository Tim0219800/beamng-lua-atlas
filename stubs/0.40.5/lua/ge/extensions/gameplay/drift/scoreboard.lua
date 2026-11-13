---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/scoreboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_scoreboard` : `extensions.load("gameplay_drift_scoreboard")`, puis la globale `gameplay_drift_scoreboard`
---@class gameplay_drift_scoreboard
gameplay_drift_scoreboard = {}

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:119
function gameplay_drift_scoreboard.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:198
function gameplay_drift_scoreboard.getDriftEventStats() end

--- getting the performance stats is a function  as opposed to as a table because we don't want to calculate avrgs every frame i guess
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:148
function gameplay_drift_scoreboard.getPerformanceStats() end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:194
function gameplay_drift_scoreboard.getTiersStats() end

--- when single drift done
---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:87
---@param data any
function gameplay_drift_scoreboard.onDriftActiveDataFinished(data) end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:68
---@param data any
function gameplay_drift_scoreboard.onDriftCompletedScored(data) end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:206
function gameplay_drift_scoreboard.onDriftCrash() end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:53
---@param data any
function gameplay_drift_scoreboard.onDriftQuickMessageReached(data) end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:210
function gameplay_drift_scoreboard.onDriftSpinout() end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:44
function gameplay_drift_scoreboard.onUpdate() end

---Source : lua/ge/extensions/gameplay/drift/scoreboard.lua:104
function gameplay_drift_scoreboard.reset() end

