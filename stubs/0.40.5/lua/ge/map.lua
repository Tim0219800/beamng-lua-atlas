---@meta
-- tim19Atlas stub generated from lua/ge/map.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Graphe routier (navgraph) du niveau côté Game Engine. Il construit le graphe de nœuds et d'arêtes à partir des routes décalques (DecalRoad), des waypoints de la scène et du fichier map.json du niveau, fusionne les nœuds proches, calcule les limites de vitesse, puis envoie le graphe aux VM véhicules (mailbox "mapData", lu par mapmgr.lua). Un moddeur s'en sert pour chercher la route la plus proche (findClosestRoad), calculer un chemin (getPath, getPointToPointPath), lire la structure du graphe (getMap) et lire l'état des véhicules suivis (getTrackedObjects). Il reçoit aussi chaque frame les données des véhicules (objectData) et les redistribue.
--- Accès : globale `map`
---@class map
---@field drawNavGraphState string 'off' ou 'on' selon que le dessin debug du navgraph est actif (toggleDrawNavGraph).
---@field objectNames table<string, integer> Association nom -> id d'objet, remplie par setNameForId. getState() copie le nom dans objects[id].name.
---@field objects table<integer, table> Véhicules suivis cette frame (clé = id d'objet). Rempli par objectData/tempObjectData, vidé quand plus aucune donnée n'arrive. Même table que getTrackedObjects().
map = {}

--- Charge la carte routière si elle n'est pas encore chargée (loadMap), puis remet loadedMap à false pour qu'un prochain map.load() recharge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3667
function map.assureLoad() end

--- Vide la liste des zones d'exclusion de trafic (table.clear). Ne reconstruit pas le graphe : il faut appeler map.reset() pour que ça prenne effet.
---Source : lua/ge/map.lua:3955
function map.clearTrafficExclusionZones() end

--- Calcule l'ensemble des noeuds exclus à partir des zones données (noeuds dans chaque rayon, puis élargissement le long des routes sans issue), marque les arêtes internes comme type 'private' et les arêtes frontière comme 'gated' (coût +10000). Appelée par loadMap avec les zones enregistrées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:2370
---@param trafficExlusionZones table<integer, {pos: vec3, radius: number}> Liste de zones circulaires.
function map.createTrafficExclusionArea(trafficExlusionZones) end

--- Active (trajectoire donnée) ou désactive (nil) le dessin debug d'une trajectoire issue de optimizePath (sphères, normales, forces, cylindres).
---Source : lua/ge/map.lua:3430
---@param trajectory table|nil Résultat de map.optimizePath, ou nil pour arrêter le dessin.
function map.debugDrawTrajectory(trajectory) end

--- Cherche la route la plus adaptée à une position et une direction : parmi les arêtes à moins de 20 m dont la position tombe dans la largeur de la route, choisit celle dont l'axe est le plus aligné avec dir. Retombe sur findClosestRoad s'il n'y a aucun candidat.
---Source : lua/ge/map.lua:2732
---@param pos vec3 Position à projeter (m).
---@param dir vec3 Direction normalisée (par ex. direction du véhicule).
---@return string|nil  Id du premier noeud de l'arête.
---@return string|nil  Id du second noeud.
---@return number|nil  Distance de pos au segment (m).
function map.findBestRoad(pos, dir) end

--- Trouve l'arête (segment de route) la plus proche de pos et renvoie ses deux noeuds et la distance. La recherche part d'un rayon min(maxRadius, searchRadiusLim) et le double jusqu'à trouver une arête ou dépasser searchRadiusLim. La distance est calculée au segment central, sans tenir compte de la largeur.
---Source : lua/ge/map.lua:2706
---@param pos vec3 Position (m). Seuls x et y servent à la recherche dans le kd-tree, la distance est 3D.
---@param searchRadiusLim number|nil Rayon de recherche maximal en m (200 par défaut).
---@return string|nil  Id du noeud 1 de l'arête (nil si rien trouvé ou graphe non construit).
---@return string|nil  Id du noeud 2.
---@return number  Distance à l'arête en m (valeur non significative si aucun noeud n'est trouvé).
function map.findClosestRoad(pos, searchRadiusLim) end

