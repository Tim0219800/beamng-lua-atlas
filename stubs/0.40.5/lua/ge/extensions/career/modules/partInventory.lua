---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/partInventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_partInventory` : `extensions.load("career_modules_partInventory")`, puis la globale `career_modules_partInventory`
---@class career_modules_partInventory
---@field dependencies table
career_modules_partInventory = {}

---Source : lua/ge/extensions/career/modules/partInventory.lua:121
---@param part any
function career_modules_partInventory.addPartToInventory(part) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:508
function career_modules_partInventory.closeMenu() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:548
function career_modules_partInventory.getInventory() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:467
---@param inventoryId any
---@param path any
function career_modules_partInventory.getPart(inventoryId, path) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:544
function career_modules_partInventory.getPartPathToPartIdMap() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:540
function career_modules_partInventory.getSlotToPartIdMap() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:129
---@param part any
function career_modules_partInventory.isHiddenInUI(part) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:552
---@param menuData any
---@param computerFunctions any
function career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:438
---@param currentVehicle any
function career_modules_partInventory.onEnterVehicleFinished(currentVehicle) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:399
function career_modules_partInventory.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:445
function career_modules_partInventory.onPartShoppingTransactionComplete() end

--- Router lifecycle: re-emit the inventory data once the destination view has mounted.
---Source : lua/ge/extensions/career/modules/partInventory.lua:493
---@param context any
---@param toRoute any
---@param fromRoute any
---@param data any
function career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:529
function career_modules_partInventory.onSaveFinished() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:282
function career_modules_partInventory.onUpdate() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:450
---@param inventoryId any
function career_modules_partInventory.onVehicleAdded(inventoryId) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:454
---@param inventoryId any
function career_modules_partInventory.onVehicleRemoved(inventoryId) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:355
---@param currentSavePath any
function career_modules_partInventory.onVehicleSaveFinished(currentSavePath) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:476
---@param _originComputerId any
function career_modules_partInventory.openMenu(_originComputerId) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:536
function career_modules_partInventory.partInventoryClosed() end

--- Router back handler entry point: route-managed BACK and the wrapper back button
---  share the existing closeMenu path so autosave behavior stays intact.
---Source : lua/ge/extensions/career/modules/partInventory.lua:525
function career_modules_partInventory.requestExit() end

---Source : lua/ge/extensions/career/modules/partInventory.lua:24
---@param partIds any
function career_modules_partInventory.sellParts(partIds) end

---Source : lua/ge/extensions/career/modules/partInventory.lua:316
function career_modules_partInventory.sendUIData() end

--- TODO could even update once every time before removing a part
---Source : lua/ge/extensions/career/modules/partInventory.lua:110
function career_modules_partInventory.updatePartConditionsInInventory() end

--- Re-reads the parts from the currently spawned vehicle and reconciles them with the part inventory.
---Source : lua/ge/extensions/career/modules/partInventory.lua:152
---@param inventoryId any
function career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId) end

