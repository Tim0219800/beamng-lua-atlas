---@meta
-- tim19Atlas stub generated from lua/common/testFramework/MockGenerators.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Générateurs de données factices pour les tests d'extensions (utilisés par testFramework/ExtensionTest). Chaque fonction `generateMockData_<hook>` déclenche le hook correspondant via `extensions.hook(hook, ...)` avec des arguments plausibles, afin de vérifier qu'une extension qui définit ce hook ne plante pas. `generateMockData_default(hookName)` sert pour les hooks sans générateur dédié (appel sans argument). Pour ajouter un hook couvert, il suffit d'ajouter `M.generateMockData_<nomDuHook>`.
--- Accès : `require("testFramework/MockGenerators")`
---@class testFramework_MockGenerators
local testFramework_MockGenerators = {}

--- Déclenche le hook `hookName` sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:47
---@param hookName string Nom du hook.
function testFramework_MockGenerators.generateMockData_default(hookName) end

--- extensions.hook('onDeserialize', {}).
---Source : lua/common/testFramework/MockGenerators.lua:31
function testFramework_MockGenerators.generateMockData_onDeserialize() end

--- extensions.hook('onDeserialized', {}).
---Source : lua/common/testFramework/MockGenerators.lua:35
function testFramework_MockGenerators.generateMockData_onDeserialized() end

--- extensions.hook('onExtensionLoaded') sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:39
function testFramework_MockGenerators.generateMockData_onExtensionLoaded() end

--- extensions.hook('onExtensionUnloaded') sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:43
function testFramework_MockGenerators.generateMockData_onExtensionUnloaded() end

--- extensions.hook('onPhysicsStep', 0.001).
---Source : lua/common/testFramework/MockGenerators.lua:23
function testFramework_MockGenerators.generateMockData_onPhysicsStep() end

--- extensions.hook('onSerialize', 'extensionTest').
---Source : lua/common/testFramework/MockGenerators.lua:27
function testFramework_MockGenerators.generateMockData_onSerialize() end

--- extensions.hook('onUpdate', 0.016, 0.016, 0.016).
---Source : lua/common/testFramework/MockGenerators.lua:15
function testFramework_MockGenerators.generateMockData_onUpdate() end

--- onVehicleActiveChanged(0, true) puis (0, false).
---Source : lua/common/testFramework/MockGenerators.lua:73
function testFramework_MockGenerators.generateMockData_onVehicleActiveChanged() end

--- onVehicleAdded(1).
---Source : lua/common/testFramework/MockGenerators.lua:209
function testFramework_MockGenerators.generateMockData_onVehicleAdded() end

--- onVehicleAddedToInventory({inventoryId=1, vehicleInfo={id=1}}).
---Source : lua/common/testFramework/MockGenerators.lua:188
function testFramework_MockGenerators.generateMockData_onVehicleAddedToInventory() end

--- onVehicleBought() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:221
function testFramework_MockGenerators.generateMockData_onVehicleBought() end

--- onVehicleCameraConfigChanged() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:229
function testFramework_MockGenerators.generateMockData_onVehicleCameraConfigChanged() end

--- onVehicleColorChanged(0, 0, {baseColor = {1,1,1,1}}).
---Source : lua/common/testFramework/MockGenerators.lua:168
function testFramework_MockGenerators.generateMockData_onVehicleColorChanged() end

--- onVehicleConnectionReady(0, 64256).
---Source : lua/common/testFramework/MockGenerators.lua:112
function testFramework_MockGenerators.generateMockData_onVehicleConnectionReady() end

--- onVehicleDamaged({damage=0.1}, {damage=0.01}).
---Source : lua/common/testFramework/MockGenerators.lua:200
function testFramework_MockGenerators.generateMockData_onVehicleDamaged() end

--- onVehicleDestroyed avec les ids 0 et 1.
---Source : lua/common/testFramework/MockGenerators.lua:63
function testFramework_MockGenerators.generateMockData_onVehicleDestroyed() end

--- onVehicleEditorRenderJBeams(0.016, 0.016, 0.016).
---Source : lua/common/testFramework/MockGenerators.lua:90
function testFramework_MockGenerators.generateMockData_onVehicleEditorRenderJBeams() end

--- onVehicleFlippedUpright(0).
---Source : lua/common/testFramework/MockGenerators.lua:172
function testFramework_MockGenerators.generateMockData_onVehicleFlippedUpright() end

--- onVehicleGroupSpawned({0, 1}, 1, 'groupA').
---Source : lua/common/testFramework/MockGenerators.lua:82
function testFramework_MockGenerators.generateMockData_onVehicleGroupSpawned() end

--- onVehicleInfoReady(0, {name='vehicle', speed=0}).
---Source : lua/common/testFramework/MockGenerators.lua:108
function testFramework_MockGenerators.generateMockData_onVehicleInfoReady() end

--- onVehicleLoaded(false) puis (true).
---Source : lua/common/testFramework/MockGenerators.lua:94
function testFramework_MockGenerators.generateMockData_onVehicleLoaded() end

--- onVehicleMapmgrUpdate(0).
---Source : lua/common/testFramework/MockGenerators.lua:78
function testFramework_MockGenerators.generateMockData_onVehicleMapmgrUpdate() end

