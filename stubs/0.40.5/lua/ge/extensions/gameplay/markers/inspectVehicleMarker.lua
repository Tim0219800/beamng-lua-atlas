---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur « inspecter un véhicule » en mode jeu (par exemple un véhicule à examiner chez un vendeur) : une icône flottante (poi_parking_rect par défaut) reliée au sol par un trait, qui se lève au-dessus du véhicule du joueur quand il est dans le rayon. Dans la zone, le marqueur rend son POI interactif (data du POI). Une version « focus » reste visible de loin avec un petit rebond. Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_inspectVehicleMarker` : `extensions.load("gameplay_markers_inspectVehicleMarker")`, puis la globale `gameplay_markers_inspectVehicleMarker`
---@class gameplay_markers_inspectVehicleMarker
gameplay_markers_inspectVehicleMarker = {}

--- Transforme chaque POI inspectVehicleMarker en un cluster distinct et l'ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:248
---@param pois table[] POI avec markerInfo.inspectVehicleMarker.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur d'inspection de véhicule (instance de C).
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:239
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_inspectVehicleMarker.create(...) end

--- Marqueur d'inspection de véhicule avec icône animée.
---@class gameplay_markers_inspectVehicleMarker_C
local gameplay_markers_inspectVehicleMarker_C = {}

--- Retire l'icône de l'icon renderer.
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:42
function gameplay_markers_inspectVehicleMarker_C:clearObjects() end

--- Nettoie les objets existants (n'en crée pas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:38
function gameplay_markers_inspectVehicleMarker_C:createObjects() end

--- Passe invisible et met l'opacité de l'icône à 0.
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:52
function gameplay_markers_inspectVehicleMarker_C:hide() end

--- Attribue un id et crée les lisseurs (position, croisière, opacité, distance) ; visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:26
function gameplay_markers_inspectVehicleMarker_C:init() end

--- Si canInteract et que le joueur est dans la zone, ajoute cluster.data aux éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:231
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_inspectVehicleMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Mémorise cluster, pos, radius, focus, réinitialise les lisseurs et crée l'icône d'opacité initiale 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:202
---@param cluster table Cluster issu de cluster().
function gameplay_markers_inspectVehicleMarker_C:setup(cluster) end

--- Repasse visible.
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:63
function gameplay_markers_inspectVehicleMarker_C:show() end

--- Chaque frame : calcule la distance, anime la hauteur de l'icône (au-dessus du véhicule du joueur s'il est dedans), gère la perspective en mode focus, ajuste taille et opacité, dessine le trait vers le sol (debugDrawer) et met à jour _inside et isInAreaChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua:86
---@param data table Données de frame : isFreeCam, camPos, camRot, playerPosition, highestBBPointZ, cruisingSpeedFactor, bigMapActive, dt.
function gameplay_markers_inspectVehicleMarker_C:update(data) end

