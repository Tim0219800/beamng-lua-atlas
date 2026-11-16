# `testFramework_MockGenerators`

*Fichier : `lua/common/testFramework/MockGenerators.lua` · VM : Commun (GE + véhicule) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("testFramework/MockGenerators")`

Générateurs de données factices pour les tests d'extensions (utilisés par testFramework/ExtensionTest). Chaque fonction `generateMockData_<hook>` déclenche le hook correspondant via `extensions.hook(hook, ...)` avec des arguments plausibles, afin de vérifier qu'une extension qui définit ce hook ne plante pas. `generateMockData_default(hookName)` sert pour les hooks sans générateur dédié (appel sans argument). Pour ajouter un hook couvert, il suffit d'ajouter `M.generateMockData_<nomDuHook>`.

## Remarques

- Les générateurs appellent eux-mêmes extensions.hook ; leur valeur de retour n'est pas exploitée par ExtensionTest (qui accepte aussi une liste d'appels {args = {...}} mais aucun générateur n'en renvoie).
- Les véhicules factices (mockVehicle) n'ont que getID() et queueLuaCommand() (sans effet).
- ExtensionTest signale comme « manquants » les hooks `on*` d'une extension qui n'ont pas de générateur exact (le générateur par défaut ne compte pas comme couverture).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `testFramework_MockGenerators.generateMockData_default(hookName)` | Déclenche le hook `hookName` sans argument. | 47 |
| `testFramework_MockGenerators.generateMockData_onDeserialize()` | extensions.hook('onDeserialize', {}). | 31 |
| `testFramework_MockGenerators.generateMockData_onDeserialized()` | extensions.hook('onDeserialized', {}). | 35 |
| `testFramework_MockGenerators.generateMockData_onExtensionLoaded()` | extensions.hook('onExtensionLoaded') sans argument. | 39 |
| `testFramework_MockGenerators.generateMockData_onExtensionUnloaded()` | extensions.hook('onExtensionUnloaded') sans argument. | 43 |
| `testFramework_MockGenerators.generateMockData_onPhysicsStep()` | extensions.hook('onPhysicsStep', 0.001). | 23 |
| `testFramework_MockGenerators.generateMockData_onSerialize()` | extensions.hook('onSerialize', 'extensionTest'). | 27 |
| `testFramework_MockGenerators.generateMockData_onUpdate()` | extensions.hook('onUpdate', 0.016, 0.016, 0.016). | 15 |
| `testFramework_MockGenerators.generateMockData_onVehicleActiveChanged()` | onVehicleActiveChanged(0, true) puis (0, false). | 73 |
| `testFramework_MockGenerators.generateMockData_onVehicleAdded()` | onVehicleAdded(1). | 209 |
| `testFramework_MockGenerators.generateMockData_onVehicleAddedToInventory()` | onVehicleAddedToInventory({inventoryId=1, vehicleInfo={id=1}}). | 188 |
| `testFramework_MockGenerators.generateMockData_onVehicleBought()` | onVehicleBought() sans argument. | 221 |
| `testFramework_MockGenerators.generateMockData_onVehicleCameraConfigChanged()` | onVehicleCameraConfigChanged() sans argument. | 229 |
| `testFramework_MockGenerators.generateMockData_onVehicleColorChanged()` | onVehicleColorChanged(0, 0, {baseColor = {1,1,1,1}}). | 168 |
| `testFramework_MockGenerators.generateMockData_onVehicleConnectionReady()` | onVehicleConnectionReady(0, 64256). | 112 |
| `testFramework_MockGenerators.generateMockData_onVehicleDamaged()` | onVehicleDamaged({damage=0.1}, {damage=0.01}). | 200 |
| `testFramework_MockGenerators.generateMockData_onVehicleDestroyed()` | onVehicleDestroyed avec les ids 0 et 1. | 63 |
| `testFramework_MockGenerators.generateMockData_onVehicleEditorRenderJBeams()` | onVehicleEditorRenderJBeams(0.016, 0.016, 0.016). | 90 |
| `testFramework_MockGenerators.generateMockData_onVehicleFlippedUpright()` | onVehicleFlippedUpright(0). | 172 |
| `testFramework_MockGenerators.generateMockData_onVehicleGroupSpawned()` | onVehicleGroupSpawned({0, 1}, 1, 'groupA'). | 82 |
| `testFramework_MockGenerators.generateMockData_onVehicleInfoReady()` | onVehicleInfoReady(0, {name='vehicle', speed=0}). | 108 |
| `testFramework_MockGenerators.generateMockData_onVehicleLoaded()` | onVehicleLoaded(false) puis (true). | 94 |
| `testFramework_MockGenerators.generateMockData_onVehicleMapmgrUpdate()` | onVehicleMapmgrUpdate(0). | 78 |
| `testFramework_MockGenerators.generateMockData_onVehiclePaintingUiOpened()` | onVehiclePaintingUiOpened() sans argument. | 217 |
| `testFramework_MockGenerators.generateMockData_onVehicleParkingStatus()` | onVehicleParkingStatus(0, {state='parked', score=1}). | 86 |
| `testFramework_MockGenerators.generateMockData_onVehiclePoolAdded()` | onVehiclePoolAdded(0). | 164 |
| `testFramework_MockGenerators.generateMockData_onVehiclePoolRemoved()` | onVehiclePoolRemoved(0). | 160 |
| `testFramework_MockGenerators.generateMockData_onVehicleRemoved()` | onVehicleRemoved(1). | 213 |
| `testFramework_MockGenerators.generateMockData_onVehicleRemovedFromInventory()` | onVehicleRemovedFromInventory(1). | 225 |
| `testFramework_MockGenerators.generateMockData_onVehicleReplaced()` | onVehicleReplaced(0). | 156 |
| `testFramework_MockGenerators.generateMockData_onVehicleReset()` | onVehicleReset(false) puis (true). | 99 |
| `testFramework_MockGenerators.generateMockData_onVehicleResetted()` | onVehicleResetted avec les ids 0, 1, 1. | 58 |
| `testFramework_MockGenerators.generateMockData_onVehicleSaveFinished()` | onVehicleSaveFinished('/vehicles/car.pc', 0) puis sans argument. | 204 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorCloneCurrent()` | onVehicleSelectorCloneCurrent() sans argument. | 132 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorLoadDefault()` | onVehicleSelectorLoadDefault() sans argument. | 128 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveAll()` | onVehicleSelectorRemoveAll() sans argument. | 144 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveCurrent()` | onVehicleSelectorRemoveCurrent() sans argument. | 148 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorRemoveOthers()` | onVehicleSelectorRemoveOthers() sans argument. | 152 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorReplaceCurrent()` | onVehicleSelectorReplaceCurrent('pickup', 'base', 'paint1', 'paint2', 'paint3'). | 120 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorResetAll()` | onVehicleSelectorResetAll() sans argument. | 140 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSelectRandom()` | onVehicleSelectorSelectRandom() sans argument. | 136 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSetAsDefault()` | onVehicleSelectorSetAsDefault() sans argument. | 124 |
| `testFramework_MockGenerators.generateMockData_onVehicleSelectorSpawnNew()` | onVehicleSelectorSpawnNew('pickup', 'base', 'paint1', 'paint2', 'paint3'). | 116 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuClosed()` | onVehicleShoppingMenuClosed({}). | 184 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingMenuOpened()` | onVehicleShoppingMenuOpened({seller='dealer'}). | 180 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingPurchaseMenuOpened()` | onVehicleShoppingPurchaseMenuOpened({purchaseType='cash', shopId='shopA'}). | 196 |
| `testFramework_MockGenerators.generateMockData_onVehicleShoppingVehicleShown()` | onVehicleShoppingVehicleShown({vehicleInfo={id=1}}). | 192 |
| `testFramework_MockGenerators.generateMockData_onVehicleSpawnFinished()` | onVehicleSpawnFinished(0). | 176 |
| `testFramework_MockGenerators.generateMockData_onVehicleSpawned()` | onVehicleSpawned(id, véhicule factice) pour les ids 0 et 1. | 68 |
| `testFramework_MockGenerators.generateMockData_onVehicleSwitched()` | onVehicleSwitched avec les couples (0,0), (0,1) et (1,0) (ancien id, nouvel id). | 52 |
| `testFramework_MockGenerators.generateMockData_onVehicleTileClick()` | onVehicleTileClick() sans argument. | 104 |
| `testFramework_MockGenerators.generateMockData_updateGFX()` | extensions.hook('updateGFX', 0.016). | 19 |

### Détail des paramètres

#### `testFramework_MockGenerators.generateMockData_default(hookName)`

Déclenche le hook `hookName` sans argument.

- `hookName` (*string*) : Nom du hook.

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
