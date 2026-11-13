# `telemetry_trackers_gameplay_firstDrive`

*Fichier : `lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_gameplay_firstDrive` : `extensions.load("telemetry_trackers_gameplay_firstDrive")`, puis la globale `telemetry_trackers_gameplay_firstDrive`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_gameplay_firstDrive.onExtensionLoaded()` | *(hook)* | 171 |
| `telemetry_trackers_gameplay_firstDrive.onExtensionUnloaded()` | game exit, a lua reload and disabling the tracker all unload it, the core unloads the<br> trackers before their onExit would run *(hook)* | 179 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason)` | reason: completed, skipToFreeroam, mainMenu, startFailed or clientEndMission *(hook)* | 120 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id)` | *(hook)* | 153 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id)` | *(hook)* | 124 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason)` | reason: pauseMenu when the player stops it, otherwise leftArea, leftStartArea, sessionEnded,<br> completionFailed or a lesson specific one like vehicleChanged *(hook)* | 149 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout)` | Also fires for a restart from the pause menu, which closes the previous session *(hook)* | 104 |
| `telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer)` | *(hook)* | 157 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua`.*
