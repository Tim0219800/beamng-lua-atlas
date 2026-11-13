---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/display.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_display` : `extensions.load("gameplay_drift_display")`, puis la globale `gameplay_drift_display`
---@class gameplay_drift_display
---@field dependencies table
gameplay_drift_display = {}

---Source : lua/ge/extensions/gameplay/drift/display.lua:494
function gameplay_drift_display.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/display.lua:70
---@param vehId any
function gameplay_drift_display.getIsScorePresentationActive(vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:56
function gameplay_drift_display.getScorePresentationDuration() end

---Source : lua/ge/extensions/gameplay/drift/display.lua:453
---@param data any
function gameplay_drift_display.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:171
---@param score any
function gameplay_drift_display.onDonutDriftScored(score) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:407
---@param vehId any
function gameplay_drift_display.onDriftCachedScoreReset(vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:143
---@param data any
function gameplay_drift_display.onDriftCompletedScored(data) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:463
---@param context any
function gameplay_drift_display.onDriftContextChanged(context) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:163
---@param vehId any
function gameplay_drift_display.onDriftCrash(vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:457
---@param value any
function gameplay_drift_display.onDriftDebugChanged(value) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:401
---@param vehId any
function gameplay_drift_display.onDriftPlVehReset(vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:396
---@param data any
function gameplay_drift_display.onDriftQuickMessageDisplay(data) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:436
---@param score any
---@param vehId any
function gameplay_drift_display.onDriftScoreWrappedUp(score, vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:167
---@param vehId any
function gameplay_drift_display.onDriftSpinout(vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:392
---@param data any
function gameplay_drift_display.onDriftSpotCompleted(data) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:432
---@param data any
function gameplay_drift_display.onDriftSpotFailed(data) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:480
function gameplay_drift_display.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drift/display.lua:411
function gameplay_drift_display.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/drift/display.lua:428
function gameplay_drift_display.onFreeroamDriftZoneNewHighscore() end

---Source : lua/ge/extensions/gameplay/drift/display.lua:186
---@param score any
function gameplay_drift_display.onHitPoleScored(score) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:176
---@param score any
function gameplay_drift_display.onNearPoleScored(score) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:442
---@param tierData any
function gameplay_drift_display.onNewDriftTierReached(tierData) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:447
function gameplay_drift_display.onSerialize() end

---Source : lua/ge/extensions/gameplay/drift/display.lua:181
---@param score any
function gameplay_drift_display.onTightDriftScored(score) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:381
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drift_display.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:423
---@param vehId any
function gameplay_drift_display.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/drift/display.lua:487
function gameplay_drift_display.reset() end

