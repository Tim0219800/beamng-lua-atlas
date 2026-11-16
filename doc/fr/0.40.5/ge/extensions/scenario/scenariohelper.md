# `scenario_scenariohelper`

*Fichier : `lua/ge/extensions/scenario/scenariohelper.lua` · VM : Game Engine (GE) · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_scenariohelper` : `extensions.load("scenario_scenariohelper")`, puis la globale `scenario_scenariohelper`

Boîte à outils des scénarios (extension GE scenario_scenariohelper). Elle enveloppe l'envoi de commandes Lua à un véhicule par son nom dans le scenetree, le pilotage de l'IA (mode, agressivité, route, cible, évitement), la casse de groupes de poutres, et deux messages d'interface. C'est l'API utilisée par les scénarios de moddeurs. Chaque fonction IA envoie une commande textuelle ai.xxx(...) au VM du véhicule, puis, si scenario_scenarios est chargé, mémorise l'état via scenario_scenarios.updateVehicleAiState pour pouvoir le rejouer après un reset.

## Exemple

```lua
local h = scenario_scenariohelper
h.setAiPath({
  vehicleName = 'ai1',
  waypoints = {'scenario_wp01', 'scenario_wp02', 'scenario_wp03', 'scenario_wp01'},
  lapCount = 3,
  aggression = 1.2,
  routeSpeed = 25,
  routeSpeedMode = 'limit',
  driveInLane = 'on'
})
h.flashUiMessage('Go !', 3)
```

## Remarques

- Les commandes sont construites par concaténation de chaînes puis exécutées dans le VM du véhicule via queueLuaCommand : les valeurs de type string sont insérées entre guillemets doubles sans échappement, un nom ou une valeur contenant un guillemet casse la commande.
- breakBreakGroup et triggerDeformGroup n'ont aucun test : si vehicleName est introuvable dans le scenetree, getVehicleByName renvoie nil et l'appel plante (erreur sur nil). Seul queueLuaCommandByName journalise une erreur 'Vehicle not found' et continue.
- setAiMode : si targetVehicleName est donné mais introuvable, vehicle.obj plante (pas de test nil).
- Le nom de la cible de setAiMode est converti en ID numérique (vehicle.obj:getId()) et envoyé comme targetObjectID.
- setAiAvoidCars mémorise l'état sous la clé 'value' ({value = value}) et non 'avoidCars' : incohérence probable avec les autres fonctions qui utilisent un nom de clé explicite (aggression, mode, target...).
- setAiPath : valeurs par défaut quand une option est absente : routeSpeed 0, routeSpeedMode 'off', driveInLane 'off', speeds {}, lapCount 0, aggression 1, avoidCars 'off', aggressionMode ''. avoidCars est converti par tostring() donc un booléen est accepté.
- setAiPath n'envoie pas resetLearning dans la commande ai.driveUsingPath construite ici, bien que le commentaire d'usage le documente : l'option reste seulement stockée dans arg (checkpoints / état scénario). À vérifier côté ai.lua.
- setAiPath sauvegarde arg via core_checkpoints.saveAIPath (si core_checkpoints est chargé) afin de réappliquer le chemin au reset des véhicules IA.
- Unités : routeSpeed en m/s. Aggression maximale 2 d'après le commentaire du code (le multiplicateur interne est 0.7 par unité).
- getDistanceBetweenSceneObjects renvoie -1 (et non nil) si l'un des deux objets n'existe pas, distance en mètres sinon.
- M.setAiTargetVehicle est commenté dans l'interface publique : non exporté.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_scenariohelper.breakBreakGroup(vehicleName, group)` | Casse un groupe de rupture (breakGroup) du véhicule en exécutant beamstate.breakBreakGroup(group) dans son VM. | 29 |
| `scenario_scenariohelper.flashUiMessage(msg, duration, useBiggerText)` | Affiche un message flash à l'écran via guihooks.trigger('ScenarioFlashMessage', {{msg, duration, 0, useBiggerText}}). | 178 |
| `scenario_scenariohelper.getDistanceBetweenSceneObjects(sceneObjectName1, sceneObjectName2)` | Calcule la distance entre les positions de deux objets du scenetree. | 189 |
| `scenario_scenariohelper.getVehicleByName(name)` | Renvoie l'objet du scenetree portant ce nom (scenetree.findObject), typiquement un véhicule. | 14 |
| `scenario_scenariohelper.queueLuaCommand(vehicle, command)` | Envoie une chaîne de code Lua à exécuter dans le VM du véhicule donné (appelle vehicle:queueLuaCommand). Aucun test sur vehicle. | 9 |
| `scenario_scenariohelper.queueLuaCommandByName(vehicleName, command)` | Envoie une commande Lua à un véhicule retrouvé par son nom. Si le véhicule n'existe pas, écrit une erreur dans le log (tag scenarioHelper) et ne fait rien d'autre. | 19 |
| `scenario_scenariohelper.realTimeUiDisplay(msg)` | Met à jour l'affichage temps réel du scénario via guihooks.trigger('ScenarioRealtimeDisplay', {msg = msg}). | 185 |
| `scenario_scenariohelper.setAiAggression(vehicleName, aggression)` | Règle l'agressivité de l'IA (ai.setAggression) et la mémorise dans l'état scénario. | 58 |
| `scenario_scenariohelper.setAiAggressionMode(vehicleName, aggrMode)` | Choisit le mode d'agressivité dynamique de l'IA en mode manual (ai.setAggressionMode). Avec 'rubberBand', l'agressivité varie avec la distance à l'adversaire : plus l'IA est proche, moins elle est agressive. | 67 |
| `scenario_scenariohelper.setAiAvoidCars(vehicleName, value)` | Active ou désactive l'évitement des autres voitures par l'IA (ai.setAvoidCars). | 81 |
| `scenario_scenariohelper.setAiMode(vehicleName, mode, targetVehicleName)` | Fixe le mode de l'IA du véhicule via ai.setState({mode=...}). Si targetVehicleName est fourni, l'ID de ce véhicule est transmis comme targetObjectID (utile pour les modes qui visent un autre véhicule, par exemple chase ou flee). Mémorise le mode dans l'état scénario. | 44 |
| `scenario_scenariohelper.setAiPath(arg)` | Fait suivre à un véhicule IA une route entre waypoints (ai.driveUsingPath) avec de nombreuses options. L'IA calcule le plus court chemin entre waypoints consécutifs. Le tableau arg est aussi sauvegardé (core_checkpoints.saveAIPath et scenario_scenarios.updateVehicleAiState) pour être réappliqué au reset. | 104 |
| `scenario_scenariohelper.setAiRoute(vehicleName, waypoints)` | Active la progression automatique de l'IA le long d'une liste de waypoints (ai.driveUsingPath avec wpTargetList). Le mode IA doit être manual ou flee. Version simple de setAiPath, sans options de vitesse ou de tours. | 90 |
| `scenario_scenariohelper.setAiTarget(vehicleName, target)` | Définit la cible de l'IA (ai.setTarget) et la mémorise dans l'état scénario. | 74 |
| `scenario_scenariohelper.setCutOffDrivability(vehicleName, drivability)` | Règle le seuil de drivabilité de coupure de l'IA (ai.setCutOffDrivability), qui sert à écarter les routes de trop faible drivabilité. | 97 |
| `scenario_scenariohelper.trackVehicle(vehicleName, trackingName)` | Active le suivi cartographique du véhicule (mapmgr.enableTracking) sous un nom de suivi personnalisé. | 39 |
| `scenario_scenariohelper.triggerDeformGroup(vehicleName, group)` | Déclenche un groupe de déformation (beamstate.triggerDeformGroup) : bascule vers un matériau cassé, par exemple pour briser une vitre. | 34 |

