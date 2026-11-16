# `core_trafficSignals`

*Fichier : `lua/ge/extensions/core/trafficSignals.lua` · VM : Game Engine (GE) · 1725 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_trafficSignals` : `extensions.load("core_trafficSignals")`, puis la globale `core_trafficSignals`

Extension GE `core_trafficSignals` (Traffic Signals V2) : simule les feux tricolores, stops et autres signaux d'un niveau. Trois types d'objets : SignalInstance (un signal placé dans le monde avec position, direction, controller et séquence), SignalController (type de signal et liste d'états avec durées : feu tricolore, stop…) et SignalSequence (phases qui enchaînent des controllers, partagées par les instances d'une intersection). Charge signals.json et signalControllerDefinitions.json du dossier du niveau, met à jour les lumières des objets TSStatic liés (champs dynamiques signalInstance, instanceColor*), publie l'état aux véhicules (mailbox 'trafficSignalUpdates') et via le hook onTrafficSignalUpdate.

## Exemple

```lua
-- État du premier signal
local s = core_trafficSignals.getSignals()[1]
local stateName, stateData = s:getState()   -- ex. 'greenTrafficLight'
-- Forcer une séquence à l'étape 2 sans que le timer interfère
local seq = s:getSequence()
seq:enableTimer(false)
seq:setStep(2)
-- Signal le plus proche en amont d'un véhicule
local best = core_trafficSignals.getBestSignal(veh:getPosition(), veh:getDirectionVector())
```

## Remarques

- Cycle de vie : onClientStartMission -> loadSignals() ; le système n'est vraiment lancé (runSignals) par onNavgraphReloaded, quand le graphe de routes est prêt (ou immédiatement avec autoRun=true). onClientEndMission -> resetSignals().
- Le temps du module (`timer`, lu par getTimer) avance de dtSim à chaque onUpdate (ou dt réel si M.useDtReal). Les changements d'étape sont planifiés dans une file de priorité (minheap) triée par temps.
- Chaque changement d'état est publié aux véhicules sous forme de tableau {n1, n2, indexInterne, action} (action : 1 alert, 2 stop, 3 briefStop, 4 yield, 5 slow, 0 sinon) envoyé dans la mailbox 'trafficSignalUpdates', et au Lua GE via extensions.hook('onTrafficSignalUpdate', résultats) où résultats[nomInstance] = {state, linkedObjects, stateAction, lightColors, lightStates}.
- Les définitions de controllers viennent de settings/trafficSignals.json (clés states et types) fusionnées avec celles du niveau ; signalActions et signalColors (ColorF de debug) sont ajoutés par le code.
- BUG : setTimer(nil) appelle resetTimer() (timer = 0) puis exécute `timer = val`, ce qui remet timer à nil ; les additions suivantes dans onUpdate provoquent alors une erreur.
- Signatures réelles différentes de la liste automatique : SignalController:autoSetTimings(speedMetresPerSecond, intersectionLength, isPermissive) ; SignalInstance:isVehAfterSignal(vehId, maxDist, minDot) ; SignalInstance:getStateAfterTime(seconds, isAbsolute) ; SignalInstance:createSignalObject(shapeFile, pos, rot) ; SignalInstance:setup(pos, dir, controllerId, sequenceId) ; SignalInstance:setStrictState(stateIdx) ; SignalInstance:getVehPlacement(vehId) ; SignalSequence:setStrictState(ctrlName, stateIdx) ; SignalSequence:createPhase(phase, idx) ; SignalSequence:deletePhase(idx) ; SignalSequence:setStep(index) ; SignalSequence:setPhase(index) ; SignalSequence:setActive(val) ; SignalSequence:enableTimer(val) ; SignalController:applyDefinition(key) ; SignalInstance:setActive(val) ; SignalInstance:setLights(lightsArray) ; SignalInstance:setController(id) ; SignalInstance:setSequence(id) ; SignalInstance:setAuxiliaryData().
- Le paramètre de autoSetTimings `isPermissive` est accepté mais pas utilisé dans le code (les formules supposent déjà la règle du jaune permissif).
- Les fonctions du module nommées newSignal/getSignals/getSignalByName sont en interne newInstance/getInstances/getInstanceByName ; ne pas chercher ces noms internes. Le champ getSignalsDict vaut `nop` (fonction vide globale du jeu) : il ne renvoie jamais rien. L'alerte « référence nop non définie » est une fausse alerte.
- SignalSequence:calcDuration(controllersRef) est appelée avec un argument optionnel (utilisé par l'éditeur). SignalInstance:drawDebug(isEditMode, isSelected, showText, capColor, cylinderScl, arrowScl) dessine via debugDrawer ; onUpdate l'appelle quand M.debugLevel > 0 pour les signaux à moins de 300 m de la caméra (niveau 2 : textes et flèches).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_trafficSignals.getBestSignal(pos, dirVec, resetCache)` | Renvoie le signal le plus pertinent près d'une position. Avec dirVec, favorise les signaux devant le véhicule et orientés dans le même sens (distance divisée par le plus petit des deux produits scalaires). Le résultat est mis en cache tant que le segment de route (n1, n2) ne change pas. | 1252 |
| `core_trafficSignals.getControllerByName(name)` | Renvoie un controller par son nom. | 1216 |
| `core_trafficSignals.getControllerDefinitions()` | Renvoie les définitions de controllers (states, types, signalActions, signalColors). | 1196 |
| `core_trafficSignals.getControllers()` | Renvoie le tableau des controllers. | 1212 |
| `core_trafficSignals.getData(full)` | Renvoie les données principales du module. | 1232 |
| `core_trafficSignals.getElementById(id)` | Renvoie un élément (instance, controller ou séquence) d'après son id unique. | 47 |
| `core_trafficSignals.getMapNodeSignals()` | Renvoie la table qui relie les noeuds de la carte routière aux signaux : [n1][n2] = liste de {instance, pos, useLane, state, action}. | 1204 |
| `core_trafficSignals.getSequenceByName(name)` | Renvoie une séquence par son nom. | 1224 |
| `core_trafficSignals.getSequences()` | Renvoie le tableau des séquences. | 1220 |
| `core_trafficSignals.getSignalByName(name)` | Renvoie une instance par son nom. | 1208 |
| `core_trafficSignals.getSignals()` | Renvoie le tableau des instances de signaux. | 1200 |
| `core_trafficSignals.getTimer()` | Renvoie le temps écoulé du système (s) ; -1 tant qu'il n'a jamais été lancé. | 1228 |
| `core_trafficSignals.loadControllerDefinitions(filePath)` | Recharge les définitions par défaut puis applique celles du niveau (signalControllerDefinitions.json dans le dossier du niveau, ou filePath). | 1459 |
| `core_trafficSignals.loadSignals(filePath, autoRun)` | Charge un fichier de signaux JSON (instances, controllers, sequences) et l'installe avec setupSignals. Charge aussi les définitions de controllers du niveau. | 1476 |
| `core_trafficSignals.newController(data)` | Crée un SignalController (non inclus tant que :include() n'est pas appelé). | 1181 |
| `core_trafficSignals.newSequence(data)` | Crée une SignalSequence (non incluse tant que :include() n'est pas appelé). | 1185 |
| `core_trafficSignals.newSignal(data)` | Crée une SignalInstance (non incluse dans le système tant que :include() n'est pas appelé). Sans pos : position de la caméra au sol ; sans dir : direction de la route la plus proche, sinon de la caméra. | 1177 |
| `core_trafficSignals.onClientEndMission()` | Hook : le niveau se termine ; supprime les signaux. *(interne)* *(hook)* | 1631 |
| `core_trafficSignals.onClientStartMission()` | Hook : un niveau démarre ; charge signals.json du niveau. *(interne)* *(hook)* | 1627 |
| `core_trafficSignals.onDeserialized(data)` | Hook : recrée et inclut les éléments sérialisés, recharge les définitions et recalcule le compteur d'ids. *(interne)* *(hook)* | 1653 |
| `core_trafficSignals.onNavgraphReloaded()` | Hook : le graphe de routes est (re)chargé. Si le système est actif, lance runSignals (calcule durées, routes, timer, table mapNodeSignals). *(interne)* *(hook)* | 1615 |
| `core_trafficSignals.onSerialize()` | Hook : sérialise instances, controllers, séquences, active, loaded, useDtReal, debugLevel avant un rechargement Lua. *(interne)* *(hook)* | 1635 |
| `core_trafficSignals.onUpdate(dt, dtSim)` | Hook appelé à chaque frame : fait clignoter les états à lumières clignotantes, avance le timer, dépile la file pour faire avancer les séquences, applique les changements d'état en attente (lumières, mailbox, hook onTrafficSignalUpdate) et dessine le debug si debugLevel > 0. *(interne)* *(hook)* | 1516 |
| `core_trafficSignals.resetControllerDefinitions()` | Recharge les définitions par défaut (settings/trafficSignals.json : états et types) et ajoute signalActions (alert=1, stop=2, briefStop=3, yield=4, slow=5) et signalColors. | 66 |
| `core_trafficSignals.resetSignals()` | Supprime tous les signaux, controllers et séquences (setupSignals sans argument). | 1455 |
| `core_trafficSignals.resetTimer()` | Met le timer à 0, vide la file, (ré)active les séquences et instances valides puis émet onTrafficSignalsReset. | 1287 |
| `core_trafficSignals.setActive(val, autoRun)` | Active ou met en pause le système. Avec autoRun=true et système non chargé, lance runSignals immédiatement ; sinon attend onNavgraphReloaded. | 1357 |
| `core_trafficSignals.setControllerDefinitions(data)` | Fusionne des états et types personnalisés dans les définitions de controllers (tableMerge). | 1189 |
| `core_trafficSignals.setLightsManual(id, stateArray)` | Allume ou éteint directement les 3 lumières d'un objet signal (champs instanceColor, instanceColor1, instanceColor2) sans changer l'état logique. | 1376 |
| `core_trafficSignals.setTimer(val)` | Fixe directement le timer (peut changer instantanément les états). Voir le bug dans les notes si val est nil. | 1309 |
| `core_trafficSignals.setupSignalObjects()` | Met en cache les objets TSStatic de la scène qui possèdent un champ dynamique `signalInstance` (nom d'instance), indexés par nom d'instance. | 51 |
| `core_trafficSignals.setupSignals(data, merge, autoRun)` | Installe un jeu de signaux (et efface les index précédents). Sans data, vide tout. Avec data, remplace (ou fusionne si merge) instances, controllers et séquences, retire les doublons d'id puis appelle setActive(true, autoRun). | 1387 |

### Détail des paramètres

#### `core_trafficSignals.getBestSignal(pos, dirVec, resetCache)`

Renvoie le signal le plus pertinent près d'une position. Avec dirVec, favorise les signaux devant le véhicule et orientés dans le même sens (distance divisée par le plus petit des deux produits scalaires). Le résultat est mis en cache tant que le segment de route (n1, n2) ne change pas.

- `pos` (*vec3*) : position de recherche
- `dirVec` (*vec3|nil*) : direction de déplacement
- `resetCache` (*boolean|nil*) : true pour oublier le résultat en cache
- **renvoie** : SignalInstance|nil meilleure instance valide ; nil si le système n'est pas lancé ou si aucune route proche

#### `core_trafficSignals.getControllerByName(name)`

Renvoie un controller par son nom.

- `name` (*string*) : nom
- **renvoie** : SignalController|nil controller

#### `core_trafficSignals.getControllerDefinitions()`

Renvoie les définitions de controllers (states, types, signalActions, signalColors).

- **renvoie** : table définitions (pas une copie)

#### `core_trafficSignals.getControllers()`

Renvoie le tableau des controllers.

- **renvoie** : SignalController[] controllers

#### `core_trafficSignals.getData(full)`

Renvoie les données principales du module.

- `full` (*boolean|nil*) : si true, ajoute instancesByName, controllersByName, sequencesByName, elementsById
- **renvoie** : table {instances, controllers, sequences, loaded, active, timer, nextTime (prochaine échéance de la file, 0 si vide)} (+ tables par nom/id si full)

#### `core_trafficSignals.getElementById(id)`

Renvoie un élément (instance, controller ou séquence) d'après son id unique.

- `id` (*integer|nil*) : identifiant unique
- **renvoie** : SignalInstance|SignalController|SignalSequence|nil élément

#### `core_trafficSignals.getMapNodeSignals()`

Renvoie la table qui relie les noeuds de la carte routière aux signaux : [n1][n2] = liste de {instance, pos, useLane, state, action}.

- **renvoie** : table table de références (envoyée aux véhicules)

#### `core_trafficSignals.getSequenceByName(name)`

Renvoie une séquence par son nom.

- `name` (*string*) : nom
- **renvoie** : SignalSequence|nil séquence

#### `core_trafficSignals.getSequences()`

Renvoie le tableau des séquences.

- **renvoie** : SignalSequence[] séquences

#### `core_trafficSignals.getSignalByName(name)`

Renvoie une instance par son nom.

- `name` (*string*) : nom de l'instance
- **renvoie** : SignalInstance|nil instance

#### `core_trafficSignals.getSignals()`

Renvoie le tableau des instances de signaux.

- **renvoie** : SignalInstance[] instances

#### `core_trafficSignals.getTimer()`

Renvoie le temps écoulé du système (s) ; -1 tant qu'il n'a jamais été lancé.

- **renvoie** : number timer

#### `core_trafficSignals.loadControllerDefinitions(filePath)`

Recharge les définitions par défaut puis applique celles du niveau (signalControllerDefinitions.json dans le dossier du niveau, ou filePath).

- `filePath` (*string|nil*) : fichier de définitions ; défaut = <dossier du niveau>/signalControllerDefinitions.json

#### `core_trafficSignals.loadSignals(filePath, autoRun)`

Charge un fichier de signaux JSON (instances, controllers, sequences) et l'installe avec setupSignals. Charge aussi les définitions de controllers du niveau.

- `filePath` (*string|nil*) : fichier ; défaut = <dossier du niveau>/signals.json
- `autoRun` (*boolean|nil*) : false si le graphe de routes n'est pas encore chargé (cas du chargement de niveau)
- **renvoie** : boolean true si le fichier a été lu

#### `core_trafficSignals.newController(data)`

Crée un SignalController (non inclus tant que :include() n'est pas appelé).

- `data` (*table|nil*) : {id?, name?, type?, isSimple?, defaultIndex?, states?}
- **renvoie** : SignalController nouveau controller

#### `core_trafficSignals.newSequence(data)`

Crée une SignalSequence (non incluse tant que :include() n'est pas appelé).

- `data` (*table|nil*) : {id?, name?, startTime?, phases?, startDisabled?, ignoreTimer?}
- **renvoie** : SignalSequence nouvelle séquence

#### `core_trafficSignals.newSignal(data)`

Crée une SignalInstance (non incluse dans le système tant que :include() n'est pas appelé). Sans pos : position de la caméra au sol ; sans dir : direction de la route la plus proche, sinon de la caméra.

- `data` (*table|nil*) : {id?, name?, pos?, dir?, group?, controllerId?, sequenceId?, useCurrentLane?, startDisabled?}
- **renvoie** : SignalInstance nouvelle instance

#### `core_trafficSignals.onDeserialized(data)`

Hook : recrée et inclut les éléments sérialisés, recharge les définitions et recalcule le compteur d'ids.

- `data` (*table*) : données de onSerialize

#### `core_trafficSignals.onSerialize()`

Hook : sérialise instances, controllers, séquences, active, loaded, useDtReal, debugLevel avant un rechargement Lua.

- **renvoie** : table données

#### `core_trafficSignals.onUpdate(dt, dtSim)`

Hook appelé à chaque frame : fait clignoter les états à lumières clignotantes, avance le timer, dépile la file pour faire avancer les séquences, applique les changements d'état en attente (lumières, mailbox, hook onTrafficSignalUpdate) et dessine le debug si debugLevel > 0.

- `dt` (*number*) : temps réel (s)
- `dtSim` (*number*) : temps de simulation (s)

#### `core_trafficSignals.setActive(val, autoRun)`

Active ou met en pause le système. Avec autoRun=true et système non chargé, lance runSignals immédiatement ; sinon attend onNavgraphReloaded.

- `val` (*boolean*) : état actif
- `autoRun` (*boolean|nil*) : true : lancer tout de suite (graphe de routes déjà prêt)

#### `core_trafficSignals.setControllerDefinitions(data)`

Fusionne des états et types personnalisés dans les définitions de controllers (tableMerge).

- `data` (*table*) : {states = {...}, types = {...}}

#### `core_trafficSignals.setLightsManual(id, stateArray)`

Allume ou éteint directement les 3 lumières d'un objet signal (champs instanceColor, instanceColor1, instanceColor2) sans changer l'état logique.

- `id` (*integer*) : identifiant de l'objet scène (TSStatic)
- `stateArray` (*boolean[]|nil*) : état de chaque lumière ; défaut {false,false,false}

#### `core_trafficSignals.setTimer(val)`

Fixe directement le timer (peut changer instantanément les états). Voir le bug dans les notes si val est nil.

- `val` (*number*) : nouvelle valeur du timer (s)

#### `core_trafficSignals.setupSignals(data, merge, autoRun)`

Installe un jeu de signaux (et efface les index précédents). Sans data, vide tout. Avec data, remplace (ou fusionne si merge) instances, controllers et séquences, retire les doublons d'id puis appelle setActive(true, autoRun).

- `data` (*table|nil*) : {instances, controllers, sequences} d'objets SignalInstance/Controller/Sequence
- `merge` (*boolean|nil*) : true : ajoute aux éléments existants
- `autoRun` (*boolean|nil*) : true : lancer immédiatement le système

## Champs

| Champ | Type | Description |
|---|---|---|
| `debugLevel` | number | 0 = aucun dessin debug ; 1 = dessin simple ; 2 = avec textes et flèches. Sauvegardé par onSerialize. |
| `getSignalsDict` | function | Vaut `nop` (fonction vide) : sans effet. |
| `useDtReal` | boolean | false par défaut ; si true, le timer avance avec le temps réel (dt) au lieu du temps de simulation (dtSim), donc même pendant une pause. |

## Classe `SignalController`

Type de signal avec sa liste d'états ordonnés ({state, duration}) : feu tricolore, stop, etc. Champs : id, name, type, isSimple (durées ignorées), defaultIndex (état par défaut), totalDuration, states. Réutilisable par plusieurs séquences.

| Méthode | Description | Ligne |
|---|---|---|
| `SignalController:applyDefinition(key)` | Applique un type de signal des définitions (copie isSimple, defaultIndex et les états avec leurs durées). | 695 |
| `SignalController:autoSetTimings(speedMetresPerSecond, intersectionLength, isPermissive)` | Règle automatiquement les durées : vert = 0.7*vitesse + 0.6*longueur d'intersection (borné 10..40 s), jaune = 1 + (vitesse - 4.167)/3.27 (borné 3..7 s), rouge = 1 s. | 740 |
| `SignalController:calcDuration()` | Calcule la durée totale des états (math.huge si une durée est absente ou négative ; 0 si isSimple). | 723 |
| `SignalController:exclude()` | Retire le controller des données du module. | 763 |
| `SignalController:getStateData(state)` | Données d'un état dans les définitions (lights, action, flashingLights…). | 719 |
| `SignalController:include()` | Ajoute le controller aux données du module. | 755 |
| `SignalController:new(data)` | Constructeur (voir newController). | 679 |
| `SignalController:onDeserialized(data)` | Restaure les champs. | 795 |
| `SignalController:onSerialize()` | Données à sauvegarder (les durées négatives sont ramenées à -1). | 776 |

## Classe `SignalInstance`

Un signal placé dans le monde (feu, panneau). Champs : id, name, pos (vec3), dir (vec3), group, controllerId, sequenceId, startDisabled, active, road ({n1, n2, dist, pos, dir, radius}), linkedObjects (ids d'objets TSStatic liés), priorityStateIndex (état imposé qui prime sur la séquence), targetPos/intersectionId (centre de l'intersection), _invalid (signal inutilisable : pas de route ou de controller). Créé par newSignal.

| Méthode | Description | Ligne |
|---|---|---|
| `SignalInstance:calcIntersectionPos()` | Calcule le centre de l'intersection en moyennant les signaux de même séquence situés à moins de 40 m devant ce signal (au moins 2) et renseigne targetPos/intersectionId pour tous. Nécessite le système actif. | 346 |
| `SignalInstance:clearSignalObjects(alsoDelete)` | Délie les objets liés (efface leur champ signalInstance) ou les supprime. | 182 |
| `SignalInstance:createSignalObject(shapeFile, pos, rot)` | Crée un TSStatic (shape de feu, par défaut art/shapes/objects/trafficlight_overhead1.dae, cherchée dans le niveau puis dans art/shapes/), le place, le lie au signal et le range dans le groupe AutoTrafficSignals. | 207 |
| `SignalInstance:drawDebug(isEditMode, isSelected, showText, capColor, cylinderScl, arrowScl)` | Dessine cylindre, flèche et texte de debug du signal. | 385 |
| `SignalInstance:exclude()` | Retire l'instance des données du module. | 640 |
| `SignalInstance:getBestRoad(pos, dir)` | Trouve la route la plus proche d'une position et renvoie le segment orienté dans le sens du signal (route à sens unique : sens de la route). | 286 |
| `SignalInstance:getController()` | Controller associé (via controllerId). | 463 |
| `SignalInstance:getSequence()` | Séquence associée (via sequenceId). | 467 |
| `SignalInstance:getSignalObjects(refresh)` | Ids des objets TSStatic liés à ce signal (champ signalInstance = nom). | 177 |
| `SignalInstance:getState()` | État courant (getStateAfterTime(0)). | 528 |
| `SignalInstance:getStateAfterTime(seconds, isAbsolute)` | État du signal après `seconds` secondes (système actif requis) en simulant la séquence. | 471 |
| `SignalInstance:getVehPlacement(vehId)` | Position d'un véhicule par rapport au signal. | 324 |
| `SignalInstance:include()` | Ajoute l'instance (et son controller/sa séquence internes éventuels) aux données du module. | 624 |
| `SignalInstance:isVehAfterSignal(vehId, maxDist, minDot)` | Vrai si le véhicule a franchi le point du signal dans le bon sens et à moins de maxDist. | 335 |
| `SignalInstance:linkSignalObject(objId)` | Lie un objet scène à ce signal (champ dynamique signalInstance = nom). | 195 |
| `SignalInstance:new(data)` | Constructeur. | 114 |
| `SignalInstance:onDeserialized(data)` | Restaure les champs à partir de data (pos/dir reconverties en vec3). | 669 |
| `SignalInstance:onSerialize()` | Données à sauvegarder (id, name, pos, dir, group, controllerId, sequenceId, useCurrentLane, startDisabled). | 653 |
| `SignalInstance:refresh()` | Réactualise ce signal ainsi que sa séquence (réactive, rétablit l'étape courante). | 532 |
| `SignalInstance:setActive(val)` | Active ou désactive le signal ; à l'activation, met l'état attendu (séquence, sinon état par défaut du controller) en file d'envoi. | 556 |
| `SignalInstance:setAuxiliaryData()` | Cherche la route, vérifie la présence du controller et recense les objets liés ; marque le signal _invalid en cas de problème (log d'erreur). | 597 |
| `SignalInstance:setController(id)` | Change le controller et rafraîchit si le système est actif. | 546 |
| `SignalInstance:setLights(lightsArray)` | Allume/éteint directement les lumières de tous les objets liés (sans changer l'état logique). Surtout interne. | 146 |
| `SignalInstance:setSequence(id)` | Change la séquence et rafraîchit si le système est actif. | 551 |
| `SignalInstance:setStrictState(stateIdx)` | Impose l'état de ce signal d'après l'indice dans la liste d'états du controller (prime sur la séquence ; désactiver le timer de la séquence avant). Sans stateIdx valide (nil ou <= 0), le signal retrouve son état normal. | 161 |
| `SignalInstance:setup(pos, dir, controllerId, sequenceId)` | Configuration alternative : fixe pos/dir, cherche la route, et crée un controller ('lightsBasic') et/ou une séquence si les ids donnés sont absents ou invalides. | 266 |
| `SignalInstance:unlinkSignalObject(objId)` | Délie un objet scène de ce signal. | 201 |

## Classe `SignalSequence`

Enchaîne des phases ({controllerIds, startTime?, totalDuration}) pour piloter les controllers d'une intersection. Champs : id, name, startTime, totalDuration, phases, timeline ([temps] = liste {nomController, indexPhase, indexEtat}), timelineTimes (temps triés), controllerStates, currStep, currPhase, stateTime, startDisabled, ignoreTimer.

| Méthode | Description | Ligne |
|---|---|---|
| `SignalSequence:advance()` | Passe à l'étape suivante (boucle au début). Appelé par la file du module quand l'échéance est atteinte. | 1012 |
| `SignalSequence:calcDuration(controllersRef)` | Calcule la durée de chaque phase (plus longue durée de ses controllers) et de la séquence (somme, ou max de startTime + durée si startTime est donné). | 840 |
| `SignalSequence:createPhase(phase, idx)` | Ajoute une phase (à la fin ou à l'indice idx). | 822 |
| `SignalSequence:deletePhase(idx)` | Supprime une phase. | 833 |
| `SignalSequence:enableTimer(val)` | Indique si la séquence suit le timer principal ; false la fige (utile avec setStep/setPhase/setStrictState). | 1125 |
| `SignalSequence:exclude()` | Retire la séquence des données du module. | 1143 |
| `SignalSequence:include()` | Ajoute la séquence aux données du module. | 1135 |
| `SignalSequence:new(data)` | Constructeur (voir newSequence). | 803 |
| `SignalSequence:onDeserialized(data)` | Restaure les champs. | 1169 |
| `SignalSequence:onSequenceUpdate()` | Interne : traite l'étape courante et planifie la suivante dans la file. | 899 |
| `SignalSequence:onSerialize()` | Données à sauvegarder (id, name, phases, startTime, startDisabled, ignoreTimer). | 1156 |
| `SignalSequence:resetSequence()` | Remet la séquence au début (états par défaut des controllers) et planifie la première échéance. | 933 |
| `SignalSequence:resolveUpdates(forceUpdate)` | Pousse l'état des controllers modifiés vers les instances actives en file d'envoi. | 884 |
| `SignalSequence:setActive(val)` | Active la séquence (construit timeline et controllerStates, puis resetSequence ; ignorée avec un avertissement si durée nulle) ou la désactive (instances mises à l'état 'none'). | 1039 |
| `SignalSequence:setPhase(index)` | Saute à la première étape de la phase donnée. | 978 |
| `SignalSequence:setStep(index)` | Saute à l'étape d'indice donné de la timeline (si elle existe). | 952 |
| `SignalSequence:setStrictState(ctrlName, stateIdx)` | Impose l'état d'un controller de la séquence pour toutes ses instances (lumières et état). Désactiver le timer avant (enableTimer(false)). | 1022 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficSignalUpdate`
- `onTrafficSignalsReset`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `be:` `getSurfaceHeightBelow`, `sendToMailbox`
- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`, `drawTextAdvanced`
- `obj:` `getID`, `getId`, `getWorldBox`, `registerObject`, `setField`, `setTransform`
- `scenetree.` `findObjectById`, `objectExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/trafficSignals.lua`.*
