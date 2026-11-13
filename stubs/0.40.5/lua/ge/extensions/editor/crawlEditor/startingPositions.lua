---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/startingPositions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'outil. Champs principaux : startingPosition (élément édité), currentTransform ("area" ou "icon" ou nil), snapToTerrain, buffers ImGui name/fileName/description.
---@class editor_crawlEditor_startingPositions
local editor_crawlEditor_startingPositions = {}

--- Début de manipulation du gizmo : mémorise les positions/rotation de départ.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:381
function editor_crawlEditor_startingPositions:beginDrag() end

--- Désélectionne la transformation (currentTransform = nil), ce qui masque le gizmo.
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:253
function editor_crawlEditor_startingPositions:clearSelection() end

--- Pendant la manipulation : applique translation ou rotation du gizmo et recolle au terrain si snapToTerrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:394
function editor_crawlEditor_startingPositions:dragging() end

--- Appelé à chaque frame : traite l'entrée, affiche l'aperçu de placement avec rotation et le gizmo d'axes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:460
---@param mouseInfo table infos souris
function editor_crawlEditor_startingPositions:draw(mouseInfo) end

--- Dessine le panneau de détail (bouton Goto qui place la caméra 15 m au-dessus, nom, description, rayon, etc.) avec enregistrement des changements dans l'historique d'annulation.
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:108
---@param startingPosition table position affichée
function editor_crawlEditor_startingPositions:drawStartingPositionDetail(startingPosition) end

--- Dessine dans la vue 3D la sphère de rayon réel (vert translucide), des points de sélection à taille liée à la distance caméra, la flèche d'orientation (3 m) et les étiquettes « Area: » et « Icon: ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:520
---@param mouseInfo table doit contenir camPos
function editor_crawlEditor_startingPositions:drawStartingPositionIndicators(mouseInfo) end

--- Dessine le bouton « Add Starting Position » et la liste sélectionnable ; le clic droit propose Delete. Met à jour selection.index et selection.clicked.
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:72
---@param allStartingPositions table[] toutes les positions (modifiée en place)
---@param selection table {index, clicked}
function editor_crawlEditor_startingPositions:drawStartingPositionsList(allStartingPositions, selection) end

--- Place la position à la hauteur du terrain.
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:429
---@param pos vec3 position
---@return vec3  copie ajustée en z
---@return boolean  true si core_terrain est disponible
function editor_crawlEditor_startingPositions:dropToTerrain(pos) end

--- Fin de manipulation : recolle au terrain et enregistre l'action (zone ou icône) dans editor.history.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:438
function editor_crawlEditor_startingPositions:endDragging() end

--- Crée une position par défaut : nom « New Starting Position », position (0,0,0), rotation identité, rayon 4.0, version de métadonnées "1.0".
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:232
---@return table  nouvelle position
function editor_crawlEditor_startingPositions:getNewStartingPosition() end

--- Initialise l'état (aucune sélection, snapToTerrain = true, positions précédentes du gizmo à zéro).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:55
function editor_crawlEditor_startingPositions:init() end

--- Gère la souris : Maj+clic place l'icône ; Ctrl+clic/glisser place la zone avec rotation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:257
---@param mouseInfo table infos souris de l'éditeur (down, hold, _downPos, _holdPos, rayCast…)
function editor_crawlEditor_startingPositions:input(mouseInfo) end

--- Remplit les buffers ImGui (nom 256, nom de fichier 256, description 1024 caractères) depuis la position de départ.
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:65
---@param startingPosition table position de départ
function editor_crawlEditor_startingPositions:setFields(startingPosition) end

--- Définit la position de départ en cours d'édition.
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:249
---@param startingPositionParam table|nil position
function editor_crawlEditor_startingPositions:setStartingPosition(startingPositionParam) end

--- Place le gizmo d'axes sur la zone (avec sa rotation) ou sur l'icône selon currentTransform.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/startingPositions.lua:365
function editor_crawlEditor_startingPositions:updateTransform() end

