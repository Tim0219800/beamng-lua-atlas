---@meta
-- tim19Atlas stub generated from lua/common/testFramework/MockGenerators.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mock data generators for extension tests (used by testFramework/ExtensionTest). Each `generateMockData_<hook>` function triggers the corresponding hook via `extensions.hook(hook, ...)` with plausible arguments, to check that an extension defining this hook does not crash. `generateMockData_default(hookName)` is used for hooks without a dedicated generator (call without arguments). To add a covered hook, simply add `M.generateMockData_<hookName>`.
--- Access: `require("testFramework/MockGenerators")`
---@class testFramework_MockGenerators
local testFramework_MockGenerators = {}

--- Triggers the hook `hookName` without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:47
---@param hookName string Hook name.
function testFramework_MockGenerators.generateMockData_default(hookName) end

--- extensions.hook('onDeserialize', {}).
---Source: lua/common/testFramework/MockGenerators.lua:31
function testFramework_MockGenerators.generateMockData_onDeserialize() end

--- extensions.hook('onDeserialized', {}).
---Source: lua/common/testFramework/MockGenerators.lua:35
function testFramework_MockGenerators.generateMockData_onDeserialized() end

--- extensions.hook('onExtensionLoaded') without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:39
function testFramework_MockGenerators.generateMockData_onExtensionLoaded() end

--- extensions.hook('onExtensionUnloaded') without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:43
function testFramework_MockGenerators.generateMockData_onExtensionUnloaded() end

--- extensions.hook('onPhysicsStep', 0.001).
---Source: lua/common/testFramework/MockGenerators.lua:23
function testFramework_MockGenerators.generateMockData_onPhysicsStep() end

--- extensions.hook('onSerialize', 'extensionTest').
---Source: lua/common/testFramework/MockGenerators.lua:27
function testFramework_MockGenerators.generateMockData_onSerialize() end

--- extensions.hook('onUpdate', 0.016, 0.016, 0.016).
---Source: lua/common/testFramework/MockGenerators.lua:15
function testFramework_MockGenerators.generateMockData_onUpdate() end

--- onVehicleActiveChanged(0, true) then (0, false).
---Source: lua/common/testFramework/MockGenerators.lua:73
function testFramework_MockGenerators.generateMockData_onVehicleActiveChanged() end

--- onVehicleAdded(1).
---Source: lua/common/testFramework/MockGenerators.lua:209
function testFramework_MockGenerators.generateMockData_onVehicleAdded() end

--- onVehicleAddedToInventory({inventoryId=1, vehicleInfo={id=1}}).
---Source: lua/common/testFramework/MockGenerators.lua:188
function testFramework_MockGenerators.generateMockData_onVehicleAddedToInventory() end

--- onVehicleBought() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:221
function testFramework_MockGenerators.generateMockData_onVehicleBought() end

--- onVehicleCameraConfigChanged() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:229
function testFramework_MockGenerators.generateMockData_onVehicleCameraConfigChanged() end

--- onVehicleColorChanged(0, 0, {baseColor = {1,1,1,1}}).
---Source: lua/common/testFramework/MockGenerators.lua:168
function testFramework_MockGenerators.generateMockData_onVehicleColorChanged() end

--- onVehicleConnectionReady(0, 64256).
---Source: lua/common/testFramework/MockGenerators.lua:112
function testFramework_MockGenerators.generateMockData_onVehicleConnectionReady() end

--- onVehicleDamaged({damage=0.1}, {damage=0.01}).
---Source: lua/common/testFramework/MockGenerators.lua:200
function testFramework_MockGenerators.generateMockData_onVehicleDamaged() end

--- onVehicleDestroyed with the ids 0 and 1.
---Source: lua/common/testFramework/MockGenerators.lua:63
function testFramework_MockGenerators.generateMockData_onVehicleDestroyed() end

--- onVehicleEditorRenderJBeams(0.016, 0.016, 0.016).
---Source: lua/common/testFramework/MockGenerators.lua:90
function testFramework_MockGenerators.generateMockData_onVehicleEditorRenderJBeams() end

--- onVehicleFlippedUpright(0).
---Source: lua/common/testFramework/MockGenerators.lua:172
function testFramework_MockGenerators.generateMockData_onVehicleFlippedUpright() end

--- onVehicleGroupSpawned({0, 1}, 1, 'groupA').
---Source: lua/common/testFramework/MockGenerators.lua:82
function testFramework_MockGenerators.generateMockData_onVehicleGroupSpawned() end

--- onVehicleInfoReady(0, {name='vehicle', speed=0}).
---Source: lua/common/testFramework/MockGenerators.lua:108
function testFramework_MockGenerators.generateMockData_onVehicleInfoReady() end

--- onVehicleLoaded(false) then (true).
---Source: lua/common/testFramework/MockGenerators.lua:94
function testFramework_MockGenerators.generateMockData_onVehicleLoaded() end

--- onVehicleMapmgrUpdate(0).
---Source: lua/common/testFramework/MockGenerators.lua:78
function testFramework_MockGenerators.generateMockData_onVehicleMapmgrUpdate() end

--- onVehiclePaintingUiOpened() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:217
function testFramework_MockGenerators.generateMockData_onVehiclePaintingUiOpened() end

