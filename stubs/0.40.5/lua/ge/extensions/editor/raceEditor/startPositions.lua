---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/startPositions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Start Positions (windowDescription = 'Start Positions'). Instanciée avec init(raceEditor).
---@class editor_raceEditor_startPositions
local editor_raceEditor_startPositions = {}

--- Valide une action d'historique pour la position courante à partir de l'état sérialisé précédent et de l'état actuel.
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:144
---@param name string Nom de l'action.
---@param old table Résultat de sp:onSerialize() avant la modification.
function editor_raceEditor_startPositions:addHistory(name, old) end

--- Début de manipulation au gizmo : mémorise la rotation et l'état sérialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:102
function editor_raceEditor_startPositions:beginDrag() end

--- Affiche l'aide et l'aperçu (prismes) pendant le glisser, puis au relâchement crée une position (position = point d'appui, orientation = direction du glisser) via l'historique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:151
function editor_raceEditor_startPositions:createStartPosition() end

--- Pendant la manipulation : applique translation (pos) ou rotation (rot).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:109
function editor_raceEditor_startPositions:dragging() end

--- Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste et le panneau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:211
---@param mouseInfo table Infos souris (valid, down, hold, up, camPos, rayDir, rayCast, _downPos, _holdPos, _upPos).
function editor_raceEditor_startPositions:draw(mouseInfo) end

--- Dessine la liste des positions et le panneau de la position courante : suppression, déplacement dans la liste, nom, position, terrain, véhicule, groupe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:223
function editor_raceEditor_startPositions:drawStartPositions() end

--- Fin de manipulation : valide l'action « Moved Start Position by Gizmo ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:126
function editor_raceEditor_startPositions:endDragging() end

--- Renvoie la position de départ survolée par le rayon souris (sphère de 3 m), la plus proche de la caméra.
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:69
---@return table|nil  Position survolée.
function editor_raceEditor_startPositions:hoveringStartPosition() end

--- Mémorise raceEditor et met l'index de sélection à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:13
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_startPositions:init(raceEditor) end

--- Gère la souris : avec Shift, création ; sinon clic pour sélectionner ou désélectionner.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:86
function editor_raceEditor_startPositions:input() end

--- Appelé à l'activation du mode d'édition : resélectionne la position courante si elle existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:205
function editor_raceEditor_startPositions:onEditModeActivate() end

--- Sélectionne la position d'ID id (nil pour aucune) : surbrillance, charge nom et groupe, place le gizmo.
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:39
---@param id integer|nil ID de la position de départ.
function editor_raceEditor_startPositions:selectStartPosition(id) end

--- Appelé quand l'onglet devient actif : désélectionne, dessine les positions en « normal » et ajoute le raccourci Shift « Add New ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:22
function editor_raceEditor_startPositions:selected() end

--- Définit le chemin de course édité.
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:18
---@param path table Objet gameplay/race/path.
function editor_raceEditor_startPositions:setPath(path) end

--- Appelé quand l'onglet est quitté : positions en « faded », retire le raccourci Shift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:31
function editor_raceEditor_startPositions:unselect() end

--- Place le gizmo sur la position (orienté selon sp.rot en alignement local). Sans effet si le gizmo est interdit.
---Source : lua/ge/extensions/editor/raceEditor/startPositions.lua:52
---@param index integer ID de la position.
function editor_raceEditor_startPositions:updateTransform(index) end

