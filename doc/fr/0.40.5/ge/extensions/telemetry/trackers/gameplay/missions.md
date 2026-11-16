# `telemetry_trackers_gameplay_missions`

*Fichier : `lua/ge/extensions/telemetry/trackers/gameplay/missions.lua` · VM : Game Engine (GE) · 190 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_gameplay_missions` : `extensions.load("telemetry_trackers_gameplay_missions")`, puis la globale `telemetry_trackers_gameplay_missions`

Suiveur de télémétrie des missions : suit l'entonnoir (quelles missions démarrent, comment elles sont configurées, comment elles finissent). L'activité « missionRunning » porte la durée ; des évènements ponctuels signalent le clic sur Démarrer, l'ouverture des écrans de début/fin, chaque tentative terminée, les redémarrages, reconfigurations et abandons.

## Remarques

- Ne jamais mettre de clé « name » dans les données d'activité : elle remplacerait le nom de l'activité et les évènements de début et de fin ne pourraient plus être appariés.
- Les nœuds d'écran de début/fin sont aussi utilisés hors missions (modes écran partagé) : les évènements ne sont comptés que pendant une mission.
- Une mission construite sur le nœud endScreenWhole ne déclenche jamais onEndScreenUIOpened ; les résultats viennent de onMissionAttemptAggregated.
- Issues de fin d'activité : stopped, abandoned, trackerUnloaded.

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom)` | Hook appelé quand la mission tourne réellement, pour tous les chemins de démarrage (y compris ceux qui chargent d'abord un niveau). Démarre l'activité missionRunning. startedFrom : missionScreen (en niveau), gameplaySelector, discover, withinMission (nouvel essai, mission suivante ou reconfiguration depuis l'écran de fin) ; les départs depuis tutoriels de carrière, flux d'activité, multijoueur ou scénarios donnent « other ». *(interne)* *(hook)* | 24 |
| `telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission)` | Hook appelé avant tout arrêt de mission, y compris l'arrêt instantané lors d'un changement de niveau, d'un retour au menu ou d'un démarrage de carrière (qui saute onMissionStopped). Termine l'activité avec l'issue « stopped ». *(interne)* *(hook)* | 163 |
| `telemetry_trackers_gameplay_missions.onEndScreenUIOpened()` | Hook appelé à l'ouverture de l'écran de fin : émet missionEndScreenOpened (sans résultat). *(interne)* *(hook)* | 67 |
| `telemetry_trackers_gameplay_missions.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel. *(interne)* *(hook)* | 169 |
| `telemetry_trackers_gameplay_missions.onExtensionUnloaded()` | Hook appelé au déchargement (fermeture du jeu, rechargement Lua, suiveur désactivé) : termine l'activité avec l'issue trackerUnloaded. *(interne)* *(hook)* | 176 |
| `telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer)` | Hook appelé quand la mission est fermée prématurément : émet missionAbandoned (byPlayer, attemptsCompleted, qui vaut 0 si aucun essai n'a été terminé) et termine l'activité avec l'issue « abandoned ». byPlayer est false quand le jeu ferme lui-même la mission, par exemple après un échec d'apparition de véhicule. *(interne)* *(hook)* | 149 |
| `telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey)` | Hook appelé quand une tentative est enregistrée (seul moment où le résultat complet existe en une table) : émet missionAttemptCompleted (issue, numéro, étoiles, temps, pénalité, points, modèle et config du véhicule). Les champs remplis dépendent du type de mission. *(interne)* *(hook)* | 87 |
| `telemetry_trackers_gameplay_missions.onMissionReconfigured(data)` | Hook appelé quand les réglages d'une mission changent : émet missionReconfigured avec les seuls réglages modifiés. *(interne)* *(hook)* | 130 |
| `telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id)` | Hook appelé au clic d'un bouton du message de récupération : si id vaut restartMission, émet missionRestarted. *(interne)* *(hook)* | 121 |
| `telemetry_trackers_gameplay_missions.onStartScreenFinishedBuilding()` | Hook appelé quand l'écran de départ est construit : émet missionStartScreenOpened une seule fois par mission. *(interne)* *(hook)* | 110 |
| `telemetry_trackers_gameplay_missions.onUIStartButtonClicked()` | Hook appelé au clic sur le bouton Démarrer : émet missionStartButtonClicked (seulement pendant une mission). *(interne)* *(hook)* | 56 |

### Détail des paramètres

#### `telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom)`

Hook appelé quand la mission tourne réellement, pour tous les chemins de démarrage (y compris ceux qui chargent d'abord un niveau). Démarre l'activité missionRunning. startedFrom : missionScreen (en niveau), gameplaySelector, discover, withinMission (nouvel essai, mission suivante ou reconfiguration depuis l'écran de fin) ; les départs depuis tutoriels de carrière, flux d'activité, multijoueur ou scénarios donnent « other ».

- `state` (*string*) : État ; seul « started » est pris en compte.
- `mission` (*table*) : Mission (doit avoir _isOngoing).
- `userSettings` (*table*) : Réglages du joueur pour la mission.
- `startedFrom` (*string|nil*) : Origine du démarrage.

#### `telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission)`

Hook appelé avant tout arrêt de mission, y compris l'arrêt instantané lors d'un changement de niveau, d'un retour au menu ou d'un démarrage de carrière (qui saute onMissionStopped). Termine l'activité avec l'issue « stopped ».

- `state` (*string*) : Seul « stopped » est pris en compte.
- `mission` (*table*) : Mission concernée.

#### `telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer)`

Hook appelé quand la mission est fermée prématurément : émet missionAbandoned (byPlayer, attemptsCompleted, qui vaut 0 si aucun essai n'a été terminé) et termine l'activité avec l'issue « abandoned ». byPlayer est false quand le jeu ferme lui-même la mission, par exemple après un échec d'apparition de véhicule.

- `mission` (*table*) : Mission.
- `byPlayer` (*boolean*) : true si le joueur a abandonné.

#### `telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey)`

Hook appelé quand une tentative est enregistrée (seul moment où le résultat complet existe en une table) : émet missionAttemptCompleted (issue, numéro, étoiles, temps, pénalité, points, modèle et config du véhicule). Les champs remplis dépendent du type de mission.

- `attempt` (*table*) : Tentative (type, attemptNumber, unlockedStars, data).
- `mission` (*table*) : Mission.
- `progressKey` (*string*) : Clé de progression.

#### `telemetry_trackers_gameplay_missions.onMissionReconfigured(data)`

Hook appelé quand les réglages d'une mission changent : émet missionReconfigured avec les seuls réglages modifiés.

- `data` (*table*) : {mission, oldUserSettings, newUserSettings}

#### `telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id)`

Hook appelé au clic d'un bouton du message de récupération : si id vaut restartMission, émet missionRestarted.

- `id` (*string*) : Identifiant du bouton.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/gameplay/missions.lua`.*
