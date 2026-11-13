---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/traffic/trafficUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boîte à outils du système de trafic : création de groupes de véhicules de trafic ou de police (via core_multiSpawn), chargement de fichiers *.vehGroup.json, recherche de points d'apparition (spawn) sur une route, une ligne ou un cercle autour d'une position, placement des véhicules IA de trafic et recherche du véhicule de trafic le plus proche. Un moddeur s'en sert pour faire apparaître du trafic de façon réaliste à partir d'une position et d'une direction (par défaut celles de la caméra).
--- Accès : extension `gameplay_traffic_trafficUtils` : `extensions.load("gameplay_traffic_trafficUtils")`, puis la globale `gameplay_traffic_trafficUtils`
---@class gameplay_traffic_trafficUtils
---@field debugMode boolean Si true, écrit dans le log les paramètres et résultats des recherches de point d'apparition. false par défaut.
gameplay_traffic_trafficUtils = {}

--- Vérifie qu'un point est utilisable : entre minDist et maxDist de l'origine, hors des carrefours, et sans conflit avec les autres véhicules actifs.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:293
---@param pos vec3 Point à tester.
---@param origPos vec3|nil Origine des distances (caméra par défaut).
---@param minDist number|nil Distance minimale (80 m par défaut).
---@param maxDist number|nil Distance maximale (illimitée par défaut).
---@param minVehDist number|nil Distance minimale aux autres véhicules (15 m par défaut).
---@param n1 string|nil Premier nœud de route (pour exclure les carrefours).
---@param n2 string|nil Second nœud de route.
---@return boolean  true si le point est valide.
function gameplay_traffic_trafficUtils.checkSpawnPoint(pos, origPos, minDist, maxDist, minVehDist, n1, n2) end

--- Crée un groupe de véhicules de police (configs de type 'police'), favorisant le pays du niveau, selon le réglage trafficAllowMods.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:85
---@param amount integer Nombre de véhicules.
---@param allMods boolean Ignoré : écrasé par le réglage trafficAllowMods.
---@return table  Groupe renvoyé par core_multiSpawn.createGroup.
function gameplay_traffic_trafficUtils.createPoliceGroup(amount, allMods) end

--- Crée un groupe de véhicules de trafic selon les réglages du joueur (trafficSimpleVehicles, trafficAllowMods, trafficSmartSelections) : sans véhicules de police, ou uniquement des véhicules 'proptraffic' en mode simple.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:58
---@param amount integer Nombre de véhicules du groupe.
---@param allMods boolean Ignoré : écrasé par le réglage trafficAllowMods.
---@param allConfigs boolean Ignoré : forcé à true.
---@param simpleVehs boolean Ignoré : écrasé par le réglage trafficSimpleVehicles.
---@return table  Groupe renvoyé par core_multiSpawn.createGroup.
function gameplay_traffic_trafficUtils.createTrafficGroup(amount, allMods, allConfigs, simpleVehs) end

--- Cale un point sur une voie de la route (position et direction), en tenant compte du sens de circulation (conduite à droite ou à gauche), des sens uniques et du nombre de voies estimé. Si aucune route n'est trouvée à moins de 30 m, renvoie les valeurs d'entrée.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:297
---@param pos vec3 Position à ajuster.
---@param dir vec3|nil Direction ; si nil, prend le sens de la route (legalDirection = true).
---@param mapNode1 string|nil Premier nœud de la route (recherché si absent).
---@param mapNode2 string|nil Second nœud de la route.
---@param options table|nil legalDirection (sens légal), minLane/maxLane (voies autorisées), roadDir (±1, vers/loin du joueur), roadLateralXnorm (décalage latéral direct de -1 à 1).
---@return vec3  Nouvelle position.
---@return vec3  Nouvelle direction.
function gameplay_traffic_trafficUtils.finalizeSpawnPoint(pos, dir, mapNode1, mapNode2, options) end

