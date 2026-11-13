---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/zones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur de zones du drag race (zone d'un strip ou zone d'une voie), sur le même principe que les frontières du crawl editor. Il s'appuie sur la classe gameplay/sites/zone : sélection de sommets à la souris, ajout/insertion de sommets, déplacement et rotation avec le gizmo d'axes de l'éditeur, accrochage optionnel au terrain, undo/redo via editor.history. init() renvoie une instance d'éditeur ; zoneFromData/zoneToData convertissent entre table sérialisée et objet Zone.
--- Accès : extension `editor_dragRaceEditor_zones` : `extensions.load("editor_dragRaceEditor_zones")`, puis la globale `editor_dragRaceEditor_zones`
---@class editor_dragRaceEditor_zones
---@field zoneFromData function Alias de C.zoneFromData.
---@field zoneToData function Alias de C.zoneToData.
editor_dragRaceEditor_zones = {}

--- Crée et renvoie une instance d'éditeur de zone (classe C) initialisée.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:334
---@return table  instance avec les méthodes setZone, clearZone, syncBack, draw…
function editor_dragRaceEditor_zones.init() end

--- Éditeur de zone renvoyé par init(). Champs : zone, target, currentVertices (sommets sélectionnés), currentPlane, snapToTerrain.
---@class editor_dragRaceEditor_zones_C
local editor_dragRaceEditor_zones_C = {}

--- Début de déplacement du gizmo : mémorise les positions de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:226
function editor_dragRaceEditor_zones_C:beginDrag() end

--- Oublie la zone et la cible courantes.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:75
function editor_dragRaceEditor_zones_C:clearZone() end

--- Pendant le déplacement du gizmo : translate (avec accrochage terrain) ou fait pivoter les sommets sélectionnés autour de leur centroïde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:237
function editor_dragRaceEditor_zones_C:dragging() end

--- À appeler chaque frame en mode édition de zone : met à jour/affiche le gizmo, traite la saisie et dessine la zone en debug.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:318
---@param mouseInfo table info souris (voir input.getMouseInfo)
function editor_dragRaceEditor_zones_C:draw(mouseInfo) end

--- Projette une position sur la hauteur du terrain (core_terrain.getTerrainHeight).
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:129
---@param pos vec3 position
---@return vec3  nouvelle position
---@return boolean  true si core_terrain existe
function editor_dragRaceEditor_zones_C:dropToTerrain(pos) end

--- Fin du déplacement : recale au terrain si activé et enregistre l'action d'historique « Manipulate Zone Vertices ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:295
function editor_dragRaceEditor_zones_C:endDragging() end

--- Cherche parmi des objets {pos, index} celui touché par le rayon souris (rayon de sélection = distance caméra/40) le plus proche de la caméra ; dessine aussi les sphères (orange si déjà sélectionné).
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:99
---@param mouseInfo table camPos, rayDir…
---@param objects table objets avec pos
---@return table|nil  objet touché
function editor_dragRaceEditor_zones_C:findVert(mouseInfo, objects) end

--- Initialise les champs (aucune zone, snapToTerrain=true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:57
function editor_dragRaceEditor_zones_C:init() end

--- Gère la saisie souris : ajout de sommet (Maj ou zone vide), insertion (Alt), sinon sélection simple ou multiple (Ctrl) de sommets.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:157
---@param mouseInfo table info souris
function editor_dragRaceEditor_zones_C:input(mouseInfo) end

--- Définit la zone éditée et sa cible ; réinitialise la sélection de sommets.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:68
---@param zoneInstance table Zone
---@param target table {type, strip, lane}
function editor_dragRaceEditor_zones_C:setZone(zoneInstance, target) end

--- Réécrit la zone dans strip.stripZone ou lane.zone, marque le strip _dirty et signale des modifications non sauvées. Sans effet si pas de zone ou de cible.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:83
function editor_dragRaceEditor_zones_C:syncBack() end

--- Cherche le milieu d'arête survolé ; au clic, insère un sommet à cet endroit (action d'historique « Insert Zone Vertex »). Demande au moins 2 sommets.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:138
---@param mouseInfo table info souris
function editor_dragRaceEditor_zones_C:tryInsert(mouseInfo) end

--- Place le gizmo d'axes au centroïde des sommets sélectionnés (ou au point du plan courant).
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:201
function editor_dragRaceEditor_zones_C:updateTransform() end

--- Fonction statique : construit une Zone depuis une table sérialisée (copie profonde ; vertices et customFields par défaut vides, donc zone vide autorisée).
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:41
---@param data table|nil strip.stripZone ou lane.zone
---@return table|nil  instance Zone, nil si data est nil
function editor_dragRaceEditor_zones_C.zoneFromData(data) end

--- Fonction statique : sérialise une Zone via zone:onSerialize().
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:52
---@param zone table|nil instance Zone
---@return table|nil  table sérialisée
function editor_dragRaceEditor_zones_C.zoneToData(zone) end