--- Renvoie l'objet Graphpath interne (gp) : graphe bidirectionnel avec gp.graph[a][b] (arêtes), gp.positions, gp.radius et les méthodes de plus court chemin. nil avant le chargement.
---Source : lua/ge/map.lua:3816
---@return table|nil  Instance Graphpath.
function map.getGraphpath() end

--- Renvoie la table des waypoints manuels (BeamNGWaypoint de la scène) : nom -> {pos, radius, ...}, avec la valeur 1 pour les entrées déjà traitées après le chargement.
---Source : lua/ge/map.lua:3820
---@return table  Table des waypoints manuels.
function map.getManualWaypoints() end

--- Renvoie la table du graphe routier : {nodes = ..., nodeAliases = ..., buildSerial = ...}. Voir les notes pour le détail des noeuds et arêtes. Ne pas modifier : la table est partagée.
---Source : lua/ge/map.lua:3812
---@return table  Table map (nodes, nodeAliases, buildSerial).
function map.getMap() end

--- Nombre d'arêtes reliées à un noeud dans le graphe bidirectionnel.
---Source : lua/ge/map.lua:2150
---@param nId string Id du noeud.
---@return integer  Nombre de liens, ou -1 si le graphe n'existe pas ou que le noeud est inconnu.
function map.getNodeLinkCount(nId) end

--- Parcourt un chemin sur une distance donnée (somme des distances entre noeuds consécutifs) et renvoie le segment atteint et la position relative dans ce segment.
---Source : lua/ge/map.lua:2801
---@param path string[] Chemin (liste d'ids de noeuds), au moins 2 noeuds.
---@param dist number|nil Distance à parcourir en m ; nil = jusqu'à la fin.
---@return string|nil  Noeud de début du segment (nil si le chemin est invalide).
---@return string|nil  Noeud de fin du segment.
---@return number|nil  xnorm entre 0 et 1 : position le long du segment. Vaut 1 si dist dépasse la longueur du chemin.
function map.getNodesFromPathDist(path, dist) end

--- Renvoie les ids des noeuds du graphe situés dans le rayon d'au moins une des zones données (un noeud peut apparaître plusieurs fois s'il est dans plusieurs zones).
---Source : lua/ge/map.lua:2353
---@param trafficExlusionZones table<integer, {pos: vec3, radius: number}> Liste de zones circulaires.
---@return string[]  Ids de noeuds.
function map.getNodesNearPositions(trafficExlusionZones) end

--- Plus court chemin entre deux noeuds (Dijkstra sur Graphpath:getFilteredPath). Le coût d'une arête = len x pénalité de sens x pénalité de praticabilité.
---Source : lua/ge/map.lua:2774
---@param start string Id du noeud de départ.
---@param target string Id du noeud d'arrivée.
---@param cutOffDrivability number|nil Seuil de praticabilité (0 par défaut) : les arêtes avec drivability <= seuil sont pénalisées par penaltyBelowCutoff.
---@param dirMult number|nil Multiplicateur de coût pour une arête à sens unique prise à contresens (1 ou nil = pas de pénalité ; valeurs raisonnables 1e3 à 1e4).
---@param penaltyAboveCutoff number|nil Multiplicateur pour les routes au-dessus du seuil (1 par défaut).
---@param penaltyBelowCutoff number|nil Multiplicateur pour les routes sous le seuil (10000 par défaut).
---@return string[]  Liste d'ids de noeuds du départ à l'arrivée ; {} si le graphe ou un des noeuds n'existe pas.
function map.getPath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff) end

--- Longueur totale d'un chemin (somme des distances 3D entre les positions des noeuds).
---Source : lua/ge/map.lua:2824
---@param path string[] Liste d'ids de noeuds.
---@return number  Longueur en m (0 si le chemin ou la carte manque).
function map.getPathLen(path) end

