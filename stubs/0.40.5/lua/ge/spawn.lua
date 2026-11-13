---@meta
-- tim19Atlas stub generated from lua/ge/spawn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Création et placement de véhicules côté Game Engine. Il crée un objet BeamNGVehicle (spawnVehicle), choisit un point d'apparition (pickSpawnPoint), et surtout place ou téléporte un véhicule sans collision (safeTeleport, safeReset) : le module construit la boîte orientée du véhicule, la pose au sol par raycast, puis la décale en spirale jusqu'à trouver une place libre (autres véhicules, statiques, trafic). Il gère aussi la téléportation vers la dernière route (récupération) et le placement d'une remorque sur un attelage.
--- Accès : globale `spawn`
---@class spawn
spawn = {}

--- Calcule la matrice monde d'un second véhicule pour que son attelage coïncide avec celui du premier : transform0 x décalage coupler0 x rotOffset x inverse(décalage coupler1).
---Source : lua/ge/spawn.lua:1058
---@param transform0 MatrixF Matrice monde du premier véhicule (par ex. veh:getRefNodeMatrix()).
---@param coupler0_offset vec3 Position de l'attelage sur le premier véhicule, par rapport à son noeud de référence.
---@param coupler1_offset vec3 Position de l'attelage sur le second véhicule, par rapport à son noeud de référence.
---@param rotOffset MatrixF|nil Rotation supplémentaire appliquée entre les deux attelages.
---@return MatrixF  Matrice de placement du second véhicule.
function spawn.calculateRelativeVehiclePlacement(transform0, coupler0_offset, coupler1_offset, rotOffset) end

--- Vide le cache des véhicules placés pendant la frame courante, s'il y en a. Appelée par le moteur pour que le cache ne dure qu'une frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/spawn.lua:33
function spawn.clearCache() end

--- Cherche un point d'apparition valide : d'abord le point par défaut du niveau (setSpawnpoint), puis un objet pris au hasard dans les groupes CameraSpawnPoints, PlayerSpawnPoints, PlayerDropPoints, puis DefaultPlayerSpawnSphere (mods anciens), sinon crée une SpawnSphere par défaut dans MissionCleanup. Voir notes sur le test du point par défaut.
---Source : lua/ge/spawn.lua:880
---@param spawnName string 'player' ou 'camera' : type de SpawnSphere à créer si rien n'est trouvé.
---@return table|nil  Objet de scène du point d'apparition (SpawnSphere, marqueur…), nil en cas d'erreur.
function spawn.pickSpawnPoint(spawnName) end

--- Positionne une remorque sur le véhicule tracteur en faisant coïncider les attelages, la remet à zéro (requestReset(RESET_PHYSICS), resetBrokenFlexMesh) et active l'attelage automatique si l'option du tag est 'autoCouple'. Si les deux attelages sont du même côté (avant/avant ou arrière/arrière), la remorque est retournée de 180 degrés.
---Source : lua/ge/spawn.lua:1088
---@param vehId integer Id du véhicule tracteur.
---@param couplerOffsetVeh vec3 Position de l'attelage du tracteur par rapport à son noeud de référence.
---@param trailerId integer Id de la remorque.
---@param couplerOffsetTrailer vec3 Position de l'attelage de la remorque.
---@param couplerTag string Tag de l'attelage ; consulté dans core_vehicles.couplerTagsOptions pour l'attelage automatique.
---@param rotOffset MatrixF|nil Rotation supplémentaire à appliquer.
function spawn.placeTrailer(vehId, couplerOffsetVeh, trailerId, couplerOffsetTrailer, couplerTag, rotOffset) end

--- Remplacement conseillé de be:resetVehicle(0) : téléporte le véhicule à sa position et rotation d'origine (veh:getOriginalPosition/Rotation) en cherchant une place libre, avec réinitialisation du véhicule.
---Source : lua/ge/spawn.lua:696
---@param veh table Objet véhicule.
---@param checkOnlyStatics_ boolean|nil Ne tester que les objets statiques.
---@param visibilityPoint_ vec3|nil Point d'où la place trouvée ne doit pas être visible.
---@param removeTraffic_ boolean|nil Écarter le trafic de la zone.
function spawn.safeReset(veh, checkOnlyStatics_, visibilityPoint_, removeTraffic_) end

--- Téléporte un véhicule en évitant les collisions : (si resetVehicle) le place à pos/rot et le répare du maillage souple, puis cherche la place libre la plus proche (pose au sol par raycast, spirale de décalages). Applique la pose finale au groupe de noeuds, remet la vitesse à zéro et mémorise la pose finale.
---Source : lua/ge/spawn.lua:659
---@param veh table Objet véhicule (BeamNGVehicle).
---@param pos vec3 Position souhaitée (noeud de référence, ou centre de la boîte si centeredPosition).
---@param rot quat|nil Rotation souhaitée (quat(0,0,0,-1) par défaut), multipliée en interne par une rotation de 180 degrés autour de z.
---@param checkOnlyStatics_ boolean|nil Si vrai, ne teste que les statiques (et ne déplace pas le trafic).
---@param visibilityPoint_ vec3|nil Position de la caméra : la place trouvée doit être hors de sa vue si possible.
---@param removeTraffic_ boolean|nil Écarter les véhicules de trafic (gameplay_traffic) de la zone. Conserve la valeur précédente si nil (true au départ).
---@param centeredPosition boolean|nil true si pos désigne le centre de la boîte du véhicule.
---@param resetVehicle boolean|nil true par défaut : utilise les positions initiales des noeuds (véhicule réparé). false : déplace le véhicule tel qu'il est (boîte du groupe de noeuds principal).
---@param player any Transmis à setSafePosition (déduit du code : non utilisé dans les fonctions de placement lues).
---@param unlimitedSafeSpawnRange boolean|nil Supprime la limite de distance de recherche d'une place.
function spawn.safeTeleport(veh, pos, rot, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle, player, unlimitedSafeSpawnRange) end

