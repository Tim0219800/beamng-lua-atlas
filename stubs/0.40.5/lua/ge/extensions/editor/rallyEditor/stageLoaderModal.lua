---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre modale « Open Rally Stage » de l'éditeur de rallye. Elle liste les missions de type rallyStage du niveau courant (gameplay_missions_missions.getFilesData), triées par nom, les missions de dev étant marquées [DEV]. Le bouton Open charge le notebook de la mission choisie (rallyEditor.loadForMissionEditor) et affiche l'outil (showRallyTool).
--- Accès : extension `editor_rallyEditor_stageLoaderModal` : `extensions.load("editor_rallyEditor_stageLoaderModal")`, puis la globale `editor_rallyEditor_stageLoaderModal`
---@class editor_rallyEditor_stageLoaderModal
editor_rallyEditor_stageLoaderModal = {}

--- À appeler chaque frame. Ouvre la popup quand openPtr[0] passe à true (en rafraîchissant la liste), dessine la liste et les détails, et remet openPtr[0] à false à la fermeture (Open ou Cancel).
---Source : lua/ge/extensions/editor/rallyEditor/stageLoaderModal.lua:140
---@param rallyEditor table Module éditeur de rallye (doit fournir loadForMissionEditor et showRallyTool).
---@param openPtr table Pointeur booléen imgui (BoolPtr) indiquant si la modale doit être ouverte.
function editor_rallyEditor_stageLoaderModal.draw(rallyEditor, openPtr) end

