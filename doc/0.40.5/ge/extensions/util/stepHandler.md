# `util_stepHandler`

*Fichier : `lua/ge/extensions/util/stepHandler.lua` · VM : Game Engine (GE) · 338 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_stepHandler` : `extensions.load("util_stepHandler")`, puis la globale `util_stepHandler`

Exécuteur de séquences d'étapes (« steps ») asynchrones pour scénarios et scripts de test. On construit une liste d'étapes avec les fonctions makeStepXxx (fondu au noir, attente, apparition de véhicule ou de trafic, chargement de niveau, fonction personnalisée) puis on la lance avec startStepSequence. À chaque onUpdate, l'étape courante est traitée jusqu'à ce qu'elle soit terminée (step.complete) ; on passe alors à la suivante dans la même frame. Une étape qui dépasse son délai (timeout, 120 s par défaut) est journalisée comme erreur et forcée à « terminée ».

## Exemple

```lua
util_stepHandler.startStepSequence({
  util_stepHandler.makeStepFadeToBlack(),
  util_stepHandler.makeStepSpawnVehicleSimple('pickup', 'vehicles/pickup/d15_4wd_A.pc', function() print('Hello') end),
  util_stepHandler.makeStepFadeFromBlack()
}, function() print('Terminé') end)
```

## Remarques

- Une étape est une table {name, processTask = function(step, dtTable), timeout, origin, ...} ; processTask met step.complete = true quand elle a fini. dtTable contient dtReal, dtSim et dtRaw.
- startStepSequence remplace toute séquence en cours ; le callback de fin devient une dernière étape ajoutée à la liste fournie (la table steps est modifiée).
- onClientStartMission marque comme terminée l'étape courante quelle qu'elle soit (pas seulement le chargement de niveau) ; taskLoadLevelStep ne se termine d'ailleurs que par ce hook, car step.levelLoaded n'est jamais renseigné. Délai de l'étape de chargement : 600 s.
- Dans onUpdate, la variable logTag n'est pas définie dans ce fichier (valeur nil dans le log « Completed Step »).
- makeStepReturnTrueFunction est déclarée deux fois (la seconde, locale, masque la première) ; elles sont identiques. Seule la première est exportée.
- taskVehicleSpawnStep : si spawnNewVehicle échoue, step.veh est nil et l'appel step.veh:getId() qui suit provoque une erreur Lua.
- Si showDebugWindow (variable locale, false) est mise à true dans le code, onUpdate affiche une fenêtre ImGui de débogage des étapes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_stepHandler.makeLoadLevelStep(level)` | Étape : charge un niveau par son nom (core_levels.startLevel) et attend onClientStartMission (timeout 600 s). | 246 |
| `util_stepHandler.makeStepFadeFromBlack(duration)` | Étape : lance le retour de fondu (ui_fadeScreen.stop) et attend l'état 3 de onScreenFadeState (timeout 10 s). | 59 |
| `util_stepHandler.makeStepFadeToBlack(duration)` | Étape : lance le fondu vers le noir (ui_fadeScreen.start) et attend l'évènement d'écran noir (état 1, timeout 10 s). | 49 |
| `util_stepHandler.makeStepReturnTrueFunction(fun)` | Étape : appelle fun(step, dtTable) à chaque frame jusqu'à ce qu'elle renvoie une valeur vraie. | 124 |
| `util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator)` | Étape : crée un groupe de véhicules de trafic (core_multiSpawn), attend son apparition, règle le nombre actif, active le trafic et le disperse (gameplay_traffic). | 204 |
| `util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback)` | Étape : fait apparaître un véhicule (core_vehicles.spawnNewVehicle) puis attend qu'il soit prêt (isReady) ; le callback reçoit alors (step, vehId). | 160 |
| `util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback)` | Version simple de makeStepSpawnVehicle : options construites par sanitizeVehicleSpawnOptions(model, {config = config}). | 169 |
| `util_stepHandler.makeStepWait(seconds)` | Étape : attend un nombre de secondes réelles (os.clockhp). | 78 |
| `util_stepHandler.makeStepWaitFrames(frames)` | Étape : attend un nombre de frames d'onUpdate, quelle que soit leur durée. | 97 |
| `util_stepHandler.makeUiMessageStep(message)` | Étape : affiche un message à l'écran (ui_message) et dans le journal (tag « test »), puis se termine immédiatement. | 132 |
| `util_stepHandler.onClientStartMission(state)` | Hook appelé au démarrage d'un niveau : marque l'étape courante comme terminée. *(interne)* *(hook)* | 239 |
| `util_stepHandler.onScreenFadeState(state)` | Hook appelé par ui_fadeScreen à chaque état du fondu : mémorise fadeState<état> sur l'étape courante si elle attend un fondu. *(interne)* *(hook)* | 43 |
| `util_stepHandler.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : traite l'étape courante, gère les délais d'expiration, enchaîne les étapes terminées et désactive la séquence à la fin. *(interne)* *(hook)* | 282 |
| `util_stepHandler.onVehicleGroupSpawned(vehIds, groupId)` | Hook appelé quand un groupe de véhicules est apparu : si c'est le groupe attendu par l'étape de trafic courante, passe son état à 2 et mémorise les identifiants. *(interne)* *(hook)* | 176 |
| `util_stepHandler.skipToLastStepOrCallback()` | Termine l'étape courante et saute directement à la dernière étape (typiquement le callback de fin). | 275 |
| `util_stepHandler.startStepSequence(steps, callbackWhenFinished)` | Démarre une séquence d'étapes (remplace l'éventuelle séquence en cours). Si un callback est donné, il est exécuté en dernière étape. | 262 |
| `util_stepHandler.taskLoadLevelStep(step)` | Fonction processTask de l'étape de chargement de niveau : lance le chargement au premier appel, journalise une erreur si le niveau est introuvable. Renvoie step.levelLoaded (jamais renseigné). *(interne)* | 218 |
| `util_stepHandler.taskSpawnTrafficStep(step)` | Fonction processTask de l'étape de trafic : machine à états 0 (créer le groupe) → 1 (attente de onVehicleGroupSpawned) → 2 (activer le trafic). *(interne)* | 188 |

### Détail des paramètres

#### `util_stepHandler.makeLoadLevelStep(level)`

Étape : charge un niveau par son nom (core_levels.startLevel) et attend onClientStartMission (timeout 600 s).

- `level` (*string*) : Nom du niveau (insensible à la casse).
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepFadeFromBlack(duration)`

