---@meta
-- tim19Atlas stub generated from lua/vehicle/ai.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Intelligence artificielle de conduite d'un véhicule (VM véhicule, globale `ai`). Elle conduit le véhicule le long d'un graphe routier (mapmgr) ou d'un script de trajectoire, en agissant sur throttle/brake/steering via electrics. Un moddeur s'en sert pour piloter le véhicule : choisir un mode (ai.setMode), une cible (setTarget, driveUsingPath), une vitesse (setSpeed + setSpeedMode), un niveau d'agressivité. L'état public (mode, debugMode, speedMode, routeSpeed, extAggression, extAvoidCars, driveInLaneFlag, cutOffDrivability, manualTargetName, pullOver) est la table M elle-même, renvoyée par getState() et envoyée à l'UI via guihooks AIStateChange. La boucle de conduite M.updateGFX n'est active que lorsque le mode n'est pas 'disabled'.
--- Accès : globale `ai`
---@class ai
---@field cutOffDrivability number Seuil de praticabilité (drivability) en dessous duquel les routes sont ignorées en mode 'span'. Défaut 0.
---@field debugDraw function Fonction de dessin debug appelée par la boucle principale ; nop par défaut, remplacée par aiDebugDraw quand le mode debug est actif.
---@field debugMode string Mode de dessin debug ('off' par défaut).
---@field driveInLaneFlag string 'on' ou 'off' : rester sur la voie légale. Défaut 'off'.
---@field extAggression number Agressivité demandée de l'extérieur, défaut 0.3.
---@field extAvoidCars string 'on', 'off' ou 'auto' (défaut).
---@field manualTargetName string|nil Nom du waypoint cible posé par setTarget (nil sinon, remis à nil par reset).
---@field mode string Mode principal de l'IA (voir notes). Défaut 'disabled'.
---@field pullOver boolean Demande de se ranger sur le côté (voir setPullOver). Défaut false.
---@field routeSpeed number|nil Vitesse de route en m/s utilisée selon speedMode.
---@field speedMode string|nil 'set', 'limit', 'legal', 'off' ou nil.
---@field updateGFX function Boucle de conduite appelée à chaque pas graphique ; nop tant que l'IA est désactivée, remplacée par la fonction interne ou par scriptai.updateGFX.
ai = {}

--- Active ou non la conduite sur le côté légal de la route (affecte aussi la recherche de chemin).
---Source : lua/vehicle/ai.lua:5785
---@param v string 'on' pour activer ; toute autre valeur désactive.
function ai.driveInLane(v) end

--- Interface principale pour faire suivre un parcours : met l'IA en mode 'manual' et configure chemin, vitesses, tours, conduite sur voie, agressivité et évitement. Il faut au moins path, wpTargetList ou script ; tout argument de mauvais type fait ignorer silencieusement l'appel. Avec script, la voiture est d'abord téléportée au point de départ du script.
---Source : lua/vehicle/ai.lua:5950
---@param arg table Table d'options : path (string[], chemin de waypoints), wpTargetList (string[], cibles successives reliées par plus court chemin), script (table de {x,y,z,[r],[vl],[v],[dir],[up]} : r largeur, vl limite de vitesse, v vitesse imposée en ce point en m/s), wpSpeeds (table nom_waypoint -> vitesse m/s), noOfLaps (number, tours si boucle, défaut 1), routeSpeed (number m/s), routeSpeedMode ('limit' ou 'set'), driveInLane ('on', sinon inactif), aggression (0.3 à 1, défaut 0.3), avoidCars ('on'/'off', défaut 'off'), et réglages fins repris dans setParameters : driveStyle, staticFrictionCoefMult, lookAheadKv (min 0.1), understeerThrottleControl, oversteerThrottleControl, throttleTcs, abBrakeControl, underSteerBrakeControl, throttleKp, targetSpeedSmootherRate, turnForceCoef, springForceIntegratorDispLim.
function ai.driveUsingPath(arg) end

--- Affiche (dump) la route courante dans la console, pour debug.
---Source : lua/vehicle/ai.lua:6149
function ai.dumpCurrentRoute() end

--- Affiche (dump) les paramètres et l'agressivité interne dans la console.
---Source : lua/vehicle/ai.lua:359
function ai.dumpParameters() end

--- Renvoie la configuration de voies d'une arête dans le sens fromNode -> toNode, sous forme de chaîne de '+' (voie dans le sens de parcours) et '-' (sens opposé). Si l'arête n'a pas de données de voies, elles sont déduites des rayons des nœuds (3.61 m par voie ; sens selon mapmgr.rules.rightHandDrive).
---Source : lua/vehicle/ai.lua:1155
---@param fromNode string Nom du nœud de départ.
---@param toNode string Nom du nœud d'arrivée.
---@return string  Ex. '--++' ; erreur Lua si l'arête n'existe pas dans le graphe.
function ai.getEdgeLaneConfig(fromNode, toNode) end

