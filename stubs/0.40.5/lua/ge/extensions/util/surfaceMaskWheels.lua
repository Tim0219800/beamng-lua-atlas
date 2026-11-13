---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/surfaceMaskWheels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_surfaceMaskWheels` : `extensions.load("util_surfaceMaskWheels")`, puis la globale `util_surfaceMaskWheels`
---@class util_surfaceMaskWheels
---@field dependencies table
---@field enabled boolean
util_surfaceMaskWheels = {}

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:448
function util_surfaceMaskWheels.clear() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:538
function util_surfaceMaskWheels.cycleDebug() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:512
function util_surfaceMaskWheels.getPerformanceStats() end

--- Surface-mask service used by other extensions (e.g. util_lawnMower): the clipmap lifetime
---  (storage, centering, clear) is owned here, so consumers stamp/center through these instead of
---  poking the SurfaceMaskClipmap global directly. isReady lets a consumer cheaply skip its work.
---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:455
function util_surfaceMaskWheels.isReady() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:463
---@param x any
---@param y any
---@param radius any
---@param flatten any
---@param mark any
function util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:467
---@param x1 any
---@param y1 any
---@param x2 any
---@param y2 any
---@param width any
---@param flatten any
---@param mark any
function util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:427
function util_surfaceMaskWheels.onClientStartMission() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:492
---@param data any
function util_surfaceMaskWheels.onDeserialized(data) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:421
function util_surfaceMaskWheels.onExtensionLoaded() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:391
---@param dtReal any
---@param dtSim any
function util_surfaceMaskWheels.onPreRender(dtReal, dtSim) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:471
function util_surfaceMaskWheels.onSerialize() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:431
---@param vehId any
function util_surfaceMaskWheels.onVehicleDestroyed(vehId) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:435
---@param vehId any
function util_surfaceMaskWheels.onVehicleResetted(vehId) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:459
---@param x any
---@param y any
function util_surfaceMaskWheels.setCenter(x, y) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:534
---@param enabled any
function util_surfaceMaskWheels.setDebug(enabled) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:527
---@param mode any
function util_surfaceMaskWheels.setDebugMode(mode) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:554
---@param radius any
function util_surfaceMaskWheels.setDebugPageRadius(radius) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:439
---@param enabled any
function util_surfaceMaskWheels.setEnabled(enabled) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:550
---@param width any
function util_surfaceMaskWheels.setMowerWidth(width) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:542
---@param enabled any
function util_surfaceMaskWheels.setMowingEnabled(enabled) end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:444
function util_surfaceMaskWheels.toggle() end

---Source : lua/ge/extensions/util/surfaceMaskWheels.lua:546
function util_surfaceMaskWheels.toggleMowing() end

