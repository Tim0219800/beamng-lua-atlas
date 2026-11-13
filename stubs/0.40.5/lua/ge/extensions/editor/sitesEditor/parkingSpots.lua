---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/parkingSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur. Champs : sitesEditor, key, current (place sélectionnée), list, isMultiSpot, multiSpotData (spotAmount, spotOffset, spotDirection, spotRotation), listDisplay (assigné par sitesEditor), requestGizmo.
---@class editor_sitesEditor_parkingSpots
local editor_sitesEditor_parkingSpots = {}

--- Duplique la place courante (action annulable 'Duplicate Parking Spot') quand un glissement commence avec Shift, et fait adopter la copie par la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:258
function editor_sitesEditor_parkingSpots:_beginShiftDuplicate() end

--- Crée une place à la position donnée avec l'échelle 'Car' (action annulable 'Create Parking Spot') et la renvoie.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:197
---@param pos vec3 Position de la nouvelle place.
---@return table  Place créée (self.current).
function editor_sitesEditor_parkingSpots:create(pos) end

--- Dessine l'éditeur de la place : gizmo, choix de taille, angles de rotation, case 'Is MultiSpot' et ses curseurs (Amount of Spots 1 à 25, Offset 0 à 5, Spot Rotation -1.55 à 1.55).
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:277
---@param ps table Place affichée.
---@param mouseInfo table Infos souris.
function editor_sitesEditor_parkingSpots:drawElement(ps, mouseInfo) end

--- Renvoie la place dont la boîte (ou l'une des boîtes du multispot) est touchée au plus près par le rayon souris, seulement lors d'un clic.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:111
---@param mouseInfo table Infos souris (camPos, rayDir, down).
---@param objects table Table des places.
---@return table|nil  Place touchée ou nil.
function editor_sitesEditor_parkingSpots:hitTest(mouseInfo, objects) end

--- Constructeur : prépare les valeurs de multispot, l'état de glissement et l'utilitaire transformUtil ('Edit Sites', 'Transform'). Définit aussi la méthode C:requestGizmo(mode) qui programme la (re)configuration du gizmo sur 3 images.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:57
---@param sitesEditor table Module editor_sitesEditor.
---@param key string 'parkingSpots'.
function editor_sitesEditor_parkingSpots:init(sitesEditor, key) end

--- Supprime une place (action annulable 'Remove Parking Spot').
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:204
---@param ps table Place à supprimer.
function editor_sitesEditor_parkingSpots:remove(ps) end

--- Sélectionne une place : place le transform, active l'édition et recopie ses réglages de multispot dans l'UI.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:97
---@param ps table|nil Place à sélectionner.
function editor_sitesEditor_parkingSpots:select(ps) end

--- Définit les sites édités, restaure les rotations d'origine des multispots et désélectionne.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:84
---@param sites table Objet sites.
function editor_sitesEditor_parkingSpots:setSites(sites) end

--- Copie pos, rot, scl de la place courante dans transformUtil.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:210
function editor_sitesEditor_parkingSpots:setTransform() end

--- Copie pos, rot, scl de transformUtil vers la place courante (pendant un glissement).
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:214
function editor_sitesEditor_parkingSpots:updateFromTransform() end

--- Recopie les réglages de multispot de l'UI vers la place courante.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:248
function editor_sitesEditor_parkingSpots:updateMultiSpot() end

--- Enregistre une action annulable 'Update Transform of ...' avec les anciennes et nouvelles valeurs.
---Source : lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:240
function editor_sitesEditor_parkingSpots:updateTransform() end

