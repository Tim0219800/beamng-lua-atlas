---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/missionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de mission en mode jeu : une icône (exclamation par défaut) flottant au-dessus d'un point, reliée au sol par un trait, plus deux décalques au sol (un point et un anneau). Quand le joueur s'approche, l'icône apparaît en fondu ; quand son véhicule touche la sphère du marqueur (rayon fixe 1.2 m), l'anneau s'allume et le marqueur devient interactif (liste des missions du cluster). Plusieurs missions proches (moins de 3 m) sont fusionnées en un cluster avec une icône numérotée. Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_missionMarker` : `extensions.load("gameplay_markers_missionMarker")`, puis la globale `gameplay_markers_missionMarker`
---@class gameplay_markers_missionMarker
gameplay_markers_missionMarker = {}

--- Regroupe les POI missionMarker qui se chevauchent (quadtree, rayon 1.5 m) et ajoute un cluster fusionné par groupe à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:488
---@param pois table[] POI avec markerInfo.missionMarker.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_missionMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur de mission (instance de C).
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:436
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_missionMarker.create(...) end

--- Marqueur de mission avec icône, trait et décalques.
---@class gameplay_markers_missionMarker_C
local gameplay_markers_missionMarker_C = {}

--- Libère l'icône (Skia ou icon renderer), supprime le maillage éventuel et vide les références.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:387
function gameplay_markers_missionMarker_C:clearObjects() end

--- Crée et enregistre un objet TSStatic avec couleur d'instance ; utilitaire non utilisé par défaut.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:318
---@param shapeName string Chemin du maillage.
---@param objectName string Nom d'enregistrement de l'objet.
---@return userdata  Objet TSStatic créé.
function gameplay_markers_missionMarker_C:createObject(shapeName, objectName) end

--- Nettoie les objets existants (la création du maillage est commentée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:333
function gameplay_markers_missionMarker_C:createObjects() end

--- Dessine un marqueur triangle bleu sur la minimap (couche GAMEPLAY_MARKERS).
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:428
---@param td table Objet de dessin de la minimap (triangleMarker).
---@param dpi number Facteur DPI.
function gameplay_markers_missionMarker_C:drawOnMinimap(td, dpi) end

--- Passe invisible, réinitialise les lisseurs et rend l'icône transparente immédiatement.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:345
function gameplay_markers_missionMarker_C:hide() end

--- Attribue un id, rayon par défaut 1.2 m et crée les lisseurs ; visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:61
function gameplay_markers_missionMarker_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:380
---@param visible boolean Ignoré.
function gameplay_markers_missionMarker_C:instantFade(visible) end

--- Si canInteract et que le véhicule touche la sphère, ajoute les données (elemData) des missions du cluster aux éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:414
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_missionMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Teste si la boîte englobante orientée du véhicule du joueur recouvre la sphère du marqueur (overlapsOBB_Sphere).
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:86
---@param data table Données de frame : veh, bbCenter, bbHalfAxis0..2.
---@return boolean  true si recouvrement ; false si pas de véhicule.
function gameplay_markers_missionMarker_C:playerIsInArea(data) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:383
---@param vis boolean Ignoré.
---@param instant boolean Ignoré.
function gameplay_markers_missionMarker_C:setVisibilityInBigmap(vis, instant) end

--- Mémorise pos et cluster, crée l'icône (cluster.icon ou poi_exclamationmark ; ou icône Skia), initialise les lisseurs et crée groundDecalData (point dot_128 et anneau outline_512).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:250
---@param cluster table Cluster issu de merge.
function gameplay_markers_missionMarker_C:setup(cluster) end

--- Repasse visible.
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:375
function gameplay_markers_missionMarker_C:show() end

--- Chaque frame : calcule les distances, masque l'icône derrière la géométrie (rayon), anime l'opacité et la hauteur de l'icône, dessine le trait vers le sol, pilote l'opacité du point et de l'anneau au sol et met à jour isInAreaChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/missionMarker.lua:100
---@param data table Données de frame : camPos, playerPosition, bigMapActive, globalAlpha, cruisingSpeedFactor, highestBBPointZ, isWalking, dt...
function gameplay_markers_missionMarker_C:update(data) end

