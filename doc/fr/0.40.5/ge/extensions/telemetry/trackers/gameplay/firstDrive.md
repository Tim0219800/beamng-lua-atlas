# `telemetry_trackers_gameplay_firstDrive`

*Fichier : `lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_gameplay_firstDrive` : `extensions.load("telemetry_trackers_gameplay_firstDrive")`, puis la globale `telemetry_trackers_gameplay_firstDrive`

Suiveur de télémétrie du didacticiel « First Drive » : la session (activité « firstDriveActive »), ses leçons (démarrées, arrêtées, terminées, avec durée) et les récupérations de véhicule faites pendant la session. Hors session, seul un instantané « firstDriveProgress » (leçons terminées, lu dans settings/firstDriveLearning.json) est envoyé, au plus une fois par intervalle de sondage ou quand la progression change.

## Remarques

- Les changements de véhicule (vehicleUsed) et les resets (vehicleReset) viennent du suiveur véhicule et ne sont pas répétés ici ; une récupération déclenche aussi trackVehReset donc apparaît aussi comme vehicleReset.
- Raisons de fin de session (onFirstDriveEnded) : completed, skipToFreeroam, mainMenu, startFailed, clientEndMission ; en interne aussi restarted (redémarrage depuis le menu pause) et trackerUnloaded.
- Raisons d'arrêt de leçon : pauseMenu quand le joueur l'arrête, sinon leftArea, leftStartArea, sessionEnded, completionFailed ou une raison propre à la leçon (par ex. vehicleChanged).
- Intervalle de sondage par défaut : 7 jours (24*7 h) via telemetry_configManager.getSurveyIntervalHours ; la dernière enquête envoyée est mémorisée dans surveys/firstDriveSurvey.json du dossier de données de télémétrie.
- Extension en déchargement manuel : le cœur décharge les suiveurs avant leur onExit, donc la fin de session est faite dans onExtensionUnloaded.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_gameplay_firstDrive.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel, puis envoi éventuel de l'instantané de progression. *(interne)* *(hook)* | 171 |
| `telemetry_trackers_gameplay_firstDrive.onExtensionUnloaded()` | Hook appelé au déchargement (fermeture du jeu, rechargement Lua ou suiveur désactivé) : termine la session avec la raison trackerUnloaded. *(interne)* *(hook)* | 179 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason)` | Hook appelé à la fin de First Drive : termine l'activité ; si reason vaut completed, émet aussi firstDriveCompleted avec la durée. *(interne)* *(hook)* | 120 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id)` | Hook appelé quand une leçon est réussie : émet firstDriveLessonCompleted avec durée. *(interne)* *(hook)* | 153 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id)` | Hook appelé au début d'une leçon : émet firstDriveLessonStarted (ignoré hors session). *(interne)* *(hook)* | 124 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason)` | Hook appelé quand une leçon est interrompue : émet firstDriveLessonStopped avec raison et durée. *(interne)* *(hook)* | 149 |
| `telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout)` | Hook appelé au démarrage de First Drive (aussi lors d'un redémarrage depuis le menu pause, qui ferme la session précédente) : démarre l'activité firstDriveActive avec leçons terminées. *(interne)* *(hook)* | 104 |
| `telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer)` | Hook appelé quand la récupération de véhicule s'arrête : émet firstDriveVehicleRecovered avec la durée de maintien, la phase et la leçon (ignoré pendant l'aperçu de récupération). *(interne)* *(hook)* | 157 |

### Détail des paramètres

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason)`

Hook appelé à la fin de First Drive : termine l'activité ; si reason vaut completed, émet aussi firstDriveCompleted avec la durée.

- `reason` (*string*) : completed, skipToFreeroam, mainMenu, startFailed ou clientEndMission.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id)`

Hook appelé quand une leçon est réussie : émet firstDriveLessonCompleted avec durée.

- `id` (*string*) : Identifiant de leçon.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id)`

Hook appelé au début d'une leçon : émet firstDriveLessonStarted (ignoré hors session).

- `id` (*string*) : Identifiant de leçon.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason)`

Hook appelé quand une leçon est interrompue : émet firstDriveLessonStopped avec raison et durée.

- `id` (*string*) : Identifiant de leçon.
- `reason` (*string*) : Raison de l'arrêt.

#### `telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout)`

Hook appelé au démarrage de First Drive (aussi lors d'un redémarrage depuis le menu pause, qui ferme la session précédente) : démarre l'activité firstDriveActive avec leçons terminées.

- `startAtLookout` (*boolean*) : true si le départ se fait au belvédère.

#### `telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer)`

Hook appelé quand la récupération de véhicule s'arrête : émet firstDriveVehicleRecovered avec la durée de maintien, la phase et la leçon (ignoré pendant l'aperçu de récupération).

- `timer` (*number*) : Durée de maintien en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

## Appels vers le moteur (C++)

- `FS:` `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua`.*
