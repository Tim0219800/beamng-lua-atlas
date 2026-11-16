# `scenario_raceUI`

*Fichier : `lua/ge/extensions/scenario/raceUI.lua` · VM : Game Engine (GE) · 101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_raceUI` : `extensions.load("scenario_raceUI")`, puis la globale `scenario_raceUI`

Pont entre la course de scénario et l'interface : envoie à l'UI la progression des waypoints (WayPointChange), des tours (RaceLapChange) et les comparaisons de temps avec le tour précédent (RaceCheckpointComparison, RaceTimeComparison). Ne réagit qu'aux évènements du véhicule du joueur 0.

## Remarques

- Évènements UI émis par guihooks.trigger : WayPointChange {current, count} ou nil, RaceLapChange {current, count} ou nil, RaceCheckpointComparison {timeOut = 5000, time}, RaceTimeComparison {timeOut = 5000, time}.
- Les comparaisons ne sont émises qu'à partir du deuxième tour (lastTimeId > 1), et sont ignorées si scenario.disableWaypointTimes est vrai.
- À chaque tour terminé, un message ui_message 'lap N time: X.XXXs' est affiché 2 s.
- M.initialise n'est pas un hook : à appeler explicitement par le code du scénario.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_raceUI.initialise(scenario)` | Vide les temps de waypoints mémorisés et efface côté UI les affichages de waypoint et de tour. | 10 |
| `scenario_raceUI.onRaceLap(data)` | Hook appelé à chaque tour terminé. Pour le véhicule du joueur, met à jour le numéro de tour (plafonné à lapCount), remet la progression de waypoint à fond et affiche le temps du tour. *(interne)* *(hook)* | 70 |
| `scenario_raceUI.onRaceStart()` | Hook de début de course : envoie WayPointChange {current = 0, count = N} si la configuration de tour a plus d'un waypoint, et RaceLapChange {current = 1, count = lapCount} si lapCount > 1. *(interne)* *(hook)* | 17 |
| `scenario_raceUI.onRaceWaypointReached(data)` | Hook appelé à chaque waypoint atteint. Pour le véhicule du joueur, mémorise le temps, émet les comparaisons de temps avec le tour précédent et met à jour la progression de waypoint. *(interne)* *(hook)* | 38 |
| `scenario_raceUI.onScenarioChange(scenario)` | Hook de changement d'état du scénario : efface l'affichage de waypoint quand le scénario est absent ou en 'pre-start'. *(interne)* *(hook)* | 30 |

### Détail des paramètres

#### `scenario_raceUI.initialise(scenario)`

Vide les temps de waypoints mémorisés et efface côté UI les affichages de waypoint et de tour.

- `scenario` (*table*) : Scénario (non utilisé).

#### `scenario_raceUI.onRaceLap(data)`

Hook appelé à chaque tour terminé. Pour le véhicule du joueur, met à jour le numéro de tour (plafonné à lapCount), remet la progression de waypoint à fond et affiche le temps du tour.

- `data` (*table*) : Données du tour : vehicleId, lap, time (secondes).

#### `scenario_raceUI.onRaceWaypointReached(data)`

Hook appelé à chaque waypoint atteint. Pour le véhicule du joueur, mémorise le temps, émet les comparaisons de temps avec le tour précédent et met à jour la progression de waypoint.

- `data` (*table*) : Données du waypoint : vehicleId, time, cur, currentLapConfig.

#### `scenario_raceUI.onScenarioChange(scenario)`

Hook de changement d'état du scénario : efface l'affichage de waypoint quand le scénario est absent ou en 'pre-start'.

- `scenario` (*table|nil*) : Scénario courant.

**Évènements UI (guihooks.trigger) :** `RaceCheckpointComparison`, `RaceLapChange`, `RaceTimeComparison`, `WayPointChange`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceUI.lua`.*