### Détail des paramètres

#### `scenario_scenariohelper.breakBreakGroup(vehicleName, group)`

Casse un groupe de rupture (breakGroup) du véhicule en exécutant beamstate.breakBreakGroup(group) dans son VM.

- `vehicleName` (*string*) : Nom du véhicule. Doit exister, sinon erreur.
- `group` (*string*) : Nom du breakGroup défini dans le jbeam.

#### `scenario_scenariohelper.flashUiMessage(msg, duration, useBiggerText)`

Affiche un message flash à l'écran via guihooks.trigger('ScenarioFlashMessage', {{msg, duration, 0, useBiggerText}}).

- `msg` (*string*) : Texte à afficher.
- `duration` (*number*) : Durée d'affichage (secondes, déduit du code).
- `useBiggerText` (*boolean|nil*) : true pour un texte plus gros ; toute autre valeur est traitée comme false.

#### `scenario_scenariohelper.getDistanceBetweenSceneObjects(sceneObjectName1, sceneObjectName2)`

Calcule la distance entre les positions de deux objets du scenetree.

- `sceneObjectName1` (*string*) : Nom du premier objet.
- `sceneObjectName2` (*string*) : Nom du second objet.
- **renvoie** : number Distance en mètres, ou -1 si l'un des objets est introuvable.

#### `scenario_scenariohelper.getVehicleByName(name)`

Renvoie l'objet du scenetree portant ce nom (scenetree.findObject), typiquement un véhicule.

- `name` (*string*) : Nom de l'objet dans le scenetree.
- **renvoie** : table|nil L'objet, ou nil s'il n'existe pas.

#### `scenario_scenariohelper.queueLuaCommand(vehicle, command)`

Envoie une chaîne de code Lua à exécuter dans le VM du véhicule donné (appelle vehicle:queueLuaCommand). Aucun test sur vehicle.

- `vehicle` (*table*) : Objet véhicule (BeamObject) déjà résolu, par exemple renvoyé par getVehicleByName.
- `command` (*string*) : Code Lua à exécuter côté véhicule.

#### `scenario_scenariohelper.queueLuaCommandByName(vehicleName, command)`

