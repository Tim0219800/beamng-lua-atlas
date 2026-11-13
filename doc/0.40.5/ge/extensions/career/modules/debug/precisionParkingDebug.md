# `career_modules_debug_precisionParkingDebug`

*Fichier : `lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_debug_precisionParkingDebug` : `extensions.load("career_modules_debug_precisionParkingDebug")`, puis la globale `career_modules_debug_precisionParkingDebug`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_debug_precisionParkingDebug.drawDebugMenu()` |  | 154 |
| `career_modules_debug_precisionParkingDebug.drawDebugVisualization()` | Draw debug visualization in 3D world | 396 |
| `career_modules_debug_precisionParkingDebug.onDebugDisabled()` | Cleanup when debug is disabled *(hook)* | 403 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugName` | string |  |
| `debugOrder` | number |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawArrow`, `drawLine`, `drawSphere`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua`.*
