# `scenario_finishRaceGoal`

*Fichier : `lua/ge/extensions/scenario/finishRaceGoal.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_finishRaceGoal` : `extensions.load("scenario_finishRaceGoal")`, puis la globale `scenario_finishRaceGoal`

Objectif de scénario « finishRace » (goals.vehicles avec id = 'finishRace') : le véhicule doit terminer la course. Il écoute le dernier waypoint atteint, puis, à l'état 'onRaceResult', termine le scénario en réussite ou en échec.

## Exemple

```lua
-- JSON du scénario :
-- {"id":"finishRace", "value":{"mustWin":true, "passed":"Victoire !", "failed":"Perdu"}}
```

## Remarques

- Options de instance.value : mustWin (boolean : le véhicule doit être le premier à franchir le dernier waypoint), passed et failed (messages finaux).
- Sur 'onRaceWaypointReached', quand stateData.next est nil (dernier waypoint), le résultat est 'passed' pour le véhicule stateData.vehicleId et 'failed' pour les autres. Avec mustWin, seul le premier arrivé est évalué (le résultat n'est plus écrasé).
- Sur 'onRaceResult', chaque instance sans résultat ou en échec appelle failedGoal (message par défaut anglais 'You failed to finish the race.'), sinon passedGoal ; chacun appelle scenario_scenarios.finish.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_finishRaceGoal.init(scenario)` | Réinitialise instances et ajoute chaque goal id='finishRace' en remettant status.result à nil. *(interne)* | 66 |
| `scenario_finishRaceGoal.processState(scenario, state, stateData)` | Appelé à chaque état du scénario. Traite 'onRaceWaypointReached' (stateData.next, stateData.vehicleId) et 'onRaceResult'. *(interne)* | 31 |
| `scenario_finishRaceGoal.updateFinalStatus(scenario)` | Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress en fin de scénario. *(interne)* | 76 |

### Détail des paramètres

#### `scenario_finishRaceGoal.init(scenario)`

Réinitialise instances et ajoute chaque goal id='finishRace' en remettant status.result à nil.

- `scenario` (*table*) : Scénario courant.

#### `scenario_finishRaceGoal.processState(scenario, state, stateData)`

Appelé à chaque état du scénario. Traite 'onRaceWaypointReached' (stateData.next, stateData.vehicleId) et 'onRaceResult'.

- `scenario` (*table*) : Scénario courant.
- `state` (*string*) : Nom de l'état.
- `stateData` (*table*) : Pour 'onRaceWaypointReached' : next (prochain waypoint, nil si dernier) et vehicleId.

#### `scenario_finishRaceGoal.updateFinalStatus(scenario)`

Envoie le résultat de chaque instance à statistics_statistics.setGoalProgress en fin de scénario.

- `scenario` (*table*) : Scénario courant.

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table | Liste des goals 'finishRace', remplie par init(). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/finishRaceGoal.lua`.*
