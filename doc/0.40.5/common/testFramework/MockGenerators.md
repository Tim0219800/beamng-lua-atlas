# `testFramework_MockGenerators`

*File: `lua/common/testFramework/MockGenerators.lua` · VM: Common (GE + vehicle) · 234 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("testFramework/MockGenerators")`

Mock data generators for extension tests (used by testFramework/ExtensionTest). Each `generateMockData_<hook>` function triggers the corresponding hook via `extensions.hook(hook, ...)` with plausible arguments, to check that an extension defining this hook does not crash. `generateMockData_default(hookName)` is used for hooks without a dedicated generator (call without arguments). To add a covered hook, simply add `M.generateMockData_<hookName>`.

## Notes

- The generators call extensions.hook themselves; their return value is not used by ExtensionTest (which also accepts a list of calls {args = {...}} but no generator returns one).
- The mock vehicles (mockVehicle) only have getID() and queueLuaCommand() (no effect).
- ExtensionTest reports as "missing" the `on*` hooks of an extension that have no exact generator (the default generator does not count as coverage).

## Functions

| Function | Description | Line |
|---|---|---|
| `testFramework_MockGenerators.generateMockData_default(hookName)` | Triggers the hook `hookName` without arguments. | 47 |
| `testFramework_MockGenerators.generateMockData_onDeserialize()` | extensions.hook('onDeserialize', {}). | 31 |
| `testFramework_MockGenerators.generateMockData_onDeserialized()` | extensions.hook('onDeserialized', {}). | 35 |
| `testFramework_MockGenerators.generateMockData_onExtensionLoaded()` | extensions.hook('onExtensionLoaded') without arguments. | 39 |
| `testFramework_MockGenerators.generateMockData_onExtensionUnloaded()` | extensions.hook('onExtensionUnloaded') without arguments. | 43 |
| `testFramework_MockGenerators.generateMockData_onPhysicsStep()` | extensions.hook('onPhysicsStep', 0.001). | 23 |
| `testFramework_MockGenerators.generateMockData_onSerialize()` | extensions.hook('onSerialize', 'extensionTest'). | 27 |
| `testFramework_MockGenerators.generateMockData_onUpdate()` | extensions.hook('onUpdate', 0.016, 0.016, 0.016). | 15 |
| `testFramework_MockGenerators.generateMockData_onVehicleActiveChanged()` | onVehicleActiveChanged(0, true) then (0, false). | 73 |
| `testFramework_MockGenerators.generateMockData_onVehicleAdded()` | onVehicleAdded(1). | 209 |
| `testFramework_MockGenerators.generateMockData_onVehicleAddedToInventory()` | onVehicleAddedToInventory({inventoryId=1, vehicleInfo={id=1}}). | 188 |
| `testFramework_MockGenerators.generateMockData_onVehicleBought()` | onVehicleBought() without arguments. | 221 |
| `testFramework_MockGenerators.generateMockData_onVehicleCameraConfigChanged()` | onVehicleCameraConfigChanged() without arguments. | 229 |
| `testFramework_MockGenerators.generateMockData_onVehicleColorChanged()` | onVehicleColorChanged(0, 0, {baseColor = {1,1,1,1}}). | 168 |
| `testFramework_MockGenerators.generateMockData_onVehicleConnectionReady()` | onVehicleConnectionReady(0, 64256). | 112 |
| `testFramework_MockGenerators.generateMockData_onVehicleDamaged()` | onVehicleDamaged({damage=0.1}, {damage=0.01}). | 200 |
| `testFramework_MockGenerators.generateMockData_onVehicleDestroyed()` | onVehicleDestroyed with the ids 0 and 1. | 63 |
| `testFramework_MockGenerators.generateMockData_onVehicleEditorRenderJBeams()` | onVehicleEditorRenderJBeams(0.016, 0.016, 0.016). | 90 |
| `testFramework_MockGenerators.generateMockData_onVehicleFlippedUpright()` | onVehicleFlippedUpright(0). | 172 |
| `testFramework_MockGenerators.generateMockData_onVehicleGroupSpawned()` | onVehicleGroupSpawned({0, 1}, 1, 'groupA'). | 82 |
| `testFramework_MockGenerators.generateMockData_onVehicleInfoReady()` | onVehicleInfoReady(0, {name='vehicle', speed=0}). | 108 |
| `testFramework_MockGenerators.generateMockData_onVehicleLoaded()` | onVehicleLoaded(false) then (true). | 94 |
| `testFramework_MockGenerators.generateMockData_onVehicleMapmgrUpdate()` | onVehicleMapmgrUpdate(0). | 78 |
| `testFramework_MockGenerators.generateMockData_onVehiclePaintingUiOpened()` | onVehiclePaintingUiOpened() without arguments. | 217 |
| `testFramework_MockGenerators.generateMockData_onVehicleParkingStatus()` | onVehicleParkingStatus(0, {state='parked', score=1}). | 86 |
| `testFramework_MockGenerators.generateMockData_onVehiclePoolAdded()` | onVehiclePoolAdded(0). | 164 |
| `testFramework_MockGenerators.generateMockData_onVehiclePoolRemoved()` | onVehiclePoolRemoved(0). | 160 |
| `testFramework_MockGenerators.generateMockData_onVehicleRemoved()` | onVehicleRemoved(1). | 213 |
| `testFramework_MockGenerators.generateMockData_onVehicleRemovedFromInventory()` | onVehicleRemovedFromInventory(1). | 225 |
| `testFramework_MockGenerators.generateMockData_onVehicleReplaced()` | onVehicleReplaced(0). | 156 |
| `testFramework_MockGenerators.generateMockData_onVehicleReset()` | onVehicleReset(false) then (true). | 99 |
| `testFramework_MockGenerators.generateMockData_onVehicleResetted()` | onVehicleResetted with the ids 0, 1, 1. | 58 |
| `testFramework_MockGenerators.generateMockData_onVehicleSaveFinished()` | onVehicleSaveFinished('/vehicles/car.pc', 0) then without arguments. | 204 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorCloneCurrent()` | onVehicleSelectorCloneCurrent() without arguments. | 132 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorLoadDefault()` | onVehicleSelectorLoadDefault() without arguments. | 128 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveAll()` | onVehicleSelectorRemoveAll() without arguments. | 144 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveCurrent()` | onVehicleSelectorRemoveCurrent() without arguments. | 148 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveOthers()` | onVehicleSelectorRemoveOthers() without arguments. | 152 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorReplaceCurrent()` | onVehicleSelectorReplaceCurrent('pickup', 'base', 'paint1', 'paint2', 'paint3'). | 120 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorResetAll()` | onVehicleSelectorResetAll() without arguments. | 140 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSelectRandom()` | onVehicleSelectorSelectRandom() without arguments. | 136 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSetAsDefault()` | onVehicleSelectorSetAsDefault() without arguments. | 124 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSpawnNew()` | onVehicleSelectorSpawnNew('pickup', 'base', 'paint1', 'paint2', 'paint3'). | 116 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuClosed()` | onVehicleShoppingMenuClosed({}). | 184 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuOpened()` | onVehicleShoppingMenuOpened({seller='dealer'}). | 180 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingPurchaseMenuOpened()` | onVehicleShoppingPurchaseMenuOpened({purchaseType='cash', shopId='shopA'}). | 196 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingVehicleShown()` | onVehicleShoppingVehicleShown({vehicleInfo={id=1}}). | 192 |
| `testFramework_MockGenerators.generateMockData_onVehicleSpawnFinished()` | onVehicleSpawnFinished(0). | 176 |
| `testFramework_MockGenerators.generateMockData_onVehicleSpawned()` | onVehicleSpawned(id, mock vehicle) for the ids 0 and 1. | 68 |
| `testFramework_MockGenerators.generateMockData_onVehicleSwitched()` | onVehicleSwitched with the pairs (0,0), (0,1) and (1,0) (old id, new id). | 52 |
| `testFramework_MockGenerators.generateMockData_onVehicleTileClick()` | onVehicleTileClick() without arguments. | 104 |
| `testFramework_MockGenerators.generateMockData_updateGFX()` | extensions.hook('updateGFX', 0.016). | 19 |

### Parameter details

#### `testFramework_MockGenerators.generateMockData_default(hookName)`

Triggers the hook `hookName` without arguments.

- `hookName` (*string*) : Hook name.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDeserialize`
- `onDeserialized`
- `onExtensionLoaded` — listened to by 3 module(s)
- `onExtensionUnloaded` — listened to by 1 module(s)
- `onPhysicsStep`
- `onSerialize`
- `onUpdate` — listened to by 1 module(s)
- `onVehicleActiveChanged`
- `onVehicleAdded`
- `onVehicleAddedToInventory`
- `onVehicleBought`
- `onVehicleCameraConfigChanged`
- `onVehicleColorChanged`
- `onVehicleConnectionReady`
- `onVehicleDamaged`
- `onVehicleDestroyed`
- `onVehicleEditorRenderJBeams`
- `onVehicleFlippedUpright`
- `onVehicleGroupSpawned`
- `onVehicleInfoReady`
- `onVehicleLoaded`
- `onVehicleMapmgrUpdate`
- `onVehiclePaintingUiOpened`
- `onVehicleParkingStatus`
- `onVehiclePoolAdded`
- `onVehiclePoolRemoved`
- `onVehicleRemoved`
- `onVehicleRemovedFromInventory`
- `onVehicleReplaced`
- `onVehicleReset`
- `onVehicleResetted`
- `onVehicleSaveFinished`
- `onVehicleSelectorCloneCurrent`
- `onVehicleSelectorLoadDefault`
- `onVehicleSelectorRemoveAll`
- `onVehicleSelectorRemoveCurrent`
- `onVehicleSelectorRemoveOthers`
- `onVehicleSelectorReplaceCurrent`
- `onVehicleSelectorResetAll`
- `onVehicleSelectorSelectRandom`
- `onVehicleSelectorSetAsDefault`
- `onVehicleSelectorSpawnNew`
- `onVehicleShoppingMenuClosed`
- `onVehicleShoppingMenuOpened`
- `onVehicleShoppingPurchaseMenuOpened`
- `onVehicleShoppingVehicleShown`
- `onVehicleSpawnFinished`
- `onVehicleSpawned` — listened to by 1 module(s)
- `onVehicleSwitched` — listened to by 1 module(s)
- `onVehicleTileClick`
- `updateGFX`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/testFramework/MockGenerators.lua`.*
