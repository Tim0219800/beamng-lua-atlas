---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markers/walkingMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Marqueur de « portes » pour le joueur à pied (entrées de bâtiments, par exemple). Même principe que vehicleTrigger : chaque porte est une paire d'objets de scène (zone, icône) ; l'icône monte quand le personnage entre dans la zone, un écran 3D facultatif s'affiche 5 s, et le marqueur devient interactif. Contrairement à vehicleTrigger, le recouvrement n'est testé que si le joueur marche (data.isWalking) et sous la vitesse de croisière. Le module renvoie {create, cluster}.
--- Accès : extension `gameplay_markers_walkingMarker` : `extensions.load("gameplay_markers_walkingMarker")`, puis la globale `gameplay_markers_walkingMarker`
---@class gameplay_markers_walkingMarker
gameplay_markers_walkingMarker = {}

--- Regroupe les POI walkingMarker ayant les mêmes noms de portes et ajoute un cluster par groupe à allClusters.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:278
---@param pois table[] POI avec markerInfo.walkingMarker.
---@param allClusters table[] Liste de clusters complétée en place.
function gameplay_markers_walkingMarker.cluster(pois, allClusters) end

--- Fabrique un marqueur de portes pour piéton (instance de C).
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:269
---@param ... any Arguments transmis à C:init (non utilisés).
---@return table  Instance de marqueur.
function gameplay_markers_walkingMarker.create(...) end

--- Marqueur de portes pour le joueur à pied.
---@class gameplay_markers_walkingMarker_C
local gameplay_markers_walkingMarker_C = {}

--- Retire les icônes, cache les écrans et efface la liste des portes.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:174
function gameplay_markers_walkingMarker_C:clearObjects() end

--- Nettoie les objets existants (n'en crée pas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:147
function gameplay_markers_walkingMarker_C:createObjects() end

--- Dessine une boîte de debug (arêtes et faces) par debugDrawer ; non utilisée ici.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:204
---@param corner vec3 Coin de départ.
---@param x vec3 Vecteur de l'arête X.
---@param y vec3 Vecteur de l'arête Y.
---@param z vec3 Vecteur de l'arête Z.
---@param clr ColorI|nil Couleur des faces (défaut 128,64,64,32).
function gameplay_markers_walkingMarker_C:drawAxisBox(corner, x, y, z, clr) end

--- Dessine un cercle sur la minimap à la position de chaque icône de porte.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:262
---@param td table Données de dessin (non utilisées).
function gameplay_markers_walkingMarker_C:drawOnMinimap(td) end

--- Passe invisible, rend les icônes transparentes et cache les écrans.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:151
function gameplay_markers_walkingMarker_C:hide() end

--- Initialise visible = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:21
function gameplay_markers_walkingMarker_C:init() end

--- Ne fait rien.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:200
---@param visible boolean Ignoré.
function gameplay_markers_walkingMarker_C:instantFade(visible) end

--- Si canInteract et que le joueur est dans une porte, ajoute les données (elemData) du cluster aux éléments interactifs.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:190
---@param interactData table Données de frame avec canInteract.
---@param interactableElements table[] Liste complétée en place.
function gameplay_markers_walkingMarker_C:interactInPlayMode(interactData, interactableElements) end

--- Pour chaque porte, retrouve l'objet de zone et l'objet d'icône, calcule la boîte de la zone, cache l'écran associé et crée l'icône.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:25
---@param cluster table Cluster issu de cluster().
function gameplay_markers_walkingMarker_C:setup(cluster) end

--- Repasse visible.
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:169
function gameplay_markers_walkingMarker_C:show() end

--- Chaque frame : teste, par porte, le recouvrement OBB/OBB (uniquement si le joueur marche et sous la vitesse de croisière), gère écrans, son, icônes et trait de debug, puis met à jour isInAreaChanged et anyOverlap.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/markers/walkingMarker.lua:83
---@param data table Données de frame : isWalking, cruisingSpeedFactor, bbCenter, bbHalfAxis0..2, camPos, bigMapActive, dt.
function gameplay_markers_walkingMarker_C:update(data) end