Envoie une commande Lua à un véhicule retrouvé par son nom. Si le véhicule n'existe pas, écrit une erreur dans le log (tag scenarioHelper) et ne fait rien d'autre.

- `vehicleName` (*string*) : Nom du véhicule dans le scenetree.
- `command` (*string*) : Code Lua à exécuter côté véhicule.

#### `scenario_scenariohelper.realTimeUiDisplay(msg)`

Met à jour l'affichage temps réel du scénario via guihooks.trigger('ScenarioRealtimeDisplay', {msg = msg}).

- `msg` (*any*) : Contenu transmis à l'UI dans le champ msg.

#### `scenario_scenariohelper.setAiAggression(vehicleName, aggression)`

Règle l'agressivité de l'IA (ai.setAggression) et la mémorise dans l'état scénario.

- `vehicleName` (*string*) : Nom du véhicule.
- `aggression` (*number*) : Agressivité, insérée telle quelle dans la commande (le commentaire de setAiPath indique un maximum de 2).

#### `scenario_scenariohelper.setAiAggressionMode(vehicleName, aggrMode)`

Choisit le mode d'agressivité dynamique de l'IA en mode manual (ai.setAggressionMode). Avec 'rubberBand', l'agressivité varie avec la distance à l'adversaire : plus l'IA est proche, moins elle est agressive.

- `vehicleName` (*string*) : Nom du véhicule.
- `aggrMode` (*string*) : Actuellement 'rubberBand' (seule valeur citée dans le code).

#### `scenario_scenariohelper.setAiAvoidCars(vehicleName, value)`

Active ou désactive l'évitement des autres voitures par l'IA (ai.setAvoidCars).

- `vehicleName` (*string*) : Nom du véhicule.
- `value` (*string*) : 'on' ou 'off'.

#### `scenario_scenariohelper.setAiMode(vehicleName, mode, targetVehicleName)`

Fixe le mode de l'IA du véhicule via ai.setState({mode=...}). Si targetVehicleName est fourni, l'ID de ce véhicule est transmis comme targetObjectID (utile pour les modes qui visent un autre véhicule, par exemple chase ou flee). Mémorise le mode dans l'état scénario.

- `vehicleName` (*string*) : Nom du véhicule piloté par l'IA.
- `mode` (*string*) : Mode IA (valeurs du ai.lua du véhicule, par exemple 'manual', 'chase', 'flee', 'stop', 'disabled' : déduit du code, non vérifié ici).
- `targetVehicleName` (*string|nil*) : Nom du véhicule cible, facultatif. Doit exister s'il est fourni.

#### `scenario_scenariohelper.setAiPath(arg)`

Fait suivre à un véhicule IA une route entre waypoints (ai.driveUsingPath) avec de nombreuses options. L'IA calcule le plus court chemin entre waypoints consécutifs. Le tableau arg est aussi sauvegardé (core_checkpoints.saveAIPath et scenario_scenarios.updateVehicleAiState) pour être réappliqué au reset.

- `arg` (*table*) : Table d'options. Seuls vehicleName et waypoints sont obligatoires.

#### `scenario_scenariohelper.setAiRoute(vehicleName, waypoints)`

Active la progression automatique de l'IA le long d'une liste de waypoints (ai.driveUsingPath avec wpTargetList). Le mode IA doit être manual ou flee. Version simple de setAiPath, sans options de vitesse ou de tours.

- `vehicleName` (*string*) : Nom du véhicule.
- `waypoints` (*string[]*) : Liste de noms de waypoints, sérialisée avec serialize().

#### `scenario_scenariohelper.setAiTarget(vehicleName, target)`

Définit la cible de l'IA (ai.setTarget) et la mémorise dans l'état scénario.

- `vehicleName` (*string*) : Nom du véhicule piloté par l'IA.
- `target` (*string*) : Cible transmise à ai.setTarget (nom, entre guillemets dans la commande).

#### `scenario_scenariohelper.setCutOffDrivability(vehicleName, drivability)`

Règle le seuil de drivabilité de coupure de l'IA (ai.setCutOffDrivability), qui sert à écarter les routes de trop faible drivabilité.

- `vehicleName` (*string*) : Nom du véhicule.
- `drivability` (*number*) : Valeur de drivabilité, insérée telle quelle dans la commande.

#### `scenario_scenariohelper.trackVehicle(vehicleName, trackingName)`

Active le suivi cartographique du véhicule (mapmgr.enableTracking) sous un nom de suivi personnalisé.

- `vehicleName` (*string*) : Nom du véhicule dans le scenetree.
- `trackingName` (*string*) : Nom de suivi à utiliser.

#### `scenario_scenariohelper.triggerDeformGroup(vehicleName, group)`

Déclenche un groupe de déformation (beamstate.triggerDeformGroup) : bascule vers un matériau cassé, par exemple pour briser une vitre.

- `vehicleName` (*string*) : Nom du véhicule. Doit exister, sinon erreur.
- `group` (*string*) : Nom du deformGroup défini dans le jbeam.

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessage`, `ScenarioRealtimeDisplay`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/scenariohelper.lua`.*
