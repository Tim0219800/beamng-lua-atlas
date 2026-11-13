# `career_modules_debug_vehicleSpawn`

*Fichier : `lua/ge/extensions/career/modules/debug/vehicleSpawn.lua` · VM : Game Engine (GE) · 131 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_vehicleSpawn` : `extensions.load("career_modules_debug_vehicleSpawn")`, puis la globale `career_modules_debug_vehicleSpawn`

**Dépendances (chargées avant) :** `gameplay_sites_sitesManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_vehicleSpawn.buttonPressed(i)` |  | 81 |
| `career_modules_debug_vehicleSpawn.drawDebugMenu()` |  | 30 |
| `career_modules_debug_vehicleSpawn.onGetRawPoiListForLevel(levelIdentifier, elements)` | poi list stuff *(hook)* | 15 |
| `career_modules_debug_vehicleSpawn.onPoiDetailPromptOpening(elemData, promptData)` | *(hook)* | 85 |
| `career_modules_debug_vehicleSpawn.spawnVehicle(model, config, addToInventory)` |  | 48 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string |  |
| `debugOrder` | number |  |
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `showConfirmationDialog`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

**Charge les extensions :** `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/vehicleSpawn.lua`.*
