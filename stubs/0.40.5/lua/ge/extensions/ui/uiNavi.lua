---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiNavi.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Back-end Lua de la carte de navigation de l'interface (minimap, GPS). Il envoie à l'UI les positions des véhicules suivis, les points d'intérêt, les missions et les nœuds routiers de la carte, et gère un itinéraire simple (marqueurs au sol via core_groundMarkers). Il sert aussi à alimenter la texture JS d'un tableau de bord de véhicule avec la carte.
--- Accès : extension `ui_uiNavi` : `extensions.load("ui_uiNavi")`, puis la globale `ui_uiNavi`
---@class ui_uiNavi
ui_uiNavi = {}

--- Renvoie le résultat de map.findClosestRoad pour le point (x, y, z) : les informations sur le segment de route le plus proche.
---Source : lua/ge/extensions/ui/uiNavi.lua:9
---@param x number Coordonnée X monde.
---@param y number Coordonnée Y monde.
---@param z number Coordonnée Z monde.
---@return any  Résultat de map.findClosestRoad (déduit du code).
function ui_uiNavi.findClosestRoad(x, y, z) end

--- Liste les arrêts de bus (BeamNGTrigger de type 'busstop'). Les arrêts distants de moins de 70 m (de part et d'autre de la route) sont fusionnés en un point au milieu.
---Source : lua/ge/extensions/ui/uiNavi.lua:183
---@return table[]  Liste de {pos = {x,y,z}}.
function ui_uiNavi.getBusStops() end

--- Renvoie la table des missions actuellement stockée (vide au départ ; les exemples sont commentés dans le code).
---Source : lua/ge/extensions/ui/uiNavi.lua:119
---@return table  Liste de missions (pos, desc, title, state, new, objectives, type).
function ui_uiNavi.getMissions() end

--- Renvoie les objets du PointOfInterestSet de la scène sous forme de liste {name, pos, desc, title, type}.
---Source : lua/ge/extensions/ui/uiNavi.lua:44
---@return table[]|nil  nil si l'ensemble PointOfInterestSet n'existe pas.
function ui_uiNavi.getPointsOfInterest() end

--- Liste les objets SpawnSphere de la scène avec leur position ({x,y,z} en table). Si le fichier de mission du niveau existe et contient `spawnPoints`, les informations additionnelles (indexées par objectname) sont fusionnées dans chaque entrée.
---Source : lua/ge/extensions/ui/uiNavi.lua:13
---@return table[]  Liste d'entrées contenant au moins `pos`.
function ui_uiNavi.getSpawnpoints() end

--- Hook appelé au chargement de l'extension : envoie un 'RouteUpdate' vide à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiNavi.lua:453
function ui_uiNavi.onExtensionLoaded() end

--- Hook appelé à chaque frame GUI. Rassemble les objets suivis par la carte (uiState ~= 0) avec position, cap en degrés, vitesse et état, puis envoie 'NavigationMapUpdate' ({controlID, objects}) à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiNavi.lua:228
---@param dtReal number Durée réelle de la frame (s).
---@param dtSim number Durée simulée de la frame (s).
---@param dtRaw number Durée brute de la frame (s).
function ui_uiNavi.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé au changement de véhicule contrôlé. Le corps est entièrement commenté : ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/uiNavi.lua:437
---@param oid integer Ancien id de véhicule.
---@param nid integer Nouvel id de véhicule.
function ui_uiNavi.onVehicleSwitched(oid, nid) end

--- Outil de développement : calcule le chemin entre deux positions via map.getPath et l'envoie à l'UI par 'RoutePlanned'.
---Source : lua/ge/extensions/ui/uiNavi.lua:172
---@param posX number[] Point de départ {x, y, z}.
---@param posY number[] Point d'arrivée {x, y, z}.
function ui_uiNavi.planRoute(posX, posY) end

--- Envoie la liste des missions courante à l'UI par l'évènement 'MapMissions'.
---Source : lua/ge/extensions/ui/uiNavi.lua:123
function ui_uiNavi.requestMissions() end

--- Envoie les points d'intérêt à l'UI par l'évènement 'MapPointsOfInterest'.
---Source : lua/ge/extensions/ui/uiNavi.lua:60
function ui_uiNavi.requestPoi() end

--- Construit les données de la carte (tuiles de terrain du niveau courant, points d'intérêt, nœuds routiers) et les envoie à l'UI par 'NavigationMap'. Si le niveau n'a pas de minimap, elle est générée depuis le TerrainBlock. Remplit aussi les anciens champs (terrainSize, minimapImage, squareSize, terrainOffset) pour les mods d'ancien format.
---Source : lua/ge/extensions/ui/uiNavi.lua:386
---@return table  Les données envoyées (terrainTiles, poi, nodes, ...).
function ui_uiNavi.requestUIDashboardMap() end

--- Envoie la carte à la texture JS d'un tableau de bord de véhicule (queueJSUITexture) en appelant la fonction JS `initmap` avec les données en JSON (nœuds, heure HH:MM, tuiles de terrain). Ne fait rien en mode headless, sans niveau chargé ou sans `dashboard`.
---Source : lua/ge/extensions/ui/uiNavi.lua:411
---@param dashboard string Nom de la texture JS cible.
---@param initmap string|nil Fonction JS à appeler, par défaut 'map.setData'.
---@param vehId integer|nil Id du véhicule cible, sinon le véhicule du joueur 0.
function ui_uiNavi.requestVehicleDashboardMap(dashboard, initmap, vehId) end

--- Termine l'itinéraire : efface la destination, supprime le chemin au sol et envoie 'RouteUpdate' (table vide) puis 'RouteEnded' à l'UI.
---Source : lua/ge/extensions/ui/uiNavi.lua:145
function ui_uiNavi.route_end() end

--- Met à jour l'itinéraire en cours (fonction locale route_update). Sans itinéraire, ne fait rien. Si la position a bougé de plus de 0,1 m, recalcule le chemin, envoie 'RouteUpdate' ; à moins de 50 m de la destination, envoie 'RouteReachedDestination' et termine l'itinéraire.
---Source : lua/ge/extensions/ui/uiNavi.lua:158
---@param oldPos vec3 Position précédente du joueur.
---@param newPos vec3 Position actuelle du joueur.
function ui_uiNavi.route_requestStatus(oldPos, newPos) end

--- Démarre un itinéraire : appelle core_groundMarkers.setPath(wp) et mémorise la destination et sa position. Le code note que le multi-sièges ne rend le chemin que pour le dernier joueur.
---Source : lua/ge/extensions/ui/uiNavi.lua:139
---@param wp any Destination (nom de waypoint de la carte), transmise à core_groundMarkers.setPath et à map.getPath.
---@param pos number[] Position {x, y, z} de la destination.
function ui_uiNavi.route_start(wp, pos) end

--- Remplace la liste des missions et l'envoie aussitôt à l'UI via 'MapMissions'.
---Source : lua/ge/extensions/ui/uiNavi.lua:127
---@param m table Nouvelle liste de missions.
function ui_uiNavi.setMissions(m) end

