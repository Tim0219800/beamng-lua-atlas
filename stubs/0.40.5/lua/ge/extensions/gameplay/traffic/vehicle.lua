---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet véhicule de trafic. Champs courants : id, state, isAi, isPerson, isVehicle, isPlayerControlled, model, modelName, drivability, autoRole, role, tracking (roadTracking), collisions, pursuit, respawn, pos/dirVec/vel/driveVec/targetPos, speed, damage, alpha, focus, focusDist, enableRespawn, enableTracking, enableAutoPooling, camVisible, headlights, queuedFuncs.
---@class gameplay_traffic_vehicle
local gameplay_traffic_vehicle = {}

--- Déduit des données du modèle et de la config : nom d'affichage, drivability (à partir du score tout-terrain et de la taille), peinture aléatoire, taxi, statut de véhicule (types car, truck, automation, traffic, proptraffic, player) et rôle automatique ('police' pour les configs de police, sinon 'standard' ; 'empty' si non véhicule).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:98
function gameplay_traffic_vehicle:applyModelConfigData() end

--- Détecte les contacts avec les autres objets de la carte (vérification OBB), crée et met à jour les tables de collision (compteur, vitesse, dégâts, produit scalaire), notifie le rôle (onCollision) et les autres véhicules de trafic (onOtherCollision) lorsque la vitesse >= 1 m/s, et gère le cas d'un piéton (unicycle) percuté (l'IA s'arrête puis repart).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:319
function gameplay_traffic_vehicle:checkCollisions() end

--- Évalue les infractions du véhicule pour la police (excès de vitesse, course, conduite imprudente, mauvais sens, feu/stop, collision avec la police ou le trafic) à partir des fautes de roadTracking et des collisions. Sans effet si strictness <= 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:492
function gameplay_traffic_vehicle:checkOffenses() end

--- Détermine la police la plus proche, fait croître ou décroître sightValue (visibilité 0 à 1 ; policeVisible si >= 0,5) et met à jour le score de poursuite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:550
---@param dtSim number Delta temps de simulation (s).
function gameplay_traffic_vehicle:checkPoliceVisibility(dtSim) end

--- Teste la ligne de vue statique entre deux points (castRayStatic).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:412
---@param startPos vec3|nil Départ (position du véhicule par défaut).
---@param endPos vec3|nil Arrivée (position du véhicule par défaut).
---@return boolean  true si le rayon atteint la position sans obstacle.
function gameplay_traffic_vehicle:checkRayCast(startPos, endPos) end

--- Indique s'il fait jour d'après l'heure du jeu et la fenêtre de nuit solaire.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:599
---@return boolean  true en journée.
function gameplay_traffic_vehicle:checkTimeOfDay() end

--- Fait varier l'opacité du véhicule ; à 0 en fondu sortant l'état passe à 'queued', à 1 en fondu entrant à 'active'.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:401
---@param rate number|nil Pas d'opacité (0,1 par défaut).
---@param isFadeOut boolean|nil true pour disparaître, false/nil pour apparaître.
function gameplay_traffic_vehicle:fade(rate, isFadeOut) end

--- Estime la distance de freinage : v² / (2 · accel · g), avec g borné pour éviter une division par zéro.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:311
---@param speed number|nil Vitesse en m/s (self.speed par défaut).
---@param accel number|nil Décélération en fraction de g (agressivité du conducteur par défaut).
---@return number  Distance en mètres.
function gameplay_traffic_vehicle:getBrakingDistance(speed, accel) end

--- Renvoie la distance entre le point « regarde devant » du véhicule (targetPos, 10 à 50 m devant selon la vitesse) et une position.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:297
---@param pos vec3|nil Position à mesurer.
---@param squared boolean|nil Si true, renvoie la distance au carré.
---@return number  Distance en mètres (math.huge si pos est nil).
function gameplay_traffic_vehicle:getInteractiveDistance(pos, squared) end

--- Active le klaxon puis l'arrête après la durée donnée (fonction différée 'horn').
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:213
---@param duration number|nil Durée en secondes (1 par défaut).
function gameplay_traffic_vehicle:honkHorn(duration) end

