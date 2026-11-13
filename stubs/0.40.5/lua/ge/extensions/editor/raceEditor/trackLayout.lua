---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/trackLayout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre Track Layout (windowDescription = 'Track Layout'). Instanciée avec init(raceEditor).
---@class editor_raceEditor_trackLayout
local editor_raceEditor_trackLayout = {}

--- Si la nouvelle valeur diffère de path[field], valide une action d'historique qui modifie ce champ du chemin.
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:27
---@param field string Champ du chemin (defaultLaps, startNode, endNode, defaultStartPosition, simplifyAiPath…).
---@param new any Nouvelle valeur (ID d'objet, -1 pour aucun, nombre ou booléen).
function editor_raceEditor_trackLayout:changeField(field, new) end

--- Affiche une ligne « nom » avec icône coche ou croix selon classification[field].
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:78
---@param classification table Résultat de path:classify().
---@param name string Libellé.
---@param field string Clé testée (reversible, allowRollingStart, closed, branching).
---@param tt string|nil Infobulle.
function editor_raceEditor_trackLayout:displayClassification(classification, name, field, tt) end

--- Appelé à chaque frame : dessine le formulaire, la zone d'arrêt et les splits.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:20
function editor_raceEditor_trackLayout:draw() end

--- Dessine le formulaire (tours, nœuds, positions de départ, classification, option de simplification IA) puis la zone d'arrêt et les splits.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:35
function editor_raceEditor_trackLayout:drawGeneralInfo() end

--- Dessine « Split N » sur chaque pathnode useAsSplit (hors dernier nœud de la liste triée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:107
function editor_raceEditor_trackLayout:drawSplits() end

--- Cherche une position de départ nommée STOP_ZONE, SS_stop_control ou TC_out et y dessine le texte « Stop Control ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:89
function editor_raceEditor_trackLayout:drawStopZone() end

--- Mémorise raceEditor.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:10
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_trackLayout:init(raceEditor) end

--- Appelé quand l'onglet devient actif ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:17
function editor_raceEditor_trackLayout:selected() end

--- Liste déroulante de choix d'un nœud ou d'une position pour un champ du chemin (None = -1), avec libellé dessiné dans le monde et prévisualisation du nom survolé.
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:120
---@param name string Libellé.
---@param objects table Collection (objects, sorted) : path.pathnodes ou path.startPositions.
---@param fieldName string Champ du chemin contenant l'ID choisi.
---@param clrI ColorI|nil Couleur de fond du texte dans le monde.
---@param tt string|nil Infobulle.
function editor_raceEditor_trackLayout:selector(name, objects, fieldName, clrI, tt) end

--- Définit le chemin de course édité.
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:14
---@param path table Objet gameplay/race/path.
function editor_raceEditor_trackLayout:setPath(path) end

--- Appelé quand l'onglet est quitté ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/trackLayout.lua:18
function editor_raceEditor_trackLayout:unselect() end

