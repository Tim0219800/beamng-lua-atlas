---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/inventory.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_modules_inventory` : `extensions.load("career_modules_inventory")`, puis la globale `career_modules_inventory`
---@class career_modules_inventory
---@field dependencies table
career_modules_inventory = {}

---Source : lua/ge/extensions/career/modules/inventory.lua:299
---@param vehId any
---@param inventoryId any
---@param options any
function career_modules_inventory.addVehicle(vehId, inventoryId, options) end

---Source : lua/ge/extensions/career/modules/inventory.lua:428
---@param inventoryId any
---@param vehId any
function career_modules_inventory.applyPartConditions(inventoryId, vehId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1111
---@param inventoryId any
---@param buttonIndex any
---@param repairPrevVeh any
function career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1032
function career_modules_inventory.closeMenu() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1370
function career_modules_inventory.debugRespawnCurrentVehicle() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1193
---@param inventoryId any
---@param delay any
---@param reason any
function career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason) end

--- loadOption 1: dont reload the vehicle
---  loadOption 2: force reload the vehicle
---Source : lua/ge/extensions/career/modules/inventory.lua:538
---@param newInventoryId any
---@param loadOption any
---@param callback any
function career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1187
---@param inventoryId any
---@param price any
function career_modules_inventory.expediteRepairFromInventory(inventoryId, price) end

---Source : lua/ge/extensions/career/modules/inventory.lua:36
---@param pos any
function career_modules_inventory.getClosestGarage(pos) end

--- Debug
---Source : lua/ge/extensions/career/modules/inventory.lua:674
function career_modules_inventory.getCurrentVehicle() end

---Source : lua/ge/extensions/career/modules/inventory.lua:698
function career_modules_inventory.getCurrentVehicleId() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1343
function career_modules_inventory.getDirtiedVehicles() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1214
function career_modules_inventory.getFavoriteVehicle() end

---Source : lua/ge/extensions/career/modules/inventory.lua:688
---@param vehId any
function career_modules_inventory.getInventoryIdFromVehicleId(vehId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:973
---@param onlyFirst any
function career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst) end

---Source : lua/ge/extensions/career/modules/inventory.lua:678
function career_modules_inventory.getLastVehicle() end

---Source : lua/ge/extensions/career/modules/inventory.lua:694
function career_modules_inventory.getMapInventoryIdToVehId() end

---Source : lua/ge/extensions/career/modules/inventory.lua:286
function career_modules_inventory.getNumberOfFreeSlots() end

---Source : lua/ge/extensions/career/modules/inventory.lua:395
---@param partConditions any
---@param inventoryId any
function career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1152
---@param inventoryId any
function career_modules_inventory.getVehicle(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:682
---@param inventoryId any
function career_modules_inventory.getVehicleIdFromInventoryId(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:833
---@param inventoryId any
function career_modules_inventory.getVehicleNiceNameTranslated(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:760
---@param inventoryId any
function career_modules_inventory.getVehicleThumbnail(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:839
---@param inventoryId any
---@param inventoryIdsInGarage any
function career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1148
function career_modules_inventory.getVehicles() end

---Source : lua/ge/extensions/career/modules/inventory.lua:294
function career_modules_inventory.hasFreeSlot() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1347
function career_modules_inventory.isEmpty() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1351
---@param text any
function career_modules_inventory.isLicensePlateValid(text) end

---Source : lua/ge/extensions/career/modules/inventory.lua:702
function career_modules_inventory.isSeatedInsideOwnedVehicle() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1355
---@param text any
function career_modules_inventory.isVehicleNameValid(text) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1200
function career_modules_inventory.onAvailableMissionsSentToUi() end

---Source : lua/ge/extensions/career/modules/inventory.lua:964
---@param enabled any
---@param vehicleInFrontVehId any
function career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:662
function career_modules_inventory.onBigMapActivated() end

---Source : lua/ge/extensions/career/modules/inventory.lua:636
---@param active any
function career_modules_inventory.onCareerActive(active) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1270
---@param tags any
---@param permissions any
---@param additionalData any
function career_modules_inventory.onCheckPermission(tags, permissions, additionalData) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1218
---@param menuData any
---@param computerFunctions any
function career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1142
---@param inventoryId any
function career_modules_inventory.onEnterVehicleFinished(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1137
function career_modules_inventory.onExitVehicleInventory() end

---Source : lua/ge/extensions/career/modules/inventory.lua:54
function career_modules_inventory.onExtensionLoaded() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1299
---@param levelIdentifier any
---@param elements any
function career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- TODO update a vehicles part conditions in the table when you exit a vehicle
---Source : lua/ge/extensions/career/modules/inventory.lua:247
---@param currentSavePath any
---@param vehiclesThumbnailUpdate any
function career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate) end

---Source : lua/ge/extensions/career/modules/inventory.lua:177
function career_modules_inventory.onSaveCurrentProfileAsyncStart() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1001
---@param state any
function career_modules_inventory.onScreenFadeState(state) end

---Source : lua/ge/extensions/career/modules/inventory.lua:923
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1115
function career_modules_inventory.openInventoryMenuForChoosingListing() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1009
---@param _chooseButtonsData any
---@param header any
---@param _buttonsActive any
---@param _backTarget any
function career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1082
---@param _originComputerId any
function career_modules_inventory.openMenuFromComputer(_originComputerId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1243
---@param inventoryId any
---@param text any
---@param money any
function career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money) end

---Source : lua/ge/extensions/career/modules/inventory.lua:378
---@param inventoryId any
function career_modules_inventory.removeVehicle(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:360
---@param inventoryId any
---@param skipPartConditions any
function career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1360
---@param inventoryId any
---@param name any
function career_modules_inventory.renameVehicle(inventoryId, name) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1036
function career_modules_inventory.requestPickerExit() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1180
---@param inventoryId any
function career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1156
---@param inventoryId any
---@param price any
function career_modules_inventory.sellVehicle(inventoryId, price) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1173
---@param inventoryId any
function career_modules_inventory.sellVehicleFromInventory(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:903
function career_modules_inventory.sendDataToUi() end

---Source : lua/ge/extensions/career/modules/inventory.lua:1208
---@param inventoryId any
function career_modules_inventory.setFavoriteVehicle(inventoryId) end

---Source : lua/ge/extensions/career/modules/inventory.lua:1235
---@param inventoryId any
---@param text any
function career_modules_inventory.setLicensePlateText(inventoryId, text) end

---Source : lua/ge/extensions/career/modules/inventory.lua:146
---@param inventoryId any
function career_modules_inventory.setVehicleDirty(inventoryId) end

--- replaceOption 1: replace the current vehicle object
---  replaceOption 2: replace the vehicle object with the same inventoryId
---Source : lua/ge/extensions/career/modules/inventory.lua:436
---@param inventoryId any
---@param replaceOption any
---@param callback any
function career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback) end

---Source : lua/ge/extensions/career/modules/inventory.lua:668
function career_modules_inventory.teleportedFromBigmap() end

---Source : lua/ge/extensions/career/modules/inventory.lua:406
---@param vehId any
---@param inventoryId any
---@param callback any
function career_modules_inventory.updatePartConditions(vehId, inventoryId, callback) end

---Source : lua/ge/extensions/career/modules/inventory.lua:150
---@param callback any
function career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback) end

