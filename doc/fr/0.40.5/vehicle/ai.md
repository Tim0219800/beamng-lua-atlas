# `ai`

*Fichier : `lua/vehicle/ai.lua` · VM : Véhicule · 6281 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `ai`

Intelligence artificielle de conduite d'un véhicule (VM véhicule, globale `ai`). Elle conduit le véhicule le long d'un graphe routier (mapmgr) ou d'un script de trajectoire, en agissant sur throttle/brake/steering via electrics. Un moddeur s'en sert pour piloter le véhicule : choisir un mode (ai.setMode), une cible (setTarget, driveUsingPath), une vitesse (setSpeed + setSpeedMode), un niveau d'agressivité. L'état public (mode, debugMode, speedMode, routeSpeed, extAggression, extAvoidCars, driveInLaneFlag, cutOffDrivability, manualTargetName, pullOver) est la table M elle-même, renvoyée par getState() et envoyée à l'UI via guihooks AIStateChange. La boucle de conduite M.updateGFX n'est active que lorsque le mode n'est pas 'disabled'.

## Exemple

```lua
-- depuis la console du véhicule (VM véhicule)
ai.setMode('manual')
ai.setSpeedMode('limit'); ai.setSpeed(20) -- 20 m/s max
ai.setAggression(0.5)
ai.setTarget('wp_12')
-- ou, en une fois :
ai.driveUsingPath{wpTargetList = {'wp1', 'wp10'}, driveInLane = 'on', avoidCars = 'on', routeSpeed = 35, routeSpeedMode = 'limit', aggression = 0.3}
-- depuis le jeu (GE) : be:getObjectByID(id):queueLuaCommand('ai.setMode("traffic")')
```

## Remarques

