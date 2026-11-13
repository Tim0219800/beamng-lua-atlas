# `career_modules_painting`

*Fichier : `lua/ge/extensions/career/modules/painting.lua` · VM : Game Engine (GE) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_painting` : `extensions.load("career_modules_painting")`, puis la globale `career_modules_painting`

**Dépendances (chargées avant) :** `career_career`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_painting.apply()` |  | 186 |
| `career_modules_painting.cleanup()` | Restores vehicle/camera/input state. Does NOT navigate; the router owns the<br> transition back to career.computer. Safe to call from the UI on unmount. | 128 |
| `career_modules_painting.close(_closeMenuAfterSaving)` |  | 153 |
| `career_modules_painting.getFactoryPaint()` |  | 282 |
| `career_modules_painting.getPaintData()` |  | 75 |
| `career_modules_painting.getPrimerColor()` |  | 45 |
| `career_modules_painting.onComputerAddFunctions(menuData, computerFunctions)` | *(hook)* | 215 |
| `career_modules_painting.onRouteMount(context, toRoute, fromRoute, data)` | Router lifecycle: re-emit the painting data once the destination view has mounted. *(hook)* | 296 |
| `career_modules_painting.onUIOpened()` | *(hook)* | 300 |
| `career_modules_painting.onVehicleSaveFinished()` | *(hook)* | 165 |
| `career_modules_painting.sendPaintingDataToUI()` |  | 288 |
| `career_modules_painting.setPaints(paints, paintOptions, partName)` |  | 258 |
| `career_modules_painting.start(_inventoryId, _originComputerId)` |  | 105 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehiclePaintingUiOpened`

**Évènements UI (guihooks.trigger) :** `onCareerPaintingStarted`, `paintingData`, `sendPaintingShoppingCartData`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/painting.lua`.*
