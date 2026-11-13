# `telemetry_trackers_traffic`

*Fichier : `lua/ge/extensions/telemetry/trackers/traffic.lua` · VM : Game Engine (GE) · 65 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_traffic` : `extensions.load("telemetry_trackers_traffic")`, puis la globale `telemetry_trackers_traffic`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_traffic.onClientEndMission()` | traffic does not always stop cleanly on a level change, so close the activity here *(hook)* | 46 |
| `telemetry_trackers_traffic.onExit()` | traffic does not always stop cleanly on a level change, so close the activity here *(hook)* | 46 |
| `telemetry_trackers_traffic.onExtensionLoaded()` | *(hook)* | 50 |
| `telemetry_trackers_traffic.onExtensionUnloaded()` | traffic does not always stop cleanly on a level change, so close the activity here *(hook)* | 46 |
| `telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount)` | Fires whenever vehicles are pooled in or out. Only the peak is kept, no event. *(hook)* | 39 |
| `telemetry_trackers_traffic.onTrafficStarted()` | *(hook)* | 22 |
| `telemetry_trackers_traffic.onTrafficStopped()` | *(hook)* | 31 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/traffic.lua`.*
