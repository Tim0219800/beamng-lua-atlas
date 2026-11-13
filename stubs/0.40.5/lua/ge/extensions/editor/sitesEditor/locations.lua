---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/locations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur du module. Champs : sitesEditor, key, current (lieu sélectionné), sites, list.
---@class editor_sitesEditor_locations
local editor_sitesEditor_locations = {}

--- Début de glissement du gizmo : mémorise la position et le rayon de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:69
function editor_sitesEditor_locations:beginDrag() end

--- Crée un lieu à la position donnée (action annulable 'Create Location') et le renvoie.
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:121
---@param pos vec3 Position du nouveau lieu.
---@return table  Lieu créé (self.current).
function editor_sitesEditor_locations:create(pos) end

--- Pendant le glissement : en mode translation met à jour pos, en mode échelle recalcule radius (minimum 0.1) à partir du facteur du gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:74
function editor_sitesEditor_locations:dragging() end

--- Dessine l'éditeur de l'élément : gizmo (si allowGizmo) et texte du segment de route le plus proche.
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:134
---@param loc table Lieu affiché.
function editor_sitesEditor_locations:drawElement(loc) end

--- Fin de glissement : enregistre une action annulable 'Update Transform of ...' (ancienne et nouvelle pos/radius).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:93
function editor_sitesEditor_locations:endDragging() end

--- Renvoie le lieu le plus proche de la caméra dont la sphère (rayon node.radius) est traversée par le rayon souris.
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:28
---@param mouseInfo table Infos souris (camPos, rayDir) construites par sitesEditor.
---@param objects table Table des lieux.
---@return table|nil  Lieu touché ou nil.
function editor_sitesEditor_locations:hitTest(mouseInfo, objects) end

--- Constructeur (appelé par le module) : mémorise sitesEditor et la clé, sans sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:9
---@param sitesEditor table Module editor_sitesEditor.
---@param key string Clé dans l'objet sites ('locations').
function editor_sitesEditor_locations:init(sitesEditor, key) end

--- Supprime un lieu (action annulable 'Remove Location').
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:128
---@param loc table Lieu à supprimer.
function editor_sitesEditor_locations:remove(loc) end

--- Sélectionne un lieu et place le gizmo sur lui.
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:21
---@param loc table|nil Lieu à sélectionner.
function editor_sitesEditor_locations:select(loc) end

--- Définit les sites édités, retient la liste sites[key] et désélectionne.
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:15
---@param sites table Objet sites.
function editor_sitesEditor_locations:setSites(sites) end

--- Place le gizmo sur la position du lieu courant.
---Source : lua/ge/extensions/editor/sitesEditor/locations.lua:45
function editor_sitesEditor_locations:updateTransform() end

