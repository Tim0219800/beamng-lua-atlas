---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/zoneMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de zone sans visuel : rend un POI interactif quand le véhicule du joueur (ses quatre coins au sol de la boîte englobante) est entièrement dans l'un des polygones de zone donnés. Aucune icône ni décalque n'est dessiné. Le module renvoie {create, cluster} ; chaque POI zoneMarker forme son propre cluster.
--- Accès : extension `gameplay_markers_zoneMarker` : `extensions.load("gameplay_markers_zoneMarker")`, puis la globale `gameplay_markers_zoneMarker`
---@class gameplay_markers_zoneMarker
gameplay_markers_zoneMarker = {}

--- Transforme chaque POI zoneMarker en un cluster distinct (pas de fusion) et l'ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:57
---@param pois table[] POI avec markerInfo.zoneMarker {zones, pos, radius}.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_zoneMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur de zone (instance de C).
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:48
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_zoneMarker.create(...) end

--- Marqueur de zone sans rendu.
---@class gameplay_markers_zoneMarker_C
local gameplay_markers_zoneMarker_C = {}

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:24
function gameplay_markers_zoneMarker_C:clearObjects() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:20
function gameplay_markers_zoneMarker_C:createObjects() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:21
function gameplay_markers_zoneMarker_C:hide() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:7
function gameplay_markers_zoneMarker_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:23
---@param visible boolean Ignoré.
function gameplay_markers_zoneMarker_C:instantFade(visible) end

--- Ajoute les données (elemData) du cluster aux éléments interactifs si le véhicule est entièrement dans une zone et que canInteract est vrai ; sans effet à pied.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:27
---@param interactData table Données de frame : isWalking, vehPos2d, bbPoints, canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_zoneMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:19
---@param value boolean Ignoré.
function gameplay_markers_zoneMarker_C:setHidden(value) end

--- Mémorise zones, cluster, centre 2D (visibilityPos avec z = 0) et rayon (visibilityRadius).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:12
---@param cluster table Cluster issu de cluster().
function gameplay_markers_zoneMarker_C:setup(cluster) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:22
function gameplay_markers_zoneMarker_C:show() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/zoneMarker.lua:9
---@param data table Ignoré.
function gameplay_markers_zoneMarker_C:update(data) end

