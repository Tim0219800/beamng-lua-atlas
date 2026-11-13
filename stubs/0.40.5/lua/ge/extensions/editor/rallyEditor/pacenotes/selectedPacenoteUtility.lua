---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/selectedPacenoteUtility.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite fenêtre flottante bleue « Selected Pacenote Utility » de l'éditeur de rallye. Pour le pacenote sélectionné, elle affiche trois blocs : « Actual » (appel de virage, longueur et forme réellement générés par le compositeur), « Adjustment » (risque d'intensité plus/moins, virage plus long/court, longueur ignorée) et « Metadata » (métadonnées de calibration : descripteur ou intensité, direction, longueur, forme). Elle lit le premier virage (slot 4) de la structure du pacenote.
--- Accès : extension `editor_rallyEditor_pacenotes_selectedPacenoteUtility` : `extensions.load("editor_rallyEditor_pacenotes_selectedPacenoteUtility")`, puis la globale `editor_rallyEditor_pacenotes_selectedPacenoteUtility`
---@class editor_rallyEditor_pacenotes_selectedPacenoteUtility
editor_rallyEditor_pacenotes_selectedPacenoteUtility = {}

--- Dessine la fenêtre d'utilité du pacenote sélectionné. À appeler chaque frame depuis la fenêtre des pacenotes.
---Source : lua/ge/extensions/editor/rallyEditor/pacenotes/selectedPacenoteUtility.lua:121
---@param pacenotesWindow table Fenêtre des pacenotes ; doit fournir selectedPacenote() et cameraPathIsPlaying().
function editor_rallyEditor_pacenotes_selectedPacenoteUtility.draw(pacenotesWindow) end

