# `editor_trafficManager`

*Fichier : `lua/ge/extensions/editor/trafficManager.lua` · VM : Game Engine (GE) · 2601 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficManager` : `extensions.load("editor_trafficManager")`, puis la globale `editor_trafficManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficManager.disableSimulation()` |  | 603 |
| `editor_trafficManager.enableSimulation()` |  | 586 |
| `editor_trafficManager.getSessionData()` |  | 2305 |
| `editor_trafficManager.loadSession(filePath)` |  | 2088 |
| `editor_trafficManager.onDeserialized(data)` | *(hook)* | 2554 |
| `editor_trafficManager.onEditorGui()` | *(hook)* | 2341 |
| `editor_trafficManager.onEditorInitialized()` | *(hook)* | 2566 |
| `editor_trafficManager.onSerialize()` | *(hook)* | 2549 |
| `editor_trafficManager.onUpdate(dt, dtSim)` | *(hook)* | 2423 |
| `editor_trafficManager.onVehicleResetted(vehId)` | *(hook)* | 2526 |
| `editor_trafficManager.onVehicleSpawned(vehId)` | *(hook)* | 2513 |
| `editor_trafficManager.onWindowMenuItem()` | *(hook)* | 2557 |
| `editor_trafficManager.saveSession(filePath)` |  | 2212 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `assertLevel` | boolean |  |
| `debugMode` | boolean |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `be:` `enterVehicle`, `getEnabled`, `getPlayerVehicleID`, `getSurfaceHeightBelow`, `reloadCollision`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getClassName`, `getDirectionVector`, `getDirectionVectorUp`, `getID`, `getName`, `getPosition`, `setInternalName`, `setName`
- `scenetree.` `findObject`, `findObjectById`, `objectExists`, `objectExistsById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficManager.lua`.*
