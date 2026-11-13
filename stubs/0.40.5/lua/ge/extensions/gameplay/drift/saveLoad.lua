---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/saveLoad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_drift_saveLoad` : `extensions.load("gameplay_drift_saveLoad")`, puis la globale `gameplay_drift_saveLoad`
---@class gameplay_drift_saveLoad
gameplay_drift_saveLoad = {}

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:17
function gameplay_drift_saveLoad.clearCache() end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:45
---@param spotId any
function gameplay_drift_saveLoad.getDriftSpotById(spotId) end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:50
function gameplay_drift_saveLoad.getDriftSpotsById() end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:119
---@param dir any
function gameplay_drift_saveLoad.getPreviewWithFallback(dir) end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:132
function gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap() end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:142
---@param fileName any
function gameplay_drift_saveLoad.loadDriftData(fileName) end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:13
function gameplay_drift_saveLoad.onCareerActive() end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:27
---@param currentSavePath any
function gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/gameplay/drift/saveLoad.lua:36
---@param spotId any
function gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId) end