- Modes reconnus par la boucle de conduite (M.mode) : 'disabled' (IA coupée, défaut), 'manual' (suit la cible/le chemin fixé par setTarget/setPath/driveUsingPath), 'random' (erre sur le réseau routier), 'span' (parcourt toute la carte, voir spanMap), 'traffic' (circulation : speedMode 'legal', driveInLane 'on', modèle de traction 1, profil de vitesse 'Back'), 'slotTraffic' (suit la cible donnée par setSlotTrafficTarget, évitement de voitures désactivé par défaut), 'flee' (fuit le véhicule joueur), 'chase' (poursuit le joueur), 'follow' (suit le joueur), 'stop' (freine puis repasse seul en 'disabled' quand la vitesse < 0.08 m/s), 'script' (lecture/enregistrement scriptai). Toute autre valeur est acceptée par setMode mais n'a pas de branche dédiée.
- setMode appelle le GE : onAiModeChange(objectId, mode) quand le mode change. En quittant 'disabled', la boîte est mise en mode 'arcade' (le mode précédent est sauvegardé puis restauré au retour en 'disabled' ou à la fin de 'stop').
- Valeurs de speedMode : 'set' (vise routeSpeed), 'limit' (plafonne à routeSpeed), 'legal' (limites légales de la route), 'off'. Toute autre valeur remet speedMode à nil. routeSpeed est en m/s.
- debugMode (setVehicleDebugMode) : 'off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all' (valeurs testées par aiDebugDraw ; 'all' est aussi utilisé par setScriptDebugMode).
- aggression : 0.3 correspond à une conduite normale de tous les jours, 1 à la limite d'adhérence (d'après le commentaire de driveUsingPath). Valeur par défaut extAggression = 0.3.
- extAvoidCars : 'on', 'off' ou autre (défaut 'auto'). En 'auto' l'évitement est 'off' en modes 'manual' et 'slotTraffic', 'on' sinon.
- Incohérences dans le code : M.debugDraw est défini à `nop`, qui doit être défini globalement par le moteur (aiDebugDraw le remplace quand le debug est actif). M.updateGFX est initialisé à `nop` puis remplacé par la fonction interne updateGFX. M.targetObjectID n'est pas initialisé en tête de fichier (nil au départ) et setTargetObjectID compare M.targetObjectID à `objectId` (et non à `id`), ce qui ressemble à une erreur (le toggle prévu semble être id vs M.targetObjectID).
- ai.stopFollowing et ai.scriptStop sont la même fonction (scriptStop).
- Dans setScriptDebugMode, mode nil ou 'off' met M.debugMode à 'all' avant de désactiver le dessin : probablement un bug (devrait être 'off').
- La plupart des setters appellent stateChanged(), qui n'envoie AIStateChange à l'UI que si un joueur est assis dans le véhicule.
- UI/GE : guihooks 'AIStateChange' (état M) et 'AIStatusChange' ({status, category}, ex. 'route done'/'route') ; appels GE onAiModeChange(id, mode) et onAiRouteDone(id).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ai.driveInLane(v)` | Active ou non la conduite sur le côté légal de la route (affecte aussi la recherche de chemin). | 5785 |
| `ai.driveUsingPath(arg)` | Interface principale pour faire suivre un parcours : met l'IA en mode 'manual' et configure chemin, vitesses, tours, conduite sur voie, agressivité et évitement. Il faut au moins path, wpTargetList ou script ; tout argument de mauvais type fait ignorer silencieusement l'appel. Avec script, la voiture est d'abord téléportée au point de départ du script. | 5950 |
| `ai.dumpCurrentRoute()` | Affiche (dump) la route courante dans la console, pour debug. | 6149 |
| `ai.dumpParameters()` | Affiche (dump) les paramètres et l'agressivité interne dans la console. | 359 |
| `ai.getEdgeLaneConfig(fromNode, toNode)` | Renvoie la configuration de voies d'une arête dans le sens fromNode -> toNode, sous forme de chaîne de '+' (voie dans le sens de parcours) et '-' (sens opposé). Si l'arête n'a pas de données de voies, elles sont déduites des rayons des nœuds (3.61 m par voie ; sens selon mapmgr.rules.rightHandDrive). | 1155 |
| `ai.getParameters()` | Renvoie la table des paramètres courants (référence directe, non copiée). | 6153 |
| `ai.getState()` | Renvoie la table d'état publique M (référence directe). | 253 |
| `ai.isDriving()` | Indique si la boucle de conduite (ou scriptai) est active. | 6211 |
| `ai.laneChange(plan, dist, signedDisp)` | Décale latéralement les nœuds du plan courant pour changer de voie, progressivement sur une distance donnée, en respectant la largeur de route. | 1068 |
| `ai.onDeserialized(v)` | Hook appelé par le système de sérialisation du véhicule après rechargement (Ctrl+R) : restaure l'état via setState. *(interne)* *(hook)* | 6144 |
| `ai.reset()` | Appelée au reset du véhicule (touche I) : efface la cible manuelle, remet à zéro les états internes (trafic, crash, klaxon), lissages, et ré-applique le mode courant sans le changer. Arrête l'enregistrement de données si actif. *(interne)* | 5898 |
| `ai.restoreSavedGearboxMode()` | Restaure le mode de boîte mémorisé par saveGearboxMode via controller.mainController.setGearboxMode. | 158 |
| `ai.roadNaturalContinuation(wp1, wp2)` | Calcule, parmi les arêtes sortant de wp2, celle qui prolonge le plus naturellement l'arête wp1->wp2 (direction et flux de voies). | 1178 |
| `ai.saveGearboxMode()` | Mémorise le mode de boîte actuel (electrics.values.gearboxMode) pour le restaurer plus tard ; sans effet s'il est déjà mémorisé. Pour debug. | 154 |
| `ai.scriptState()` | Renvoie l'état du script en cours selon scriptai.scriptState. | 6194 |
| `ai.scriptStop(...)` | Arrête la lecture de script : mode 'disabled' puis scriptai.scriptStop. | 6187 |
| `ai.setAggression(v)` | Définit l'agressivité de conduite (M.extAggression) et l'applique immédiatement, puis notifie l'UI. nil conserve la valeur actuelle. | 284 |
| `ai.setAggressionMode(aggrmode)` | Active ou non le mode d'agressivité adaptatif. | 290 |
| `ai.setAvoidCars(v)` | Active/désactive l'évitement des autres véhicules. | 5775 |
| `ai.setCutOffDrivability(drivability)` | Change seulement le seuil de praticabilité (cutOffDrivability) sans changer de mode. | 6139 |
| `ai.setEnableFastPhysicsforTraffic(v)` | Autorise la physique simplifiée (collision propre et aérodynamique mode 2) pour les véhicules du trafic. Appliqué au prochain setMode('traffic'). | 2040 |
| `ai.setMode(mode)` | Change le mode principal de l'IA et (ré)initialise la route, la carte routière (mapmgr.requestMap sauf slotTraffic) et le lissage de vitesse. Sans effet si le véhicule n'a pas de roues. Avec mode=nil, ré-applique simplement le mode courant. En 'disabled' coupe les commandes et la boucle updateGFX. | 5806 |
| `ai.setParameters(data)` | Fusionne (tableMerge) des réglages fins dans la table de paramètres de l'IA. Clés connues et défauts : turnForceCoef 2, awarenessForceCoef 0.25, edgeDist 0, trafficWaitTime 2, enableElectrics true, driveStyle 'default', staticFrictionCoefMult 0.95, lookAheadKv 0.6, minStTargetDist 4.5, applyWidthMarginOffset true, planErrorSmoothing true, springForceIntegratorDispLim 0.1, understeerThrottleControl/oversteerThrottleControl/throttleTcs 'on' (autre que 'off' = actif), abBrakeControl 'on', underSteerBrakeControl 'on', throttleKp 0.5, targetSpeedSmootherRate 10, str 1, stt 0.5. | 355 |
| `ai.setPath(path)` | Fixe un chemin explicite (suite de noms de waypoints à suivre dans l'ordre) pour le mode 'manual'. | 5945 |
| `ai.setPullOver(val)` | Positionne M.pullOver (demande de se ranger sur le côté, lu par la logique de circulation). | 4285 |
| `ai.setRacing(v)` | Active/désactive l'option interne racing de l'IA. | 2031 |
| `ai.setRecoverOnCrash(val)` | Autorise l'IA à tenter de se récupérer quand elle reste bloquée environ 5 s sans bouger malgré une cible. | 5884 |
| `ai.setScriptDebugMode(mode)` | Active le dessin debug du suivi de script (scriptai.debugMode = mode). Avec nil ou 'off', désactive le dessin (voir notes). | 6199 |
| `ai.setSlotTrafficTarget(x, y, z, speed)` | Fournit une cible de position et vitesse pour le mode 'slotTraffic' (passe en ce mode si besoin). L'âge de la cible est remis à 0 à chaque appel. | 5877 |
| `ai.setSpeed(speed)` | Fixe la vitesse de route (routeSpeed) ; toute valeur non numérique la remet à nil. | 263 |
| `ai.setSpeedMode(speedMode)` | Définit comment routeSpeed est interprétée. | 267 |
| `ai.setSpeedProfileMode(mode)` | Choisit la méthode de génération du profil de vitesse. | 1913 |
| `ai.setState(newState)` | Applique un état complet (table de type M : mode, extAggression, extAvoidCars, driveInLaneFlag, debugMode, targetObjectID, etc.) en fusionnant dans M, ré-applique le mode et prévient le GE (onAiModeChange) si le mode change. Sans effet si le véhicule n'a pas de roues. | 5917 |
| `ai.setStopPoint(plan, dist, args)` | Définit le segment d'arrêt du plan : l'IA s'arrête à la distance donnée le long du plan. Sans dist, annule l'arrêt (stopSeg = math.huge). | 1096 |
| `ai.setTarget(wp)` | Fixe un waypoint unique comme cible (mode 'manual') ; la validation du nom se fait au prochain pas de la boucle. | 5939 |
| `ai.setTargetObjectID(id)` | Choisit manuellement le véhicule cible (joueur) pour les modes flee/chase/follow. Passer -1 revient à la sélection automatique. Voir notes : la comparaison interne semble erronée. | 365 |
| `ai.setTractionModel(model_index)` | Choisit la contrainte d'adhérence du profil de vitesse (utile seulement en profil 'Back' ou 'ForwBack'). | 1944 |
| `ai.setVehicleDebugMode(newMode)` | Fusionne la table donnée dans l'état M (typiquement {debugMode = '...'}), prévient aiDebugDraw et active ou coupe le dessin debug selon que debugMode vaut 'off' ou non. | 5796 |
| `ai.spanMap(cutOffDrivability)` | Met l'IA en mode 'span' : parcourt tout le réseau routier en passant sur chaque route. | 6133 |
| `ai.startFollowing(...)` | Fait suivre un script enregistré. Si le script (ou script.path) contient des points avec vitesse v, passe par driveUsingPath{script=...} ; sinon utilise scriptai en mode 'script'. | 6172 |
| `ai.startRecording(recordSpeed)` | Passe en mode 'script' et lance l'enregistrement d'une trajectoire via scriptai. | 6157 |
| `ai.startStopDataLog(name)` | Bascule l'enregistrement de données de conduite : au premier appel démarre, au suivant arrête et écrit un fichier CSV. | 217 |
| `ai.stateChanged()` | Envoie l'état à l'UI (guihooks AIStateChange) si un joueur est assis dans ce véhicule. | 257 |
| `ai.stopFollowing(...)` | Alias de scriptStop : arrête le suivi de script, mode 'disabled'. | 6187 |
| `ai.stopRecording()` | Arrête l'enregistrement (mode repasse à 'disabled') et renvoie le script enregistré. | 6164 |
| `ai.toggleTrafficMode()` | Bascule entre le mode 'traffic' (avec récupération après crash activée) et 'disabled'. | 5888 |

### Détail des paramètres

#### `ai.driveInLane(v)`

Active ou non la conduite sur le côté légal de la route (affecte aussi la recherche de chemin).

- `v` (*string*) : 'on' pour activer ; toute autre valeur désactive.

#### `ai.driveUsingPath(arg)`

Interface principale pour faire suivre un parcours : met l'IA en mode 'manual' et configure chemin, vitesses, tours, conduite sur voie, agressivité et évitement. Il faut au moins path, wpTargetList ou script ; tout argument de mauvais type fait ignorer silencieusement l'appel. Avec script, la voiture est d'abord téléportée au point de départ du script.

- `arg` (*table*) : Table d'options : path (string[], chemin de waypoints), wpTargetList (string[], cibles successives reliées par plus court chemin), script (table de {x,y,z,[r],[vl],[v],[dir],[up]} : r largeur, vl limite de vitesse, v vitesse imposée en ce point en m/s), wpSpeeds (table nom_waypoint -> vitesse m/s), noOfLaps (number, tours si boucle, défaut 1), routeSpeed (number m/s), routeSpeedMode ('limit' ou 'set'), driveInLane ('on', sinon inactif), aggression (0.3 à 1, défaut 0.3), avoidCars ('on'/'off', défaut 'off'), et réglages fins repris dans setParameters : driveStyle, staticFrictionCoefMult, lookAheadKv (min 0.1), understeerThrottleControl, oversteerThrottleControl, throttleTcs, abBrakeControl, underSteerBrakeControl, throttleKp, targetSpeedSmootherRate, turnForceCoef, springForceIntegratorDispLim.

#### `ai.getEdgeLaneConfig(fromNode, toNode)`

Renvoie la configuration de voies d'une arête dans le sens fromNode -> toNode, sous forme de chaîne de '+' (voie dans le sens de parcours) et '-' (sens opposé). Si l'arête n'a pas de données de voies, elles sont déduites des rayons des nœuds (3.61 m par voie ; sens selon mapmgr.rules.rightHandDrive).

- `fromNode` (*string*) : Nom du nœud de départ.
- `toNode` (*string*) : Nom du nœud d'arrivée.
- **renvoie** : string Ex. '--++' ; erreur Lua si l'arête n'existe pas dans le graphe.

#### `ai.getParameters()`

Renvoie la table des paramètres courants (référence directe, non copiée).

- **renvoie** : table Paramètres de l'IA.

#### `ai.getState()`

Renvoie la table d'état publique M (référence directe).

- **renvoie** : table M.

#### `ai.isDriving()`

Indique si la boucle de conduite (ou scriptai) est active.

- **renvoie** : boolean true si l'IA est en train de conduire.

#### `ai.laneChange(plan, dist, signedDisp)`

Décale latéralement les nœuds du plan courant pour changer de voie, progressivement sur une distance donnée, en respectant la largeur de route.

- `plan` (*table|nil*) : Plan à modifier ; nil = plan de la route courante (sans effet s'il n'y en a pas).
- `dist` (*number*) : Distance (m) sur laquelle le déport est appliqué.
- `signedDisp` (*number*) : Déport latéral en m, signé (le signe donne le côté).

#### `ai.onDeserialized(v)`

Hook appelé par le système de sérialisation du véhicule après rechargement (Ctrl+R) : restaure l'état via setState.

- `v` (*table*) : État sauvegardé (même format que M).

#### `ai.roadNaturalContinuation(wp1, wp2)`

Calcule, parmi les arêtes sortant de wp2, celle qui prolonge le plus naturellement l'arête wp1->wp2 (direction et flux de voies).

- `wp1` (*string*) : Nœud précédent.
- `wp2` (*string*) : Nœud courant.
- **renvoie** : any Nœud suivant retenu (déduit du code ; non relu en entier).

#### `ai.scriptState()`

Renvoie l'état du script en cours selon scriptai.scriptState.

- **renvoie** : any État renvoyé par scriptai.scriptState.

#### `ai.scriptStop(...)`

Arrête la lecture de script : mode 'disabled' puis scriptai.scriptStop.

- `...` (*any*) : Transmis à scriptai.scriptStop.

#### `ai.setAggression(v)`

Définit l'agressivité de conduite (M.extAggression) et l'applique immédiatement, puis notifie l'UI. nil conserve la valeur actuelle.

- `v` (*number|nil*) : Environ 0.3 (normal) à 1 (limite d'adhérence).

#### `ai.setAggressionMode(aggrmode)`

Active ou non le mode d'agressivité adaptatif.

- `aggrmode` (*string|nil*) : 'rubberBand' pour l'élastique (utilisé automatiquement en flee/chase/follow) ; toute autre valeur le désactive et ré-applique l'agressivité externe.

#### `ai.setAvoidCars(v)`

Active/désactive l'évitement des autres véhicules.

- `v` (*string*) : 'on' ou 'off' (forcé) ; toute autre valeur (ex. 'auto') : retombe sur 'off' en modes manual/slotTraffic, 'on' sinon.

#### `ai.setCutOffDrivability(drivability)`

Change seulement le seuil de praticabilité (cutOffDrivability) sans changer de mode.

- `drivability` (*number|nil*) : Seuil (nil = 0).

#### `ai.setEnableFastPhysicsforTraffic(v)`

Autorise la physique simplifiée (collision propre et aérodynamique mode 2) pour les véhicules du trafic. Appliqué au prochain setMode('traffic').

- `v` (*boolean*) : true active ; autre = false.

#### `ai.setMode(mode)`

Change le mode principal de l'IA et (ré)initialise la route, la carte routière (mapmgr.requestMap sauf slotTraffic) et le lissage de vitesse. Sans effet si le véhicule n'a pas de roues. Avec mode=nil, ré-applique simplement le mode courant. En 'disabled' coupe les commandes et la boucle updateGFX.

- `mode` (*string|nil*) : 'disabled', 'manual', 'random', 'span', 'traffic', 'slotTraffic', 'flee', 'chase', 'follow', 'stop', 'script' ; nil pour conserver le mode courant.

#### `ai.setParameters(data)`

Fusionne (tableMerge) des réglages fins dans la table de paramètres de l'IA. Clés connues et défauts : turnForceCoef 2, awarenessForceCoef 0.25, edgeDist 0, trafficWaitTime 2, enableElectrics true, driveStyle 'default', staticFrictionCoefMult 0.95, lookAheadKv 0.6, minStTargetDist 4.5, applyWidthMarginOffset true, planErrorSmoothing true, springForceIntegratorDispLim 0.1, understeerThrottleControl/oversteerThrottleControl/throttleTcs 'on' (autre que 'off' = actif), abBrakeControl 'on', underSteerBrakeControl 'on', throttleKp 0.5, targetSpeedSmootherRate 10, str 1, stt 0.5.

- `data` (*table*) : Clés/valeurs à écraser dans les paramètres.

#### `ai.setPath(path)`

Fixe un chemin explicite (suite de noms de waypoints à suivre dans l'ordre) pour le mode 'manual'.

- `path` (*string[]*) : Noms de waypoints consécutifs formant un chemin.

#### `ai.setPullOver(val)`

Positionne M.pullOver (demande de se ranger sur le côté, lu par la logique de circulation).

- `val` (*boolean*) : true pour se ranger.

#### `ai.setRacing(v)`

Active/désactive l'option interne racing de l'IA.

- `v` (*boolean*) : true active ; toute autre valeur = false.

#### `ai.setRecoverOnCrash(val)`

Autorise l'IA à tenter de se récupérer quand elle reste bloquée environ 5 s sans bouger malgré une cible.

- `val` (*boolean*) : true pour activer.

#### `ai.setScriptDebugMode(mode)`

Active le dessin debug du suivi de script (scriptai.debugMode = mode). Avec nil ou 'off', désactive le dessin (voir notes).

- `mode` (*string|nil*) : Mode debug de scriptai ; nil ou 'off' pour couper.

#### `ai.setSlotTrafficTarget(x, y, z, speed)`

Fournit une cible de position et vitesse pour le mode 'slotTraffic' (passe en ce mode si besoin). L'âge de la cible est remis à 0 à chaque appel.

- `x` (*number|nil*) : Position monde X (nil = 0).
- `y` (*number|nil*) : Position monde Y (nil = 0).
- `z` (*number|nil*) : Position monde Z (nil = 0).
- `speed` (*number|nil*) : Vitesse cible en m/s (min 0).

#### `ai.setSpeed(speed)`

Fixe la vitesse de route (routeSpeed) ; toute valeur non numérique la remet à nil.

- `speed` (*number|nil*) : Vitesse en m/s.

#### `ai.setSpeedMode(speedMode)`

Définit comment routeSpeed est interprétée.

- `speedMode` (*string|nil*) : 'set' (vise la vitesse), 'limit' (plafond), 'legal' (limites légales), 'off'. Toute autre valeur = nil.

#### `ai.setSpeedProfileMode(mode)`

Choisit la méthode de génération du profil de vitesse.

- `mode` (*string|nil*) : 'Back' (méthode arrière), 'ForwBack' (avant + arrière) ; autre = nil (méthode par défaut).

#### `ai.setState(newState)`

Applique un état complet (table de type M : mode, extAggression, extAvoidCars, driveInLaneFlag, debugMode, targetObjectID, etc.) en fusionnant dans M, ré-applique le mode et prévient le GE (onAiModeChange) si le mode change. Sans effet si le véhicule n'a pas de roues.

- `newState` (*table*) : État partiel ou complet.

#### `ai.setStopPoint(plan, dist, args)`

Définit le segment d'arrêt du plan : l'IA s'arrête à la distance donnée le long du plan. Sans dist, annule l'arrêt (stopSeg = math.huge).

- `plan` (*table|nil*) : Plan ; nil = plan courant.
- `dist` (*number|nil*) : Distance d'arrêt en m, nil pour annuler.
- `args` (*table|nil*) : Option avoidJunction=true : repousse le point d'arrêt de 20 m en 20 m pour ne pas s'arrêter dans une intersection.

#### `ai.setTarget(wp)`

Fixe un waypoint unique comme cible (mode 'manual') ; la validation du nom se fait au prochain pas de la boucle.

- `wp` (*string*) : Nom du waypoint de la carte routière.

#### `ai.setTargetObjectID(id)`

Choisit manuellement le véhicule cible (joueur) pour les modes flee/chase/follow. Passer -1 revient à la sélection automatique. Voir notes : la comparaison interne semble erronée.

- `id` (*integer*) : ID du véhicule cible, ou -1 pour aucun.

#### `ai.setTractionModel(model_index)`

Choisit la contrainte d'adhérence du profil de vitesse (utile seulement en profil 'Back' ou 'ForwBack').

- `model_index` (*integer*) : 1 = modèle linéaire (acc_eval_1) ; toute autre valeur = modèle elliptique (acc_eval_2, défaut).

#### `ai.setVehicleDebugMode(newMode)`

Fusionne la table donnée dans l'état M (typiquement {debugMode = '...'}), prévient aiDebugDraw et active ou coupe le dessin debug selon que debugMode vaut 'off' ou non.

- `newMode` (*table*) : Ex. {debugMode = 'route'} ; valeurs : 'off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all'.

#### `ai.spanMap(cutOffDrivability)`

Met l'IA en mode 'span' : parcourt tout le réseau routier en passant sur chaque route.

- `cutOffDrivability` (*number|nil*) : Les routes de drivability inférieure sont ignorées (nil = 0).

#### `ai.startFollowing(...)`

Fait suivre un script enregistré. Si le script (ou script.path) contient des points avec vitesse v, passe par driveUsingPath{script=...} ; sinon utilise scriptai en mode 'script'.

- `...` (*any*) : Premier argument : script (table, ou table avec champ path) ; arguments suivants transmis à scriptai.startFollowing.

#### `ai.startRecording(recordSpeed)`

Passe en mode 'script' et lance l'enregistrement d'une trajectoire via scriptai.

- `recordSpeed` (*number|nil*) : Paramètre de vitesse transmis à scriptai.startRecording (déduit du code).

#### `ai.startStopDataLog(name)`

Bascule l'enregistrement de données de conduite : au premier appel démarre, au suivant arrête et écrit un fichier CSV.

- `name` (*string|nil*) : Nom du fichier CSV.

#### `ai.stopFollowing(...)`

Alias de scriptStop : arrête le suivi de script, mode 'disabled'.

- `...` (*any*) : Transmis à scriptai.scriptStop.

#### `ai.stopRecording()`

Arrête l'enregistrement (mode repasse à 'disabled') et renvoie le script enregistré.

- **renvoie** : table Script (liste de points) renvoyé par scriptai.stopRecording.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cutOffDrivability` | number | Seuil de praticabilité (drivability) en dessous duquel les routes sont ignorées en mode 'span'. Défaut 0. |
| `debugDraw` | function | Fonction de dessin debug appelée par la boucle principale ; nop par défaut, remplacée par aiDebugDraw quand le mode debug est actif. |
| `debugMode` | string | Mode de dessin debug ('off' par défaut). |
| `driveInLaneFlag` | string | 'on' ou 'off' : rester sur la voie légale. Défaut 'off'. |
| `extAggression` | number | Agressivité demandée de l'extérieur, défaut 0.3. |
| `extAvoidCars` | string | 'on', 'off' ou 'auto' (défaut). |
| `manualTargetName` | string|nil | Nom du waypoint cible posé par setTarget (nil sinon, remis à nil par reset). |
| `mode` | string | Mode principal de l'IA (voir notes). Défaut 'disabled'. |
| `pullOver` | boolean | Demande de se ranger sur le côté (voir setPullOver). Défaut false. |
| `routeSpeed` | number|nil | Vitesse de route en m/s utilisée selon speedMode. |
| `speedMode` | string|nil | 'set', 'limit', 'legal', 'off' ou nil. |
| `updateGFX` | function | Boucle de conduite appelée à chaque pas graphique ; nop tant que l'IA est désactivée, remplacée par la fonction interne ou par scriptai.updateGFX. |

