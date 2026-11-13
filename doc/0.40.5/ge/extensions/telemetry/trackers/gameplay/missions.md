# `telemetry_trackers_gameplay_missions`

*Fichier : `lua/ge/extensions/telemetry/trackers/gameplay/missions.lua` · VM : Game Engine (GE) · 190 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_gameplay_missions` : `extensions.load("telemetry_trackers_gameplay_missions")`, puis la globale `telemetry_trackers_gameplay_missions`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom)` | Fires once the mission is actually running, for every start path including the ones that<br> load a level first. startedFrom is missionScreen (in level), gameplaySelector, discover or<br> withinMission (retry, next mission or reconfigure from the end screen). Starts from career<br> tutorials, activity flows, multiplayer or scenarios report other. *(hook)* | 24 |
| `telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission)` | Every stop passes through here, including the instant one on a level change, a return to<br> the main menu or a career start, which skips onMissionStopped *(hook)* | 163 |
| `telemetry_trackers_gameplay_missions.onEndScreenUIOpened()` | Counterpart of missionStartScreenOpened. Carries no result: the screen is told what to<br> show from elsewhere, and a mission built on the endScreenWhole node never fires this at<br> all. The results come from onMissionAttemptAggregated below. *(hook)* | 67 |
| `telemetry_trackers_gameplay_missions.onExtensionLoaded()` | *(hook)* | 169 |
| `telemetry_trackers_gameplay_missions.onExtensionUnloaded()` | game exit, a lua reload and disabling the tracker all unload it, the core unloads the<br> trackers before their onExit would run *(hook)* | 176 |
| `telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer)` | Fires when the mission is closed early, before it would stop on its own. attemptsCompleted<br> is 0 when the player left without finishing a single attempt. byPlayer is false when the<br> game closed the mission itself, for example after a failed vehicle spawn.<br> Missions that handle the abandon themselves still stop afterwards, the activity is already<br> closed by then. *(hook)* | 149 |
| `telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey)` | Fires as the attempt is saved, the one point where the whole result exists as a single<br> table. Which of the data fields are filled depends on the mission type. *(hook)* | 87 |
| `telemetry_trackers_gameplay_missions.onMissionReconfigured(data)` | *(hook)* | 130 |
| `telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id)` | *(hook)* | 121 |
| `telemetry_trackers_gameplay_missions.onStartScreenFinishedBuilding()` | *(hook)* | 110 |
| `telemetry_trackers_gameplay_missions.onUIStartButtonClicked()` | The start and end screen nodes are also used outside missions, split screen gamemodes<br> for example, so both events are only counted while a mission runs *(hook)* | 56 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/gameplay/missions.lua`.*