--- Renvoie toujours un point d'apparition (téléportation forcée). Essaie d'abord la route devant, puis une recherche radiale proche (200-1000 m), une recherche large moins stricte (200-2000 m, drivability 0,5) et enfin très loin (10 000-12 000 m, z = 1).
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:648
---@param startPos vec3|nil Origine.
---@param startDir vec3|nil Direction de marche.
---@param minDist number|nil Distance minimale de la première recherche.
---@param maxDist number|nil Distance maximale de la première recherche.
---@param targetDist number|nil Distance idéale de la première recherche.
---@param options table|nil Mêmes options que findSpawnPointOnRoute (modifiée : minDrivability passe à 0,5 dans les recherches de repli).
---@return table  {pos, dir, ...}, jamais nil.
---@return boolean  true si une méthode a trouvé un point valide.
function gameplay_traffic_trafficUtils.findSafeSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Alias de findSpawnPointOnRoute (même fonction, mêmes paramètres et retours).
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:519
---@param startPos vec3|nil Origine.
---@param startDir vec3|nil Direction de marche.
---@param minDist number|nil Distance minimale.
---@param maxDist number|nil Distance maximale.
---@param targetDist number|nil Distance idéale.
---@param options table|nil Voir findSpawnPointOnRoute.
---@return table  {pos, dir, n1, n2}.
---@return boolean  true si valide.
function gameplay_traffic_trafficUtils.findSpawnPoint(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Cherche un point d'apparition le long d'une droite partant de l'origine dans la direction startDir, par pas de options.gap (50 m par défaut).
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:452
---@param startPos vec3|nil Origine (caméra par défaut).
---@param startDir vec3|nil Direction de la droite (avant de la caméra par défaut).
---@param minDist number|nil Distance minimale (20 m).
---@param maxDist number|nil Distance maximale (2000 m).
---@param targetDist number|nil Distance idéale pour le test de visibilité.
---@param options table|nil gap, usePrivateRoads, minDrivability, minRadius.
---@return table  {pos, dir, n1, n2}.
---@return boolean  true si un point valide a été trouvé.
function gameplay_traffic_trafficUtils.findSpawnPointOnLine(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Génère un chemin sur la route devant l'origine (aléatoire avec ramifications, ou options.route) et teste des points de ce chemin entre minDist et maxDist. Les pas peuvent être modulés par la limite de vitesse du tronçon (gapVehCoef, gapSpeedCoef, bornés à 20-50 m). Exportée aussi sous le nom findSpawnPoint.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:519
---@param startPos vec3|nil Origine (caméra par défaut).
---@param startDir vec3|nil Direction de marche (avant de la caméra par défaut).
---@param minDist number|nil Distance minimale (20 m).
---@param maxDist number|nil Distance maximale (2000 m).
---@param targetDist number|nil Distance idéale pour le test de visibilité.
---@param options table|nil gap (20 m), usePrivateRoads, minDrivability, minRadius, pathRandomization (0,5), route (chemin fourni), gapVehCoef, gapSpeedCoef.
---@return table  {pos, dir, n1, n2}.
---@return boolean  true si un point valide a été trouvé.
function gameplay_traffic_trafficUtils.findSpawnPointOnRoute(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Cherche un point d'apparition en testant des directions aléatoires autour de l'origine, de minDist à maxDist par pas de options.gap (50 m par défaut), jusqu'à trouver une route valide.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:384
---@param startPos vec3|nil Origine (caméra par défaut).
---@param startDir vec3|nil Direction de départ (non utilisée par la méthode radiale, remise à z = 0).
---@param minDist number|nil Distance minimale (20 m).
---@param maxDist number|nil Distance maximale (2000 m).
---@param targetDist number|nil Distance idéale ; en deçà, le point doit être caché à la caméra (raycast statique).
---@param options table|nil gap, usePrivateRoads, minDrivability, minRadius.
---@return table  {pos, dir, n1, n2} (n1/n2 seulement si valide).
---@return boolean  true si un point valide a été trouvé.
function gameplay_traffic_trafficUtils.findSpawnPointRadial(startPos, startDir, minDist, maxDist, targetDist, options) end

--- Renvoie une position située devant pos, dans la direction dir, à la distance scale. Sert à comparer à moindre coût les distances entre véhicules.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:161
---@param pos vec3 Position de départ.
---@param dir vec3 Direction.
---@param scale number Distance en mètres ; si 0, renvoie pos tel quel.
---@param useZ0 boolean|nil Si true, aplatit la direction à l'horizontale (z = 0) avant de la normaliser.
---@return vec3  Vecteur mis en cache (à copier si conservé) ; ou pos si scale == 0.
function gameplay_traffic_trafficUtils.getAheadPos(pos, dir, scale, useZ0) end

--- Construit les paramètres de base d'un groupe de véhicules (filtre de types voiture/camion, pays du niveau, minPop 50 ; filtre de région si le réglage trafficSmartSelections est actif).
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:49
---@return table  Paramètres à passer à core_multiSpawn.createGroup.
function gameplay_traffic_trafficUtils.getBaseGroupParams() end

--- Renvoie la table des valeurs de seuil partagées par les modules de trafic (référence directe).
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:45
---@return table  {minDrivability, minRadius, lowDamage, highDamage, lowSpeed}.
function gameplay_traffic_trafficUtils.getBaseValues() end

--- Lit le fichier d'infos du niveau courant et renvoie son pays (converti en nom anglais parmi une liste restreinte, sinon 'default') et sa région.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:26
---@return table  {country = string, region = string|nil}.
function gameplay_traffic_trafficUtils.getLevelInfo() end

--- Renvoie l'id du véhicule IA de trafic le plus proche d'une position, avec filtres optionnels sur les propriétés du véhicule de trafic.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:678
---@param pos vec3|nil Position de référence (caméra par défaut).
---@param filters table|nil Paires propriété = valeur ; un véhicule est exclu si la propriété existe avec une autre valeur.
---@return integer|nil  Id du véhicule le plus proche.
---@return number  Distance en mètres (math.huge si aucun véhicule).
function gameplay_traffic_trafficUtils.getNearestTrafficVehicle(pos, filters) end

--- Renvoie le constructeur d'un rôle de trafic (module sous traffic/roles/), mis en cache. Si le rôle n'existe pas, un avertissement est écrit et le rôle 'standard' est utilisé.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:150
---@param roleName string Nom du rôle (ex. 'standard', 'police', 'suspect', 'empty').
---@return function  Constructeur de rôle.
function gameplay_traffic_trafficUtils.getRoleConstructor(roleName) end

--- Renvoie les données d'un fichier de groupe de véhicules (*.vehGroup.json), choisi au hasard parmi ceux du niveau (ou de /vehicleGroups/).
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:107
---@param options table|nil options.name = filtre sur le nom du fichier (sous-chaîne, en minuscules) ; options.useCustom = true pour forcer /vehicleGroups/.
---@return table|nil  Données du groupe (champ data du fichier si présent).
---@return string|nil  Chemin du fichier choisi.
function gameplay_traffic_trafficUtils.getTrafficGroupFromFile(options) end

--- Téléporte tous les véhicules IA de trafic à la position donnée et les aligne (core_multiSpawn.placeGroup), par défaut en mode 'roadAhead' avec un écart de 15 m.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:669
---@param pos vec3|nil Position (caméra par défaut).
---@param dir vec3|nil Direction (avant de la caméra par défaut).
---@param options table|nil Options de placeGroup ; mode ('roadAhead' par défaut) et gap (15 par défaut).
function gameplay_traffic_trafficUtils.placeTrafficVehicles(pos, dir, options) end

--- Convertit une vitesse saisie dans l'application Trafic (km/h, mph ou auto) en m/s et l'applique comme limite de vitesse du trafic (setTrafficVars({speedLimit})). Le mode 'auto' envoie -1.
---Source : lua/ge/extensions/gameplay/traffic/trafficUtils.lua:707
---@param speed number|nil Vitesse dans l'unité du mode (0 par défaut).
---@param mode string|nil 'km/h', 'mph' ou 'auto' (défaut) ; autre valeur = m/s.
---@return number  Vitesse appliquée en m/s (-1 en mode auto).
function gameplay_traffic_trafficUtils.setTrafficSpeedFromApp(speed, mode) end

