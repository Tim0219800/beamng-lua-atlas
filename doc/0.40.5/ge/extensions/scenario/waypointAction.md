# `scenario_waypointAction`

*Fichier : `lua/ge/extensions/scenario/waypointAction.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_waypointAction` : `extensions.load("scenario_waypointAction")`, puis la globale `scenario_waypointAction`

But de scénario « wayPointAction » : affiche un message à l'écran quand un véhicule atteint certains waypoints de la course. Chargé par scenario_raceGoals (init, processState, updateFinalStatus) ; déclaré dans goals.vehicles avec id 'wayPointAction'.

## Exemple

```lua
-- JSON : {"id":"wayPointAction", "vehicle":"scenario_player0", "value":{"wayPointNum":[2,4], "wayPointMsg":["Moitié !", "Presque fini"]}}
```

## Remarques

- Sur l'évènement 'onRaceWaypointReached' (seulement si scenario.state == 'running' et raceState == 'racing'), compare vehWpData.cur (index de waypoint courant, via scenario_waypoints.getVehicleWaypointData) à chaque entrée de value.wayPointNum et affiche value.wayPointMsg[i] pendant 2 s (helper.flashUiMessage) à l'index correspondant.
- Bug/incohérence : init met value.wayPointMsg à la chaîne " " si absent ; l'indexer comme un tableau (wayPointMsg[i]) donne nil et le message affiché est vide/nil.
- Bug/incohérence : init ne vérifie pas que wayPointNum existe ; s'il est nil, processState appelle next(nil) et lève une erreur Lua.
- Bug/incohérence : si getVehicleWaypointData renvoie nil (véhicule sans données de waypoint), vehWpData.cur lève une erreur.
- updateFinalStatus est vide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_waypointAction.init(scenario)` | Reconstruit M.instances à partir de scenario.goals.vehicles (id == 'wayPointAction') après validation du type de wayPointNum (tableau). *(interne)* | 38 |
| `scenario_waypointAction.processState(scenario, state, stateData)` | Appelée par scenario_raceGoals ; ne réagit qu'à 'onRaceWaypointReached' pendant la course et affiche le message du waypoint atteint. *(interne)* | 9 |
| `scenario_waypointAction.updateFinalStatus(scenario, instance)` | Appelée en fin de scénario ; ne fait rien. *(interne)* | 55 |

### Détail des paramètres

#### `scenario_waypointAction.init(scenario)`

Reconstruit M.instances à partir de scenario.goals.vehicles (id == 'wayPointAction') après validation du type de wayPointNum (tableau).

- `scenario` (*table*) : scénario courant

#### `scenario_waypointAction.processState(scenario, state, stateData)`

Appelée par scenario_raceGoals ; ne réagit qu'à 'onRaceWaypointReached' pendant la course et affiche le message du waypoint atteint.

- `scenario` (*table*) : scénario courant
- `state` (*string*) : nom du hook
- `stateData` (*table|nil*) : données du hook (non utilisées)

#### `scenario_waypointAction.updateFinalStatus(scenario, instance)`

Appelée en fin de scénario ; ne fait rien.

- `scenario` (*table*) : scénario courant
- `instance` (*table*) : non utilisé

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table<integer, table> | Instances du but 'wayPointAction' pour le scénario courant, remplies par init. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/waypointAction.lua`.*
