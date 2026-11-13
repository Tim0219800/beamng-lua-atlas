# `testFramework_MockGenerators`

*Fichier : `lua/common/testFramework/MockGenerators.lua` · VM : Commun (GE + véhicule) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("testFramework/MockGenerators")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `testFramework_MockGenerators.generateMockData_default(hookName)` |  | 47 |
| `testFramework_MockGenerators.generateMockData_onDeserialize()` |  | 31 |
| `testFramework_MockGenerators.generateMockData_onDeserialized()` |  | 35 |
| `testFramework_MockGenerators.generateMockData_onExtensionLoaded()` |  | 39 |
| `testFramework_MockGenerators.generateMockData_onExtensionUnloaded()` |  | 43 |
| `testFramework_MockGenerators.generateMockData_onPhysicsStep()` |  | 23 |
| `testFramework_MockGenerators.generateMockData_onSerialize()` |  | 27 |
| `testFramework_MockGenerators.generateMockData_onUpdate()` | Default hooks | 15 |
| `testFramework_MockGenerators.generateMockData_onVehicleActiveChanged()` |  | 73 |
| `testFramework_MockGenerators.generateMockData_onVehicleAdded()` |  | 209 |
| `testFramework_MockGenerators.generateMockData_onVehicleAddedToInventory()` |  | 188 |
| `testFramework_MockGenerators.generateMockData_onVehicleBought()` |  | 221 |
| `testFramework_MockGenerators.generateMockData_onVehicleCameraConfigChanged()` |  | 229 |
| `testFramework_MockGenerators.generateMockData_onVehicleColorChanged()` |  | 168 |
| `testFramework_MockGenerators.generateMockData_onVehicleConnectionReady()` |  | 112 |
| `testFramework_MockGenerators.generateMockData_onVehicleDamaged()` |  | 200 |
| `testFramework_MockGenerators.generateMockData_onVehicleDestroyed()` |  | 63 |
| `testFramework_MockGenerators.generateMockData_onVehicleEditorRenderJBeams()` |  | 90 |
| `testFramework_MockGenerators.generateMockData_onVehicleFlippedUpright()` |  | 172 |
| `testFramework_MockGenerators.generateMockData_onVehicleGroupSpawned()` |  | 82 |
| `testFramework_MockGenerators.generateMockData_onVehicleInfoReady()` |  | 108 |
| `testFramework_MockGenerators.generateMockData_onVehicleLoaded()` |  | 94 |
| `testFramework_MockGenerators.generateMockData_onVehicleMapmgrUpdate()` |  | 78 |
| `testFramework_MockGenerators.generateMockData_onVehiclePaintingUiOpened()` |  | 217 |
| `testFramework_MockGenerators.generateMockData_onVehicleParkingStatus()` |  | 86 |
| `testFramework_MockGenerators.generateMockData_onVehiclePoolAdded()` |  | 164 |
| `testFramework_MockGenerators.generateMockData_onVehiclePoolRemoved()` |  | 160 |
| `testFramework_MockGenerators.generateMockData_onVehicleRemoved()` |  | 213 |
| `testFramework_MockGenerators.generateMockData_onVehicleRemovedFromInventory()` |  | 225 |
| `testFramework_MockGenerators.generateMockData_onVehicleReplaced()` |  | 156 |
| `testFramework_MockGenerators.generateMockData_onVehicleReset()` |  | 99 |
| `testFramework_MockGenerators.generateMockData_onVehicleResetted()` |  | 58 |
| `testFramework_MockGenerators.generateMockData_onVehicleSaveFinished()` |  | 204 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorCloneCurrent()` |  | 132 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorLoadDefault()` |  | 128 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveAll()` |  | 144 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveCurrent()` |  | 148 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveOthers()` |  | 152 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorReplaceCurrent()` |  | 120 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorResetAll()` |  | 140 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSelectRandom()` |  | 136 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSetAsDefault()` |  | 124 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSpawnNew()` |  | 116 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuClosed()` |  | 184 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuOpened()` |  | 180 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingPurchaseMenuOpened()` |  | 196 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingVehicleShown()` |  | 192 |
| `testFramework_MockGenerators.generateMockData_onVehicleSpawnFinished()` |  | 176 |
| `testFramework_MockGenerators.generateMockData_onVehicleSpawned()` |  | 68 |
| `testFramework_MockGenerators.generateMockData_onVehicleSwitched()` | Vehicle hooks | 52 |
| `testFramework_MockGenerators.generateMockData_onVehicleTileClick()` |  | 104 |
| `testFramework_MockGenerators.generateMockData_updateGFX()` |  | 19 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeserialize`
- `onDeserialized`
- `onExtensionLoaded` — écouté par 3 module(s)
- `onExtensionUnloaded` — écouté par 1 module(s)
- `onPhysicsStep`
- `onSerialize`
- `onUpdate` — écouté par 1 module(s)
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
- `onVehicleSpawned` — écouté par 1 module(s)
- `onVehicleSwitched` — écouté par 1 module(s)
- `onVehicleTileClick`
- `updateGFX`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/testFramework/MockGenerators.lua`.*
