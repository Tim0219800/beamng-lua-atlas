---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires de l'éditeur de drag race : affichage des erreurs, drapeau de modifications non sauvées, pile undo/redo sur dragRaceData, validation et création de données de course/voies par défaut, mise à jour de la souris, création d'un transformUtil et widgets d'en-tête ImGui.
--- Accès : extension `editor_dragRaceEditor_utils` : `extensions.load("editor_dragRaceEditor_utils")`, puis la globale `editor_dragRaceEditor_utils`
---@class editor_dragRaceEditor_utils
editor_dragRaceEditor_utils = {}

--- Efface le drapeau de modifications non sauvées.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:34
function editor_dragRaceEditor_utils.clearUnsavedChanges() end

--- Crée un dragRaceData par défaut : contexte activity, type headsUpRace, 4 phases (stage, countdown, race, stop), prefabs (christmasTree .500, displaySign, paths, decorations) non utilisés.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:116
---@return table  données
function editor_dragRaceEditor_utils.createNewDragRaceData() end

--- Crée une voie par défaut : noms « Lane N », couleur blue, waypoints stage et endLine, boundary, tous avec la transformation par défaut.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:94
---@param laneIndex integer numéro de voie (laneOrder)
---@return table  voie
function editor_dragRaceEditor_utils.createNewLane(laneIndex) end

--- Texte d'en-tête sûr pour ImGui : « Untitled » si vide, sinon la chaîne sans caractère #.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:227
---@param s string|nil texte
---@return string  libellé
function editor_dragRaceEditor_utils.dragHeaderLabel(s) end

--- Dessine un CollapsingHeader avec un padding plus grand.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:235
---@param visibleLabel string|nil texte affiché
---@param idSuffix string suffixe d'ID ImGui (ex. "##xyz")
---@param defaultOpen boolean ouvert par défaut
---@return boolean  true si la section est ouverte
function editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen) end

--- Mémorise le message comme dernière erreur, l'affiche 3 s et l'écrit dans le log (niveau E, tag DragRaceEditor).
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:11
---@param message string texte de l'erreur
function editor_dragRaceEditor_utils.logError(message) end

--- Marque l'état comme modifié non sauvegardé.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:30
function editor_dragRaceEditor_utils.markUnsavedChanges() end

--- Rétablit l'état annulé : le courant retourne dans la pile undo.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:62
function editor_dragRaceEditor_utils.redo() end

--- Déplace un élément d'un tableau de la position old à new en décalant les autres (modifie t sur place).
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:163
---@param t table tableau
---@param old integer index source
---@param new integer index destination
function editor_dragRaceEditor_utils.reorderLanes(t, old, new) end

--- Empile une copie profonde de dragRaceData (supprime la plus ancienne si la pile est pleine) et vide la pile redo.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:38
function editor_dragRaceEditor_utils.saveToUndoStack() end

--- Crée un transformUtil (gizmo) initialisé depuis une table transform {position, rotation, scale}.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:212
---@param label string nom/identifiant du transformUtil
---@param transform table position {x,y,z}, rotation quaternion {x,y,z,w}, scale {x,y,z}
---@param allowTranslate boolean|nil faux seulement si false explicite
---@param allowRotate boolean|nil faux seulement si false explicite
---@param allowScale boolean|nil faux seulement si false explicite
---@return table  transformUtil
function editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale) end

--- Affiche en rouge l'erreur courante tant que son délai n'est pas écoulé ; décrémente le délai avec le DeltaTime ImGui. À appeler à chaque frame.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:17
function editor_dragRaceEditor_utils.showError() end

--- Dépile l'état précédent : le courant va dans la pile redo. Ne fait rien si la pile est vide.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:50
function editor_dragRaceEditor_utils.undo() end

--- Met à jour la table souris de state (rayon caméra, raycast, clic/maintien/relâchement bouton gauche si ImGui ne capture pas la souris).
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:173
function editor_dragRaceEditor_utils.updateMouseInfo() end

--- Vérifie qu'un dragRaceData est exploitable.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:74
---@param data table|nil données à vérifier
---@return boolean  validité
---@return string|nil  message d'erreur si invalide
function editor_dragRaceEditor_utils.validateDragRaceData(data) end

