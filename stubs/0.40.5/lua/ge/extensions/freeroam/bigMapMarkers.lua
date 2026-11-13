---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/bigMapMarkers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les marqueurs de la grande carte (big map) : regroupe les points d'intérêt (POI) bruts de gameplay_rawPois qui ont un bigmapMarker en grappes (clusters) selon un rayon, crée un marqueur par grappe (gameplay/markers/bigmapMarker), les met à jour/affiche à chaque image et détecte quel marqueur est survolé par la souris ou le réticule. Utilisé par freeroam_bigMapMode ; un moddeur n'y touche normalement pas.
--- Accès : extension `freeroam_bigMapMarkers` : `extensions.load("freeroam_bigMapMarkers")`, puis la globale `freeroam_bigMapMarkers`
---@class freeroam_bigMapMarkers
---@field buildPoiList nil Toujours nil (référence à une variable non définie).
---@field iconCounter number Compteur d'icônes, initialisé à 0 (non utilisé dans ce fichier).
---@field iconsById table Table vide réservée au debug.
---@field printNext boolean Drapeau de debug (impressions commentées), false.
freeroam_bigMapMarkers = {}

--- Détruit les objets de rendu de tous les marqueurs (courants et anciens) et vide les listes.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:225
function freeroam_bigMapMarkers.clearMarkers() end

--- À appeler à chaque image tant que la grande carte est affichée : met à jour tous les marqueurs des grappes du filtre actif (affichés) et des filtres précédents (masqués en fondu), ainsi que les anciens marqueurs en cours de disparition.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:72
---@param dtReal number Temps réel écoulé (s).
function freeroam_bigMapMarkers.displayBigMapMarkers(dtReal) end

--- Renvoie (en calculant si besoin) les grappes de POI pour un filtre : POI dont l'id est valide et qui ont un bigmapMarker, triés par id, regroupés par quadtree puis fusionnés via bigmapMarker.merge.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:314
---@param settingsId string Identifiant de filtre créé par setupFilter (nommé currentClusterSettingsId en interne).
---@return table[]  Liste de grappes (champs id, containedIds, containedIdsLookup…).
function freeroam_bigMapMarkers.getAllClustersBySettings(settingsId) end

--- Renvoie le marqueur d'une grappe, en le créant s'il n'existe pas (ou en réutilisant l'ancien marqueur de même id).
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:191
---@param cluster table Grappe issue de getAllClustersBySettings.
---@return table  Objet marqueur de la grande carte.
function freeroam_bigMapMarkers.getClusterMarker(cluster) end

--- Pour un id de POI, renvoie les ids de tous les POI de sa grappe dans le filtre actif.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:182
---@param id string Id d'un POI.
---@return string[]|nil  Ids contenus dans la grappe, nil si le POI n'est dans aucune grappe.
function freeroam_bigMapMarkers.getIdsFromHoveredPoiId(id) end

--- Détermine quelle grappe est survolée : lance un rayon depuis la souris (si elle a bougé) ou depuis le centre de la caméra, et teste la distance rayon/icône avec une sphère dont le rayon dépend du zoom (fov) et de la distance (ou fixe en caméra orthogonale). Ne fait rien en mode manette quand un POI est déjà sélectionné.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:145
---@param camMode table Mode caméra de la grande carte (utilise camMode.manualzoom.fov).
---@param mouseMoved boolean true si le rayon vient de la souris, false si de la caméra.
---@param poiIsSelected boolean true si un POI est déjà sélectionné.
---@return string|nil  Id du premier POI de la grappe survolée, nil sinon.
function freeroam_bigMapMarkers.handleMouse(camMode, mouseMoved, poiIsSelected) end

--- Masque (fondu) tous les marqueurs courants et anciens, sans les détruire.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:214
function freeroam_bigMapMarkers.hideMarkers() end

--- Fait apparaître instantanément en pleine opacité les marqueurs actifs lors de la prochaine mise à jour (une seule fois).
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:328
function freeroam_bigMapMarkers.setNextMarkersFullAlphaInstant() end

--- Définit le filtre actif : le rayon de regroupement est arrondi au multiple de 5 (20 par défaut), les ids sont triés, et les marqueurs actuels sont déplacés vers la liste des anciens et masqués pour une transition douce. Les anciens marqueurs invisibles sont détruits.
---Source : lua/ge/extensions/freeroam/bigMapMarkers.lua:23
---@param validIds string[] Ids de POI à afficher (la table est triée sur place).
---@param radius number|nil Rayon de regroupement en mètres monde (20 par défaut).
function freeroam_bigMapMarkers.setupFilter(validIds, radius) end

