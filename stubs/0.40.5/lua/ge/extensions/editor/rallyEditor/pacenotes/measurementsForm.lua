---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Section « Measurements » de l'éditeur de pacenotes de rallye : repliable au clic sur son titre. Elle affiche pour le pacenote sélectionné le résumé de la mesure géométrique du virage (type d'ajustement, intensité, direction, diamètre, arc, corde, angle, qualité d'ajustement, candidat épingle) et une liste déroulante « Measurement Type ». Un bouton « Details » ouvre une fenêtre avec l'arbre complet de pacenote.measurements, et un bouton ouvre/ferme la fenêtre de calibration.
--- Accès : extension `editor_rallyEditor_pacenotes_measurementsForm` : `extensions.load("editor_rallyEditor_pacenotes_measurementsForm")`, puis la globale `editor_rallyEditor_pacenotes_measurementsForm`
---@class editor_rallyEditor_pacenotes_measurementsForm
editor_rallyEditor_pacenotes_measurementsForm = {}

--- Réinitialisation d'état appelée par l'éditeur ; ne fait rien dans ce module.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua:256
function editor_rallyEditor_pacenotes_measurementsForm.clear() end

--- Dessine la section Measurements. Met pacenoteToolsState.showMeasurements à true quand la section est dépliée, false sinon.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/measurementsForm.lua:222
---@param pacenote table Pacenote sélectionné.
---@param pacenoteToolsState table|nil État partagé des outils pacenotes (champ showMeasurements écrit).
---@param pacenoteToolsWindow table|nil Fenêtre d'outils pacenotes (rallyEditor, measureSelectedPacenote, markValidationDirty).
function editor_rallyEditor_pacenotes_measurementsForm.draw(pacenote, pacenoteToolsState, pacenoteToolsWindow) end

