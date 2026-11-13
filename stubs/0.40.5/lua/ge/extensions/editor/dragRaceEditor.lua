---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre principale de l'éditeur de drag race (menu Gameplay > Drag Race Editor). Elle assemble les sous-modules dragRaceEditor/* : liste des strips et des fichiers de réglages (dragSettings) à gauche, détails du strip ou des réglages sélectionnés à droite. Elle enregistre aussi le mode d'édition « Edit Drag Zone » pour éditer les zones (strip ou voie) dans la vue 3D. Au premier affichage dans un niveau, elle charge tous les strips et réglages.
--- Accès : extension `editor_dragRaceEditor` : `extensions.load("editor_dragRaceEditor")`, puis la globale `editor_dragRaceEditor`
---@class editor_dragRaceEditor
---@field selectStrip function Alias de strips.selectStrip (sélectionne un strip par index dans l'éditeur).
editor_dragRaceEditor = {}

--- Hook appelé après rechargement : restaure l'état renvoyé par onSerialize (valeurs par défaut -1 pour les index).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor.lua:212
---@param data table|nil Table produite par onSerialize.
function editor_dragRaceEditor.onDeserialized(data) end

--- Hook appelé à chaque frame par l'éditeur : synchronise l'éditeur de zone, dessine la fenêtre (menu, listes, détails) et l'aperçu 3D des strips. Charge les strips et réglages une seule fois si un niveau est chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor.lua:228
function editor_dragRaceEditor.onEditorGui() end

--- Hook de l'éditeur : enregistre la fenêtre (1800x900), l'entrée de menu, crée les données drag vides si besoin et déclare le mode d'édition editor.editModes.dragZoneEditMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor.lua:178
function editor_dragRaceEditor.onEditorInitialized() end

--- Hook appelé avant un rechargement des extensions Lua : renvoie le dossier/nom de fichier courant, les données drag, l'indicateur de modifications non sauvées et les index de strip/réglage sélectionnés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/dragRaceEditor.lua:201
---@return table  currentFileDir, currentFileName, dragRaceData, hasUnsavedChanges, selectedStripIndex, selectedSettingsIndex
function editor_dragRaceEditor.onSerialize() end

--- Vide la sélection d'objets de l'éditeur et affiche la fenêtre « Drag Race Editor ».
---Source : lua/ge/extensions/editor/dragRaceEditor.lua:223
function editor_dragRaceEditor.show() end

