# `career_modules_debug_cargoContainerDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua` · VM : Game Engine (GE) · 373 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_cargoContainerDebug` : `extensions.load("career_modules_debug_cargoContainerDebug")`, puis la globale `career_modules_debug_cargoContainerDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_cargoContainerDebug.drawDebugMenu(dt)` | extensions.load("career/modules/debug/cargoContainerDebug") career_modules_debug_cargoContainerDebug.show() | 320 |
| `career_modules_debug_cargoContainerDebug.drawFlowRate(dt)` |  | 279 |
| `career_modules_debug_cargoContainerDebug.drawVehicle(data)` |  | 101 |
| `career_modules_debug_cargoContainerDebug.getData()` |  | 19 |
| `career_modules_debug_cargoContainerDebug.onChangeFlowRate(factor)` | *(hook)* | 315 |
| `career_modules_debug_cargoContainerDebug.onInstabilityDetected(id)` | *(hook)* | 364 |
| `career_modules_debug_cargoContainerDebug.onVehicleDestroyed(id)` | *(hook)* | 364 |
| `career_modules_debug_cargoContainerDebug.onVehicleResetted(id)` | *(hook)* | 357 |
| `career_modules_debug_cargoContainerDebug.show()` |  | 351 |
| `career_modules_debug_cargoContainerDebug.updateVehicle(data)` |  | 75 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string |  |
| `debugOrder` | number |  |
| `vehCargoData` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/cargoContainerDebug.lua`.*