--- Renvoie la table des paramètres courants (référence directe, non copiée).
---Source : lua/vehicle/ai.lua:6153
---@return table  Paramètres de l'IA.
function ai.getParameters() end

--- Renvoie la table d'état publique M (référence directe).
---Source : lua/vehicle/ai.lua:253
---@return table  M.
function ai.getState() end

--- Indique si la boucle de conduite (ou scriptai) est active.
---Source : lua/vehicle/ai.lua:6211
---@return boolean  true si l'IA est en train de conduire.
function ai.isDriving() end

--- Décale latéralement les nœuds du plan courant pour changer de voie, progressivement sur une distance donnée, en respectant la largeur de route.
---Source : lua/vehicle/ai.lua:1068
---@param plan table|nil Plan à modifier ; nil = plan de la route courante (sans effet s'il n'y en a pas).
---@param dist number Distance (m) sur laquelle le déport est appliqué.
---@param signedDisp number Déport latéral en m, signé (le signe donne le côté).
function ai.laneChange(plan, dist, signedDisp) end

--- Hook appelé par le système de sérialisation du véhicule après rechargement (Ctrl+R) : restaure l'état via setState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/ai.lua:6144
---@param v table État sauvegardé (même format que M).
function ai.onDeserialized(v) end

--- Appelée au reset du véhicule (touche I) : efface la cible manuelle, remet à zéro les états internes (trafic, crash, klaxon), lissages, et ré-applique le mode courant sans le changer. Arrête l'enregistrement de données si actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/ai.lua:5898
function ai.reset() end

--- Restaure le mode de boîte mémorisé par saveGearboxMode via controller.mainController.setGearboxMode.
---Source : lua/vehicle/ai.lua:158
function ai.restoreSavedGearboxMode() end

--- Calcule, parmi les arêtes sortant de wp2, celle qui prolonge le plus naturellement l'arête wp1->wp2 (direction et flux de voies).
---Source : lua/vehicle/ai.lua:1178
---@param wp1 string Nœud précédent.
---@param wp2 string Nœud courant.
---@return any  Nœud suivant retenu (déduit du code ; non relu en entier).
function ai.roadNaturalContinuation(wp1, wp2) end

--- Mémorise le mode de boîte actuel (electrics.values.gearboxMode) pour le restaurer plus tard ; sans effet s'il est déjà mémorisé. Pour debug.
---Source : lua/vehicle/ai.lua:154
function ai.saveGearboxMode() end

--- Renvoie l'état du script en cours selon scriptai.scriptState.
---Source : lua/vehicle/ai.lua:6194
---@return any  État renvoyé par scriptai.scriptState.
function ai.scriptState() end

--- Arrête la lecture de script : mode 'disabled' puis scriptai.scriptStop.
---Source : lua/vehicle/ai.lua:6187
---@param ... any Transmis à scriptai.scriptStop.
function ai.scriptStop(...) end

