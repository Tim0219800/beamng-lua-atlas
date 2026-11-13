---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/parking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de véhicules garés et de suivi du stationnement. D'une part il fait apparaître des voitures garées sur les places du fichier de sites du niveau (city.sites.json via gameplay_city) et les téléporte vers de nouvelles places devant le joueur quand il s'éloigne, en s'appuyant sur un pool d'activation (core_vehicleActivePooling). D'autre part il suit un véhicule en conduite (enableTracking) pour détecter qu'il entre, sort ou se gare correctement dans une place et émet onVehicleParkingStatus. Un moddeur s'en sert pour peupler une zone de voitures garées ou pour des missions de stationnement.
--- Accès : extension `gameplay_parking` : `extensions.load("gameplay_parking")`, puis la globale `gameplay_parking`
---@class gameplay_parking
---@field debugLevel integer Niveau de debug : > 0 logs de téléportation et de filtrage ; >= 1 dessine les places autour du véhicule suivi ; >= 2 dessine les coins ; >= 3 dessine le point de recherche et les cercles.
---@field dependencies string[] {'core_vehicleActivePooling'}, extension chargée avant.
gameplay_parking = {}

--- Active un groupe de véhicules comme voitures garées (les insère), puis émet onParkingVehiclesActivated. Désactive le système s'il n'y a pas de sites, pas de véhicules ou aucun inséré. Alias : processVehicles.
---Source : lua/ge/extensions/gameplay/parking.lua:660
---@param vehIds integer[] Ids de véhicules.
function gameplay_parking.activate(vehIds) end

--- Indique si une place est utilisable pour un véhicule garé : existante, dans la fenêtre de distance du focus, libre (pas de véhicule, pas banned, aucun véhicule dessus), hors des rayons trafficClearRadius, taille adaptée (ni trop petite ni trop grande : rapport >= 0.5).
---Source : lua/ge/extensions/gameplay/parking.lua:155
---@param vehId integer Véhicule à garer.
---@param parkingSpot table Place à tester.
---@param minDist number|nil Distance minimale au focus (m, défaut 0).
---@param maxDist number|nil Distance maximale au focus (m, défaut 1e12).
---@return boolean  true si la place convient.
function gameplay_parking.checkParkingSpot(vehId, parkingSpot, minDist, maxDist) end

--- Désactive le système : vide les listes, supprime le pool et émet onParkingVehiclesDeactivated.
---Source : lua/ge/extensions/gameplay/parking.lua:682
function gameplay_parking.deactivate() end

--- Supprime du monde les dernières voitures garées (toutes par défaut).
---Source : lua/ge/extensions/gameplay/parking.lua:647
---@param amount integer|nil Nombre à supprimer, en commençant par la fin de la liste.
function gameplay_parking.deleteVehicles(amount) end

--- Arrête le suivi du stationnement d'un véhicule.
---Source : lua/ge/extensions/gameplay/parking.lua:394
---@param vehId integer|nil Véhicule (défaut joueur 0).
function gameplay_parking.disableTracking(vehId) end

--- Active le suivi du stationnement pour un véhicule conduit (active aussi le système). Crée les données de suivi : inside, preParked, parked, event, maxDist 80 m, parkingTimer, isOversized…
---Source : lua/ge/extensions/gameplay/parking.lua:374
---@param vehId integer|nil Véhicule (défaut joueur 0).
---@param autoDisable boolean|nil Si true, le suivi s'arrête à la première validation du stationnement.
function gameplay_parking.enableTracking(vehId, autoDisable) end

