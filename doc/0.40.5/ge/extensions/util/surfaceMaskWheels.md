# `util_surfaceMaskWheels`

*Fichier : `lua/ge/extensions/util/surfaceMaskWheels.lua` · VM : Game Engine (GE) · 559 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_surfaceMaskWheels` : `extensions.load("util_surfaceMaskWheels")`, puis la globale `util_surfaceMaskWheels`

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_surfaceMaskWheels.clear()` |  | 448 |
| `util_surfaceMaskWheels.cycleDebug()` |  | 538 |
| `util_surfaceMaskWheels.getPerformanceStats()` |  | 512 |
| `util_surfaceMaskWheels.isReady()` | Surface-mask service used by other extensions (e.g. util_lawnMower): the clipmap lifetime<br> (storage, centering, clear) is owned here, so consumers stamp/center through these instead of<br> poking the SurfaceMaskClipmap global directly. isReady lets a consumer cheaply skip its work. | 455 |
| `util_surfaceMaskWheels.maskCircleWorld(x, y, radius, flatten, mark)` |  | 463 |
| `util_surfaceMaskWheels.maskLineWorld(x1, y1, x2, y2, width, flatten, mark)` |  | 467 |
| `util_surfaceMaskWheels.onClientStartMission()` | *(hook)* | 427 |
| `util_surfaceMaskWheels.onDeserialized(data)` | *(hook)* | 492 |
| `util_surfaceMaskWheels.onExtensionLoaded()` | *(hook)* | 421 |
| `util_surfaceMaskWheels.onPreRender(dtReal, dtSim)` | *(hook)* | 391 |
| `util_surfaceMaskWheels.onSerialize()` | *(hook)* | 471 |
| `util_surfaceMaskWheels.onVehicleDestroyed(vehId)` | *(hook)* | 431 |
| `util_surfaceMaskWheels.onVehicleResetted(vehId)` | *(hook)* | 435 |
| `util_surfaceMaskWheels.setCenter(x, y)` |  | 459 |
| `util_surfaceMaskWheels.setDebug(enabled)` |  | 534 |
| `util_surfaceMaskWheels.setDebugMode(mode)` |  | 527 |
| `util_surfaceMaskWheels.setDebugPageRadius(radius)` |  | 554 |
| `util_surfaceMaskWheels.setEnabled(enabled)` |  | 439 |
| `util_surfaceMaskWheels.setMowerWidth(width)` |  | 550 |
| `util_surfaceMaskWheels.setMowingEnabled(enabled)` |  | 542 |
| `util_surfaceMaskWheels.toggle()` |  | 444 |
| `util_surfaceMaskWheels.toggleMowing()` |  | 546 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `enabled` | boolean |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawLineInstance`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/surfaceMaskWheels.lua`.*
