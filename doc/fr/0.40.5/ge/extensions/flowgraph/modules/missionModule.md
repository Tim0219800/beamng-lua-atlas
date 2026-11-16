# `flowgraph_modules_missionModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/missionModule.lua` · VM : Game Engine (GE) · 133 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/missionModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder -100) qui lie un projet flowgraph à la mission qui l'a lancé (self.mgr.activity). Il gère les véhicules de mission (garder ou masquer le véhicule joueur et le trafic), prépare un véhicule (phares la nuit, conducteur factice), supprime le véhicule joueur mis de côté et relaie les évènements personnalisés vers la mission. À l'arrêt, il stoppe la mission si elle est en cours et émet onMissionFinished.

## Remarques

- Sans mgr.activity (projet lancé hors mission), la plupart des fonctions ne font rien.
- processVehicles ne s'exécute qu'une fois (flag processed) et seulement si params n'est pas vide.
- onClear est vide et n'est pas déclaré comme hook.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_missionModule.clear()` | Remet processed à false. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionModule.executionStarted()` | Appelé au démarrage du projet : déclenche l'évènement UI hotlappingReevaluateControlsEnabled et appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionModule.executionStopped()` | Appelé à l'arrêt du projet : arrête la mission si elle est en cours (gameplay_missions_missionManager.stop), émet extensions.hook('onMissionFinished') et déclenche l'évènement UI hotlappingReevaluateControlsEnabled. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionModule.getOriginalPlayerId()` | Renvoie l'id du véhicule joueur d'avant la mission (mission._startingInfo.vehId). (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionModule.init()` | Appelé à la création du module : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_missionModule.missionHook(name, data)` | Appelle mission:onMissionCustomEvent(name, data) si la mission le définit, et journalise l'évènement. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionModule.onClear()` | Fonction vide. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `flowgraph_modules_missionModule.prepareVehicle(id, addDummyDriver)` | Prépare un véhicule pour la mission : si l'heure du jeu est dans la fenêtre de nuit solaire, allume les phares (electrics.setLightsState(2)) ; si addDummyDriver et le réglage enableSeatOccupants, place un occupant factice au siège conducteur. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionModule.processVehicles(params)` | Applique les options keepPlayer et keepTraffic de la mission : active ou désactive le véhicule joueur d'origine et met à jour mission.setupData.stashedVehicles, et dégèle le trafic via gameplay_traffic.unfreezeState si keepTraffic est vrai. Avertit si déjà appelé. (assignée dynamiquement) | dyn |
| `flowgraph_modules_missionModule.removeStashedPlayerVehicle()` | Supprime définitivement le véhicule joueur mis de côté (il ne sera plus réactivé à la fin du projet). (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_missionModule.getOriginalPlayerId()`

Renvoie l'id du véhicule joueur d'avant la mission (mission._startingInfo.vehId). (assignée dynamiquement)

- **renvoie** : integer|nil id ou nil

#### `flowgraph_modules_missionModule.missionHook(name, data)`

Appelle mission:onMissionCustomEvent(name, data) si la mission le définit, et journalise l'évènement. (assignée dynamiquement)

- `name` (*string*) : nom de l'évènement
- `data` (*any*) : données

#### `flowgraph_modules_missionModule.prepareVehicle(id, addDummyDriver)`

Prépare un véhicule pour la mission : si l'heure du jeu est dans la fenêtre de nuit solaire, allume les phares (electrics.setLightsState(2)) ; si addDummyDriver et le réglage enableSeatOccupants, place un occupant factice au siège conducteur. (assignée dynamiquement)

- `id` (*integer|nil*) : id du véhicule (défaut : véhicule joueur 0)
- `addDummyDriver` (*boolean|nil*) : ajouter un conducteur factice

#### `flowgraph_modules_missionModule.processVehicles(params)`

Applique les options keepPlayer et keepTraffic de la mission : active ou désactive le véhicule joueur d'origine et met à jour mission.setupData.stashedVehicles, et dégèle le trafic via gameplay_traffic.unfreezeState si keepTraffic est vrai. Avertit si déjà appelé. (assignée dynamiquement)

- `params` (*table*) : champs keepPlayer (boolean) et keepTraffic (boolean)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clear()` |  | 11 |
| `C:executionStarted()` |  | 127 |
| `C:executionStopped()` |  | 114 |
| `C:getOriginalPlayerId()` |  | 87 |
| `C:init()` |  | 7 |
| `C:missionHook(name, data)` |  | 107 |
| `C:onClear()` |  | 124 |
| `C:prepareVehicle(id, addDummyDriver)` |  | 63 |
| `C:processVehicles(params)` |  | 15 |
| `C:removeStashedPlayerVehicle()` |  | 93 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionFinished`

**Évènements UI (guihooks.trigger) :** `hotlappingReevaluateControlsEnabled`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `core_environment.` `getTimeOfDay`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/missionModule.lua`.*
