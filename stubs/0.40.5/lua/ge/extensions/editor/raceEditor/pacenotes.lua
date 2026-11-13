---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/pacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Pacenotes. Créée par le constructeur renvoyé par le module, avec init(raceEditor). windowDescription = 'Pacenotes'. Les méthodes sont appelées par raceEditor.lua (setPath, selected, unselect, draw, onEditModeActivate).
---@class editor_raceEditor_pacenotes
local editor_raceEditor_pacenotes = {}

--- Début de manipulation au gizmo : mémorise l'état sérialisé, la rotation et le rayon de la pacenote (navRadiusScale si mode navgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:87
function editor_raceEditor_pacenotes:beginDrag() end

--- Affiche l'aide de création et l'aperçu (sphère, prismes) pendant le glisser, puis au relâchement crée une pacenote manuelle (rayon 5 si le glisser est ≤ 1 m) via l'historique ; la direction est donnée par le glisser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:174
function editor_raceEditor_pacenotes:createManualPacenote() end

--- Pendant la manipulation : applique translation (pos), rotation (normal) ou mise à l'échelle (radius, jamais négatif) du gizmo à la pacenote.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:101
function editor_raceEditor_pacenotes:dragging() end

--- Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste et le panneau de détail.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:165
---@param mouseInfo table Infos souris (valid, down, up, hold, camPos, rayDir, rayCast, _downPos, _holdPos, _upPos).
function editor_raceEditor_pacenotes:draw(mouseInfo) end

--- Dessine la liste des pacenotes triées (+ entrée « New... ») et le panneau de la pacenote courante (suppression, déplacement, champs).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:273
function editor_raceEditor_pacenotes:drawPacenoteList() end

--- Fin de manipulation : valide l'action d'historique « Manipulated Note via Gizmo » (avant/après via onSerialize/onDeserialized).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:140
function editor_raceEditor_pacenotes:endDragging() end

--- Initialise la fenêtre : mémorise raceEditor, index de sélection nil et mouseInfo vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:17
---@param raceEditor table Module editor_raceEditor (fournit allowGizmo).
function editor_raceEditor_pacenotes:init(raceEditor) end

--- Gère la souris : avec Shift, création manuelle ; sinon clic sur une pacenote pour la sélectionner (ou aucune).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:247
function editor_raceEditor_pacenotes:input() end

--- Renvoie la pacenote dont la sphère est traversée par le rayon souris, la plus proche de la caméra.
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:230
---@return table|nil  Pacenote survolée ou nil.
function editor_raceEditor_pacenotes:mouseOverPacenotes() end

--- Appelé à l'activation du mode d'édition de course (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:159
function editor_raceEditor_pacenotes:onEditModeActivate() end

--- Sélectionne la pacenote d'ID id (nil pour aucune). Voir notes sur le rappel récursif conditionnel à self.note.
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:49
---@param id integer|nil ID de la pacenote.
function editor_raceEditor_pacenotes:selectPacenote(id) end

--- Appelé quand l'onglet devient actif : désélectionne, dessine les pacenotes en mode « normal », les segments en « faded », ajoute le raccourci Shift « Add New » et récupère la carte de navigation (map.getMap()).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:27
function editor_raceEditor_pacenotes:selected() end

--- Liste déroulante pour choisir un segment (ou « None » = -1) dans un champ de la pacenote courante, avec action d'historique.
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:401
---@param name string Libellé de la liste.
---@param fieldName string Champ de la pacenote modifié (contient un ID de segment).
---@param tt string|nil Infobulle.
function editor_raceEditor_pacenotes:selector(name, fieldName, tt) end

--- Définit le chemin de course (gameplay/race/path) édité.
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:23
---@param path table Objet chemin de course.
function editor_raceEditor_pacenotes:setPath(path) end

--- Appelé quand l'onglet est quitté : cache les pacenotes (_drawMode = 'none') et retire le raccourci Shift.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:41
function editor_raceEditor_pacenotes:unselect() end

--- Place le gizmo d'axes sur la pacenote d'index donné, orienté selon sa normale en alignement local. Sans effet si le gizmo n'est pas autorisé.
---Source : lua/ge/extensions/editor/raceEditor/pacenotes.lua:67
---@param index integer ID de la pacenote.
function editor_raceEditor_pacenotes:updateTransform(index) end

