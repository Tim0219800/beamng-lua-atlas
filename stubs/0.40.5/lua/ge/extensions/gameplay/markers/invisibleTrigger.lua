---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/invisibleTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Déclencheur sphérique invisible : à partir d'un POI invisibleTrigger (pos, radius, onEnter, onInside, onExit), appelle les callbacks Lua quand le véhicule d'un joueur entre dans la sphère, y reste, ou en sort. L'état dedans/dehors est suivi par joueur (multiseat) et conservé par id de cluster. Le module renvoie {create, cluster}. Utile pour des déclencheurs de gameplay sans aucun visuel.
--- Accès : extension `gameplay_markers_invisibleTrigger` : `extensions.load("gameplay_markers_invisibleTrigger")`, puis la globale `gameplay_markers_invisibleTrigger`
---@class gameplay_markers_invisibleTrigger
gameplay_markers_invisibleTrigger = {}

--- Transforme chaque POI invisibleTrigger en un cluster distinct (pas de fusion) et l'ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:81
---@param pois table[] POI avec markerInfo.invisibleTrigger {pos, radius, onEnter, onInside, onExit}.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_invisibleTrigger.cluster(pois, allClusters) end

--- Fabrique un marqueur déclencheur invisible (instance de C).
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:72
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_invisibleTrigger.create(...) end

--- Déclencheur sphérique sans visuel.
---@class gameplay_markers_invisibleTrigger_C
local gameplay_markers_invisibleTrigger_C = {}

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:68
function gameplay_markers_invisibleTrigger_C:clearObjects() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:60
function gameplay_markers_invisibleTrigger_C:createObjects() end

--- Efface l'état dedans/dehors de tous les joueurs pour ce cluster.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:63
function gameplay_markers_invisibleTrigger_C:hide() end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:11
function gameplay_markers_invisibleTrigger_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:70
---@param visible boolean Ignoré.
function gameplay_markers_invisibleTrigger_C:instantFade(visible) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:23
---@param interactData table Ignoré.
---@param interactableElements table[] Ignoré.
function gameplay_markers_invisibleTrigger_C:interactInPlayMode(interactData, interactableElements) end

--- Appelée chaque frame : si le véhicule du joueur est dans la sphère, appelle onEnter (à la première frame dedans) puis onInside ; en sortant, appelle onExit.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:24
---@param interactData table Données de frame : vehPos, isWalking, playerIndex.
function gameplay_markers_invisibleTrigger_C:interactWhileMoving(interactData) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:61
---@param value boolean Ignoré.
function gameplay_markers_invisibleTrigger_C:setHidden(value) end

--- Mémorise cluster, pos, radius et les trois callbacks ; relie l'état dedans/dehors par joueur à celui de l'id du cluster.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:48
---@param cluster table Cluster issu de cluster().
function gameplay_markers_invisibleTrigger_C:setup(cluster) end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:62
function gameplay_markers_invisibleTrigger_C:show() end

--- Ne fait rien (le dessin de debug est commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/invisibleTrigger.lua:14
---@param data table Ignoré.
function gameplay_markers_invisibleTrigger_C:update(data) end