## Classe `twt`

État interne du sous-système de manœuvre de demi-tour/recul (twt) : compteurs, rayons et lisseurs. Table locale non exportée par M, listée par l'extraction automatique.

| Méthode | Description | Ligne |
|---|---|---|
| `twt.reset()` | Remet à zéro l'état twt (état, rayons minimaux, bruit bleu, vitesse cible et lisseurs). Appelée en interne. | 97 |

**Évènements UI (guihooks.trigger) :** `AIStateChange`, `AIStatusChange`

## Appels vers le moteur (C++)

- `obj:` `castRayStatic`, `getDirectionVector`, `getDirectionVectorUp`, `getDirectionVectorUpXYZ`, `getDirectionVectorXYZ`, `getFrontPosition`, `getFrontPositionXYZ`, `getGravity`, `getId`, `getInitialLength`, `getInitialWidth`, `getNodePosition`, `getObjectCenterPosition`, `getObjectCenterPositionXYZ`, `getObjectDirectionVector`, `getObjectDirectionVectorUp`, `getObjectDirectionVectorUpXYZ`, `getObjectDirectionVectorXYZ`, `getObjectFrontPositionXYZ`, `getObjectInitialHeight`, `getObjectInitialLength`, `getObjectInitialWidth`, `getOriginalFrontPositionRelative`, `getSmoothRefVelocityXYZ`, `getStaticFrictionCoef`, `getSurfaceHeightBelow`, `queueGameEngineLua`, `setAerodynamicsMode`, `setSelfCollisionMode`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/ai.lua`.*
