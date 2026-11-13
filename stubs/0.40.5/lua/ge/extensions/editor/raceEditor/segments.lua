---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/segments.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Segments (windowDescription = 'Segments'). Instanciée avec init(raceEditor).
---@class editor_raceEditor_segments
local editor_raceEditor_segments = {}

--- Valide une action d'historique pour le segment courant à partir de l'état sérialisé précédent et de l'état actuel ; undo/redo restaurent le segment et la capsule sélectionnés.
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:135
---@param name string Nom de l'action.
---@param old table Résultat de segment:onSerialize() avant la modification.
function editor_raceEditor_segments:addHistory(name, old) end

--- Début de manipulation au gizmo : mémorise le rayon de la capsule et l'état sérialisé du segment.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:81
function editor_raceEditor_segments:beginDrag() end

--- Pendant la manipulation : applique translation (pos) ou échelle (radius, jamais négatif) à la capsule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:88
function editor_raceEditor_segments:dragging() end

--- Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste des segments et le panneau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:142
---@param mouseInfo table Infos souris (valid, down, camPos, rayDir, rayCast, closestNodeHovered…).
function editor_raceEditor_segments:draw(mouseInfo) end

--- Dessine la liste des segments (« (!) » si un nœud est manquant), le bouton Create et le panneau du segment : suppression, déplacement, nom, From/To, mode, et les capsules (liste, position, rayon, Add Before/After, Remove).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:239
function editor_raceEditor_segments:drawSegmentList() end

--- Fin de manipulation : tente de valider l'action d'historique « Manipulated Capsule Node via Gizmo » (voir notes : fonctions undo/redo nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:112
function editor_raceEditor_segments:endDragging() end

--- Mémorise raceEditor ; index de segment et de capsule à nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:12
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_segments:init(raceEditor) end

--- Gère la souris pour le segment sélectionné : Alt/Shift + clic sur un nœud pour changer source/cible ; en mode capsules, clic pour sélectionner une capsule et Ctrl + clic au milieu de deux capsules pour en ajouter une.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:151
function editor_raceEditor_segments:input() end

--- Distance caméra-point si le rayon souris traverse la sphère du point, sinon -1.
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:222
---@param point table Table avec pos (vec3) et radius.
---@param mouseInfo table Infos souris (camPos, rayDir).
---@return number  Distance en mètres, ou -1 si non survolé.
function editor_raceEditor_segments:mouseDistanceTo(point, mouseInfo) end

--- Sélectionne un point-capsule du segment courant et place le gizmo dessus.
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:63
---@param index integer|nil Indice du point-capsule (à partir de 1).
function editor_raceEditor_segments:selectCapsule(index) end

--- Sélectionne le segment d'ID index (nil pour aucun) : met en surbrillance, charge le nom, définit les raccourcis Shift « Set Target » / Alt « Set Source » et n'affiche que les pacenotes de ce segment.
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:39
---@param index integer|nil ID du segment.
function editor_raceEditor_segments:selectSegment(index) end

--- Appelé quand l'onglet devient actif : désélectionne et dessine les segments en « normal ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:22
function editor_raceEditor_segments:selected() end

--- Définit le chemin de course édité.
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:18
---@param path table Objet gameplay/race/path.
function editor_raceEditor_segments:setPath(path) end

--- Appelé quand l'onglet est quitté : segments en « faded », retire les raccourcis Shift et Alt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:30
function editor_raceEditor_segments:unselect() end

--- Place le gizmo sur la capsule sélectionnée (sans effet si le gizmo est interdit ou si aucune capsule n'est choisie).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/segments.lua:68
function editor_raceEditor_segments:updateTransform() end