--- onVehicleParkingStatus(0, {state='parked', score=1}).
---Source: lua/common/testFramework/MockGenerators.lua:86
function testFramework_MockGenerators.generateMockData_onVehicleParkingStatus() end

--- onVehiclePoolAdded(0).
---Source: lua/common/testFramework/MockGenerators.lua:164
function testFramework_MockGenerators.generateMockData_onVehiclePoolAdded() end

--- onVehiclePoolRemoved(0).
---Source: lua/common/testFramework/MockGenerators.lua:160
function testFramework_MockGenerators.generateMockData_onVehiclePoolRemoved() end

--- onVehicleRemoved(1).
---Source: lua/common/testFramework/MockGenerators.lua:213
function testFramework_MockGenerators.generateMockData_onVehicleRemoved() end

--- onVehicleRemovedFromInventory(1).
---Source: lua/common/testFramework/MockGenerators.lua:225
function testFramework_MockGenerators.generateMockData_onVehicleRemovedFromInventory() end

--- onVehicleReplaced(0).
---Source: lua/common/testFramework/MockGenerators.lua:156
function testFramework_MockGenerators.generateMockData_onVehicleReplaced() end

--- onVehicleReset(false) then (true).
---Source: lua/common/testFramework/MockGenerators.lua:99
function testFramework_MockGenerators.generateMockData_onVehicleReset() end

--- onVehicleResetted with the ids 0, 1, 1.
---Source: lua/common/testFramework/MockGenerators.lua:58
function testFramework_MockGenerators.generateMockData_onVehicleResetted() end

--- onVehicleSaveFinished('/vehicles/car.pc', 0) then without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:204
function testFramework_MockGenerators.generateMockData_onVehicleSaveFinished() end

--- onVehicleSelectorCloneCurrent() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:132
function testFramework_MockGenerators.generateMockData_onVehicleSelectorCloneCurrent() end

--- onVehicleSelectorLoadDefault() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:128
function testFramework_MockGenerators.generateMockData_onVehicleSelectorLoadDefault() end

--- onVehicleSelectorRemoveAll() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:144
function testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveAll() end

--- onVehicleSelectorRemoveCurrent() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:148
function testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveCurrent() end

--- onVehicleSelectorRemoveOthers() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:152
function testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveOthers() end

--- onVehicleSelectorReplaceCurrent('pickup', 'base', 'paint1', 'paint2', 'paint3').
---Source: lua/common/testFramework/MockGenerators.lua:120
function testFramework_MockGenerators.generateMockData_onVehicleSelectorReplaceCurrent() end

--- onVehicleSelectorResetAll() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:140
function testFramework_MockGenerators.generateMockData_onVehicleSelectorResetAll() end

--- onVehicleSelectorSelectRandom() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:136
function testFramework_MockGenerators.generateMockData_onVehicleSelectorSelectRandom() end

--- onVehicleSelectorSetAsDefault() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:124
function testFramework_MockGenerators.generateMockData_onVehicleSelectorSetAsDefault() end

--- onVehicleSelectorSpawnNew('pickup', 'base', 'paint1', 'paint2', 'paint3').
---Source: lua/common/testFramework/MockGenerators.lua:116
function testFramework_MockGenerators.generateMockData_onVehicleSelectorSpawnNew() end

--- onVehicleShoppingMenuClosed({}).
---Source: lua/common/testFramework/MockGenerators.lua:184
function testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuClosed() end

--- onVehicleShoppingMenuOpened({seller='dealer'}).
---Source: lua/common/testFramework/MockGenerators.lua:180
function testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuOpened() end

--- onVehicleShoppingPurchaseMenuOpened({purchaseType='cash', shopId='shopA'}).
---Source: lua/common/testFramework/MockGenerators.lua:196
function testFramework_MockGenerators.generateMockData_onVehicleShoppingPurchaseMenuOpened() end

--- onVehicleShoppingVehicleShown({vehicleInfo={id=1}}).
---Source: lua/common/testFramework/MockGenerators.lua:192
function testFramework_MockGenerators.generateMockData_onVehicleShoppingVehicleShown() end

--- onVehicleSpawnFinished(0).
---Source: lua/common/testFramework/MockGenerators.lua:176
function testFramework_MockGenerators.generateMockData_onVehicleSpawnFinished() end

--- onVehicleSpawned(id, mock vehicle) for the ids 0 and 1.
---Source: lua/common/testFramework/MockGenerators.lua:68
function testFramework_MockGenerators.generateMockData_onVehicleSpawned() end

--- onVehicleSwitched with the pairs (0,0), (0,1) and (1,0) (old id, new id).
---Source: lua/common/testFramework/MockGenerators.lua:52
function testFramework_MockGenerators.generateMockData_onVehicleSwitched() end

--- onVehicleTileClick() without arguments.
---Source: lua/common/testFramework/MockGenerators.lua:104
function testFramework_MockGenerators.generateMockData_onVehicleTileClick() end

--- extensions.hook('updateGFX', 0.016).
---Source: lua/common/testFramework/MockGenerators.lua:19
function testFramework_MockGenerators.generateMockData_updateGFX() end

return testFramework_MockGenerators
