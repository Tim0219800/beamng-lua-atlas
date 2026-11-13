# `scenario_raceGoals`

*Fichier : `lua/ge/extensions/scenario/raceGoals.lua` · VM : Game Engine (GE) · 260 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_raceGoals` : `extensions.load("scenario_raceGoals")`, puis la globale `scenario_raceGoals`

Distributeur des objectifs (goals) d'un scénario. À l'initialisation il lit les goals déclarés dans scenario.vehicles[nom].goal du JSON, crée scenario.goals.vehicles, valide les options avec un schéma, charge dynamiquement le module de chaque goal ('scenario/<id>' ou 'scenario/<id>goal') et appelle son init. Ensuite il relaie les évènements de course (onRaceInit, onRaceStart, onRaceTick, onRaceWaypointReached, onRaceResult, onCountdownEnded) vers goal.processState(scenario, nomEtat, données).

## Exemple

```lua
-- Dans le JSON d'un scénario :
-- "vehicles": { "scenario_player0": { "goal": { "nomove": {"msg":"Ne bougez pas"}, "damage": {"damageLimit":3000} } } }
-- '*' sert de valeur par défaut pour les véhicules non listés.
```

## Remarques

- Schéma de validation des goals (type attendu par option) : timeLimit {msg, maxTime, countdown, waitTime}, nomove {msg, triggerEndOnly}, position {msg, purpose, endPoint}, damage {msg, purpose, damageLimit, damageThreshold}, distance {msg, purpose, maxDistance, minDistance, distanceEnable, target}, speed {msg, purpose, maxSpeed, minSpeed, maxTimeout, wayPointNum, delay}, drift {msg, failMsg, minDrift, maxDrift, timeAllowance}, finishRace {passed, failed, mustWin}, wayPointAction {wayPointNum, wayPointMsg}. 'localizedString' accepte une chaîne ou une table avec txt.
- Un écart au schéma n'est que journalisé (log E 'Schema error in scenario json') : le goal est quand même chargé.
- Une valeur string de type localizedString qui ne commence pas par 'scenarios.' déclenche un avertissement de localisation manquante.
- Forme du goal dans le JSON : soit une liste de noms (goal.id = nom, value = {msg='you hit something'}), soit une table nom -> options. La détection se fait avec la fonction locale istable (présence d'une clé non numérique).
- Le module d'un goal doit exister dans lua/ge/extensions/scenario/ sous le nom <id>.lua ou <id>Goal.lua et exposer init, processState, updateFinalStatus.
- M.onRaceEnd est exporté mais vaut nil (variable jamais définie).
- onRaceResult mémorise le statut final dans scenario.finalStatus avant de relayer l'état.
- initialiseGoals met scenario.targetName à '' et émet le hook extensions.hook('onRaceGoalsInitilised', scenario) (orthographe du code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_raceGoals.initialiseGoals()` | Construit scenario.goals.vehicles à partir des véhicules du scénario (scenario.vehicleNameToId), valide le schéma, charge les modules de goals et appelle init sur chacun, puis émet le hook onRaceGoalsInitilised. *(interne)* | 128 |
| `scenario_raceGoals.onCountdownEnded()` | Hook appelé à la fin du compte à rebours : relaie 'onCountdownEnded' aux goals. *(interne)* *(hook)* | 240 |
| `scenario_raceGoals.onRaceInit()` | Hook de course : relaie l'état 'onRaceInit' à tous les goals. *(interne)* *(hook)* | 201 |
| `scenario_raceGoals.onRaceResult(status)` | Hook appelé à la fin de la course : enregistre scenario.finalStatus et relaie 'onRaceResult' aux goals. *(interne)* *(hook)* | 229 |
| `scenario_raceGoals.onRaceStart()` | Hook de course : relaie l'état 'onRaceStart' à tous les goals. *(interne)* *(hook)* | 192 |
| `scenario_raceGoals.onRaceTick(raceTickTime, scenarioTimer)` | Hook appelé périodiquement pendant la course : relaie 'onRaceTick' avec {raceTickTime, scenarioTimer} à tous les goals. *(interne)* *(hook)* | 219 |
| `scenario_raceGoals.onRaceWaypointReached(data)` | Hook appelé quand un véhicule atteint un waypoint : relaie 'onRaceWaypointReached' avec les données reçues aux goals. *(interne)* *(hook)* | 210 |
| `scenario_raceGoals.updateGoalsFinalStatus()` | Appelle updateFinalStatus(scenario) sur chaque goal chargé, pour enregistrer les résultats finaux. *(interne)* | 182 |

### Détail des paramètres

#### `scenario_raceGoals.onRaceResult(status)`

Hook appelé à la fin de la course : enregistre scenario.finalStatus et relaie 'onRaceResult' aux goals.

- `status` (*table*) : Résultat final de la course.

#### `scenario_raceGoals.onRaceTick(raceTickTime, scenarioTimer)`

Hook appelé périodiquement pendant la course : relaie 'onRaceTick' avec {raceTickTime, scenarioTimer} à tous les goals.

- `raceTickTime` (*number*) : Temps du tick de course.
- `scenarioTimer` (*number*) : Chronomètre du scénario.

#### `scenario_raceGoals.onRaceWaypointReached(data)`

Hook appelé quand un véhicule atteint un waypoint : relaie 'onRaceWaypointReached' avec les données reçues aux goals.

- `data` (*table*) : Données du waypoint (vehicleId, next, time...).

## Champs

| Champ | Type | Description |
|---|---|---|
| `onRaceEnd` | any |  ⚠ référence `onRaceEnd` non définie dans le fichier (vaut probablement nil) |
| `state` | table | {goals = {}} : table nom de goal -> module chargé, remplie par initialiseGoals. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRaceGoalsInitilised` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceGoals.lua`.*
