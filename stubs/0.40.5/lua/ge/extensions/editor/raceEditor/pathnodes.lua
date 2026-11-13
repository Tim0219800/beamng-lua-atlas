---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/pathnodes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Pathnodes (windowDescription = 'Pathnodes'). Instanciée par le constructeur du module avec init(raceEditor). raceEditor.lua appelle setPath, selected, unselect, draw et onEditModeActivate.
---@class editor_raceEditor_pathnodes
local editor_raceEditor_pathnodes = {}

--- Crée automatiquement une position de départ de groupe « recovery » à l'emplacement du nœud (direction inversée si reverse) et l'affecte au champ recovery ou reverseRecovery du nœud.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:725
---@param reverse boolean true pour la récupération arrière (champ reverseRecovery, normale inversée).
function editor_raceEditor_pathnodes:autoRecoverPos(reverse) end

--- Début de manipulation au gizmo : mémorise l'état sérialisé, la rotation et le rayon du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:80
function editor_raceEditor_pathnodes:beginDrag() end

--- Affiche l'aide et l'aperçu (sphère, prismes de direction) pendant le glisser, puis au relâchement crée un nœud manuel (et un segment depuis le dernier nœud) via l'historique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:271
function editor_raceEditor_pathnodes:createManualPathnode() end

--- Pendant la manipulation : applique translation (mode manuel seulement), rotation de la normale (si le nœud en a une) ou échelle du rayon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:94
function editor_raceEditor_pathnodes:dragging() end

--- Appelé à chaque frame : mémorise mouseInfo, gère gizmo et entrées si autorisé, puis dessine la liste et le panneau du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:262
---@param mouseInfo table Infos souris (valid, down, hold, up, camPos, rayDir, rayCast, _downPos, _holdPos, _upPos).
function editor_raceEditor_pathnodes:draw(mouseInfo) end

--- Dessine l'éditeur de champs personnalisés et les boutons Copy Fields / Paste Fields (copie dans self.cfData).
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:705
---@param fields table Objet de champs personnalisés (onSerialize/onDeserialized).
function editor_raceEditor_pathnodes:drawCustomFields(fields) end

--- Dessine la liste des nœuds (préfixe « * » si useAsSplit, parenthèses si non visible) et le panneau du nœud courant : suppression, déplacement dans la liste, nom, mode, position/rayon, normale, visibilité, split, positions de récupération.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:461
function editor_raceEditor_pathnodes:drawPathnodeList() end

--- Fin de manipulation : valide l'action d'historique avec l'état avant/après du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:147
function editor_raceEditor_pathnodes:endDragging() end

--- Mode simple drag : au clic, autorise le glissement si on clique le nœud déjà sélectionné, sinon sélectionne le nœud survolé ou désélectionne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:173
---@param hovered table|nil Nœud sous la souris.
function editor_raceEditor_pathnodes:handleMouseDown(hovered) end

--- Mode simple drag : pendant le maintien, calcule la position projetée au sol par lancer de rayon statique (forêt désactivée en collision) et dessine une sphère et le nom du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:224
function editor_raceEditor_pathnodes:handleMouseHold() end

--- Mode simple drag : au relâchement, valide l'action « Manipulated Node via Simple Drag » avec la nouvelle position.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:234
function editor_raceEditor_pathnodes:handleMouseUp() end

--- Mémorise raceEditor, index de sélection nil, mouseInfo vide et crée un utilitaire de champs personnalisés (customFieldsUtil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:18
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_pathnodes:init(raceEditor) end

--- Gère la souris : Alt = nœud navgraph, Shift = création manuelle, sinon sélection (clic simple, ou simple drag selon la préférence).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:416
function editor_raceEditor_pathnodes:input() end

--- Renvoie le nœud dont la sphère (rayon radius) est traversée par le rayon souris, le plus proche de la caméra.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:399
---@return table|nil  Pathnode survolé.
function editor_raceEditor_pathnodes:mouseOverPathnodes() end

--- Appelé à l'activation du mode d'édition (voir notes : inopérant).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:256
function editor_raceEditor_pathnodes:onEditModeActivate() end

--- Mode Alt : survole les waypoints manuels du navgraph (map.getManualWaypoints) et permet d'en ajouter un comme pathnode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:331
function editor_raceEditor_pathnodes:selectNavgraphNode() end

--- Sélectionne le nœud d'ID id (nil pour aucun) : met en surbrillance ce nœud, place le gizmo, charge le nom et les champs personnalisés.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:47
---@param id integer|nil ID du pathnode.
function editor_raceEditor_pathnodes:selectPathnode(id) end

--- Appelé quand l'onglet devient actif : désélectionne, met tous les nœuds en dessin « normal », ajoute le raccourci Shift « Add New » et récupère la carte (map.getMap()).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:29
function editor_raceEditor_pathnodes:selected() end

--- Renvoie le nœud sélectionné s'il existe et n'est pas manquant.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:166
---@return table|nil  Pathnode sélectionné.
function editor_raceEditor_pathnodes:selectedPathnode() end

--- Liste déroulante pour choisir une position de départ (ou « None » = -1) dans un champ du nœud, avec aperçu du nom dans le monde et bouton « Auto-Place » si le champ est vide et le nœud a une normale.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:747
---@param name string Libellé.
---@param fieldName string Champ du nœud (recovery ou reverseRecovery).
---@param clrI ColorI|nil Couleur de fond du texte dans le monde.
---@param tt string|nil Infobulle.
function editor_raceEditor_pathnodes:selector(name, fieldName, clrI, tt) end

--- Définit le chemin de course édité.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:25
---@param path table Objet gameplay/race/path.
function editor_raceEditor_pathnodes:setPath(path) end

--- Appelé quand l'onglet est quitté : les nœuds passent en dessin « faded » et le raccourci Shift est retiré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:39
function editor_raceEditor_pathnodes:unselect() end

--- Place le gizmo d'axes sur le nœud (orienté selon sa normale en alignement local si le nœud en a une). Sans effet si le gizmo n'est pas autorisé.
---Source : lua/ge/extensions/editor/raceEditor/pathnodes.lua:60
---@param index integer ID du pathnode.
function editor_raceEditor_pathnodes:updateTransform(index) end

