---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Formulaire imgui « Calibration Metadata » affiché dans l'éditeur de pacenotes. Il permet de choisir, pour le pacenote sélectionné, cinq valeurs de calibration (intensité, descripteur, direction, longueur, forme) via des listes déroulantes alimentées par la configuration du compositeur de texte du carnet (componentTypes.corner). Les choix sont stockés dans pacenote.metadata.calibration. Rien n'est affiché si le carnet n'a pas de metadata.calibrationFields.
--- Accès : extension `editor_rallyEditor_pacenotes_calibrationMetadataForm` : `extensions.load("editor_rallyEditor_pacenotes_calibrationMetadataForm")`, puis la globale `editor_rallyEditor_pacenotes_calibrationMetadataForm`
---@class editor_rallyEditor_pacenotes_calibrationMetadataForm
editor_rallyEditor_pacenotes_calibrationMetadataForm = {}

--- Dessine la section de métadonnées de calibration pour un pacenote. Ne fait rien si le pacenote n'a pas de carnet, si le carnet n'a pas de calibrationFields, ou si le compositeur n'a pas de configuration corner.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationMetadataForm.lua:140
---@param pacenote table Pacenote édité (accède à pacenote.notebook et pacenote.metadata).
---@param pacenoteToolsWindow table Fenêtre d'outils pacenotes (non utilisée dans le code).
function editor_rallyEditor_pacenotes_calibrationMetadataForm.draw(pacenote, pacenoteToolsWindow) end

