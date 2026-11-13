---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/painting.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_painting` : `extensions.load("career_modules_painting")`, puis la globale `career_modules_painting`
---@class career_modules_painting
---@field dependencies table
career_modules_painting = {}

---Source : lua/ge/extensions/career/modules/painting.lua:186
function career_modules_painting.apply() end

--- Restores vehicle/camera/input state. Does NOT navigate; the router owns the
---  transition back to career.computer. Safe to call from the UI on unmount.
---Source : lua/ge/extensions/career/modules/painting.lua:128
function career_modules_painting.cleanup() end

---Source : lua/ge/extensions/career/modules/painting.lua:153
---@param _closeMenuAfterSaving any
function career_modules_painting.close(_closeMenuAfterSaving) end

---Source : lua/ge/extensions/career/modules/painting.lua:282
function career_modules_painting.getFactoryPaint() end

---Source : lua/ge/extensions/career/modules/painting.lua:75
function career_modules_painting.getPaintData() end

---Source : lua/ge/extensions/career/modules/painting.lua:45
function career_modules_painting.getPrimerColor() end

---Source : lua/ge/extensions/career/modules/painting.lua:215
---@param menuData any
---@param computerFunctions any
function career_modules_painting.onComputerAddFunctions(menuData, computerFunctions) end

--- Router lifecycle: re-emit the painting data once the destination view has mounted.
---Source : lua/ge/extensions/career/modules/painting.lua:296
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_painting.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/painting.lua:300
function career_modules_painting.onUIOpened() end

---Source : lua/ge/extensions/career/modules/painting.lua:165
function career_modules_painting.onVehicleSaveFinished() end

---Source : lua/ge/extensions/career/modules/painting.lua:288
function career_modules_painting.sendPaintingDataToUI() end

---Source : lua/ge/extensions/career/modules/painting.lua:258
---@param paints any
---@param paintOptions any
---@param partName any
function career_modules_painting.setPaints(paints, paintOptions, partName) end

---Source : lua/ge/extensions/career/modules/painting.lua:105
---@param _inventoryId any
---@param _originComputerId any
function career_modules_painting.start(_inventoryId, _originComputerId) end

