# `career_modules_partInventory`

*Fichier : `lua/ge/extensions/career/modules/partInventory.lua` · VM : Game Engine (GE) · 595 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_partInventory` : `extensions.load("career_modules_partInventory")`, puis la globale `career_modules_partInventory`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_partInventory.addPartToInventory(part)` |  | 121 |
| `career_modules_partInventory.closeMenu()` |  | 508 |
| `career_modules_partInventory.getInventory()` |  | 548 |
| `career_modules_partInventory.getPart(inventoryId, path)` |  | 467 |
| `career_modules_partInventory.getPartPathToPartIdMap()` |  | 544 |
| `career_modules_partInventory.getSlotToPartIdMap()` |  | 540 |
| `career_modules_partInventory.isHiddenInUI(part)` |  | 129 |
| `career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 552 |
| `career_modules_partInventory.onEnterVehicleFinished(currentVehicle)` | *(hook)* | 438 |
| `career_modules_partInventory.onExtensionLoaded()` | *(hook)* | 399 |
| `career_modules_partInventory.onPartShoppingTransactionComplete()` | *(hook)* | 445 |
| `career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data)` | Router lifecycle: re-emit the inventory data once the destination view has mounted. *(hook)* | 493 |
| `career_modules_partInventory.onSaveFinished()` | *(hook)* | 529 |
| `career_modules_partInventory.onUpdate()` | *(hook)* | 282 |
| `career_modules_partInventory.onVehicleAdded(inventoryId)` | *(hook)* | 450 |
| `career_modules_partInventory.onVehicleRemoved(inventoryId)` | *(hook)* | 454 |
| `career_modules_partInventory.onVehicleSaveFinished(currentSavePath)` | *(hook)* | 355 |
| `career_modules_partInventory.openMenu(_originComputerId)` |  | 476 |
| `career_modules_partInventory.partInventoryClosed()` |  | 536 |
| `career_modules_partInventory.requestExit()` | Router back handler entry point: route-managed BACK and the wrapper back button<br> share the existing closeMenu path so autosave behavior stays intact. | 525 |
| `career_modules_partInventory.sellParts(partIds)` |  | 24 |
| `career_modules_partInventory.sendUIData()` |  | 316 |
| `career_modules_partInventory.updatePartConditionsInInventory()` | TODO could even update once every time before removing a part | 110 |
| `career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId)` | Re-reads the parts from the currently spawned vehicle and reconciles them with the part inventory. | 152 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAddedVehiclePartsToInventory` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `partInventoryData`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/partInventory.lua`.*
