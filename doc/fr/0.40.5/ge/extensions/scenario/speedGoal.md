# `scenario_speedGoal`

*Fichier : `lua/ge/extensions/scenario/speedGoal.lua` · VM : Game Engine (GE) · 151 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_speedGoal` : `extensions.load("scenario_speedGoal")`, puis la globale `scenario_speedGoal`

But de scénario « speed » : surveille la vitesse d'un véhicule et gagne ou échoue quand elle reste hors de la plage [minSpeed, maxSpeed] plus de maxTimeout secondes. Chargé par scenario_raceGoals qui appelle init, processState et updateFinalStatus ; un scénario le déclare dans goals.vehicles avec id 'speed'.

## Exemple

```lua
-- dans le JSON d'un scénario, goals.vehicles :
-- {"id":"speed", "vehicle":"scenario_player0", "value":{"minSpeed":10, "maxTimeout":3, "purpose":"fail", "msg":"Trop lent"}}
```

## Remarques

- Champs de instance.value lus : minSpeed et maxSpeed (m/s, nombres), maxTimeout (s, 0 par défaut), delay (s : ignore le contrôle tant que scenario.timer <= delay), wayPointNum (tableau d'indices de waypoint : le contrôle ne s'applique que quand vehWpData.cur en fait partie), purpose ('fail' par défaut ou 'win'), msg (message).
- Le contrôle se fait à chaque 'onRaceTick' (toutes les 0,25 s de temps simulé) : tant que la vitesse est hors plage, instance.Timeout augmente de 0,25 ; il est remis à 0 sinon. Un message de compte à rebours est affiché chaque seconde entière. Quand Timeout > maxTimeout, showMsg termine le scénario via scenario_scenarios.finish : en échec si purpose='fail' (result.failed = msg ou clé par défaut), en victoire si purpose='win' (result.msg avec le temps).
- Le suivi de la vitesse utilise map.objects (suivi de véhicule) ; si absent, la fonction demande côté véhicule mapmgr.enableTracking(nom) et attend la frame suivante.
- Bug/incohérence : dans showMsg, « {txt = instance.value.msg, ...} or {...} » ne retombe jamais sur le message par défaut (une table est toujours vraie) ; si value.msg est nil, le message de victoire n'a pas de texte.
- Bug/incohérence : processState ignore l'instance si maxSpeed == 0 mais pas si maxSpeed est nil ; si le véhicule est introuvable (vehicle nil) et fobjData nil, playerSpeed peut recevoir fobjData nil et lever une erreur.
- Bug/incohérence : le test « instance.Timeout % 1 == 0 » compare des flottants (0,25 cumulés) ; ça fonctionne car 0,25 est exactement représentable.
- Bug/incohérence : updateFinalStatus ignore son argument instance et redéclare la variable de boucle du même nom.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_speedGoal.init(scenario)` | Appelée par scenario_raceGoals au démarrage : reconstruit M.instances à partir de scenario.goals.vehicles (entrées id == 'speed'), valide les types (minSpeed, maxSpeed, delay nombres ; wayPointNum tableau ; purpose chaîne), met maxTimeout à 0 et purpose à 'fail' par défaut, et Timeout à 0. *(interne)* | 98 |
| `scenario_speedGoal.processState(scenario, state, stateData)` | Appelée par scenario_raceGoals à chaque évènement de course ; n'agit que pour state == 'onRaceTick' : vérifie la vitesse des véhicules concernés (voir notes). *(interne)* | 58 |
| `scenario_speedGoal.updateFinalStatus(scenario, instance)` | Appelée en fin de scénario : publie dans statistics_statistics le statut (passed/failed) de chaque instance. *(interne)* | 140 |

### Détail des paramètres

#### `scenario_speedGoal.init(scenario)`

Appelée par scenario_raceGoals au démarrage : reconstruit M.instances à partir de scenario.goals.vehicles (entrées id == 'speed'), valide les types (minSpeed, maxSpeed, delay nombres ; wayPointNum tableau ; purpose chaîne), met maxTimeout à 0 et purpose à 'fail' par défaut, et Timeout à 0.

- `scenario` (*table*) : scénario courant

#### `scenario_speedGoal.processState(scenario, state, stateData)`

Appelée par scenario_raceGoals à chaque évènement de course ; n'agit que pour state == 'onRaceTick' : vérifie la vitesse des véhicules concernés (voir notes).

- `scenario` (*table*) : scénario courant
- `state` (*string*) : nom du hook : 'onRaceStart','onRaceInit','onRaceWaypointReached','onRaceTick','onRaceResult','onCountdownEnded'
- `stateData` (*table|nil*) : données du hook (non utilisées ici)

#### `scenario_speedGoal.updateFinalStatus(scenario, instance)`

Appelée en fin de scénario : publie dans statistics_statistics le statut (passed/failed) de chaque instance.

- `scenario` (*table*) : scénario courant
- `instance` (*table*) : non utilisé (déduit du code)

## Champs

| Champ | Type | Description |
|---|---|---|
| `instances` | table<integer, table> | Instances du but 'speed' actives pour le scénario courant, remplies par init. |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/speedGoal.lua`.*
