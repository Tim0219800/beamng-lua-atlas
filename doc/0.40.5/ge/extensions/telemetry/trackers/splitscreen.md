# `telemetry_trackers_splitscreen`

*Fichier : `lua/ge/extensions/telemetry/trackers/splitscreen.lua` · VM : Game Engine (GE) · 184 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_splitscreen` : `extensions.load("telemetry_trackers_splitscreen")`, puis la globale `telemetry_trackers_splitscreen`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_splitscreen.onClientEndMission()` | *(hook)* | 160 |
| `telemetry_trackers_splitscreen.onClientStartMission()` | *(hook)* | 156 |
| `telemetry_trackers_splitscreen.onExit()` | *(hook)* | 166 |
| `telemetry_trackers_splitscreen.onExtensionLoaded()` | *(hook)* | 151 |
| `telemetry_trackers_splitscreen.onExtensionUnloaded()` | *(hook)* | 166 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result)` | The end screen of a round. Player indices are not reported, only the kind of result. *(hook)* | 132 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId)` | Fires for every round, a restart from the end screen or the pause menu included *(hook)* | 121 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeStopped()` | *(hook)* | 142 |
| `telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode)` | *(hook)* | 96 |
| `telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity)` | entry is discover or multiseatSettings, activity is the gamemode id or freeroam *(hook)* | 54 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/splitscreen.lua`.*
