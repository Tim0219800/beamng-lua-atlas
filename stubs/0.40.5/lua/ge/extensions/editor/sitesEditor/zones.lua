---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/zones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur. Champs : sitesEditor, key, current (zone), currentVertices (sommets sélectionnés), currentPlane (plan top ou bot en édition).
---@class editor_sitesEditor_zones
local editor_sitesEditor_zones = {}

--- Début de glissement : mémorise la position du gizmo, celle des sommets et la rotation du plan.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:154
function editor_sitesEditor_zones:beginDrag() end

--- Crée une zone (action annulable 'Create Zone') et la renvoie.
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:294
---@return table  Zone créée.
function editor_sitesEditor_zones:create() end

--- Pendant le glissement : translation ou rotation des sommets (autour de leur centroïde), du plan, avec aimantation au terrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:167
function editor_sitesEditor_zones:dragging() end

--- Dessine l'éditeur de zone : gizmo, boutons (Select All Vertices, Delete Current Vertices, Auto Planes, Divide), cases Snap To Terrain, Top Plane, Bottom Plane, et infos (nombre de sommets, aire, temps de calcul, joueur dedans).
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:307
---@param zone table Zone affichée.
function editor_sitesEditor_zones:drawElement(zone) end

--- Projette une position sur la hauteur du terrain.
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:234
---@param pos vec3 Position à projeter.
---@return vec3  Copie de la position avec z du terrain.
---@return boolean  true si core_terrain est disponible.
function editor_sitesEditor_zones:dropToTerrain(pos) end

--- Fin de glissement : aimante au terrain, recalcule les sommets (processVertices) et enregistre l'action annulable 'Dragged Vertices'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:257
function editor_sitesEditor_zones:endDragging() end

--- Dessine une sphère par sommet (orange si sélectionné) et renvoie le sommet le plus proche de la caméra touché par le rayon souris (rayon de sphère = distance caméra / 40).
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:33
---@param mouseInfo table Infos souris.
---@param objects table Liste de sommets (ou de points d'insertion).
---@return table|nil  Sommet touché.
function editor_sitesEditor_zones:findVert(mouseInfo, objects) end

--- Renvoie la zone traversée par le rayon souris à la plus petite distance (obj:rayIntersectsZone).
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:389
---@param mouseInfo table Infos souris.
---@param objects table Table des zones.
---@return table|nil  Zone touchée.
function editor_sitesEditor_zones:findZone(mouseInfo, objects) end

--- Constructeur : mémorise sitesEditor, la clé et une sélection de sommets vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:11
---@param sitesEditor table Module editor_sitesEditor.
---@param key string 'zones'.
function editor_sitesEditor_zones:init(sitesEditor, key) end

--- Gère la souris : sélection d'une zone par clic (Ctrl pour basculer), ajout de sommet avec Shift, insertion avec Alt, sinon sélection de sommets.
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:88
---@param mouseInfo table Infos souris.
function editor_sitesEditor_zones:input(mouseInfo) end

--- Supprime une zone (action annulable 'Remove Zone').
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:301
---@param zone table Zone à supprimer.
function editor_sitesEditor_zones:remove(zone) end

--- Sélectionne une zone, replace le gizmo et vide la sélection de sommets et de plan.
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:24
---@param zone table|nil Zone à sélectionner.
function editor_sitesEditor_zones:select(zone) end

--- Définit les sites édités et désélectionne.
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:18
---@param sites table Objet sites.
function editor_sitesEditor_zones:setSites(sites) end

--- Avec Alt : teste les milieux d'arêtes et, sur clic, insère un sommet à cet endroit.
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:67
---@param mouseInfo table Infos souris.
function editor_sitesEditor_zones:tryInsert(mouseInfo) end

--- Place le gizmo au centroïde des sommets sélectionnés, ou sur le plan en édition (orientation locale ou monde).
---Source : lua/ge/extensions/editor/sitesEditor/zones.lua:128
function editor_sitesEditor_zones:updateTransform() end

