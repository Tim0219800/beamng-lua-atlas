---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/state.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- État partagé de l'éditeur de drag race : une seule table locale State (données de course, fichier courant, index de sélection voie/facility/strip, souris, pile undo/redo, erreur affichée, cible d'édition de zone, recherche). Tous les autres sous-modules y accèdent via des getters/setters triviaux.
--- Accès : extension `editor_dragRaceEditor_state` : `extensions.load("editor_dragRaceEditor_state")`, puis la globale `editor_dragRaceEditor_state`
---@class editor_dragRaceEditor_state
editor_dragRaceEditor_state = {}

--- Dossier du fichier courant.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:104
---@return string  dossier, "/levels/" par défaut
function editor_dragRaceEditor_state.getCurrentFileDir() end

--- Nom du fichier courant.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:112
---@return string|nil  nom
function editor_dragRaceEditor_state.getCurrentFileName() end

--- Données de course en cours d'édition.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:48
---@return table|nil  dragRaceData
function editor_dragRaceEditor_state.getDragRaceData() end

--- Durée restante (s) d'affichage de l'erreur.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:148
---@return number  secondes
function editor_dragRaceEditor_state.getErrorTimeout() end

--- Pointeur ImGui booléen « a une caméra de fin ».
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:160
---@return userdata  im.BoolPtr
function editor_dragRaceEditor_state.getHasEndCamera() end

--- Indique s'il y a des modifications non sauvegardées.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:88
---@return boolean  drapeau
function editor_dragRaceEditor_state.getHasUnsavedChanges() end

--- Dernier message d'erreur affiché.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:140
---@return string|nil  message
function editor_dragRaceEditor_state.getLastError() end

--- Nombre maximal d'étapes d'annulation (20).
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:136
---@return integer  20
function editor_dragRaceEditor_state.getMaxUndoSteps() end

--- Table d'info souris remplie par utils.updateMouseInfo.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:80
---@return table|nil  mouseInfo
function editor_dragRaceEditor_state.getMouseInfo() end

--- Pile de rétablissement.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:128
---@return table  pile
function editor_dragRaceEditor_state.getRedoStack() end

--- Objet searchUtil utilisé pour les listes déroulantes avec recherche.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:164
---@return table  searchUtil
function editor_dragRaceEditor_state.getSearch() end

--- Index de facility sélectionnée (-1 si aucune).
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:64
---@return integer  index
function editor_dragRaceEditor_state.getSelectedFacilityIndex() end

--- Index de voie sélectionnée (-1 si aucune).
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:56
---@return integer  index
function editor_dragRaceEditor_state.getSelectedLaneIndex() end

--- Index de strip sélectionné (-1 si aucun).
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:72
---@return integer  index
function editor_dragRaceEditor_state.getSelectedStripIndex() end

--- Renvoie la table State complète.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:40
---@return table  état
function editor_dragRaceEditor_state.getState() end

--- Table des transformations de l'éditeur.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:96
---@return table  transforms
function editor_dragRaceEditor_state.getTransforms() end

--- Pile d'annulation (copies de dragRaceData).
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:120
---@return table  pile
function editor_dragRaceEditor_state.getUndoStack() end

--- Pointeur ImGui booléen « utilise des prefabs ».
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:156
---@return userdata  im.BoolPtr
function editor_dragRaceEditor_state.getUsingPrefabs() end

--- Mode d'édition de l'éditeur actif avant l'entrée en édition de zone.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:176
---@return any  mode
function editor_dragRaceEditor_state.getZoneEditPreviousEditMode() end

--- Cible de l'édition de zone (type stripZone ou laneZone, avec strip/lane).
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:168
---@return table|nil  cible
function editor_dragRaceEditor_state.getZoneEditTarget() end

--- Fixe le dossier du fichier courant.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:108
---@param dir string dossier
function editor_dragRaceEditor_state.setCurrentFileDir(dir) end

--- Fixe le nom du fichier courant.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:116
---@param name string|nil nom
function editor_dragRaceEditor_state.setCurrentFileName(name) end

--- Fixe les données de course.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:52
---@param data table|nil données
function editor_dragRaceEditor_state.setDragRaceData(data) end

--- Fixe la durée restante d'affichage de l'erreur.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:152
---@param timeout number secondes
function editor_dragRaceEditor_state.setErrorTimeout(timeout) end

--- Fixe le drapeau de modifications non sauvées.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:92
---@param value boolean drapeau
function editor_dragRaceEditor_state.setHasUnsavedChanges(value) end

--- Fixe le message d'erreur.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:144
---@param error string|nil message
function editor_dragRaceEditor_state.setLastError(error) end

--- Fixe la table d'info souris.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:84
---@param info table|nil mouseInfo
function editor_dragRaceEditor_state.setMouseInfo(info) end

--- Remplace la pile de rétablissement.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:132
---@param stack table pile
function editor_dragRaceEditor_state.setRedoStack(stack) end

--- Fixe l'index de facility sélectionnée.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:68
---@param index integer index
function editor_dragRaceEditor_state.setSelectedFacilityIndex(index) end

--- Fixe l'index de voie sélectionnée.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:60
---@param index integer index
function editor_dragRaceEditor_state.setSelectedLaneIndex(index) end

--- Fixe l'index de strip sélectionné.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:76
---@param index integer index
function editor_dragRaceEditor_state.setSelectedStripIndex(index) end

--- Remplace toute la table State.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:44
---@param newState table nouvel état
function editor_dragRaceEditor_state.setState(newState) end

--- Fixe la table des transformations.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:100
---@param transforms table transforms
function editor_dragRaceEditor_state.setTransforms(transforms) end

--- Remplace la pile d'annulation.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:124
---@param stack table pile
function editor_dragRaceEditor_state.setUndoStack(stack) end

--- Mémorise le mode d'édition précédent.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:180
---@param mode any mode
function editor_dragRaceEditor_state.setZoneEditPreviousEditMode(mode) end

--- Fixe la cible d'édition de zone.
---Source : lua/ge/extensions/editor/dragRaceEditor/state.lua:172
---@param target table|nil cible
function editor_dragRaceEditor_state.setZoneEditTarget(target) end

