---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleRadarApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua part of the "vehicle radar" interface app (vehicle proximity radar). Every GUI frame, it selects the visible vehicles near the player vehicle, computes for each its center, size, orientation, type (vehicle, traffic, parked, trailer), paint color, coupling points (fifthwheel) and minimal distance between oriented bounding boxes (OOBB), then sends it all in the 'vehicleRadar' stream. It loads and saves the app settings.
--- Access: extension `ui_vehicleRadarApp`: `extensions.load("ui_vehicleRadarApp")`, then the global `ui_vehicleRadarApp`
---@class ui_vehicleRadarApp
ui_vehicleRadarApp = {}

--- Hook called on load: reads the settings file and sends the settings to the UI via 'VehicleRadarSettingsLoaded'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleRadarApp.lua:58
function ui_vehicleRadarApp.onExtensionLoaded() end

--- Hook called every GUI frame: builds {playerVehicleId, playerVehicleSpeed, objects} and sends it via guihooks.queueStream('vehicleRadar', data). Objects are keyed by vehicle id.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleRadarApp.lua:153
---@param dtReal number Real frame time (s).
---@param dtSim number Simulated frame time (s).
---@param dtRaw number Raw frame time (s).
function ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle spawns: clears the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleRadarApp.lua:296
function ui_vehicleRadarApp.onVehicleSpawned() end

--- Hook called when the controlled vehicle changes: clears the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/vehicleRadarApp.lua:292
function ui_vehicleRadarApp.onVehicleSwitched() end

--- Modifies an existing setting and saves the settings file. Does nothing if the key does not exist or if the value is unchanged.
---Source: lua/ge/extensions/ui/vehicleRadarApp.lua:63
---@param key string Setting name (rangeMeters, rangeSeconds, foreAftOffsetPct, rangeType, minimalLook, coloredCars).
---@param value any New value.
function ui_vehicleRadarApp.updateSetting(key, value) end

---@type number
i = nil
