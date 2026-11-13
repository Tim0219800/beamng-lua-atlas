---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_vehicleSetup` : `extensions.load("util_screenshotCreator_vehicleSetup")`, puis la globale `util_screenshotCreator_vehicleSetup`
---@class util_screenshotCreator_vehicleSetup
---@field dependencies table
util_screenshotCreator_vehicleSetup = {}

--- probed from above the box: props with buried nodes (bollards, posts) put the box bottom under the floor,
---  where the short probe of getGroundHeight misses the floor and reports the buried bottom instead
---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:46
---@param bb any
function util_screenshotCreator_vehicleSetup.getFloorHeight(bb) end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:29
---@param position any
function util_screenshotCreator_vehicleSetup.getGroundHeight(position) end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:96
---@param vehicle any
function util_screenshotCreator_vehicleSetup.getResetTransform(vehicle) end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:89
function util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform() end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:149
---@param vehicleId any
function util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId) end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:102
---@param vehicle any
---@param configName any
---@param fallbackPosition any
---@param fallbackRotation any
function util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation) end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:143
---@param vehicle any
---@param enabled any
function util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled) end

---Source : lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua:135
---@param modelName any
---@param configName any
---@param options any
function util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options) end