--- Configure puis fait apparaître un objet BeamNGVehicle déjà créé : modèle, config de pièces, peintures (3 palettes), position/rotation (avec rotation de 180 degrés), l'ajoute à MissionGroup et au groupe SpawnedVehicles (canSave = false), puis cherche une place libre sauf si options.safeSpawn == false.
---Source : lua/ge/spawn.lua:575
---@param veh table Objet créé par createObject('BeamNGVehicle').
---@param options table model (string), config (string ou table), paint/paint2/paint3 ({baseColor = {r,g,b,a}, ...}), pos (vec3), rot (quat), centeredPosition, safeSpawn (true par défaut), unlimitedSafeSpawnRange, removeWhenNoPositionFound (true par défaut).
---@return boolean|nil  true si le véhicule est placé ; nil si veh manque, si MissionGroup n'existe pas, ou si aucune place n'est trouvée (véhicule supprimé).
function spawn.setVehicleObject(veh, options) end

--- Crée (si besoin) la caméra de jeu 'gameCamera' (datablock Observer), l'ajoute à MissionCleanup et la fixe comme caméra de la vue 'main'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/spawn.lua:946
function spawn.spawnCamera() end

--- Fait apparaître le véhicule joueur au chargement du niveau : via core_levels.maybeSpawnDefaultVehicle(), ou via l'ancien code (variable $beamngVehicle) avec avertissement. Si preventPlayerSpawning est vrai, ne fait rien une fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/spawn.lua:1037
function spawn.spawnPlayer() end

--- Crée un objet BeamNGVehicle, lui donne un nom unique (options.vehicleName ou 'clone', 'clone0'…), applique les options (autoEnterVehicle, autoEnterVehiclePlayer) puis délègue à setVehicleObject. Le véhicule apparaît tourné de 180 degrés autour de z.
---Source : lua/ge/spawn.lua:821
---@param model string Nom du modèle JBeam (ex. 'pickup').
---@param partConfig string|table Chemin du fichier .pc ou table de config de pièces.
---@param pos vec3 Position.
---@param rot quat Rotation.
---@param options table|nil vehicleName, autoEnterVehicle (true par défaut), autoEnterVehiclePlayer, visibilityPoint, removeTraffic, paint/paint2/paint3, centeredPosition, safeSpawn, unlimitedSafeSpawnRange, removeWhenNoPositionFound. La table est modifiée (vehicleName, model, config, pos, rot, cling y sont écrits).
---@return table|nil  Objet véhicule, ou nil si la création ou le placement échoue.
function spawn.spawnVehicle(model, partConfig, pos, rot, options) end

--- Renvoie et efface la dernière pose appliquée par safeTeleport pour ce véhicule (utilisé par la capture du multijoueur).
---Source : lua/ge/spawn.lua:690
---@param vid integer Id du véhicule.
---@return table|nil  {x, y, z, rx, ry, rz, rw} (noeud de référence et quaternion), ou nil si aucune pose.
function spawn.takeLastSafeTeleportPose(vid) end

--- Récupération : téléporte le véhicule sur la dernière position de route connue. Demande les points de récupération (recovery.recoveryPoints) à la VM véhicule, puis le callback teleportToLastRoadCallback place le véhicule sur la route côté légal. Le multijoueur peut intercepter l'appel.
---Source : lua/ge/spawn.lua:810
---@param veh table|nil Véhicule (joueur 0 par défaut).
---@param options table|nil destinationPos (vec3 : oriente le véhicule vers cette destination), resetVehicle (boolean), unlimitedSafeSpawnRange (boolean).
function spawn.teleportToLastRoad(veh, options) end

--- Callback de teleportToLastRoad, exécuté côté GE avec les points de récupération du véhicule. Parcourt les points du plus récent au plus ancien, retient le premier proche d'une route (distance <= rayon moyen), le projette sur l'arête, choisit le côté légal (règles map.getRoadRules) et la direction, puis appelle safeTeleport. Sans point valide, cherche la route la plus proche (< 50 m), sinon garde la position actuelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/spawn.lua:701
---@param data table|nil File de points de récupération {head, tail, [i] = {pos = vec3, ...}}.
---@param options table Mêmes options que teleportToLastRoad.
---@param vehId integer|nil Id du véhicule (joueur 0 par défaut).
function spawn.teleportToLastRoadCallback(data, options, vehId) end