--- Plus court chemin entre un point libre et un noeud (ou inversement). L'un des deux arguments doit être un nom de noeud, l'autre un vec3.
---Source : lua/ge/map.lua:2787
---@param start string|vec3 Départ : id de noeud ou position.
---@param target string|vec3 Arrivée : id de noeud ou position.
---@param cutOffDrivability number|nil Voir getPath.
---@param dirMult number|nil Voir getPath.
---@param penaltyAboveCutoff number|nil Voir getPath.
---@param penaltyBelowCutoff number|nil Voir getPath.
---@param wZ number|nil Poids de la hauteur dans la distance ; au-dessus de 1, minimise davantage l'écart en z qu'en x/y.
---@return string[]  Chemin en ids de noeuds ; {} si le graphe n'est pas chargé.
function map.getPointNodePath(start, target, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wZ) end

--- Plus court chemin entre deux positions libres : la fonction relie chaque position aux arêtes proches (itérateur startPosLinks, jusqu'à 2000 m) puis lance la recherche.
---Source : lua/ge/map.lua:2909
---@param startPos vec3 Position de départ.
---@param targetPos vec3 Position d'arrivée.
---@param cutOffDrivability number|nil Voir getPath.
---@param dirMult number|nil Voir getPath (typiquement >= 10e4).
---@param penaltyAboveCutoff number|nil Voir getPath.
---@param penaltyBelowCutoff number|nil Voir getPath.
---@param wD any Obsolète, ignoré (gardé pour compatibilité).
---@param wZ number|nil Poids de l'écart de hauteur (4 par défaut).
---@return table  Chemin ; {} si le graphe n'est pas chargé.
function map.getPointToPointPath(startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Même chose que getPointToPointPath mais s'exécute dans un job coroutine (permet de rendre la main entre les étapes).
---Source : lua/ge/map.lua:2926
---@param job table Objet job courant (coroutine du système de jobs).
---@param startPos vec3 Position de départ.
---@param targetPos vec3 Position d'arrivée.
---@param cutOffDrivability number|nil Voir getPath.
---@param dirMult number|nil Voir getPath.
---@param penaltyAboveCutoff number|nil Voir getPath.
---@param penaltyBelowCutoff number|nil Voir getPath.
---@param wD any Obsolète, ignoré.
---@param wZ number|nil Poids de l'écart de hauteur (4 par défaut).
---@return table  Chemin ; {} si le graphe n'est pas chargé.
function map.getPointToPointPathJob(job, startPos, targetPos, cutOffDrivability, dirMult, penaltyAboveCutoff, penaltyBelowCutoff, wD, wZ) end

--- Renvoie les règles de conduite du niveau : {rightHandDrive = false, turnOnRed = false} fusionnées avec le champ roadRules du fichier info du niveau. Renvoie {} tant que la carte n'a pas été chargée.
---Source : lua/ge/map.lua:157
---@return table  Règles (rightHandDrive, turnOnRed, ...).
function map.getRoadRules() end

--- Met à jour le nom et la plaque (licensePlate) de chaque objet suivi puis renvoie tout le module M (objets, noms, etc.). Sert au transfert d'état.
---Source : lua/ge/map.lua:3796
---@return table  Le module map lui-même.
function map.getState() end

--- Renvoie map.objects : les véhicules dont les données sont arrivées cette frame (id -> {pos, vel, dirVec, dirVecUp, active, damage, states, ...}).
---Source : lua/ge/map.lua:3824
---@return table<integer, table>  Objets suivis.
function map.getTrackedObjects() end

--- Renvoie la liste courante des zones d'exclusion de trafic (nom avec faute de frappe conservé).
---Source : lua/ge/map.lua:3950
---@return table  Liste de {pos, radius}.
function map.getTrafficExlucsionZones() end

--- Estime si un objet en mouvement peut s'arrêter avant d'atteindre une position (distance de freinage calculée avec la gravité, un frottement de 0.5 et la pente). Sert à décider si on peut faire apparaître quelque chose à cet endroit.
---Source : lua/ge/map.lua:3913
---@param objectID integer Id du véhicule en mouvement.
---@param pos vec3 Position du point à protéger.
---@param radius number|nil Rayon de sécurité en m (7.5 par défaut).
---@return boolean  true si c'est sûr (objet introuvable, plus de 150 m, ou distance suffisante pour freiner).
function map.isCrashAvoidable(objectID, pos, radius) end

--- Charge la carte une seule fois (garde loadedMap) en appelant loadMap().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3661
function map.load() end

--- Écrit dans le log les empreintes SHA256 des noeuds et des arêtes (debug du déterminisme de la construction du graphe).
---Source : lua/ge/map.lua:501
function map.logGraphHashes() end

--- Fabrique un nom de noeud unique : prefix..idx, ou prefix..idx.._N si ce nom existe déjà dans map.nodes.
---Source : lua/ge/map.lua:135
---@param prefix string Préfixe du nom.
---@param idx integer Numéro.
---@return string  Nom libre.
function map.nameNode(prefix, idx) end

--- Reçoit chaque frame les données d'un véhicule (envoyées par la VM véhicule) et les enregistre dans map.objects avec position, vitesse et direction lues sur l'objet. Ignoré si l'objet est déjà enregistré cette frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3829
---@param objId integer Id du véhicule.
---@param isactive boolean Véhicule actif.
---@param damage number Niveau de dégâts.
---@param states table|nil États du véhicule (table vide partagée si nil).
---@param objectCollisions table|nil Collisions avec d'autres objets.
function map.objectData(objId, isactive, damage, states, objectCollisions) end

--- Hook appelé quand un waypoint est ajouté à la scène. Si l'éditeur est actif (setEditorState), recharge la carte après 0.5 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3708
---@param wp any Waypoint ajouté (non utilisé).
function map.onAddWaypoint(wp) end

--- Restaure isEditorEnabled et buildSerial après un rechargement du Lua GE (voir note sur le nom du hook).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3783
---@param s table Table produite par onSerialize : {isEditorEnabled, buildSerial}.
function map.onDeserialize(s) end

--- Hook appelé quand des fichiers changent sur disque. Si le fichier map.json de la carte est concerné, recharge le graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3729
---@param files table[] Liste d'entrées avec un champ filename.
function map.onFilesChanged(files) end

--- Hook appelé quand un niveau est chargé : remet loadedMap à false pour autoriser le prochain map.load().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3674
function map.onMissionLoaded() end

--- Hook appelé quand un waypoint est modifié. Si l'éditeur est actif, recharge la carte après 0.5 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3722
---@param wp any Waypoint modifié (non utilisé).
function map.onModifiedWaypoint(wp) end

--- Hook appelé quand un waypoint est retiré. Si l'éditeur est actif, recharge la carte après 0.5 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3715
---@param wp any Waypoint retiré (non utilisé).
function map.onRemoveWaypoint(wp) end

--- Renvoie {isEditorEnabled, buildSerial} pour sauvegarder l'état avant un rechargement du Lua GE.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3779
---@return table  Tableau {isEditorEnabled, buildSerial}.
function map.onSerialize() end

--- Hook appelé quand un véhicule déclenche un waypoint. Le corps est entièrement commenté : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3678
---@param args table Données du déclencheur (subjectName, triggerName, event, mode) ; non utilisées.
function map.onWaypoint(args) end

--- Lisse un chemin pour obtenir une trajectoire plus fluide : chaque point est déplacé par itérations de « curvature flow » (réduction de l'énergie de courbure) en restant dans la largeur de la route. Renvoie la trajectoire ou nil si le chemin a moins de 2 points.
---Source : lua/ge/map.lua:3309
---@param path string[]|table[] Liste d'ids de noeuds, ou (avec useRawPos) liste de {pos = vec3, radius = number}.
---@param s table Réglages : segDistSplitLim, fixPathNodes, fixEndpoints, evolvePathNormals, evolveMidNormals, evolveEndNormals, hta (0.1 m par itération par défaut), fRange (1), forceMag ('angle' par défaut ou 'curvature'), forceScale, forceMultiplier (2), iterations (120), distFromEdge (1 m), dispLimFromCenterAbs, dispLimFromCenterRel, logData, logTrajectory, tolFactor (0).
---@param useRawPos boolean|nil true si path contient des {pos, radius} au lieu d'ids de noeuds.
---@return table|nil  Trajectoire : liste de points avec pos, posOrig, normal, halfWidth, force… et trajectory.converged / trajectory.energy.
function map.optimizePath(path, s, useRawPos) end

--- Appelée par une VM véhicule pour demander le graphe : si son numéro de version (buildSerial) diffère, lui envoie mapmgr.setMap(buildSerial) et l'état des feux (mapmgr.setSignals) s'il y en a.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3739
---@param objId integer Id du véhicule demandeur.
---@param objbuildSerial integer Numéro de version du graphe connu du véhicule.
function map.request(objId, objbuildSerial) end

--- Reconstruit entièrement le graphe routier (loadMap) : lit les routes et waypoints, fusionne, calcule limites de vitesse et praticabilité, construit les arbres de recherche, envoie le graphe aux véhicules et émet onNavgraphReloaded. Peut être lent.
---Source : lua/ge/map.lua:2511
---@param customMapNodes table|nil Table de noeuds prête à l'emploi (même format que map.nodes, double face) qui remplace la lecture des routes de la scène.
function map.reset(customMapNodes) end

--- Enveloppe de spawn.safeTeleport pour l'appeler depuis une VM véhicule avec des nombres seuls : téléporte un véhicule à un endroit sans collision.
---Source : lua/ge/map.lua:3941
---@param vehId integer|string Id ou nom du véhicule (passé à scenetree.findObject).
---@param posX number Position x (m).
---@param posY number Position y (m).
---@param posZ number Position z (m).
---@param rotX number Quaternion x.
---@param rotY number Quaternion y.
---@param rotZ number Quaternion z.
---@param rotW number Quaternion w.
---@param checkOnlyStatics_ boolean|nil Ne tester que les objets statiques (ignorer les autres véhicules).
---@param visibilityPoint_ vec3|nil Point à partir duquel la place trouvée ne doit pas être visible.
---@param removeTraffic_ boolean|nil Écarter les véhicules de trafic de la zone.
---@param centeredPosition boolean|nil true si pos est le centre de la boîte du véhicule et non son noeud de référence.
---@param resetVehicle boolean|nil Réinitialiser le véhicule (true par défaut dans spawn.safeTeleport).
function map.safeTeleport(vehId, posX, posY, posZ, rotX, rotY, rotZ, rotW, checkOnlyStatics_, visibilityPoint_, removeTraffic_, centeredPosition, resetVehicle) end

--- Exporte le graphe routier au format SVG (arêtes et, au choix, noeuds), avec des coordonnées relatives à la position du terrain.
---Source : lua/ge/map.lua:2933
---@param filename string Chemin du fichier SVG.
---@param includeLinks boolean|nil Dessiner les arêtes (true par défaut).
---@param includeNodes boolean|nil Dessiner les noeuds (false par défaut).
function map.saveSVG(filename, includeLinks, includeNodes) end

--- Indique si l'éditeur est actif ; permet le rechargement automatique de la carte quand un waypoint change.
---Source : lua/ge/map.lua:3788
---@param enabled boolean true si l'éditeur est ouvert.
function map.setEditorState(enabled) end

--- Associe un nom à un id d'objet dans map.objectNames.
---Source : lua/ge/map.lua:3909
---@param name string Nom.
---@param id integer Id d'objet.
function map.setNameForId(name, id) end

--- Fusionne une table dans le module (tableMerge(M, newState)). Sert à restaurer l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3792
---@param newState table Champs à copier dans map.
function map.setState(newState) end

--- Remplace les zones d'exclusion de trafic par la table donnée (erreur loguée si ce n'est pas une table). Le graphe n'est pas reconstruit ici : l'effet s'applique au prochain map.reset().
---Source : lua/ge/map.lua:3960
---@param zones table<integer, {pos: vec3, radius: number}> Liste de zones circulaires.
function map.setTrafficExclusionZones(zones) end

--- Estime la normale du sol au point p en lançant trois rayons verticaux (be:getSurfaceHeightBelow) autour de p à une distance r ; fiable jusqu'à environ 50 degrés de pente.
---Source : lua/ge/map.lua:506
---@param p vec3 Point (m).
---@param r number|nil Rayon d'échantillonnage en m (2 par défaut).
---@return vec3  Normale unitaire.
function map.surfaceNormal(p, r) end

--- Version de objectData où l'appelant fournit lui-même position, vitesse et directions (objet virtuel ou sans VM). Enregistre l'objet dans map.objects.
---Source : lua/ge/map.lua:3868
---@param objId integer Id de l'objet.
---@param isactive boolean Objet actif.
---@param pos vec3 Position.
---@param vel vec3 Vitesse.
---@param dirVec vec3 Direction avant.
---@param dirVecUp vec3 Direction haut.
---@param damage number Dégâts.
---@param objectCollisions table|nil Collisions.
function map.tempObjectData(objId, isactive, pos, vel, dirVec, dirVecUp, damage, objectCollisions) end

--- Active/désactive le dessin debug (sphères rouges) des noeuds exclus du trafic.
---Source : lua/ge/map.lua:2483
function map.toggleDrawExcludeSet() end

--- Active/désactive le dessin debug (sphères blanches) des noeuds initiaux des zones d'exclusion.
---Source : lua/ge/map.lua:2502
function map.toggleDrawInitialExcludeSet() end

--- Active/désactive le dessin debug du graphe routier à l'écran et met à jour drawNavGraphState.
---Source : lua/ge/map.lua:3632
function map.toggleDrawNavGraph() end

--- Debug du déterminisme de construction du graphe : remplace pairs par shuffledPairs (ordre d'itération aléatoire) ou l'inverse.
---Source : lua/ge/map.lua:48
---@param mode string|nil 'shuffledPairs' ou 'pairs' ; nil = bascule.
function map.toggleShuffledPairs(mode) end

--- Change dynamiquement la praticabilité d'arêtes : recalcule le coût (len) de chaque arête, puis envoie la modification aux VM véhicules (mailbox updateDrivabilities et mapmgr.updateDrivabilities()). Ne fait rien si la taille n'est pas multiple de 3.
---Source : lua/ge/map.lua:3752
---@param changeSet table Liste plate {nodeA1, nodeB1, drivabilité1, nodeA2, nodeB2, drivabilité2, ...}. L'arête est cherchée dans le sens nodeA -> nodeB du graphe bidirectionnel. La drivabilité est limitée à 1e-30 minimum.
function map.updateDrivabilities(changeSet) end

--- Appelée chaque frame par la boucle principale : si le temps de simulation avance, envoie la table des objets aux VM véhicules (mailbox objUpdate), traite le rechargement différé (éditeur) et dessine les overlays debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:3645
---@param dtReal number Durée réelle de la frame (s).
---@param dtSim number Durée simulée de la frame (s) ; 0 en pause.
function map.updateGFX(dtReal, dtSim) end

--- Minuteur interne à usage unique (non exporté, delayedLoad en est l'instance) servant à recharger la carte 0.5 s après une modification de waypoint dans l'éditeur.
---@class map_singleEventTimer
local map_singleEventTimer = {}

--- Programme l'appel de eventFun(...) après dt secondes. NB : la page automatique indique (eventFun, ...) mais la signature réelle est (dt, eventFun, ...).
---Source : lua/ge/map.lua:122
---@param dt number Délai en s.
---@param eventFun function Fonction à appeler.
---@param ... any Arguments passés à eventFun.
function map_singleEventTimer:callAfter(dt, eventFun, ...) end

--- Décompte le délai ; à zéro appelle eventFun une seule fois. Appelé chaque frame par updateGFX avec dtReal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/map.lua:113
---@param dt number Temps réel écoulé (s).
function map_singleEventTimer:update(dt) end

