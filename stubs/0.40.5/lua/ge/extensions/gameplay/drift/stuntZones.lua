---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/stuntZones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_stuntZones` : `extensions.load("gameplay_drift_stuntZones")`, puis la globale `gameplay_drift_stuntZones`
---@class gameplay_drift_stuntZones
---@field dependencies table
gameplay_drift_stuntZones = {}

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:215
function gameplay_drift_stuntZones.clear() end

--- INTERNAL
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:299
---@param id any
function gameplay_drift_stuntZones.clearStuntZone(id) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:63
---@param cooldownPerc any
---@param filledPerc any
---@param t any
function gameplay_drift_stuntZones.getDecalColor(cooldownPerc, filledPerc, t) end

--- TEST
---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:333
function gameplay_drift_stuntZones.getDrawLines() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:349
function gameplay_drift_stuntZones.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:337
function gameplay_drift_stuntZones.getGreenColor() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:353
---@param linePos any
function gameplay_drift_stuntZones.getLineThickness(linePos) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:345
function gameplay_drift_stuntZones.getRedColor() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:312
function gameplay_drift_stuntZones.getStuntZones() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:341
function gameplay_drift_stuntZones.getWhiteColor() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:48
---@param max any
function gameplay_drift_stuntZones.increaseDecalPool(max) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:361
---@param data any
function gameplay_drift_stuntZones.onAnyStuntZoneAccomplished(data) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:357
function gameplay_drift_stuntZones.onDriftDebugChanged() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:289
---@param isDrifting any
function gameplay_drift_stuntZones.onDriftStatusChanged(isDrifting) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:316
function gameplay_drift_stuntZones.onExtensionUnloaded() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:320
function gameplay_drift_stuntZones.onSerialize() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:167
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function gameplay_drift_stuntZones.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:325
---@param vehId any
function gameplay_drift_stuntZones.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:209
function gameplay_drift_stuntZones.reset() end

---Source : lua/ge/extensions/gameplay/drift/stuntZones.lua:224
---@param zones any
function gameplay_drift_stuntZones.setStuntZones(zones) end