Étape : lance le retour de fondu (ui_fadeScreen.stop) et attend l'état 3 de onScreenFadeState (timeout 10 s).

- `duration` (*number|nil*) : Durée du fondu en secondes.
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepFadeToBlack(duration)`

Étape : lance le fondu vers le noir (ui_fadeScreen.start) et attend l'évènement d'écran noir (état 1, timeout 10 s).

- `duration` (*number|nil*) : Durée du fondu en secondes.
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepReturnTrueFunction(fun)`

Étape : appelle fun(step, dtTable) à chaque frame jusqu'à ce qu'elle renvoie une valeur vraie.

- `fun` (*function*) : Fonction (step, dtTable) -> boolean.
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator)`

Étape : crée un groupe de véhicules de trafic (core_multiSpawn), attend son apparition, règle le nombre actif, active le trafic et le disperse (gameplay_traffic).

- `amount` (*integer*) : Nombre de véhicules à faire apparaître.
- `active` (*integer*) : Nombre de véhicules actifs (activeAmount).
- `generator` (*any*) : Générateur transmis à core_multiSpawn.createGroup (déduit du code).
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback)`

Étape : fait apparaître un véhicule (core_vehicles.spawnNewVehicle) puis attend qu'il soit prêt (isReady) ; le callback reçoit alors (step, vehId).

- `spawningOptions` (*table*) : Options d'apparition avec au moins model (et config, pos, rot…).
- `callback` (*function|nil*) : Appelée avec (step, vehId) quand le véhicule est prêt.
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback)`

Version simple de makeStepSpawnVehicle : options construites par sanitizeVehicleSpawnOptions(model, {config = config}).

- `model` (*string*) : Nom du modèle.
- `config` (*string*) : Chemin ou nom de la configuration (.pc).
- `callback` (*function|nil*) : Appelée avec (step, vehId).
- **renvoie** : table Étape.

#### `util_stepHandler.makeStepWait(seconds)`

Étape : attend un nombre de secondes réelles (os.clockhp).

- `seconds` (*number*) : Durée d'attente en secondes.
- **renvoie** : table Étape (timeout = seconds + 1).

#### `util_stepHandler.makeStepWaitFrames(frames)`

Étape : attend un nombre de frames d'onUpdate, quelle que soit leur durée.

- `frames` (*integer*) : Nombre de frames.
- **renvoie** : table Étape.

#### `util_stepHandler.makeUiMessageStep(message)`

Étape : affiche un message à l'écran (ui_message) et dans le journal (tag « test »), puis se termine immédiatement.

- `message` (*string*) : Texte du message.
- **renvoie** : table Étape.

#### `util_stepHandler.onClientStartMission(state)`

Hook appelé au démarrage d'un niveau : marque l'étape courante comme terminée.

- `state` (*any*) : Argument du hook (non utilisé).

#### `util_stepHandler.onScreenFadeState(state)`

Hook appelé par ui_fadeScreen à chaque état du fondu : mémorise fadeState<état> sur l'étape courante si elle attend un fondu.

- `state` (*integer*) : État du fondu (1 = noir atteint, 3 = fondu retiré).

#### `util_stepHandler.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame : traite l'étape courante, gère les délais d'expiration, enchaîne les étapes terminées et désactive la séquence à la fin.

- `dtReal` (*number*) : Durée réelle de la frame (s).
- `dtSim` (*number*) : Durée simulée (s).
- `dtRaw` (*number*) : Durée brute (s).

#### `util_stepHandler.onVehicleGroupSpawned(vehIds, groupId)`

Hook appelé quand un groupe de véhicules est apparu : si c'est le groupe attendu par l'étape de trafic courante, passe son état à 2 et mémorise les identifiants.

- `vehIds` (*integer[]*) : Identifiants des véhicules du groupe.
- `groupId` (*any*) : Identifiant du groupe.

#### `util_stepHandler.startStepSequence(steps, callbackWhenFinished)`

Démarre une séquence d'étapes (remplace l'éventuelle séquence en cours). Si un callback est donné, il est exécuté en dernière étape.

- `steps` (*table[]*) : Liste d'étapes créées avec les makeStepXxx.
- `callbackWhenFinished` (*function|nil*) : Appelée sans argument une fois toutes les étapes terminées.

#### `util_stepHandler.taskLoadLevelStep(step)`

Fonction processTask de l'étape de chargement de niveau : lance le chargement au premier appel, journalise une erreur si le niveau est introuvable. Renvoie step.levelLoaded (jamais renseigné).

- `step` (*table*) : Étape de chargement.
- **renvoie** : boolean Toujours false en pratique.

#### `util_stepHandler.taskSpawnTrafficStep(step)`

Fonction processTask de l'étape de trafic : machine à états 0 (créer le groupe) → 1 (attente de onVehicleGroupSpawned) → 2 (activer le trafic).

- `step` (*table*) : Étape de trafic.

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/stepHandler.lua`.*
