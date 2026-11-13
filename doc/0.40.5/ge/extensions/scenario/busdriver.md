# `scenario_busdriver`

*Fichier : `lua/ge/extensions/scenario/busdriver.lua` · VM : Game Engine (GE) · 861 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_busdriver` : `extensions.load("scenario_busdriver")`, puis la globale `scenario_busdriver`

Scénario de conduite de bus (itinéraire de ligne avec arrêts). À partir de la configuration scenario.busdriver (routeID, variance, strictStop, simulatePassengers, traffic), il récupère la ligne via core_busRouteManager.setLine, trace le chemin au sol (core_groundMarkers), suit les déclencheurs d'arrêts de bus (BeamNGTrigger de type 'busstop' et 'buswp'), gère le temps d'attente de 5 s à l'arrêt, les portes et la position agenouillée, déplace 4 marqueurs de cadre d'arrêt et termine le scénario en réussite au dernier arrêt ou en échec si un arrêt est sauté. Le joueur est le véhicule 'scenario_player0'.

## Exemple

```lua
-- dans le JSON du scénario :
-- "busdriver": {"routeID": "ligne1", "variance": "a", "strictStop": true, "simulatePassengers": true, "traffic": true}
```

## Remarques

- Dépend de scenario_scenarios et core_groundMarkers. Le joueur est supposé être le véhicule nommé 'scenario_player0'.
- Une tâche (arrêt) de currentLine.tasklist est une liste : [1] nom du déclencheur, [2] nom affiché, [3] position {x,y,z}, [4] rotation (quaternion), [5] taille {longueur, largeur} (déduit du code).
- Les déclencheurs ont data.type 'busstop' (arrêts de la ligne) ou 'buswp' (points de passage) ; data.event vaut 'enter' ou 'exit', data.subjectName le véhicule, data.triggerName le déclencheur.
- Entrer dans un arrêt sans avoir passé le précédent fait échouer le scénario (clé 'scenarios.busRoutes.skip'). Quitter avant la fin de l'attente (stopTimer < 5) ou avant stopComplete n'accomplit pas l'arrêt.
- Avec busConfig.strictStop, il faut ouvrir les portes (bus_dooropen) et s'agenouiller (bus_kneel) à l'arrêt, sinon des messages invitent à le faire. La caméra passe en 'onboard.rider' puis 'external' pendant l'arrêt, et la caméra précédente est restaurée à la fin.
- Messages UI envoyés via ScenarioRealtimeDisplay : clés scenarios.busRoutes.alreadyStop, stop, kneel, open, wait (context.remaining), close, raise, proceed, success. Évènements UI : BusDisplayUpdate (ligne restante) et BusRouteStats (désactivé).
- Le calcul de statistiques (douceur, angle d'arrêt, distance d'arrêt, dégâts) est exécuté dans onPreRender mais son envoi à l'UI et à statistics_statistics est désactivé (if false, ticket #2783).
- Bug probable : dans onPreRender, la variable playerVehicle utilisée pour calculer vehPos (près de la gestion de navhelp) n'est pas déclarée localement (seul pv l'est) : si elle n'existe pas comme globale, l'appel plante.
- Dans onPreRender, la variable debugPath est toujours nil (sa déclaration est commentée) : le dessin debug des sphères ne s'exécute jamais. Utiliser M.enabledLineDebug à la place pour tracer la ligne complète.
- requestState modifie en place currentLine.tasklist (tmp = currentLine n'est pas une copie) : après un appel, la liste est tronquée aux arrêts restants.
- onVehicleStoppedMoving et computeStats existent mais le hook n'est pas exporté (M.onVehicleStoppedMoving est commenté).
- onExtensionUnloaded dégèle le véhicule joueur (controller.setFreeze(0)) et efface le chemin de groundMarkers ; reset() le gèle (setFreeze(1)).

**Dépendances (chargées avant) :** `scenario_scenarios`, `core_groundMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_busdriver.fail(reason)` | Termine le scénario en échec (scenario_scenarios.finish({failed = reason})) puis réinitialise l'état du module. | 80 |
| `scenario_busdriver.onBeamNGTrigger(data)` | Hook appelé quand un BeamNGTrigger est franchi. Gère l'entrée et la sortie des arrêts de bus de la ligne (type 'busstop') et l'enregistrement des points de passage (type 'buswp'). *(interne)* *(hook)* | 347 |
| `scenario_busdriver.onBusUpdate(state)` | Hook envoyé par le contrôleur du bus (véhicule) avec des évènements : 'onTriggerTick' (progression de l'arrêt : vitesse, portes, agenouillement), 'onApproachStop' (affiche les marqueurs d'arrêt, alpha cible 1) et 'onDepartedStop' (restaure la boîte englobante d'origine). *(interne)* *(hook)* | 668 |
| `scenario_busdriver.onClientEndMission()` | Hook de fin de mission : vide la liste des marqueurs. *(interne)* *(hook)* | 838 |
| `scenario_busdriver.onExtensionUnloaded()` | Hook de déchargement : vide les marqueurs, efface le chemin de groundMarkers et dégèle le véhicule joueur. *(interne)* *(hook)* | 801 |
| `scenario_busdriver.onPhysicsPaused()` | Hook : la physique est en pause ; le chronomètre d'arrêt ne progresse plus. *(interne)* *(hook)* | 812 |
| `scenario_busdriver.onPhysicsUnpaused()` | Hook : la physique reprend. *(interne)* *(hook)* | 816 |
| `scenario_busdriver.onPreRender(dt, dtSim)` | Hook appelé avant chaque image. Anime l'alpha des marqueurs, calcule les statistiques de conduite (accélération, à-coups, dégâts, distance et angle d'arrêt), met à jour le chemin au sol vers le prochain arrêt (core_groundMarkers.setPath) et colore les marqueurs selon que le bus est dans la zone d'arrêt. *(interne)* *(hook)* | 501 |
| `scenario_busdriver.onRaceResult(final)` | Hook de fin de course : si playerWon est vrai, enregistre le temps final dans les highscores (core_highscores.setScenarioHighscoresCustom, clé 'busRoute'). *(interne)* *(hook)* | 421 |
| `scenario_busdriver.onRaceStart()` | Hook de début de course : réinitialise, charge la ligne, dégèle le joueur, crée les 4 marqueurs TSStatic (busMarkerTL, TR, BL, BR, modèle position_marker.dae) dans ScenarioObjectsGroup, vérifie les points navhelp de la carte routière et trace le chemin vers le premier arrêt (couleur routeColor de la ligne). Met running à true. *(interne)* *(hook)* | 229 |
| `scenario_busdriver.onScenarioLoaded(scenario)` | Hook appelé quand le scénario est chargé. Si busdriver.simulatePassengers, ajoute la pièce 'citybus_seats_ballast' à la configuration du véhicule joueur ; si busdriver.traffic et que le trafic est éteint, démarre le trafic avec trafficAmount (ou le maximum pour 12 véhicules si 0). *(interne)* *(hook)* | 781 |
| `scenario_busdriver.onScenarioRestarted(scenario)` | Hook appelé au redémarrage du scénario : réinitialise l'état et recharge la ligne. *(interne)* *(hook)* | 188 |
| `scenario_busdriver.onVehicleSwitched(oldId, newId, player)` | Hook appelé au changement de véhicule. Pour le joueur 0, réinitialise, gèle le nouveau véhicule et recharge la ligne ; échoue si la ligne est introuvable. *(interne)* *(hook)* | 448 |
| `scenario_busdriver.requestState()` | Demandé par l'UI : envoie à l'évènement BusDisplayUpdate la ligne courante réduite aux arrêts restants (à partir du prochain). Journalise une erreur et sort si aucune ligne n'est chargée. | 820 |

### Détail des paramètres

#### `scenario_busdriver.fail(reason)`

Termine le scénario en échec (scenario_scenarios.finish({failed = reason})) puis réinitialise l'état du module.

- `reason` (*string|table*) : Message ou clé de traduction d'échec.

#### `scenario_busdriver.onBeamNGTrigger(data)`

Hook appelé quand un BeamNGTrigger est franchi. Gère l'entrée et la sortie des arrêts de bus de la ligne (type 'busstop') et l'enregistrement des points de passage (type 'buswp').

- `data` (*table*) : {type, event ('enter'|'exit'), subjectName, triggerName}.

#### `scenario_busdriver.onBusUpdate(state)`

Hook envoyé par le contrôleur du bus (véhicule) avec des évènements : 'onTriggerTick' (progression de l'arrêt : vitesse, portes, agenouillement), 'onApproachStop' (affiche les marqueurs d'arrêt, alpha cible 1) et 'onDepartedStop' (restaure la boîte englobante d'origine).

- `state` (*table*) : {event, triggerName, speed, bus_dooropen, bus_kneel}.

#### `scenario_busdriver.onPreRender(dt, dtSim)`

Hook appelé avant chaque image. Anime l'alpha des marqueurs, calcule les statistiques de conduite (accélération, à-coups, dégâts, distance et angle d'arrêt), met à jour le chemin au sol vers le prochain arrêt (core_groundMarkers.setPath) et colore les marqueurs selon que le bus est dans la zone d'arrêt.

- `dt` (*number*) : Durée réelle de l'image (s).
- `dtSim` (*number*) : Durée simulée (s).

#### `scenario_busdriver.onRaceResult(final)`

Hook de fin de course : si playerWon est vrai, enregistre le temps final dans les highscores (core_highscores.setScenarioHighscoresCustom, clé 'busRoute').

- `final` (*table*) : Résultat, final.finalTime en secondes.

#### `scenario_busdriver.onScenarioLoaded(scenario)`

Hook appelé quand le scénario est chargé. Si busdriver.simulatePassengers, ajoute la pièce 'citybus_seats_ballast' à la configuration du véhicule joueur ; si busdriver.traffic et que le trafic est éteint, démarre le trafic avec trafficAmount (ou le maximum pour 12 véhicules si 0).

- `scenario` (*table*) : Scénario chargé (scenario.busdriver).

#### `scenario_busdriver.onScenarioRestarted(scenario)`

Hook appelé au redémarrage du scénario : réinitialise l'état et recharge la ligne.

- `scenario` (*table*) : Scénario redémarré.

#### `scenario_busdriver.onVehicleSwitched(oldId, newId, player)`

Hook appelé au changement de véhicule. Pour le joueur 0, réinitialise, gèle le nouveau véhicule et recharge la ligne ; échoue si la ligne est introuvable.

- `oldId` (*integer*) : Ancien identifiant de véhicule.
- `newId` (*integer*) : Nouvel identifiant.
- `player` (*integer*) : Indice du joueur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : scenario_scenarios, core_groundMarkers. |
| `enabledLineDebug` | boolean | Si true, onPreRender dessine tout l'itinéraire (renderDebugLine) avec des textes debug. Faux par défaut. |

**Évènements UI (guihooks.trigger) :** `BusDisplayUpdate`, `BusRouteStats`, `ScenarioRealtimeDisplay`

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `be:` `castRay`
- `core_environment.` `getGravity`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/busdriver.lua`.*
