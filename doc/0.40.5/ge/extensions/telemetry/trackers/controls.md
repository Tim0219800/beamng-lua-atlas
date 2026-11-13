# `telemetry_trackers_controls`

*Fichier : `lua/ge/extensions/telemetry/trackers/controls.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_controls` : `extensions.load("telemetry_trackers_controls")`, puis la globale `telemetry_trackers_controls`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_controls.onExtensionLoaded()` | *(hook)* | 45 |
| `telemetry_trackers_controls.onExtensionUnloaded()` | core unloads the trackers before it flushes the buffer, so this still reaches the file *(hook)* | 50 |
| `telemetry_trackers_controls.onSerialize(reason)` | *(hook)* | 56 |
| `telemetry_trackers_controls.onSteeringFilterChanged(method)` | *(hook)* | 22 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/controls.lua`.*
