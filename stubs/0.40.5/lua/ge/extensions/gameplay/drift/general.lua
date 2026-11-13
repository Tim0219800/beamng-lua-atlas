---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_general` : `extensions.load("gameplay_drift_general")`, puis la globale `gameplay_drift_general`
---@class gameplay_drift_general
---@field dependencies table
gameplay_drift_general = {}

---Source : lua/ge/extensions/gameplay/drift/general.lua:73
function gameplay_drift_general.clear() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:196
function gameplay_drift_general.getChallengeMode() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:179
function gameplay_drift_general.getContext() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:183
function gameplay_drift_general.getDriftDebugInfo() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:187
---@param extName any
function gameplay_drift_general.getExtensionDebug(extName) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:192
function gameplay_drift_general.getFrozen() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:171
function gameplay_drift_general.getGeneralDebug() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:200
function gameplay_drift_general.getMultiplayerEnabled() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:175
function gameplay_drift_general.getPaused() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:204
---@param status any
---@param mission any
function gameplay_drift_general.onAnyMissionChanged(status, mission) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:427
function gameplay_drift_general.onClientEndMission() end

--- hook fired when level is loaded (cough)
---Source : lua/ge/extensions/gameplay/drift/general.lua:393
function gameplay_drift_general.onClientPostStartMission() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:409
---@param data any
function gameplay_drift_general.onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:415
function gameplay_drift_general.onExtensionLoaded() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:419
---@param old any
---@param new any
function gameplay_drift_general.onMPSessionChanged(old, new) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:401
function gameplay_drift_general.onSerialize() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:385
function gameplay_drift_general.onUpdate() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:217
---@param vid any
function gameplay_drift_general.onVehicleResetted(vid) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:78
function gameplay_drift_general.reset() end

---Source : lua/ge/extensions/gameplay/drift/general.lua:136
---@param newChallengeMode any
function gameplay_drift_general.setChallengeMode(newChallengeMode) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:147
---@param newContext any
function gameplay_drift_general.setContext(newContext) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:163
---@param value any
function gameplay_drift_general.setDebug(value) end

---Source : lua/ge/extensions/gameplay/drift/general.lua:143
---@param newPaused any
function gameplay_drift_general.setPaused(newPaused) end