--- onVehiclePaintingUiOpened() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:217
function testFramework_MockGenerators.generateMockData_onVehiclePaintingUiOpened() end

--- onVehicleParkingStatus(0, {state='parked', score=1}).
---Source : lua/common/testFramework/MockGenerators.lua:86
function testFramework_MockGenerators.generateMockData_onVehicleParkingStatus() end

--- onVehiclePoolAdded(0).
---Source : lua/common/testFramework/MockGenerators.lua:164
function testFramework_MockGenerators.generateMockData_onVehiclePoolAdded() end

--- onVehiclePoolRemoved(0).
---Source : lua/common/testFramework/MockGenerators.lua:160
function testFramework_MockGenerators.generateMockData_onVehiclePoolRemoved() end

--- onVehicleRemoved(1).
---Source : lua/common/testFramework/MockGenerators.lua:213
function testFramework_MockGenerators.generateMockData_onVehicleRemoved() end

--- onVehicleRemovedFromInventory(1).
---Source : lua/common/testFramework/MockGenerators.lua:225
function testFramework_MockGenerators.generateMockData_onVehicleRemovedFromInventory() end

--- onVehicleReplaced(0).
---Source : lua/common/testFramework/MockGenerators.lua:156
function testFramework_MockGenerators.generateMockData_onVehicleReplaced() end

--- onVehicleReset(false) puis (true).
---Source : lua/common/testFramework/MockGenerators.lua:99
function testFramework_MockGenerators.generateMockData_onVehicleReset() end

--- onVehicleResetted avec les ids 0, 1, 1.
---Source : lua/common/testFramework/MockGenerators.lua:58
function testFramework_MockGenerators.generateMockData_onVehicleResetted() end

--- onVehicleSaveFinished('/vehicles/car.pc', 0) puis sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:204
function testFramework_MockGenerators.generateMockData_onVehicleSaveFinished() end

--- onVehicleSelectorCloneCurrent() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:132
function testFramework_MockGenerators.generateMockData_onVehicleSelectorCloneCurrent() end

--- onVehicleSelectorLoadDefault() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:128
function testFramework_MockGenerators.generateMockData_onVehicleSelectorLoadDefault() end

--- onVehicleSelectorRemoveAll() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:144
function testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveAll() end

--- onVehicleSelectorRemoveCurrent() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:148
function testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveCurrent() end

--- onVehicleSelectorRemoveOthers() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:152
function testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveOthers() end

--- onVehicleSelectorReplaceCurrent('pickup', 'base', 'paint1', 'paint2', 'paint3').
---Source : lua/common/testFramework/MockGenerators.lua:120
function testFramework_MockGenerators.generateMockData_onVehicleSelectorReplaceCurrent() end

--- onVehicleSelectorResetAll() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:140
function testFramework_MockGenerators.generateMockData_onVehicleSelectorResetAll() end

--- onVehicleSelectorSelectRandom() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:136
function testFramework_MockGenerators.generateMockData_onVehicleSelectorSelectRandom() end

--- onVehicleSelectorSetAsDefault() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:124
function testFramework_MockGenerators.generateMockData_onVehicleSelectorSetAsDefault() end

--- onVehicleSelectorSpawnNew('pickup', 'base', 'paint1', 'paint2', 'paint3').
---Source : lua/common/testFramework/MockGenerators.lua:116
function testFramework_MockGenerators.generateMockData_onVehicleSelectorSpawnNew() end

--- onVehicleShoppingMenuClosed({}).
---Source : lua/common/testFramework/MockGenerators.lua:184
function testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuClosed() end

--- onVehicleShoppingMenuOpened({seller='dealer'}).
---Source : lua/common/testFramework/MockGenerators.lua:180
function testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuOpened() end

--- onVehicleShoppingPurchaseMenuOpened({purchaseType='cash', shopId='shopA'}).
---Source : lua/common/testFramework/MockGenerators.lua:196
function testFramework_MockGenerators.generateMockData_onVehicleShoppingPurchaseMenuOpened() end

--- onVehicleShoppingVehicleShown({vehicleInfo={id=1}}).
---Source : lua/common/testFramework/MockGenerators.lua:192
function testFramework_MockGenerators.generateMockData_onVehicleShoppingVehicleShown() end

--- onVehicleSpawnFinished(0).
---Source : lua/common/testFramework/MockGenerators.lua:176
function testFramework_MockGenerators.generateMockData_onVehicleSpawnFinished() end

--- onVehicleSpawned(id, véhicule factice) pour les ids 0 et 1.
---Source : lua/common/testFramework/MockGenerators.lua:68
function testFramework_MockGenerators.generateMockData_onVehicleSpawned() end

--- onVehicleSwitched avec les couples (0,0), (0,1) et (1,0) (ancien id, nouvel id).
---Source : lua/common/testFramework/MockGenerators.lua:52
function testFramework_MockGenerators.generateMockData_onVehicleSwitched() end

--- onVehicleTileClick() sans argument.
---Source : lua/common/testFramework/MockGenerators.lua:104
function testFramework_MockGenerators.generateMockData_onVehicleTileClick() end

--- extensions.hook('updateGFX', 0.016).
---Source : lua/common/testFramework/MockGenerators.lua:19
function testFramework_MockGenerators.generateMockData_updateGFX() end

return testFramework_MockGenerators
