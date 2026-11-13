# `telemetry_trackers_career`

*Fichier : `lua/ge/extensions/telemetry/trackers/career.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_career` : `extensions.load("telemetry_trackers_career")`, puis la globale `telemetry_trackers_career`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_career.onBeforeVehicleSell(data)` | *(hook)* | 56 |
| `telemetry_trackers_career.onCareerActive(active, newSave)` | *(hook)* | 24 |
| `telemetry_trackers_career.onExtensionLoaded()` | *(hook)* | 70 |
| `telemetry_trackers_career.onExtensionUnloaded()` | a lua reload tears the trackers down without an onExit, so close the activity here too *(hook)* | 18 |
| `telemetry_trackers_career.onVehicleAddedToInventory(data)` | *(hook)* | 42 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/career.lua`.*
