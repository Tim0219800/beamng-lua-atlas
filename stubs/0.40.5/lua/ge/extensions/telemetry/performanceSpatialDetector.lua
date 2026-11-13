---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `telemetry_performanceSpatialDetector` : `extensions.load("telemetry_performanceSpatialDetector")`, puis la globale `telemetry_performanceSpatialDetector`
---@class telemetry_performanceSpatialDetector
telemetry_performanceSpatialDetector = {}

---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:107
---@param config any
function telemetry_performanceSpatialDetector.new(config) end

--- Classe locale `Detector` de lua/ge/extensions/telemetry/performanceSpatialDetector.lua
---@class telemetry_performanceSpatialDetector_Detector
local telemetry_performanceSpatialDetector_Detector = {}

---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:58
---@param nowMs any
function telemetry_performanceSpatialDetector_Detector:canReport(nowMs) end

---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:62
---@param nowMs any
function telemetry_performanceSpatialDetector_Detector:finish(nowMs) end

---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:53
function telemetry_performanceSpatialDetector_Detector:reset() end

---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:66
---@param nowMs any
---@param fps any
---@param frameMs any
---@param absoluteAllowed any
function telemetry_performanceSpatialDetector_Detector:update(nowMs, fps, frameMs, absoluteAllowed) end

