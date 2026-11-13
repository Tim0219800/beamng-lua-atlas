---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/driftLineMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de ligne de départ des défis de drift en freeroam. Il n'affiche rien lui-même : il rend visibles les objets de scène nommés (markerObjects) à l'installation, les cache au nettoyage, et, quand le véhicule du joueur entre dans le rayon de la ligne, appelle gameplay_drift_freeroam_driftSpots.detectStart(lineId). Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_driftLineMarker` : `extensions.load("gameplay_markers_driftLineMarker")`, puis la globale `gameplay_markers_driftLineMarker`
---@class gameplay_markers_driftLineMarker
gameplay_markers_driftLineMarker = {}

--- Transforme chaque POI driftLineMarker en un cluster distinct et l'ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:109
---@param pois table[] POI avec markerInfo.driftLineMarker.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_driftLineMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur de ligne de drift (instance de C).
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:100
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_driftLineMarker.create(...) end

--- Marqueur de ligne de départ de drift.
---@class gameplay_markers_driftLineMarker_C
local gameplay_markers_driftLineMarker_C = {}

--- Cache (setHidden(true)) les objets de scène listés dans cluster.markerObjects.
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:18
function gameplay_markers_driftLineMarker_C:clearObjects() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:14
function gameplay_markers_driftLineMarker_C:createObjects() end

--- Dessine sur la minimap une ligne entre les extrémités (ou un cercle si startDir est nil) en bleu (72,125,249).
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:90
---@param td table Données de dessin (non utilisées).
function gameplay_markers_driftLineMarker_C:drawOnMinimap(td) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:28
function gameplay_markers_driftLineMarker_C:hide() end

--- Attribue un id incrémental à l'instance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:9
function gameplay_markers_driftLineMarker_C:init() end

--- Appelée chaque frame : si le joueur est en véhicule dans le rayon, déclenche gameplay_drift_freeroam_driftSpots.detectStart(lineId).
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:75
---@param interactData table Données de frame : isWalking, vehPos.
function gameplay_markers_driftLineMarker_C:interactWhileMoving(interactData) end

--- Mémorise cluster, pos, radius, lineId et startDir, calcule les extrémités gauche et droite de la ligne (à 0.7 fois le rayon) et rend visibles les objets de markerObjects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:54
---@param cluster table Cluster issu de cluster().
function gameplay_markers_driftLineMarker_C:setup(cluster) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:31
function gameplay_markers_driftLineMarker_C:show() end

--- Ne fait rien (le dessin de debug est commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/driftLineMarker.lua:35
function gameplay_markers_driftLineMarker_C:update() end

