# `career_modules_partShopping`

*Fichier : `lua/ge/extensions/career/modules/partShopping.lua` · VM : Game Engine (GE) · 1086 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_partShopping` : `extensions.load("career_modules_partShopping")`, puis la globale `career_modules_partShopping`

**Dépendances (chargées avant) :** `career_career`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_partShopping.applyShopping()` |  | 972 |
| `career_modules_partShopping.cancelShopping()` |  | 910 |
| `career_modules_partShopping.getCategoryBreadcrumbTitle(category)` | Breadcrumb title resolver for the part-shopping category route. Receives the<br> "category" route param and returns a localized label. | 1000 |
| `career_modules_partShopping.getPartsInShop()` |  | 1020 |
| `career_modules_partShopping.getShoppingCart()` |  | 1024 |
| `career_modules_partShopping.getSlotBreadcrumbTitle(slotPath)` | Breadcrumb title resolver for the part-shopping slot route. Receives the<br> "slotPath" route param and returns the slot's nice name when known. | 1010 |
| `career_modules_partShopping.installPart(part)` |  | 855 |
| `career_modules_partShopping.installPartByPartShopId(partShopId)` |  | 870 |
| `career_modules_partShopping.isShoppingSessionActive()` |  | 994 |
| `career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 1028 |
| `career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data)` | Router lifecycle: store the normalized selection on enter so any emission<br> between enter and mount uses the correct route state. *(hook)* | 445 |
| `career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data)` | Router lifecycle: re-normalize and emit the route-aware shopping data once the<br> destination view has mounted. *(hook)* | 451 |
| `career_modules_partShopping.onVehicleSaveFinished()` | *(hook)* | 922 |
| `career_modules_partShopping.removePartBySlot(slot)` |  | 879 |
| `career_modules_partShopping.requestExit()` |  | 918 |
| `career_modules_partShopping.sendShoppingDataToUI()` |  | 414 |
| `career_modules_partShopping.setupTether()` |  | 516 |
| `career_modules_partShopping.startShopping(inventoryId, _originComputerId)` |  | 531 |
| `career_modules_partShopping.updatePreviewVehicle(currentPartConditions)` |  | 456 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPartShoppingCancelled` — écouté par 1 module(s)
- `onPartShoppingPartInstalled`
- `onPartShoppingStarted` — écouté par 2 module(s)
- `onPartShoppingTransactionComplete` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `partShoppingData`, `partShoppingRequestExit`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/partShopping.lua`.*
