# `ui_pause_routeLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua` · VM : Game Engine (GE) · 705 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_routeLifecycleCallbacks` : `extensions.load("ui_pause_routeLifecycleCallbacks")`, puis la globale `ui_pause_routeLifecycleCallbacks`

**Dépendances (chargées avant) :** `ui_pause_actions`, `ui_pause_providers_routeData_system`, `ui_pause_providers_routeData_home`, `ui_pause_providers_routeData_career`, `ui_pause_providers_routeData_vehicle`, `ui_pause_providers_routeData_environment`, `ui_pause_providers_routeData_multiplayer`, `ui_pause_providers_routeData_gamemodes`, `ui_pause_providers_routeData_photomode`, `ui_pause_providers_trafficControls`, `ui_pause_providers_vehicleTabInteractions`, `ui_pause_photomode`, `ui_pause_vehicleConfigurationOccupants`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_routeLifecycleCallbacks.onPauseBigmapLeave(context, toRoute, fromRoute, data)` | *(hook)* | 655 |
| `ui_pause_routeLifecycleCallbacks.onPauseEnter(context, toRoute, fromRoute, data)` | *(hook)* | 573 |
| `ui_pause_routeLifecycleCallbacks.onPauseLeave(context, toRoute, fromRoute, data)` | *(hook)* | 606 |
| `ui_pause_routeLifecycleCallbacks.onPauseMount(context, toRoute, fromRoute, data)` | *(hook)* | 595 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeEnter(context, toRoute, fromRoute, data)` | *(hook)* | 665 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeLeave(context, toRoute, fromRoute, data)` | *(hook)* | 689 |
| `ui_pause_routeLifecycleCallbacks.onPhotomodeMount(context, toRoute, fromRoute, data)` | *(hook)* | 681 |
| `ui_pause_routeLifecycleCallbacks.onVehicleConfigTargetChanged(current, previous, reason)` | *(hook)* | 641 |
| `ui_pause_routeLifecycleCallbacks.onVehicleConfigurationLeave(context, toRoute, fromRoute, data)` | *(hook)* | 626 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/routeLifecycleCallbacks.lua`.*
