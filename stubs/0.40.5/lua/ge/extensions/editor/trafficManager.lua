---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_trafficManager` : `extensions.load("editor_trafficManager")`, puis la globale `editor_trafficManager`
---@class editor_trafficManager
---@field assertLevel boolean
---@field debugMode boolean
editor_trafficManager = {}

---Source : lua/ge/extensions/editor/trafficManager.lua:603
function editor_trafficManager.disableSimulation() end

---Source : lua/ge/extensions/editor/trafficManager.lua:586
function editor_trafficManager.enableSimulation() end

---Source : lua/ge/extensions/editor/trafficManager.lua:2305
function editor_trafficManager.getSessionData() end

---Source : lua/ge/extensions/editor/trafficManager.lua:2088
---@param filePath any
function editor_trafficManager.loadSession(filePath) end

---Source : lua/ge/extensions/editor/trafficManager.lua:2554
---@param data any
function editor_trafficManager.onDeserialized(data) end

---Source : lua/ge/extensions/editor/trafficManager.lua:2341
function editor_trafficManager.onEditorGui() end

---Source : lua/ge/extensions/editor/trafficManager.lua:2566
function editor_trafficManager.onEditorInitialized() end

---Source : lua/ge/extensions/editor/trafficManager.lua:2549
function editor_trafficManager.onSerialize() end

---Source : lua/ge/extensions/editor/trafficManager.lua:2423
---@param dt any
---@param dtSim any
function editor_trafficManager.onUpdate(dt, dtSim) end

---Source : lua/ge/extensions/editor/trafficManager.lua:2526
---@param vehId any
function editor_trafficManager.onVehicleResetted(vehId) end

---Source : lua/ge/extensions/editor/trafficManager.lua:2513
---@param vehId any
function editor_trafficManager.onVehicleSpawned(vehId) end

---Source : lua/ge/extensions/editor/trafficManager.lua:2557
function editor_trafficManager.onWindowMenuItem() end

---Source : lua/ge/extensions/editor/trafficManager.lua:2212
---@param filePath any
function editor_trafficManager.saveSession(filePath) end

