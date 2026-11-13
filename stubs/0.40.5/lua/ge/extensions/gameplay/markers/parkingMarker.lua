---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/parkingMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de place de parking en mode jeu (par exemple pour livrer ou déposer un véhicule) : un décalque rayé au sol, un contour 3D (park_outline_marker.dae) dont la hauteur et l'opacité dépendent de la vitesse, et une icône flottante (poi_parking_rect par défaut). Le véhicule du joueur est « garé » quand sa boîte englobante recouvre (mode overlap) ou est contenue dans (mode contained) la place, à moins de 15 m et sous environ 20 km/h ; le marqueur devient alors interactif. Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_parkingMarker` : `extensions.load("gameplay_markers_parkingMarker")`, puis la globale `gameplay_markers_parkingMarker`
---@class gameplay_markers_parkingMarker
gameplay_markers_parkingMarker = {}

--- Regroupe les POI parkingMarker par chemin identique et ajoute un cluster par groupe à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:497
---@param pois table[] POI avec markerInfo.parkingMarker {path, pos, rot, scl, mode, icon, focus}.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_parkingMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur de place de parking (instance de C).
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:487
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_parkingMarker.create(...) end

--- Marqueur de place de parking.
---@class gameplay_markers_parkingMarker_C
local gameplay_markers_parkingMarker_C = {}

--- Calcule la distance joueur/caméra à la place et détermine overlap (et parked) selon le mode, à moins de 15 m et sous la vitesse de croisière ; met la distance à 0 si garé.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:257
---@param data table Données de frame (voir update).
function gameplay_markers_parkingMarker_C:checkParking(data) end

--- Supprime le contour (notifie l'éditeur si présent) et l'icône flottante.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:329
function gameplay_markers_parkingMarker_C:clearObjects() end

--- Crée et enregistre un TSStatic à couleur d'instance (utilisé pour le contour).
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:288
---@param shapeName string Chemin du maillage.
---@param objectName string Nom d'enregistrement.
---@return userdata  Objet créé.
function gameplay_markers_parkingMarker_C:createObject(shapeName, objectName) end

--- Nettoie les objets existants (n'en crée pas de nouveaux ; le contour est créé dans setup).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:302
function gameplay_markers_parkingMarker_C:createObjects() end

--- Dessine une boîte de debug (arêtes et faces) par debugDrawer ; non utilisée ici.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:430
---@param corner vec3 Coin de départ.
---@param x vec3 Vecteur de l'arête X.
---@param y vec3 Vecteur de l'arête Y.
---@param z vec3 Vecteur de l'arête Z.
---@param clr any Couleur des faces (défaut color(128,64,64,32)).
function gameplay_markers_parkingMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Dessine un cercle bleu à la position de la place sur la minimap.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:368
---@param td table Données de dessin (non utilisées).
function gameplay_markers_parkingMarker_C:drawOnMinimap(td) end

--- Passe invisible, rend le contour et l'icône transparents.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:306
function gameplay_markers_parkingMarker_C:hide() end

--- Attribue un numId et crée les lisseurs (position d'icône, croisière, opacité, distance, recouvrement) ; visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:26
function gameplay_markers_parkingMarker_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:360
---@param visible boolean Ignoré.
function gameplay_markers_parkingMarker_C:instantFade(visible) end

--- Si canInteract et que le véhicule est garé, ajoute les données (elemData) du cluster aux éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:352
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_parkingMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Lit pos, rot, scl, mode du cluster, calcule les demi-axes de la boîte de test, crée l'objet de contour (TSStatic) positionné et mis à l'échelle sur la place, l'icône et le décalque au sol.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:41
---@param cluster table Cluster issu de cluster().
function gameplay_markers_parkingMarker_C:setup(cluster) end

--- Repasse visible et force la mise à jour du contour.
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:323
function gameplay_markers_parkingMarker_C:show() end

--- Chaque frame : appelle checkParking, anime la hauteur et l'opacité de l'icône, dessine le trait vers le sol, ajuste hauteur et opacité du contour, met à jour isInAreaChanged et la distance de fondu du décalque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/parkingMarker.lua:135
---@param data table Données de frame : veh, bbCenter, bbHalfAxis0..2, camPos, camRot, playerPosition, isFreeCam, cruisingSpeedFactor, bigMapActive, highestBBPointZ, dt.
function gameplay_markers_parkingMarker_C:update(data) end

