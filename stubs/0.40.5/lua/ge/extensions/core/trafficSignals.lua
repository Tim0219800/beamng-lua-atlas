---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/trafficSignals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_trafficSignals` (Traffic Signals V2) : simule les feux tricolores, stops et autres signaux d'un niveau. Trois types d'objets : SignalInstance (un signal placé dans le monde avec position, direction, controller et séquence), SignalController (type de signal et liste d'états avec durées : feu tricolore, stop…) et SignalSequence (phases qui enchaînent des controllers, partagées par les instances d'une intersection). Charge signals.json et signalControllerDefinitions.json du dossier du niveau, met à jour les lumières des objets TSStatic liés (champs dynamiques signalInstance, instanceColor*), publie l'état aux véhicules (mailbox 'trafficSignalUpdates') et via le hook onTrafficSignalUpdate.
--- Accès : extension `core_trafficSignals` : `extensions.load("core_trafficSignals")`, puis la globale `core_trafficSignals`
---@class core_trafficSignals
---@field debugLevel number 0 = aucun dessin debug ; 1 = dessin simple ; 2 = avec textes et flèches. Sauvegardé par onSerialize.
---@field getSignalsDict function Vaut `nop` (fonction vide) : sans effet.
---@field useDtReal boolean false par défaut ; si true, le timer avance avec le temps réel (dt) au lieu du temps de simulation (dtSim), donc même pendant une pause.
core_trafficSignals = {}

--- Renvoie le signal le plus pertinent près d'une position. Avec dirVec, favorise les signaux devant le véhicule et orientés dans le même sens (distance divisée par le plus petit des deux produits scalaires). Le résultat est mis en cache tant que le segment de route (n1, n2) ne change pas.
---Source : lua/ge/extensions/core/trafficSignals.lua:1252
---@param pos vec3 position de recherche
---@param dirVec vec3|nil direction de déplacement
---@param resetCache boolean|nil true pour oublier le résultat en cache
---@return SignalInstance|nil  meilleure instance valide ; nil si le système n'est pas lancé ou si aucune route proche
function core_trafficSignals.getBestSignal(pos, dirVec, resetCache) end

--- Renvoie un controller par son nom.
---Source : lua/ge/extensions/core/trafficSignals.lua:1216
---@param name string nom
---@return SignalController|nil  controller
function core_trafficSignals.getControllerByName(name) end

--- Renvoie les définitions de controllers (states, types, signalActions, signalColors).
---Source : lua/ge/extensions/core/trafficSignals.lua:1196
---@return table  définitions (pas une copie)
function core_trafficSignals.getControllerDefinitions() end

--- Renvoie le tableau des controllers.
---Source : lua/ge/extensions/core/trafficSignals.lua:1212
---@return SignalController[]  controllers
function core_trafficSignals.getControllers() end

--- Renvoie les données principales du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:1232
---@param full boolean|nil si true, ajoute instancesByName, controllersByName, sequencesByName, elementsById
---@return table  {instances, controllers, sequences, loaded, active, timer, nextTime (prochaine échéance de la file, 0 si vide)} (+ tables par nom/id si full)
function core_trafficSignals.getData(full) end

--- Renvoie un élément (instance, controller ou séquence) d'après son id unique.
---Source : lua/ge/extensions/core/trafficSignals.lua:47
---@param id integer|nil identifiant unique
---@return SignalInstance|SignalController|SignalSequence|nil  élément
function core_trafficSignals.getElementById(id) end

--- Renvoie la table qui relie les noeuds de la carte routière aux signaux : [n1][n2] = liste de {instance, pos, useLane, state, action}.
---Source : lua/ge/extensions/core/trafficSignals.lua:1204
---@return table  table de références (envoyée aux véhicules)
function core_trafficSignals.getMapNodeSignals() end

--- Renvoie une séquence par son nom.
---Source : lua/ge/extensions/core/trafficSignals.lua:1224
---@param name string nom
---@return SignalSequence|nil  séquence
function core_trafficSignals.getSequenceByName(name) end

--- Renvoie le tableau des séquences.
---Source : lua/ge/extensions/core/trafficSignals.lua:1220
---@return SignalSequence[]  séquences
function core_trafficSignals.getSequences() end

--- Renvoie une instance par son nom.
---Source : lua/ge/extensions/core/trafficSignals.lua:1208
---@param name string nom de l'instance
---@return SignalInstance|nil  instance
function core_trafficSignals.getSignalByName(name) end

--- Renvoie le tableau des instances de signaux.
---Source : lua/ge/extensions/core/trafficSignals.lua:1200
---@return SignalInstance[]  instances
function core_trafficSignals.getSignals() end

--- Renvoie le temps écoulé du système (s) ; -1 tant qu'il n'a jamais été lancé.
---Source : lua/ge/extensions/core/trafficSignals.lua:1228
---@return number  timer
function core_trafficSignals.getTimer() end

--- Recharge les définitions par défaut puis applique celles du niveau (signalControllerDefinitions.json dans le dossier du niveau, ou filePath).
---Source : lua/ge/extensions/core/trafficSignals.lua:1459
---@param filePath string|nil fichier de définitions ; défaut = <dossier du niveau>/signalControllerDefinitions.json
function core_trafficSignals.loadControllerDefinitions(filePath) end

--- Charge un fichier de signaux JSON (instances, controllers, sequences) et l'installe avec setupSignals. Charge aussi les définitions de controllers du niveau.
---Source : lua/ge/extensions/core/trafficSignals.lua:1476
---@param filePath string|nil fichier ; défaut = <dossier du niveau>/signals.json
---@param autoRun boolean|nil false si le graphe de routes n'est pas encore chargé (cas du chargement de niveau)
---@return boolean  true si le fichier a été lu
function core_trafficSignals.loadSignals(filePath, autoRun) end

--- Crée un SignalController (non inclus tant que :include() n'est pas appelé).
---Source : lua/ge/extensions/core/trafficSignals.lua:1181
---@param data table|nil {id?, name?, type?, isSimple?, defaultIndex?, states?}
---@return SignalController  nouveau controller
function core_trafficSignals.newController(data) end

--- Crée une SignalSequence (non incluse tant que :include() n'est pas appelé).
---Source : lua/ge/extensions/core/trafficSignals.lua:1185
---@param data table|nil {id?, name?, startTime?, phases?, startDisabled?, ignoreTimer?}
---@return SignalSequence  nouvelle séquence
function core_trafficSignals.newSequence(data) end

--- Crée une SignalInstance (non incluse dans le système tant que :include() n'est pas appelé). Sans pos : position de la caméra au sol ; sans dir : direction de la route la plus proche, sinon de la caméra.
---Source : lua/ge/extensions/core/trafficSignals.lua:1177
---@param data table|nil {id?, name?, pos?, dir?, group?, controllerId?, sequenceId?, useCurrentLane?, startDisabled?}
---@return SignalInstance  nouvelle instance
function core_trafficSignals.newSignal(data) end

--- Hook : le niveau se termine ; supprime les signaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1631
function core_trafficSignals.onClientEndMission() end

--- Hook : un niveau démarre ; charge signals.json du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1627
function core_trafficSignals.onClientStartMission() end

--- Hook : recrée et inclut les éléments sérialisés, recharge les définitions et recalcule le compteur d'ids.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1653
---@param data table données de onSerialize
function core_trafficSignals.onDeserialized(data) end

--- Hook : le graphe de routes est (re)chargé. Si le système est actif, lance runSignals (calcule durées, routes, timer, table mapNodeSignals).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1615
function core_trafficSignals.onNavgraphReloaded() end

--- Hook : sérialise instances, controllers, séquences, active, loaded, useDtReal, debugLevel avant un rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1635
---@return table  données
function core_trafficSignals.onSerialize() end

--- Hook appelé à chaque frame : fait clignoter les états à lumières clignotantes, avance le timer, dépile la file pour faire avancer les séquences, applique les changements d'état en attente (lumières, mailbox, hook onTrafficSignalUpdate) et dessine le debug si debugLevel > 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1516
---@param dt number temps réel (s)
---@param dtSim number temps de simulation (s)
function core_trafficSignals.onUpdate(dt, dtSim) end

--- Recharge les définitions par défaut (settings/trafficSignals.json : états et types) et ajoute signalActions (alert=1, stop=2, briefStop=3, yield=4, slow=5) et signalColors.
---Source : lua/ge/extensions/core/trafficSignals.lua:66
function core_trafficSignals.resetControllerDefinitions() end

--- Supprime tous les signaux, controllers et séquences (setupSignals sans argument).
---Source : lua/ge/extensions/core/trafficSignals.lua:1455
function core_trafficSignals.resetSignals() end

--- Met le timer à 0, vide la file, (ré)active les séquences et instances valides puis émet onTrafficSignalsReset.
---Source : lua/ge/extensions/core/trafficSignals.lua:1287
function core_trafficSignals.resetTimer() end

--- Active ou met en pause le système. Avec autoRun=true et système non chargé, lance runSignals immédiatement ; sinon attend onNavgraphReloaded.
---Source : lua/ge/extensions/core/trafficSignals.lua:1357
---@param val boolean état actif
---@param autoRun boolean|nil true : lancer tout de suite (graphe de routes déjà prêt)
function core_trafficSignals.setActive(val, autoRun) end

--- Fusionne des états et types personnalisés dans les définitions de controllers (tableMerge).
---Source : lua/ge/extensions/core/trafficSignals.lua:1189
---@param data table {states = {...}, types = {...}}
function core_trafficSignals.setControllerDefinitions(data) end

--- Allume ou éteint directement les 3 lumières d'un objet signal (champs instanceColor, instanceColor1, instanceColor2) sans changer l'état logique.
---Source : lua/ge/extensions/core/trafficSignals.lua:1376
---@param id integer identifiant de l'objet scène (TSStatic)
---@param stateArray boolean[]|nil état de chaque lumière ; défaut {false,false,false}
function core_trafficSignals.setLightsManual(id, stateArray) end

--- Fixe directement le timer (peut changer instantanément les états). Voir le bug dans les notes si val est nil.
---Source : lua/ge/extensions/core/trafficSignals.lua:1309
---@param val number nouvelle valeur du timer (s)
function core_trafficSignals.setTimer(val) end

--- Met en cache les objets TSStatic de la scène qui possèdent un champ dynamique `signalInstance` (nom d'instance), indexés par nom d'instance.
---Source : lua/ge/extensions/core/trafficSignals.lua:51
function core_trafficSignals.setupSignalObjects() end

--- Installe un jeu de signaux (et efface les index précédents). Sans data, vide tout. Avec data, remplace (ou fusionne si merge) instances, controllers et séquences, retire les doublons d'id puis appelle setActive(true, autoRun).
---Source : lua/ge/extensions/core/trafficSignals.lua:1387
---@param data table|nil {instances, controllers, sequences} d'objets SignalInstance/Controller/Sequence
---@param merge boolean|nil true : ajoute aux éléments existants
---@param autoRun boolean|nil true : lancer immédiatement le système
function core_trafficSignals.setupSignals(data, merge, autoRun) end

--- Type de signal avec sa liste d'états ordonnés ({state, duration}) : feu tricolore, stop, etc. Champs : id, name, type, isSimple (durées ignorées), defaultIndex (état par défaut), totalDuration, states. Réutilisable par plusieurs séquences.
---@class core_trafficSignals_SignalController
local core_trafficSignals_SignalController = {}

--- Applique un type de signal des définitions (copie isSimple, defaultIndex et les états avec leurs durées).
---Source : lua/ge/extensions/core/trafficSignals.lua:695
---@param key string|nil clé du type dans controllerDefinitions.types ; défaut 'none'
function core_trafficSignals_SignalController:applyDefinition(key) end

--- Règle automatiquement les durées : vert = 0.7*vitesse + 0.6*longueur d'intersection (borné 10..40 s), jaune = 1 + (vitesse - 4.167)/3.27 (borné 3..7 s), rouge = 1 s.
---Source : lua/ge/extensions/core/trafficSignals.lua:740
---@param speedMetresPerSecond number vitesse de la route (m/s)
---@param intersectionLength number longueur de l'intersection (m)
---@param isPermissive boolean|nil non utilisé dans le code
function core_trafficSignals_SignalController:autoSetTimings(speedMetresPerSecond, intersectionLength, isPermissive) end

--- Calcule la durée totale des états (math.huge si une durée est absente ou négative ; 0 si isSimple).
---Source : lua/ge/extensions/core/trafficSignals.lua:723
---@return number  durée totale (s)
function core_trafficSignals_SignalController:calcDuration() end

--- Retire le controller des données du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:763
function core_trafficSignals_SignalController:exclude() end

--- Données d'un état dans les définitions (lights, action, flashingLights…).
---Source : lua/ge/extensions/core/trafficSignals.lua:719
---@param state string nom de l'état
---@return table|nil  données
function core_trafficSignals_SignalController:getStateData(state) end

--- Ajoute le controller aux données du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:755
function core_trafficSignals_SignalController:include() end

--- Constructeur (voir newController).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:679
---@param data table|nil {id?, name?, type?, isSimple?, defaultIndex?, states?}
---@return SignalController  controller
function core_trafficSignals_SignalController:new(data) end

--- Restaure les champs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:795
---@param data table|nil données
function core_trafficSignals_SignalController:onDeserialized(data) end

--- Données à sauvegarder (les durées négatives sont ramenées à -1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:776
---@return table  données
function core_trafficSignals_SignalController:onSerialize() end

--- Un signal placé dans le monde (feu, panneau). Champs : id, name, pos (vec3), dir (vec3), group, controllerId, sequenceId, startDisabled, active, road ({n1, n2, dist, pos, dir, radius}), linkedObjects (ids d'objets TSStatic liés), priorityStateIndex (état imposé qui prime sur la séquence), targetPos/intersectionId (centre de l'intersection), _invalid (signal inutilisable : pas de route ou de controller). Créé par newSignal.
---@class core_trafficSignals_SignalInstance
local core_trafficSignals_SignalInstance = {}

--- Calcule le centre de l'intersection en moyennant les signaux de même séquence situés à moins de 40 m devant ce signal (au moins 2) et renseigne targetPos/intersectionId pour tous. Nécessite le système actif.
---Source : lua/ge/extensions/core/trafficSignals.lua:346
function core_trafficSignals_SignalInstance:calcIntersectionPos() end

--- Délie les objets liés (efface leur champ signalInstance) ou les supprime.
---Source : lua/ge/extensions/core/trafficSignals.lua:182
---@param alsoDelete boolean|nil true : supprime les objets
function core_trafficSignals_SignalInstance:clearSignalObjects(alsoDelete) end

--- Crée un TSStatic (shape de feu, par défaut art/shapes/objects/trafficlight_overhead1.dae, cherchée dans le niveau puis dans art/shapes/), le place, le lie au signal et le range dans le groupe AutoTrafficSignals.
---Source : lua/ge/extensions/core/trafficSignals.lua:207
---@param shapeFile string|nil fichier .dae ou fragment de nom
---@param pos vec3|nil position ; défaut caméra
---@param rot quat|nil rotation ; défaut caméra
---@return userdata|nil  objet créé ; nil si la shape est introuvable
function core_trafficSignals_SignalInstance:createSignalObject(shapeFile, pos, rot) end

--- Dessine cylindre, flèche et texte de debug du signal.
---Source : lua/ge/extensions/core/trafficSignals.lua:385
---@param isEditMode boolean mode éditeur
---@param isSelected boolean sélectionné
---@param showText boolean afficher les textes
---@param capColor ColorF|nil couleur du chapeau
---@param cylinderScl number|nil hauteur du cylindre, défaut 5
---@param arrowScl number|nil échelle de la flèche, défaut 2
function core_trafficSignals_SignalInstance:drawDebug(isEditMode, isSelected, showText, capColor, cylinderScl, arrowScl) end

--- Retire l'instance des données du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:640
function core_trafficSignals_SignalInstance:exclude() end

--- Trouve la route la plus proche d'une position et renvoie le segment orienté dans le sens du signal (route à sens unique : sens de la route).
---Source : lua/ge/extensions/core/trafficSignals.lua:286
---@param pos vec3|nil position ; défaut self.pos
---@param dir vec3|nil direction ; défaut self.dir
---@return table|nil  {n1, n2, dist, pos, dir, radius} ou nil si aucune route
function core_trafficSignals_SignalInstance:getBestRoad(pos, dir) end

--- Controller associé (via controllerId).
---Source : lua/ge/extensions/core/trafficSignals.lua:463
---@return SignalController|nil  controller
function core_trafficSignals_SignalInstance:getController() end

--- Séquence associée (via sequenceId).
---Source : lua/ge/extensions/core/trafficSignals.lua:467
---@return SignalSequence|nil  séquence
function core_trafficSignals_SignalInstance:getSequence() end

--- Ids des objets TSStatic liés à ce signal (champ signalInstance = nom).
---Source : lua/ge/extensions/core/trafficSignals.lua:177
---@param refresh boolean|nil true : relit la scène
---@return integer[]  ids
function core_trafficSignals_SignalInstance:getSignalObjects(refresh) end

--- État courant (getStateAfterTime(0)).
---Source : lua/ge/extensions/core/trafficSignals.lua:528
---@return string  nom de l'état
---@return table  données de l'état
function core_trafficSignals_SignalInstance:getState() end

--- État du signal après `seconds` secondes (système actif requis) en simulant la séquence.
---Source : lua/ge/extensions/core/trafficSignals.lua:471
---@param seconds number|nil délai (s), défaut 0
---@param isAbsolute boolean|nil true : compté depuis le début de la séquence au lieu de maintenant
---@return string  nom de l'état ('none' si inactif)
---@return table  données de l'état (lights, action…)
function core_trafficSignals_SignalInstance:getStateAfterTime(seconds, isAbsolute) end

--- Position d'un véhicule par rapport au signal.
---Source : lua/ge/extensions/core/trafficSignals.lua:324
---@param vehId integer véhicule connu de map.objects
---@return table|nil  {dot (alignement des directions), dist (m), relDist (négatif avant le signal)}
function core_trafficSignals_SignalInstance:getVehPlacement(vehId) end

--- Ajoute l'instance (et son controller/sa séquence internes éventuels) aux données du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:624
function core_trafficSignals_SignalInstance:include() end

--- Vrai si le véhicule a franchi le point du signal dans le bon sens et à moins de maxDist.
---Source : lua/ge/extensions/core/trafficSignals.lua:335
---@param vehId integer véhicule
---@param maxDist number|nil distance max (m), défaut 20
---@param minDot number|nil produit scalaire min des directions, défaut 0.707
---@return boolean  valide
---@return table|nil  données de getVehPlacement
function core_trafficSignals_SignalInstance:isVehAfterSignal(vehId, maxDist, minDot) end

--- Lie un objet scène à ce signal (champ dynamique signalInstance = nom).
---Source : lua/ge/extensions/core/trafficSignals.lua:195
---@param objId integer id de l'objet
function core_trafficSignals_SignalInstance:linkSignalObject(objId) end

--- Constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:114
---@param data table|nil voir newSignal
---@return SignalInstance  instance
function core_trafficSignals_SignalInstance:new(data) end

--- Restaure les champs à partir de data (pos/dir reconverties en vec3).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:669
---@param data table|nil données
function core_trafficSignals_SignalInstance:onDeserialized(data) end

--- Données à sauvegarder (id, name, pos, dir, group, controllerId, sequenceId, useCurrentLane, startDisabled).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:653
---@return table  données
function core_trafficSignals_SignalInstance:onSerialize() end

--- Réactualise ce signal ainsi que sa séquence (réactive, rétablit l'étape courante).
---Source : lua/ge/extensions/core/trafficSignals.lua:532
function core_trafficSignals_SignalInstance:refresh() end

--- Active ou désactive le signal ; à l'activation, met l'état attendu (séquence, sinon état par défaut du controller) en file d'envoi.
---Source : lua/ge/extensions/core/trafficSignals.lua:556
---@param val boolean actif
function core_trafficSignals_SignalInstance:setActive(val) end

--- Cherche la route, vérifie la présence du controller et recense les objets liés ; marque le signal _invalid en cas de problème (log d'erreur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:597
function core_trafficSignals_SignalInstance:setAuxiliaryData() end

--- Change le controller et rafraîchit si le système est actif.
---Source : lua/ge/extensions/core/trafficSignals.lua:546
---@param id integer|nil id du controller
function core_trafficSignals_SignalInstance:setController(id) end

--- Allume/éteint directement les lumières de tous les objets liés (sans changer l'état logique). Surtout interne.
---Source : lua/ge/extensions/core/trafficSignals.lua:146
---@param lightsArray string[]|nil couleurs ; 'black' = éteint, toute autre valeur = allumé ; défaut tout éteint
function core_trafficSignals_SignalInstance:setLights(lightsArray) end

--- Change la séquence et rafraîchit si le système est actif.
---Source : lua/ge/extensions/core/trafficSignals.lua:551
---@param id integer|nil id de la séquence
function core_trafficSignals_SignalInstance:setSequence(id) end

--- Impose l'état de ce signal d'après l'indice dans la liste d'états du controller (prime sur la séquence ; désactiver le timer de la séquence avant). Sans stateIdx valide (nil ou <= 0), le signal retrouve son état normal.
---Source : lua/ge/extensions/core/trafficSignals.lua:161
---@param stateIdx integer|nil indice (base 1) dans controller.states
function core_trafficSignals_SignalInstance:setStrictState(stateIdx) end

--- Configuration alternative : fixe pos/dir, cherche la route, et crée un controller ('lightsBasic') et/ou une séquence si les ids donnés sont absents ou invalides.
---Source : lua/ge/extensions/core/trafficSignals.lua:266
---@param pos vec3|nil position
---@param dir vec3|nil direction
---@param controllerId integer|nil id de controller existant
---@param sequenceId integer|nil id de séquence existante
function core_trafficSignals_SignalInstance:setup(pos, dir, controllerId, sequenceId) end

--- Délie un objet scène de ce signal.
---Source : lua/ge/extensions/core/trafficSignals.lua:201
---@param objId integer id de l'objet
function core_trafficSignals_SignalInstance:unlinkSignalObject(objId) end

--- Enchaîne des phases ({controllerIds, startTime?, totalDuration}) pour piloter les controllers d'une intersection. Champs : id, name, startTime, totalDuration, phases, timeline ([temps] = liste {nomController, indexPhase, indexEtat}), timelineTimes (temps triés), controllerStates, currStep, currPhase, stateTime, startDisabled, ignoreTimer.
---@class core_trafficSignals_SignalSequence
local core_trafficSignals_SignalSequence = {}

--- Passe à l'étape suivante (boucle au début). Appelé par la file du module quand l'échéance est atteinte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1012
function core_trafficSignals_SignalSequence:advance() end

--- Calcule la durée de chaque phase (plus longue durée de ses controllers) et de la séquence (somme, ou max de startTime + durée si startTime est donné).
---Source : lua/ge/extensions/core/trafficSignals.lua:840
---@param controllersRef table|nil table [id] = controller à utiliser à la place de elementsById (éditeur)
---@return number  durée totale (s)
function core_trafficSignals_SignalSequence:calcDuration(controllersRef) end

--- Ajoute une phase (à la fin ou à l'indice idx).
---Source : lua/ge/extensions/core/trafficSignals.lua:822
---@param phase table|nil {controllerIds, startTime?}
---@param idx integer|nil position d'insertion
function core_trafficSignals_SignalSequence:createPhase(phase, idx) end

--- Supprime une phase.
---Source : lua/ge/extensions/core/trafficSignals.lua:833
---@param idx integer|nil indice ; défaut dernière phase
function core_trafficSignals_SignalSequence:deletePhase(idx) end

--- Indique si la séquence suit le timer principal ; false la fige (utile avec setStep/setPhase/setStrictState).
---Source : lua/ge/extensions/core/trafficSignals.lua:1125
---@param val boolean true : suit le timer
function core_trafficSignals_SignalSequence:enableTimer(val) end

--- Retire la séquence des données du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:1143
function core_trafficSignals_SignalSequence:exclude() end

--- Ajoute la séquence aux données du module.
---Source : lua/ge/extensions/core/trafficSignals.lua:1135
function core_trafficSignals_SignalSequence:include() end

--- Constructeur (voir newSequence).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:803
---@param data table|nil {id?, name?, startTime?, phases?, startDisabled?, ignoreTimer?}
---@return SignalSequence  séquence
function core_trafficSignals_SignalSequence:new(data) end

--- Restaure les champs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1169
---@param data table|nil données
function core_trafficSignals_SignalSequence:onDeserialized(data) end

--- Interne : traite l'étape courante et planifie la suivante dans la file.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:899
function core_trafficSignals_SignalSequence:onSequenceUpdate() end

--- Données à sauvegarder (id, name, phases, startTime, startDisabled, ignoreTimer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:1156
---@return table  données
function core_trafficSignals_SignalSequence:onSerialize() end

--- Remet la séquence au début (états par défaut des controllers) et planifie la première échéance.
---Source : lua/ge/extensions/core/trafficSignals.lua:933
function core_trafficSignals_SignalSequence:resetSequence() end

--- Pousse l'état des controllers modifiés vers les instances actives en file d'envoi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/trafficSignals.lua:884
---@param forceUpdate boolean|nil true : tout pousser
function core_trafficSignals_SignalSequence:resolveUpdates(forceUpdate) end

--- Active la séquence (construit timeline et controllerStates, puis resetSequence ; ignorée avec un avertissement si durée nulle) ou la désactive (instances mises à l'état 'none').
---Source : lua/ge/extensions/core/trafficSignals.lua:1039
---@param val boolean actif
function core_trafficSignals_SignalSequence:setActive(val) end

--- Saute à la première étape de la phase donnée.
---Source : lua/ge/extensions/core/trafficSignals.lua:978
---@param index integer|nil phase, base 1 ; défaut 1
function core_trafficSignals_SignalSequence:setPhase(index) end

--- Saute à l'étape d'indice donné de la timeline (si elle existe).
---Source : lua/ge/extensions/core/trafficSignals.lua:952
---@param index integer|nil étape, base 1 ; défaut 1
function core_trafficSignals_SignalSequence:setStep(index) end

--- Impose l'état d'un controller de la séquence pour toutes ses instances (lumières et état). Désactiver le timer avant (enableTimer(false)).
---Source : lua/ge/extensions/core/trafficSignals.lua:1022
---@param ctrlName string nom du controller
---@param stateIdx integer|nil indice d'état (base 1) ; défaut état courant
function core_trafficSignals_SignalSequence:setStrictState(ctrlName, stateIdx) end