--- Initialise le véhicule de trafic : force la visibilité, crée tables de collisions et de fonctions différées, l'objet roadTracking et les getters, appelle resetAll, relève largeur/longueur et définit le rôle par défaut 'empty'. Ne fait rien (et le constructeur renvoie nil) si le véhicule n'existe pas ou a ignoreTraffic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:23
---@param id integer Id du véhicule.
---@param role string|nil Non utilisé dans le corps de la fonction.
function gameplay_traffic_vehicle:init(id, role) end

--- Augmente immédiatement les rayons de respawn pour garder le véhicule actif plus longtemps (utilisé après collision et pendant les poursuites).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:305
---@param addActiveRadius number|nil Ajout au rayon actif (m).
---@param addInnerRadius number|nil Ajout au rayon intérieur (m).
function gameplay_traffic_vehicle:modifyRespawnValues(addActiveRadius, addInnerRadius) end

--- Appelé après la disparition en fondu ou l'envoi dans le pool inactif ; relaie à role:onActiveDone().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:618
function gameplay_traffic_vehicle:onActiveDone() end

--- Restaure l'état depuis la table de onSerialize, recrée le rôle et restaure le suivi ; met l'état à 'queued' si l'objet n'est pas actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:994
---@param data table Données issues de onSerialize.
function gameplay_traffic_vehicle:onDeserialized(data) end

--- Fait avancer la poursuite : alerte, arrestation (arrestTime), relâchement, barrages routiers (mode 3), évasion (evadeTime), rayons d'arrestation et d'évasion, et valeurs normalisées arrestValue et evadeValue. Pour un véhicule hors trafic principal, émet directement les hooks onPursuitAction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:755
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s).
function gameplay_traffic_vehicle:onPursuitUpdate(dt, dtSim) end

--- Appelé quand les données du véhicule doivent être rafraîchies (en général après respawn). Pour une IA : reset, réglage de playerUsable, mode debug IA, ajustement nocturne de spawnValue (x0,25), état active/fadeIn, réinitialisation de l'action et de la personnalité du rôle, paramètres IA. Appelle ensuite role:onRefresh().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:632
function gameplay_traffic_vehicle:onRefresh() end

--- Appelé après un respawn dans le trafic : repeint au hasard si permis, incrémente respawnCount, passe l'état à 'reset'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:622
function gameplay_traffic_vehicle:onRespawn() end

--- Sérialise l'état du véhicule de trafic (y compris suivi de route et rôle) pour la sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:966
---@return table  Données sérialisables.
function gameplay_traffic_vehicle:onSerialize() end

--- Tick de trafic (0,25 s) : met à jour le suivi de route, la visibilité, le rayon actif, les phares (nuit ou tunnel), détecte les dégâts de crash (hook onTrafficVehicleCrashed) et les quasi-accidents, puis appelle role:onTrafficTick.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:668
---@param tickTime number Durée du tick (0,25 s).
function gameplay_traffic_vehicle:onTrafficTick(tickTime) end

--- Mise à jour par frame : lit position, direction et vitesse depuis map.objects, calcule driveVec et targetPos, gère les états (locked, fadeIn, fadeOut), cadence les ticks de trafic, suit collisions et police, exécute les fonctions différées et appelle role:onUpdate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:875
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps de simulation (s).
function gameplay_traffic_vehicle:onUpdate(dt, dtSim) end

--- Appelé quand le véhicule est réinitialisé (auto ou manuel) : dégèle le véhicule si besoin et réinitialise le suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:610
function gameplay_traffic_vehicle:onVehicleResetted() end

--- À appeler après l'initialisation : applique les données du modèle/config (applyModelConfigData) puis le rôle automatique choisi (autoRole).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:93
function gameplay_traffic_vehicle:postInit() end

--- Appelle resetPursuit, resetTracking et resetValues.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:207
function gameplay_traffic_vehicle:resetAll() end

--- Éteint la rampe lumineuse, les warnings et le klaxon du véhicule (commandes Lua véhicule).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:200
function gameplay_traffic_vehicle:resetElectrics() end

