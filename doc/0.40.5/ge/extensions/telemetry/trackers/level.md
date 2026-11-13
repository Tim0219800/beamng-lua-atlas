# `telemetry_trackers_level`

*Fichier : `lua/ge/extensions/telemetry/trackers/level.lua` · VM : Game Engine (GE) · 135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_level` : `extensions.load("telemetry_trackers_level")`, puis la globale `telemetry_trackers_level`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_level.onClientEndMission(levelPath)` | *(hook)* | 84 |
| `telemetry_trackers_level.onClientPreStartMission(levelPath)` | The top of the load pipeline, before the datablocks, the objects and the physics. Fires on<br> every load, restarts included. Entering a level the game is already in skips it, and that<br> level is then reported without a load time rather than with the previous one. *(hook)* | 57 |
| `telemetry_trackers_level.onClientStartMission(levelPath)` | *(hook)* | 62 |
| `telemetry_trackers_level.onExit()` | close the open activities so the session file is not left with dangling starts *(hook)* | 114 |
| `telemetry_trackers_level.onExtensionLoaded()` | *(hook)* | 103 |
| `telemetry_trackers_level.onExtensionUnloaded()` | a lua reload tears the trackers down without an onExit, so close the activities here too *(hook)* | 39 |
| `telemetry_trackers_level.onFlowgraphScenarioStarted(scenario)` | flowgraph scenarios never reach scenario_scenarios, so onScenarioLoaded does not fire<br> for them. They carry no finish signal either, so endLevel closes them as aborted. *(hook)* | 88 |
| `telemetry_trackers_level.onScenarioFinished(scenario)` | *(hook)* | 93 |
| `telemetry_trackers_level.onScenarioLoaded(scenario)` | *(hook)* | 88 |
| `telemetry_trackers_level.onScenarioRestarted(scenario)` | *(hook)* | 98 |
| `telemetry_trackers_level.onWorldReadyState(state)` | State 2 is the first moment the player can drive: the camera has its control object and the<br>  player vehicle reports its render materials ready. That is later than onClientStartMission,<br>  which still runs with the loading screen up.<br><br>  Two things to know about the number. The material wait inside state 2 gives up after five<br>  seconds, so a very slow load reports the point it gave up rather than the point it finished.<br>  And a level with no player vehicle reaches state 2 immediately, so it looks quick. *(hook)* | 77 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/level.lua`.*
