---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/missionTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet onglet renvoyé par le constructeur (new(rallyEditor)). Champs : rallyEditor, path, windowDescription = 'Mission'.
---@class editor_rallyEditor_missionTab
local editor_rallyEditor_missionTab = {}

--- Dessine l'interface imgui de l'onglet (infos mission, liste des voicepacks locaux).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/missionTab.lua:45
---@param mouseInfo table Informations souris (non utilisées ici).
function editor_rallyEditor_missionTab:draw(mouseInfo) end

--- Constructeur interne : mémorise l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/missionTab.lua:14
---@param rallyEditor table Instance de l'éditeur (getCurrentMissionDir/Name/Id, getCurrentVoicepackPick).
function editor_rallyEditor_missionTab:init(rallyEditor) end

--- Appelée quand l'onglet est sélectionné : émet le hook onEditorEditModeChanged(nil, nil) pour quitter tout mode d'édition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/missionTab.lua:22
function editor_rallyEditor_missionTab:selected() end

--- Mémorise le carnet courant (appelé par l'éditeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/missionTab.lua:18
---@param path table Carnet courant.
function editor_rallyEditor_missionTab:setPath(path) end

--- Appelée quand l'onglet est quitté : émet le hook onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/missionTab.lua:26
function editor_rallyEditor_missionTab:unselect() end

