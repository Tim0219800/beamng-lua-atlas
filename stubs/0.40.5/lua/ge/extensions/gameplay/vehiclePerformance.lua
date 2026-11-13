---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_vehiclePerformance` : `extensions.load("gameplay_vehiclePerformance")`, puis la globale `gameplay_vehiclePerformance`
---@class gameplay_vehiclePerformance
gameplay_vehiclePerformance = {}

--- Returns a PerformanceIndexSticker-shaped table for a class-only requirement.
---  Shape mirrors getClassFromData: { class = { name, description, minPI }, performanceIndex }.
---  The `isThreshold` flag tells the UI to render this as a minimum threshold (>=).
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:150
---@param name any
function gameplay_vehiclePerformance.buildClassRequirement(name) end

---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:48
---@param testData any
function gameplay_vehiclePerformance.getAggregateScores(testData) end

--- Returns the row from `vehicleClasses` matching the given letter, or nil.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:131
---@param name any
function gameplay_vehiclePerformance.getClassByName(name) end

---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:123
---@param model any
---@param configName any
function gameplay_vehiclePerformance.getClassFromConfig(model, configName) end

--- Reads the class/PI already computed and saved by the automated performance test
---  (config["Performance Data"]). Falls back to computing it live from config["Drag Times"]
---  for configs that predate/lack that saved value.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:99
---@param configTable any
function gameplay_vehiclePerformance.getClassFromConfigTable(configTable) end

---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:85
---@param testData any
function gameplay_vehiclePerformance.getClassFromData(testData) end

---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:116
---@param vehId any
function gameplay_vehiclePerformance.getClassFromVehId(vehId) end

---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:139
function gameplay_vehiclePerformance.getClassNames() end

--- Picks the spec of the "default" vehicle implied by a mission's
---  `setupModules.vehicles` block (i.e. the option that the mission settings UI
---  would initially pre-select). Returns one of:
---    { kind = "player" }                              -- the player's own vehicle
---    { kind = "preset", model = ..., config = ... }   -- a preset config from the mission
---    nil                                              -- no default available
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:166
---@param setupModule any
function gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule) end

