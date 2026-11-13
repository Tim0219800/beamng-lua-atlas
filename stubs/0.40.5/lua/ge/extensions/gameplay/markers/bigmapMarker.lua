---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/bigmapMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de marqueur utilisé par la grande carte (bigmap) : pour chaque cluster de POI, affiche une icône et une colonne (icônes d'icon renderer) qui apparaissent en fondu quand la grande carte est active et qui grossissent au survol ou à la sélection. Le module renvoie une table {createMarker, merge} : createMarker crée l'objet marqueur (classe C), merge fusionne plusieurs POI proches en un seul cluster avec une icône numérotée.
--- Accès : extension `gameplay_markers_bigmapMarker` : `extensions.load("gameplay_markers_bigmapMarker")`, puis la globale `gameplay_markers_bigmapMarker`
---@class gameplay_markers_bigmapMarker
---@field containsAnyDelivery boolean
---@field containsAnyMission boolean
gameplay_markers_bigmapMarker = {}

--- Fabrique un objet marqueur de grande carte (instance de la classe C) et appelle son init.
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:235
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_bigmapMarker.createMarker(...) end

--- Fusionne une liste de POI en un seul cluster de grande carte (position moyenne, ids contenus, icône numérotée si plusieurs).
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:242
---@param pois table[] POI à fusionner (avec markerInfo.bigmapMarker et data).
---@param idPrefix string Préfixe de l'id du cluster.
---@return table  Cluster {id, containedIds, containedIdsLookup, pos, icon}.
function gameplay_markers_bigmapMarker.merge(pois, idPrefix) end

--- Marqueur de grande carte : une icône plus une colonne, dont l'opacité suit l'état de la grande carte.
---@class gameplay_markers_bigmapMarker_C
local gameplay_markers_bigmapMarker_C = {}

--- Retire les icônes de l'icon renderer et réinitialise les références internes.
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:214
function gameplay_markers_bigmapMarker_C:clearObjects() end

--- Marque le marqueur invisible (l'opacité retombe en fondu).
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:199
function gameplay_markers_bigmapMarker_C:hide() end

--- Initialise l'id, le lisseur d'opacité et visible = true, sans créer d'objet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:29
function gameplay_markers_bigmapMarker_C:init() end

--- Ne fait rien (interface commune des marqueurs).
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:208
---@param visible boolean Ignoré.
function gameplay_markers_bigmapMarker_C:instantFade(visible) end

--- Met l'opacité du lisseur à 1 immédiatement.
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:191
function gameplay_markers_bigmapMarker_C:setFullAlphaInstant() end

--- Ne fait rien (interface commune des marqueurs).
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:196
---@param value boolean Ignoré.
function gameplay_markers_bigmapMarker_C:setHidden(value) end

--- Associe le marqueur à un cluster : enregistre pos et cluster, ajoute l'icône (cluster.icon) et la colonne dans l'icon renderer de gameplay_playmodeMarkers, et remet l'opacité à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:156
---@param cluster table Cluster issu de merge.
function gameplay_markers_bigmapMarker_C:setup(cluster) end

--- Marque le marqueur visible.
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:203
function gameplay_markers_bigmapMarker_C:show() end

--- Appelée chaque frame : lisse l'opacité (apparition en 0.2 s quand la grande carte est active et sans transition), place l'icône et la colonne devant la caméra (ou en projection orthographique), agrandit l'icône à 1.5 si le cluster est survolé ou sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/bigmapMarker.lua:77
---@param data table Données de frame : dt, camPos, bigmapTransitionActive...
function gameplay_markers_bigmapMarker_C:update(data) end