--- Remet à zéro l'état de poursuite (mode 0, scores, compteurs, timers) ; si une poursuite était en cours, appelle d'abord gameplay_police.setPursuitMode(0, id).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:168
function gameplay_traffic_vehicle:resetPursuit() end

--- Rafraîchit roadTracking et remet à zéro compteurs de collisions et dégâts de crash ; mémorise les dégâts actuels comme référence.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:177
function gameplay_traffic_vehicle:resetTracking() end

--- Réinitialise les valeurs de respawn (depuis les variables de trafic), et vide collisions, fonctions différées et données actives.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:184
function gameplay_traffic_vehicle:resetValues() end

--- Définit le mode IA du véhicule (ai.setMode) et ses paramètres automatiques : 'traffic' (agressivité de base, vitesse légale, conduite dans la voie), 'random', 'flee' et 'chase' (agressivité >= 0,8 pour flee/chase, pas de limite de vitesse). Met isAi à false si le mode est 'disabled'. Termine par ai.reset().
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:225
---@param mode string|nil Mode IA ; utilise trafficVars.aiMode si nil. Exemples : 'traffic', 'random', 'flee', 'chase', 'follow', 'stop', 'disabled'.
---@param ignoreParams boolean|nil Si true, ne règle pas les paramètres automatiques ni ne réinitialise l'IA.
function gameplay_traffic_vehicle:setAiMode(mode, ignoreParams) end

--- Applique à l'IA l'agressivité, la limite de vitesse (négative = vitesse légale) et le réglage aiAware (évitement de voitures) issus de params ou, par défaut, des variables de trafic.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:253
---@param params table|nil Champs aggression/baseAggression, speedLimit (m/s), aiAware.
function gameplay_traffic_vehicle:setAiParameters(params) end

--- Change le rôle du conducteur : termine l'ancien rôle (onRoleEnded), crée le nouveau via trafficUtils.getRoleConstructor, appelle onRoleStarted et émet le hook onTrafficAction(id, 'changeRole', …).
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:278
---@param roleName string|nil Nom du rôle ('standard' par défaut).
function gameplay_traffic_vehicle:setRole(roleName) end

--- Fait évoluer l'état d'une collision : 'active' puis 'resolved' (arrêt près du site pendant 5 s) ou 'abandoned' (le véhicule s'éloigne) ; efface la collision quand l'autre véhicule est à plus de 120 m.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:377
---@param otherId integer|nil Id de l'autre véhicule.
---@param dt number Delta temps en secondes.
function gameplay_traffic_vehicle:trackCollision(otherId, dt) end

--- Enregistre une infraction de poursuite (clé unique, score par défaut 100, divisé par 2 pour une IA), met à jour compteurs et score additionnel et émet le hook onPursuitOffense la première fois.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:473
---@param data table {key = string, score? = number, value?, threshold?} ; sans key, rien n'est fait.
function gameplay_traffic_vehicle:triggerOffense(data) end

--- Teste si le véhicule est assez loin du foyer pour respawn (jamais le véhicule du joueur) et qu'aucun véhicule non-trafic n'est trop près ; passe alors à l'état 'fadeOut' et coupe klaxon et phares.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:439
function gameplay_traffic_vehicle:tryRespawn() end

--- Met à jour les rayons qui décident si le véhicule peut respawn : rayon actif décroissant selon spawnValue et visibilité, plus un rayon supplémentaire dépendant de la vitesse et de la direction du foyer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:421
---@param tickTime number Durée du tick (s).
function gameplay_traffic_vehicle:updateActiveRadius(tickTime) end

--- Allume la rampe lumineuse avec sirène (signal 2) puis la remet à 1 (ou 0 si disableAfterUse) après la durée donnée. Suppose que le véhicule a une rampe. Utilise la même entrée différée 'horn' que honkHorn : les deux s'écrasent mutuellement.
---Source : lua/ge/extensions/gameplay/traffic/vehicle.lua:218
---@param duration number|nil Durée en secondes (1 par défaut).
---@param disableAfterUse boolean|nil Si true, éteint la rampe à la fin au lieu du mode lumières seules.
function gameplay_traffic_vehicle:useSiren(duration, disableAfterUse) end

