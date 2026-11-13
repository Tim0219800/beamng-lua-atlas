# `telemetry_trackers_vehicle`

*Fichier : `lua/ge/extensions/telemetry/trackers/vehicle.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_vehicle` : `extensions.load("telemetry_trackers_vehicle")`, puis la globale `telemetry_trackers_vehicle`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_vehicle.onClientEndMission()` | *(hook)* | 78 |
| `telemetry_trackers_vehicle.onExit()` | *(hook)* | 91 |
| `telemetry_trackers_vehicle.onExtensionLoaded()` | *(hook)* | 82 |
| `telemetry_trackers_vehicle.onExtensionUnloaded()` | a lua reload tears the trackers down without an onExit, so close the activity here too *(hook)* | 21 |
| `telemetry_trackers_vehicle.onVehicleSpawned(vid)` | *(hook)* | 37 |
| `telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 49 |
| `telemetry_trackers_vehicle.trackVehReset()` |  | 61 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/vehicle.lua`.*
