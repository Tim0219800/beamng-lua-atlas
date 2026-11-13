---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/crawlMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de zone de crawling (rock crawling) en mode jeu : une icône flottante au-dessus d'une zone sphérique. Le véhicule du joueur qui entre dans la sphère (centre de sa boîte englobante à moins de radius, 2 m par défaut) fait monter l'icône et la rend interactive (liste d'activités à accepter). Le module renvoie {create, cluster} : cluster regroupe les POI crawlMarker, create fabrique l'objet marqueur (classe C).
--- Accès : extension `gameplay_markers_crawlMarker` : `extensions.load("gameplay_markers_crawlMarker")`, puis la globale `gameplay_markers_crawlMarker`
---@class gameplay_markers_crawlMarker
gameplay_markers_crawlMarker = {}

--- Regroupe les POI crawlMarker identiques (même pos et iconPos) en clusters et les ajoute à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:245
---@param pois table[] POI avec markerInfo.crawlMarker.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_crawlMarker.cluster(pois, allClusters) end

--- Fabrique un objet marqueur de crawling (instance de C) et appelle init.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:236
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_crawlMarker.create(...) end

--- Marqueur de zone de crawling avec icône animée.
---@class gameplay_markers_crawlMarker_C
local gameplay_markers_crawlMarker_C = {}

--- Retire l'icône de l'icon renderer et efface triggerArea.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:145
function gameplay_markers_crawlMarker_C:clearObjects() end

--- Nettoie les objets existants (n'en crée pas de nouveaux).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:123
function gameplay_markers_crawlMarker_C:createObjects() end

--- Dessine une boîte alignée (arêtes et faces semi-transparentes) par debugDrawer ; utilitaire de debug.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:170
---@param corner vec3 Coin de départ.
---@param x vec3 Vecteur de l'arête X.
---@param y vec3 Vecteur de l'arête Y.
---@param z vec3 Vecteur de l'arête Z.
---@param clr ColorI|nil Couleur des faces (défaut 128,64,64,32).
function gameplay_markers_crawlMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Dessine un cercle à la position de l'icône sur la minimap (ui_apps_minimap_utils.simpleCircle).
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:228
---@param td table Données de dessin de la minimap (non utilisées).
function gameplay_markers_crawlMarker_C:drawOnMinimap(td) end

--- Passe invisible et met l'opacité de l'icône à 0.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:127
function gameplay_markers_crawlMarker_C:hide() end

--- Initialise visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:22
function gameplay_markers_crawlMarker_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:166
---@param visible boolean Ignoré.
function gameplay_markers_crawlMarker_C:instantFade(visible) end

--- Si canInteract et que le joueur est dans la zone, ajoute les données (elemData) du cluster à la liste des éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:156
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_crawlMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Lit pos, rot, scl du cluster et crée l'icône (id <cluster.id>-gsIcon) avec ses lisseurs ; décalage d'icône 0.5 m, levée 1.0 m.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:26
---@param cluster table Cluster issu de cluster().
function gameplay_markers_crawlMarker_C:setup(cluster) end

--- Repasse visible.
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:140
function gameplay_markers_crawlMarker_C:show() end

--- Chaque frame : teste l'entrée dans la sphère, anime la hauteur et l'opacité de l'icône, dessine un trait quand l'icône est levée, met à jour isInAreaChanged, anyOverlap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/crawlMarker.lua:65
---@param data table Données de frame : veh, bbCenter, camPos, dt, bigMapActive.
function gameplay_markers_crawlMarker_C:update(data) end

