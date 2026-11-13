# `telemetry_trackers_gameplay_other`

*Fichier : `lua/ge/extensions/telemetry/trackers/gameplay/other.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_gameplay_other` : `extensions.load("telemetry_trackers_gameplay_other")`, puis la globale `telemetry_trackers_gameplay_other`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_gameplay_other.onExit()` | *(hook)* | 59 |
| `telemetry_trackers_gameplay_other.onExtensionLoaded()` | *(hook)* | 64 |
| `telemetry_trackers_gameplay_other.onExtensionUnloaded()` | a lua reload tears the trackers down without an onExit, so close the activities here too *(hook)* | 59 |
| `telemetry_trackers_gameplay_other.onTaxiCalled(result)` | result: dispatched, noTaxiAvailable or tooFarFromRoad *(hook)* | 34 |
| `telemetry_trackers_gameplay_other.onTaxiRideEnded(data)` | reason is exited or trafficStopped. phase is where the ride was when it ended, arriving<br> means the taxi had stopped for the player. Distances are in meters. *(hook)* | 53 |
| `telemetry_trackers_gameplay_other.onTaxiRideStarted(called)` | called is false for a taxi hailed at the roadside *(hook)* | 42 |
| `telemetry_trackers_gameplay_other.onTrackBuilderWindowToggled(open)` | The window funnels every open and close through one call, which also repeats the<br> current state, so the activity is paired off our own state instead. *(hook)* | 20 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/gameplay/other.lua`.*
