# `telemetry_trackers_performance`

*Fichier : `lua/ge/extensions/telemetry/trackers/performance.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_performance` : `extensions.load("telemetry_trackers_performance")`, puis la globale `telemetry_trackers_performance`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_performance.onExtensionLoaded()` | *(hook)* | 64 |
| `telemetry_trackers_performance.onUpdate(dtReal, dtSim, dtRaw)` | Runs every frame, so it does one clock call and one comparison and nothing else. Readings<br> are taken wherever the game is, menus included; where it was is on the event. *(hook)* | 56 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/performance.lua`.*
