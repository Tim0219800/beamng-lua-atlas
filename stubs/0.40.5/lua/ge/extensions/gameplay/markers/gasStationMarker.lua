---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/gasStationMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de station-service (carburant ou recharge électrique) en mode jeu. Pour chaque pompe (paire de noms d'objets de scène : zone, icône), il crée une icône (poi_fuel_round, ou poi_charge_round pour une station électrique) qui apparaît quand le véhicule du joueur, roulant doucement, chevauche la zone de la pompe (test OBB/OBB), et rend la station interactive. Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_gasStationMarker` : `extensions.load("gameplay_markers_gasStationMarker")`, puis la globale `gameplay_markers_gasStationMarker`
---@class gameplay_markers_gasStationMarker
gameplay_markers_gasStationMarker = {}

--- Transforme chaque POI gasStationMarker en un cluster distinct (pas de fusion) et l'ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:233
---@param pois table[] POI avec markerInfo.gasStationMarker.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_gasStationMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur de station-service (instance de C).
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:224
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_gasStationMarker.create(...) end

--- Marqueur de station-service avec une icône par pompe.
---@class gameplay_markers_gasStationMarker_C
local gameplay_markers_gasStationMarker_C = {}

--- Retire les icônes de l'icon renderer et efface la liste des pompes.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:135
function gameplay_markers_gasStationMarker_C:clearObjects() end

--- Nettoie les objets existants (n'en crée pas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:113
function gameplay_markers_gasStationMarker_C:createObjects() end

--- Dessine une boîte de debug (arêtes et faces) par debugDrawer.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:159
---@param corner vec3 Coin de départ.
---@param x vec3 Vecteur de l'arête X.
---@param y vec3 Vecteur de l'arête Y.
---@param z vec3 Vecteur de l'arête Z.
---@param clr any Couleur des faces (défaut color(128,64,64,32)).
function gameplay_markers_gasStationMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Dessine un cercle sur la minimap pour chaque pompe.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:218
---@param td table Données de dessin (non utilisées).
function gameplay_markers_gasStationMarker_C:drawOnMinimap(td) end

--- Passe invisible et met l'opacité de toutes les icônes à 0.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:117
function gameplay_markers_gasStationMarker_C:hide() end

--- Initialise visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:19
function gameplay_markers_gasStationMarker_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:155
---@param visible boolean Ignoré.
function gameplay_markers_gasStationMarker_C:instantFade(visible) end

--- Si canInteract et que le véhicule est sur une pompe, ajoute les données (elemData) du cluster aux éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:145
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_gasStationMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Pour chaque pompe, retrouve les objets de scène (zone et icône), calcule la boîte de la zone (position, axes mis à l'échelle) et crée l'icône d'opacité initiale 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:23
---@param cluster table Cluster issu de cluster().
function gameplay_markers_gasStationMarker_C:setup(cluster) end

--- Repasse visible.
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:130
function gameplay_markers_gasStationMarker_C:show() end

--- Chaque frame : teste le chevauchement OBB/OBB entre le véhicule et chaque pompe, fait monter l'icône de 0.25 m et ajuste son opacité (visible si pas d'obstacle), met à jour isInAreaChanged et anyOverlap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/gasStationMarker.lua:79
---@param data table Données de frame : veh, bbCenter, bbHalfAxis0..2, camPos, dt, cruisingSpeedFactor.
function gameplay_markers_gasStationMarker_C:update(data) end