--- Définit l'agressivité de conduite (M.extAggression) et l'applique immédiatement, puis notifie l'UI. nil conserve la valeur actuelle.
---Source : lua/vehicle/ai.lua:284
---@param v number|nil Environ 0.3 (normal) à 1 (limite d'adhérence).
function ai.setAggression(v) end

--- Active ou non le mode d'agressivité adaptatif.
---Source : lua/vehicle/ai.lua:290
---@param aggrmode string|nil 'rubberBand' pour l'élastique (utilisé automatiquement en flee/chase/follow) ; toute autre valeur le désactive et ré-applique l'agressivité externe.
function ai.setAggressionMode(aggrmode) end

--- Active/désactive l'évitement des autres véhicules.
---Source : lua/vehicle/ai.lua:5775
---@param v string 'on' ou 'off' (forcé) ; toute autre valeur (ex. 'auto') : retombe sur 'off' en modes manual/slotTraffic, 'on' sinon.
function ai.setAvoidCars(v) end

--- Change seulement le seuil de praticabilité (cutOffDrivability) sans changer de mode.
---Source : lua/vehicle/ai.lua:6139
---@param drivability number|nil Seuil (nil = 0).
function ai.setCutOffDrivability(drivability) end

--- Autorise la physique simplifiée (collision propre et aérodynamique mode 2) pour les véhicules du trafic. Appliqué au prochain setMode('traffic').
---Source : lua/vehicle/ai.lua:2040
---@param v boolean true active ; autre = false.
function ai.setEnableFastPhysicsforTraffic(v) end

--- Change le mode principal de l'IA et (ré)initialise la route, la carte routière (mapmgr.requestMap sauf slotTraffic) et le lissage de vitesse. Sans effet si le véhicule n'a pas de roues. Avec mode=nil, ré-applique simplement le mode courant. En 'disabled' coupe les commandes et la boucle updateGFX.
---Source : lua/vehicle/ai.lua:5806
---@param mode string|nil 'disabled', 'manual', 'random', 'span', 'traffic', 'slotTraffic', 'flee', 'chase', 'follow', 'stop', 'script' ; nil pour conserver le mode courant.
function ai.setMode(mode) end

--- Fusionne (tableMerge) des réglages fins dans la table de paramètres de l'IA. Clés connues et défauts : turnForceCoef 2, awarenessForceCoef 0.25, edgeDist 0, trafficWaitTime 2, enableElectrics true, driveStyle 'default', staticFrictionCoefMult 0.95, lookAheadKv 0.6, minStTargetDist 4.5, applyWidthMarginOffset true, planErrorSmoothing true, springForceIntegratorDispLim 0.1, understeerThrottleControl/oversteerThrottleControl/throttleTcs 'on' (autre que 'off' = actif), abBrakeControl 'on', underSteerBrakeControl 'on', throttleKp 0.5, targetSpeedSmootherRate 10, str 1, stt 0.5.
---Source : lua/vehicle/ai.lua:355
---@param data table Clés/valeurs à écraser dans les paramètres.
function ai.setParameters(data) end

--- Fixe un chemin explicite (suite de noms de waypoints à suivre dans l'ordre) pour le mode 'manual'.
---Source : lua/vehicle/ai.lua:5945
---@param path string[] Noms de waypoints consécutifs formant un chemin.
function ai.setPath(path) end

--- Positionne M.pullOver (demande de se ranger sur le côté, lu par la logique de circulation).
---Source : lua/vehicle/ai.lua:4285
---@param val boolean true pour se ranger.
function ai.setPullOver(val) end

--- Active/désactive l'option interne racing de l'IA.
---Source : lua/vehicle/ai.lua:2031
---@param v boolean true active ; toute autre valeur = false.
function ai.setRacing(v) end

--- Autorise l'IA à tenter de se récupérer quand elle reste bloquée environ 5 s sans bouger malgré une cible.
---Source : lua/vehicle/ai.lua:5884
---@param val boolean true pour activer.
function ai.setRecoverOnCrash(val) end

--- Active le dessin debug du suivi de script (scriptai.debugMode = mode). Avec nil ou 'off', désactive le dessin (voir notes).
---Source : lua/vehicle/ai.lua:6199
---@param mode string|nil Mode debug de scriptai ; nil ou 'off' pour couper.
function ai.setScriptDebugMode(mode) end

--- Fournit une cible de position et vitesse pour le mode 'slotTraffic' (passe en ce mode si besoin). L'âge de la cible est remis à 0 à chaque appel.
---Source : lua/vehicle/ai.lua:5877
---@param x number|nil Position monde X (nil = 0).
---@param y number|nil Position monde Y (nil = 0).
---@param z number|nil Position monde Z (nil = 0).
---@param speed number|nil Vitesse cible en m/s (min 0).
function ai.setSlotTrafficTarget(x, y, z, speed) end

--- Fixe la vitesse de route (routeSpeed) ; toute valeur non numérique la remet à nil.
---Source : lua/vehicle/ai.lua:263
---@param speed number|nil Vitesse en m/s.
function ai.setSpeed(speed) end

--- Définit comment routeSpeed est interprétée.
---Source : lua/vehicle/ai.lua:267
---@param speedMode string|nil 'set' (vise la vitesse), 'limit' (plafond), 'legal' (limites légales), 'off'. Toute autre valeur = nil.
function ai.setSpeedMode(speedMode) end

--- Choisit la méthode de génération du profil de vitesse.
---Source : lua/vehicle/ai.lua:1913
---@param mode string|nil 'Back' (méthode arrière), 'ForwBack' (avant + arrière) ; autre = nil (méthode par défaut).
function ai.setSpeedProfileMode(mode) end

--- Applique un état complet (table de type M : mode, extAggression, extAvoidCars, driveInLaneFlag, debugMode, targetObjectID, etc.) en fusionnant dans M, ré-applique le mode et prévient le GE (onAiModeChange) si le mode change. Sans effet si le véhicule n'a pas de roues.
---Source : lua/vehicle/ai.lua:5917
---@param newState table État partiel ou complet.
function ai.setState(newState) end

--- Définit le segment d'arrêt du plan : l'IA s'arrête à la distance donnée le long du plan. Sans dist, annule l'arrêt (stopSeg = math.huge).
---Source : lua/vehicle/ai.lua:1096
---@param plan table|nil Plan ; nil = plan courant.
---@param dist number|nil Distance d'arrêt en m, nil pour annuler.
---@param args table|nil Option avoidJunction=true : repousse le point d'arrêt de 20 m en 20 m pour ne pas s'arrêter dans une intersection.
function ai.setStopPoint(plan, dist, args) end

--- Fixe un waypoint unique comme cible (mode 'manual') ; la validation du nom se fait au prochain pas de la boucle.
---Source : lua/vehicle/ai.lua:5939
---@param wp string Nom du waypoint de la carte routière.
function ai.setTarget(wp) end

--- Choisit manuellement le véhicule cible (joueur) pour les modes flee/chase/follow. Passer -1 revient à la sélection automatique. Voir notes : la comparaison interne semble erronée.
---Source : lua/vehicle/ai.lua:365
---@param id integer ID du véhicule cible, ou -1 pour aucun.
function ai.setTargetObjectID(id) end

--- Choisit la contrainte d'adhérence du profil de vitesse (utile seulement en profil 'Back' ou 'ForwBack').
---Source : lua/vehicle/ai.lua:1944
---@param model_index integer 1 = modèle linéaire (acc_eval_1) ; toute autre valeur = modèle elliptique (acc_eval_2, défaut).
function ai.setTractionModel(model_index) end

--- Fusionne la table donnée dans l'état M (typiquement {debugMode = '...'}), prévient aiDebugDraw et active ou coupe le dessin debug selon que debugMode vaut 'off' ou non.
---Source : lua/vehicle/ai.lua:5796
---@param newMode table Ex. {debugMode = 'route'} ; valeurs : 'off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all'.
function ai.setVehicleDebugMode(newMode) end

--- Met l'IA en mode 'span' : parcourt tout le réseau routier en passant sur chaque route.
---Source : lua/vehicle/ai.lua:6133
---@param cutOffDrivability number|nil Les routes de drivability inférieure sont ignorées (nil = 0).
function ai.spanMap(cutOffDrivability) end

--- Fait suivre un script enregistré. Si le script (ou script.path) contient des points avec vitesse v, passe par driveUsingPath{script=...} ; sinon utilise scriptai en mode 'script'.
---Source : lua/vehicle/ai.lua:6172
---@param ... any Premier argument : script (table, ou table avec champ path) ; arguments suivants transmis à scriptai.startFollowing.
function ai.startFollowing(...) end

--- Passe en mode 'script' et lance l'enregistrement d'une trajectoire via scriptai.
---Source : lua/vehicle/ai.lua:6157
---@param recordSpeed number|nil Paramètre de vitesse transmis à scriptai.startRecording (déduit du code).
function ai.startRecording(recordSpeed) end

--- Bascule l'enregistrement de données de conduite : au premier appel démarre, au suivant arrête et écrit un fichier CSV.
---Source : lua/vehicle/ai.lua:217
---@param name string|nil Nom du fichier CSV.
function ai.startStopDataLog(name) end

--- Envoie l'état à l'UI (guihooks AIStateChange) si un joueur est assis dans ce véhicule.
---Source : lua/vehicle/ai.lua:257
function ai.stateChanged() end

--- Alias de scriptStop : arrête le suivi de script, mode 'disabled'.
---Source : lua/vehicle/ai.lua:6187
---@param ... any Transmis à scriptai.scriptStop.
function ai.stopFollowing(...) end

--- Arrête l'enregistrement (mode repasse à 'disabled') et renvoie le script enregistré.
---Source : lua/vehicle/ai.lua:6164
---@return table  Script (liste de points) renvoyé par scriptai.stopRecording.
function ai.stopRecording() end

--- Bascule entre le mode 'traffic' (avec récupération après crash activée) et 'disabled'.
---Source : lua/vehicle/ai.lua:5888
function ai.toggleTrafficMode() end

--- État interne du sous-système de manœuvre de demi-tour/recul (twt) : compteurs, rayons et lisseurs. Table locale non exportée par M, listée par l'extraction automatique.
---@class ai_twt
local ai_twt = {}

--- Remet à zéro l'état twt (état, rayons minimaux, bruit bleu, vitesse cible et lisseurs). Appelée en interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/ai.lua:97
function ai_twt.reset() end

