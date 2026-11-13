# `gameplay_freeformDelivery_freeformDelivery`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua` · VM : Game Engine (GE) · 680 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_freeformDelivery` : `extensions.load("gameplay_freeformDelivery_freeformDelivery")`, puis la globale `gameplay_freeformDelivery_freeformDelivery`

**Dépendances (chargées avant) :** `core_vehicles`, `core_gamestate`, `gameplay_sites_sitesManager`, `core_flowgraphManager`, `core_quickAccess`, `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_loader`, `gameplay_freeformDelivery_setup`, `gameplay_freeformDelivery_goals`, `gameplay_freeformDelivery_tasklist`, `gameplay_freeformDelivery_markers`, `gameplay_freeformDelivery_endScreen`, `gameplay_freeformDelivery_hints`, `gameplay_freeformDelivery_routes`, `gameplay_freeformDelivery_debug`, `gameplay_freeformDelivery_odometer`, `gameplay_freeformDelivery_vehicleSleep`, `core_groundMarkers`, `core_input_actionFilter`, `ui_apps_genericMissionData`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_freeformDelivery.cleanup()` | Legacy cleanup function (now calls teardown for backwards compatibility) | 666 |
| `gameplay_freeformDelivery_freeformDelivery.finish(failed, reason)` |  | 235 |
| `gameplay_freeformDelivery_freeformDelivery.getCurrentDelivery()` |  | 174 |
| `gameplay_freeformDelivery_freeformDelivery.getFailReason()` | Expose failReason | 112 |
| `gameplay_freeformDelivery_freeformDelivery.getProgress()` |  | 296 |
| `gameplay_freeformDelivery_freeformDelivery.getResults()` |  | 305 |
| `gameplay_freeformDelivery_freeformDelivery.getSetupPending()` |  | 183 |
| `gameplay_freeformDelivery_freeformDelivery.getStartTime()` |  | 178 |
| `gameplay_freeformDelivery_freeformDelivery.isActive()` | Expose isActive for quickAccess | 97 |
| `gameplay_freeformDelivery_freeformDelivery.isFailed()` | Expose isFailed state | 107 |
| `gameplay_freeformDelivery_freeformDelivery.isFinished()` | Expose isFinished state | 102 |
| `gameplay_freeformDelivery_freeformDelivery.isLoaded()` |  | 170 |
| `gameplay_freeformDelivery_freeformDelivery.load(path)` | Public API | 117 |
| `gameplay_freeformDelivery_freeformDelivery.onBeforeRadialOpened()` | *(hook)* | 505 |
| `gameplay_freeformDelivery_freeformDelivery.onClientEndMission()` | *(hook)* | 674 |
| `gameplay_freeformDelivery_freeformDelivery.onExtensionUnloaded()` | *(hook)* | 670 |
| `gameplay_freeformDelivery_freeformDelivery.onQuickAccessLoaded()` | *(hook)* | 509 |
| `gameplay_freeformDelivery_freeformDelivery.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 538 |
| `gameplay_freeformDelivery_freeformDelivery.reset()` |  | 315 |
| `gameplay_freeformDelivery_freeformDelivery.start()` |  | 187 |
| `gameplay_freeformDelivery_freeformDelivery.teardown(keepVehicles)` | Teardown: Actually removes vehicles, unloads delivery, etc. | 624 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `debug` | table | Debug configuration (accessible by submodules via gameplay_freeformDelivery_freeformDelivery.debug) |
| `dependencies` | table | M.onExtensionLoaded = function() setExtensionUnloadMode(M, "manual") end |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/freeformDelivery.lua`.*
