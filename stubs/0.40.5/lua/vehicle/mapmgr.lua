---@meta
-- tim19Atlas stub generated from lua/vehicle/mapmgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le véhicule et la carte routière (navgraph) du jeu. Il reçoit la carte du Lua du jeu (GE) par boîte aux lettres (mailbox), la décode en graphe (graphpath) et arbre spatial (kd-tree des arêtes), et fournit à l'IA et aux extensions : recherche de la route la plus proche (findClosestRoad, findBestRoad), chemin point à point (getPointToPointPath), normale de surface (surfaceNormalBelow), objets proches (getObjects) et signaux de circulation. Il envoie aussi chaque frame au GE l'état du véhicule (map.objectData : joueur assis, dégâts, klaxon, feux, collisions) via sendTracking.
--- Accès : globale `mapmgr`
---@class mapmgr
---@field objectCollisionIds table Ids des objets en collision avec ce véhicule, rafraîchi à chaque sendTracking.
---@field objects table Objets proches décodés depuis la mailbox 'objUpdate' (rempli par getObjects ; remis à {} par reset).
---@field sendTracking function nop tant que le suivi n'est pas activé (enableTracking), puis la fonction d'envoi d'état au GE. Appelée à chaque frame par main.lua.
mapmgr = {}

--- Supprime la carte personnalisée si elle était active (mapData remis à nil).
---Source : lua/vehicle/mapmgr.lua:79
function mapmgr.clearCustomMap() end

--- Désactive l'envoi d'état (sendTracking = nop) si forceDisable ou si aucun joueur n'est assis.
---Source : lua/vehicle/mapmgr.lua:163
---@param forceDisable boolean|nil true pour désactiver même si un joueur est assis.
function mapmgr.disableTracking(forceDisable) end

--- Active l'envoi d'état au GE : associe un nom d'objet à l'id (map.setNameForId) et installe sendTracking.
---Source : lua/vehicle/mapmgr.lua:158
---@param name string|nil Nom du véhicule dans la carte ; l'id du véhicule si nil.
function mapmgr.enableTracking(name) end

--- Trouve l'arête de route la plus pertinente selon la position ET la direction (alignement, sens unique, barrières), avec repli sur findClosestRoad.
---Source : lua/vehicle/mapmgr.lua:271
---@param pos vec3|nil Position ; celle du véhicule si nil.
---@param dir vec3|nil Direction ; celle du véhicule si nil.
---@param wZ number|nil Poids de la différence de hauteur.
---@return any  Premier noeud de l'arête.
---@return any  Second noeud de l'arête.
---@return number  Distance en mètres.
function mapmgr.findBestRoad(pos, dir, wZ) end

--- Trouve l'arête de route la plus proche d'une position (distance au segment avec biais de hauteur wZ). Nécessite que la carte soit chargée.
---Source : lua/vehicle/mapmgr.lua:241
---@param pos vec3|nil Position ; celle du véhicule si nil.
---@param wZ number|nil Poids de la différence de hauteur (1.85 par défaut).
---@return any  Identifiant du premier noeud de l'arête (nil si rien trouvé à moins de 200 m).
---@return any  Identifiant du second noeud de l'arête.
---@return number  Distance à l'arête en mètres.
function mapmgr.findClosestRoad(pos, wZ) end

--- Renvoie la table des objets proches (mailbox 'objUpdate'), décodée au plus une fois par instant de simulation.
---Source : lua/vehicle/mapmgr.lua:179
---@return table  M.objects (partagée, ne pas conserver entre frames).
function mapmgr.getObjects() end

--- Calcule un chemin sur le navgraph entre deux positions (le point de départ et la cible sont rattachés aux arêtes proches). Renvoie {} si la carte n'est pas chargée.
---Source : lua/vehicle/mapmgr.lua:379
---@param startPos vec3 Position de départ.
---@param targetPos vec3 Position cible.
---@param cutOffDrivability number|nil Les routes de drivabilité inférieure ou égale sont pénalisées.
---@param dirMult number|nil Pénalité si le chemin ne respecte pas les sens légaux (> 1, typiquement >= 1e4) ; nil ou 1 = aucune.
---@param penaltyAboveCutoff number|nil Multiplicateur de coût au-dessus du seuil de drivabilité.
---@param penaltyBelowCutoff number|nil Multiplicateur de coût sous le seuil.
---@param wZ number|nil Biais de hauteur (4 par défaut) pour choisir le noeud d'arrivée.
---@return table  Liste des noeuds du chemin (format graphpath), {} si impossible.
function mapmgr.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Active le suivi vers le GE si le véhicule a des roues ou general.enableTracking. Appelée par main.lua (initSystems, dernière étape).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/mapmgr.lua:173
function mapmgr.init() end

--- Demande au GE d'envoyer la carte (map.request(id, serial de la carte actuelle)).
---Source : lua/vehicle/mapmgr.lua:68
function mapmgr.requestMap() end

--- Vide la liste d'objets M.objects au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/mapmgr.lua:169
function mapmgr.reset() end

--- Remplace la carte par un graphe fourni (outil/scénario) et oublie le numéro de build.
---Source : lua/vehicle/mapmgr.lua:72
---@param map table Graphe au format graphpath.
function mapmgr.setCustomMap(map) end

--- Charge la carte depuis la mailbox 'mapData' : construit le graphe, le kd-tree des arêtes, les règles et alias, applique les drivabilités puis notifie le GE par le hook onVehicleMapmgrUpdate. Ne fait rien si le numéro de build est déjà celui chargé ou si les données sont incomplètes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/mapmgr.lua:45
---@param newbuildSerial number|nil Numéro de build de la carte annoncée ; ignoré s'il est identique à celui déjà chargé.
function mapmgr.setMap(newbuildSerial) end

--- Définit la table des signaux de circulation (M.signalsData).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/mapmgr.lua:87
---@param data table Signaux indexés [groupe][?][?] avec un champ action.
function mapmgr.setSignals(data) end

--- Calcule la normale de la surface sous un point en échantillonnant la hauteur du sol en 3 points d'un triangle de rayon r autour de p (obj:getSurfaceHeightBelow). Précis jusqu'à environ 50° de pente ; renvoie (0,0,1) si le terrain est trop bas/irrégulier. Écrit le résultat dans v sans allocation.
---Source : lua/vehicle/mapmgr.lua:194
---@param v vec3 Vecteur de sortie (modifié ; utilisé aussi comme point d'échantillon temporaire).
---@param p vec3 Point au-dessus de la surface.
---@param r number|nil Rayon d'échantillonnage en mètres (2 par défaut).
function mapmgr.setSurfaceNormalBelow(v, p, r) end

--- Version allouante de setSurfaceNormalBelow : renvoie un nouveau vec3.
---Source : lua/vehicle/mapmgr.lua:226
---@param p vec3 Point au-dessus de la surface.
---@param r number|nil Rayon d'échantillonnage (2 par défaut).
---@return vec3  Normale unitaire de la surface.
function mapmgr.surfaceNormalBelow(p, r) end

--- Applique au graphe les changements de drivabilité reçus par la mailbox 'updateDrivabilities' ; ne fait rien si la mailbox est vide ou sans graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/mapmgr.lua:21
function mapmgr.updateDrivabilities() end

--- Met à jour l'action des signaux d'après un lot {clé1, clé2, clé3, action, …} (par groupes de 4).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/mapmgr.lua:91
---@param data table|nil Liste plate de mises à jour.
function mapmgr.updateSignals(data) end