--- Filtre en place une liste issue de findParkingSpots : retire les places banned, puis selon filters : standardSize (largeur <= 3, longueur <= 8), checkVehicles (aucun véhicule dessus), useProbability (probabilité de la place × baseProbability × coefficient jour/nuit selon l'heure et les tags dayTime/nightTime). Défaut : {useProbability = true}.
---Source : lua/ge/extensions/gameplay/parking.lua:226
---@param psList table[] Liste {ps, squaredDistance}.
---@param filters table|nil useProbability, standardSize, checkVehicles.
---@return table[]  La même liste filtrée.
function gameplay_parking.filterParkingSpots(psList, filters) end

--- Trouve les places dans une couronne autour d'une position, triées de la plus proche à la plus lointaine.
---Source : lua/ge/extensions/gameplay/parking.lua:197
---@param pos vec3|nil Centre (défaut position caméra).
---@param minRadius number|nil Rayon minimal (défaut 0).
---@param maxRadius number|nil Rayon maximal (défaut 200 m).
---@return table[]  Liste {ps = place, squaredDistance = number}.
function gameplay_parking.findParkingSpots(pos, minRadius, maxRadius) end

--- Force une voiture garée à se téléporter sur une nouvelle place libre aléatoire proche. Sans place valide, l'envoie hors carte via gameplay_traffic.forceTeleport. Sans effet si enableRespawn est false ou si la voiture a ignoreForceTeleport.
---Source : lua/ge/extensions/gameplay/parking.lua:335
---@param vehId integer Voiture garée.
---@param pos vec3|nil Position de référence (défaut caméra).
---@param minDist number|nil Distance minimale.
---@param maxDist number|nil Distance maximale.
function gameplay_parking.forceTeleport(vehId, pos, minDist, maxDist) end

--- Id de la place où un véhicule est correctement garé. Avec suivi actif, renvoie parkingSpotId si preParked ; sans suivi, cherche la place la plus proche (15 m) qui contient le véhicule avec la précision vars.precision.
---Source : lua/ge/extensions/gameplay/parking.lua:403
---@param vehId integer|nil Véhicule (défaut joueur 0).
---@return integer|nil  Id de place, ou nil.
function gameplay_parking.getCurrentParkingSpot(vehId) end

--- Nombre de voitures garées gérées ; avec activeOnly, borné par activeAmount. Alias : getParkingAmount.
---Source : lua/ge/extensions/gameplay/parking.lua:462
---@param activeOnly boolean|nil true pour compter au plus activeAmount.
---@return integer  Nombre.
function gameplay_parking.getParkedCarsAmount(activeOnly) end

--- Données par voiture garée : parkingSpotId, activeRadius, randomPaint, searchFlag…
---Source : lua/ge/extensions/gameplay/parking.lua:470
---@return table<integer, table>  Données (référence directe).
function gameplay_parking.getParkedCarsData() end

--- Liste des ids de voitures garées gérées.
---Source : lua/ge/extensions/gameplay/parking.lua:466
---@return integer[]  Ids (référence directe).
function gameplay_parking.getParkedCarsList() end

--- Alias de getParkedCarsAmount.
---Source : lua/ge/extensions/gameplay/parking.lua:462
---@param activeOnly boolean|nil Voir getParkedCarsAmount.
---@return integer  Nombre.
function gameplay_parking.getParkingAmount(activeOnly) end

--- Renvoie la collection de places de parking (sites.parkingSpots : sorted, objects…), en chargeant les sites si nécessaire.
---Source : lua/ge/extensions/gameplay/parking.lua:74
---@return table|nil  Collection de places, nil sans sites.
function gameplay_parking.getParkingSpots() end

--- Variables de stationnement actuelles.
---Source : lua/ge/extensions/gameplay/parking.lua:458
---@return table  Variables (référence directe).
function gameplay_parking.getParkingVars() end

--- Renvoie une liste de places valides triée avec un biais aléatoire en faveur des plus proches de la position d'origine. Élargit le rayon jusqu'à avoir assez de places ou atteindre maxDist.
---Source : lua/ge/extensions/gameplay/parking.lua:295
---@param originPos vec3|nil Origine (défaut caméra).
---@param minDist number|nil Distance minimale (défaut 0).
---@param maxDist number|nil Distance maximale (défaut 10000).
---@param targetCount integer|nil Nombre de places voulu ; nil ou <= 0 = rayon maxDist et minimum automatique.
---@param filters table|nil Filtres de filterParkingSpots.
---@return table[]  Liste {ps, squaredDistance} (vide si rien trouvé).
function gameplay_parking.getRandomParkingSpots(originPos, minDist, maxDist, targetCount, filters) end

--- Indique si le système est actif.
---Source : lua/ge/extensions/gameplay/parking.lua:70
---@return boolean  true si actif.
function gameplay_parking.getState() end

--- Données de suivi de tous les véhicules suivis, par id.
---Source : lua/ge/extensions/gameplay/parking.lua:399
---@return table<integer, table>  Données (inside, parked, event, parkingSpotId, lastParkingSpotId…).
function gameplay_parking.getTrackingData() end

--- Ajoute un véhicule aux voitures garées gérées : crée le pool 'autoParking' si besoin, le rend non utilisable par le joueur, l'associe à sa place actuelle éventuelle et active le suivi mapmgr. Ignoré si obj.ignoreParking.
---Source : lua/ge/extensions/gameplay/parking.lua:604
---@param vehId integer Véhicule.
function gameplay_parking.insertVehicle(vehId) end

--- Place un véhicule garé sur une place : choisit le sens (tags forwards/backwards, sinon avec la netteté), ajoute un décalage et une rotation aléatoires sauf tag perfect, éteint le contact, libère l'ancienne place, peut changer la peinture, et met à jour le suivi mapmgr.
---Source : lua/ge/extensions/gameplay/parking.lua:95
---@param vehId integer Véhicule à déplacer.
---@param parkingSpot table Objet place de parking.
---@param lowPrecision boolean|nil Transmis à moveResetVehicleTo (utilisé quand le véhicule n'est pas prêt).
function gameplay_parking.moveToParkingSpot(vehId, parkingSpot, lowPrecision) end

--- Hook de fin de niveau : appelle resetAll.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:1004
function gameplay_parking.onClientEndMission() end

--- Hook de début de niveau ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:1001
function gameplay_parking.onClientStartMission() end

--- Hook après rechargement Lua : refait apparaître les voitures stockées si options.respawnVehicles, réactive les voitures garées, rétablit les suivis, les variables et l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:1049
---@param data table Résultat de onSerialize.
---@param options table|nil respawnVehicles, debugVehicleStashing.
function gameplay_parking.onDeserialized(data, options) end

--- Hook avant rechargement Lua : renvoie l'état (actif, voiture garées, suivis, variables). Avec options.despawnVehicles, capture aussi les données d'apparition des voitures (sauf options.exceptVehicleId) puis les supprime.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:1008
---@param options table|nil despawnVehicles, exceptVehicleId, debugVehicleStashing.
---@return table  Données à restaurer.
function gameplay_parking.onSerialize(options) end

--- Appelé à chaque image. Met à jour le suivi du stationnement (événements enter/exit/valid/invalid), recherche périodiquement des places devant le joueur et recycle une voiture garée par image vers une nouvelle place hors de portée du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:822
---@param dt number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
function gameplay_parking.onUpdate(dt, dtSim) end

--- Hook de pool d'activation : marque une voiture garée désactivée pour téléportation ; à sa réactivation, la téléporte si un autre véhicule (100 m d'un joueur, 20 m sinon) est proche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:800
---@param vehId integer Véhicule.
---@param active boolean Nouvel état d'activité.
function gameplay_parking.onVehicleActiveChanged(vehId, active) end

--- Hook : retire le véhicule des listes de voitures garées et de suivi, et libère sa place.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:787
---@param vehId integer Véhicule détruit.
function gameplay_parking.onVehicleDestroyed(vehId) end

--- Hook de core_multiSpawn : active le groupe quand il porte le nom 'autoParking'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:772
---@param vehList integer[] Véhicules apparus.
---@param groupId any Id du groupe (inutilisé).
---@param groupName string Nom du groupe.
function gameplay_parking.onVehicleGroupSpawned(vehList, groupId, groupName) end

--- Hook : quand le véhicule joueur est réinitialisé/téléporté, force une recherche de places proche du joueur (mode de réapparition proche).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/parking.lua:778
---@param vehId integer Véhicule réinitialisé.
function gameplay_parking.onVehicleResetted(vehId) end

--- Alias d'activate.
---Source : lua/ge/extensions/gameplay/parking.lua:660
---@param vehIds integer[] Ids de véhicules.
function gameplay_parking.processVehicles(vehIds) end

--- Retire un véhicule des voitures garées gérées (ne le supprime pas du monde).
---Source : lua/ge/extensions/gameplay/parking.lua:640
---@param vehId integer Véhicule.
function gameplay_parking.removeVehicle(vehId) end

--- Réinitialise tout : désactive, oublie les sites, vide listes et suivis, supprime le pool et remet les variables par défaut.
---Source : lua/ge/extensions/gameplay/parking.lua:758
function gameplay_parking.resetAll() end

--- Téléporte toutes les voitures garées (ou celles fournies) sur des places aléatoires ; repli sur forceTeleport quand aucune place ne convient.
---Source : lua/ge/extensions/gameplay/parking.lua:362
---@param vehIds integer[]|nil Voitures (défaut toutes les voitures garées).
---@param minDist number|nil Distance minimale.
---@param maxDist number|nil Distance maximale.
function gameplay_parking.scatterParkedCars(vehIds, minDist, maxDist) end

--- Définit le nombre maximal de voitures garées actives (visibles) ; nil = illimité.
---Source : lua/ge/extensions/gameplay/parking.lua:453
---@param amount number|nil Nombre maximal.
function gameplay_parking.setActiveAmount(amount) end

--- Fusionne des variables de stationnement (réinitialise d'abord si reset). Un radiusCoef réinitialise les rayons actifs ; un activeAmount met à jour le pool de véhicules.
---Source : lua/ge/extensions/gameplay/parking.lua:434
---@param data table precision, neatness, radiusCoef, baseProbability, activeAmount, enableRespawn.
---@param reset boolean|nil true pour revenir aux valeurs par défaut avant fusion.
function gameplay_parking.setParkingVars(data, reset) end

--- Définit les données de sites (places de parking) utilisées, en remplaçant celles du niveau. Accepte un chemin de fichier, ou une table de sites valide (avec parkingSpots) ; sinon remet à nil.
---Source : lua/ge/extensions/gameplay/parking.lua:45
---@param data string|table|nil Chemin d'un fichier .sites.json ou table de sites.
function gameplay_parking.setSites(data) end

--- Active ou désactive le système de stationnement. À l'activation, charge les sites par défaut si besoin et initialise le point de focus (gameplay_traffic.getFocus()).
---Source : lua/ge/extensions/gameplay/parking.lua:58
---@param val boolean true pour activer.
function gameplay_parking.setState(val) end

--- Fait apparaître des véhicules garés sur des places aléatoires (groupe de véhicules de type propparked, ou options.vehGroup). Supprime d'abord les voitures garées actuelles sauf keepCurrent. Quand le groupe est apparu, onVehicleGroupSpawned appelle activate.
---Source : lua/ge/extensions/gameplay/parking.lua:693
---@param amount integer|nil Nombre ; -1 ou nil = réglage trafficParkingAmount (0 = auto entre 4 et 16).
---@param options table|nil keepCurrent, vehGroup, pos, bypassChecks.
---@return boolean  false si le nombre est nul, si le groupe est vide ou s'il n'y a aucune place (sans bypassChecks).
function gameplay_parking.setupVehicles(amount, options) end

