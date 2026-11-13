---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre imgui flottante « Pacenote Calibration » de l'éditeur de rallye, avec trois onglets. « Calibration » : édition des bornes (seuils) du diamètre d'intensité des virages et des longueurs d'arc par intensité, sur des lignes graduées colorées, enregistrées comme surcharges de mission (calibrationOverrides) pour le style de compositeur actif. « Analysis » : compare les étiquettes manuelles de calibration des pacenotes (cibles) avec les intensités et longueurs projetées par les mesures actuelles, avec tooltips d'exemples. « Export » : boutons « Export Analysis JSON » et « Export Analysis JSON v2 » (voir calibrationAnalysisExport). Après modification des bornes, les caches du compositeur du carnet sont invalidés et les notes structurées recalculées.
--- Accès : extension `editor_rallyEditor_pacenotes_calibrationWindow` : `extensions.load("editor_rallyEditor_pacenotes_calibrationWindow")`, puis la globale `editor_rallyEditor_pacenotes_calibrationWindow`
---@class editor_rallyEditor_pacenotes_calibrationWindow
editor_rallyEditor_pacenotes_calibrationWindow = {}

--- Dessine la fenêtre de calibration (onglets Calibration, Analysis, Export). À appeler à chaque image par l'éditeur ; ne fait rien si la fenêtre est fermée ou sans carnet.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/calibrationWindow.lua:832
---@param rallyEditor table Extension de l'éditeur de rallye (fournit getPacenotesWindow).
---@param openPtr BoolPtr Pointeur imgui de l'état ouvert/fermé de la fenêtre ; mis à jour par la croix de fermeture.
function editor_rallyEditor_pacenotes_calibrationWindow.draw(rallyEditor, openPtr) end

