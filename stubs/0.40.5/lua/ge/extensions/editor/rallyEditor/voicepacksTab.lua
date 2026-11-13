---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet (windowDescription = 'Voicepacks').
---@class editor_rallyEditor_voicepacksTab
local editor_rallyEditor_voicepacksTab = {}

--- Dessine l'onglet ; message si aucune mission n'est chargée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:255
---@param mouseInfo table Informations souris (non utilisé).
function editor_rallyEditor_voicepacksTab:draw(mouseInfo) end

--- Dessine la liste des voicepacks globaux (voicepack.scan()).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:241
---@param missionDir string Dossier de la mission.
function editor_rallyEditor_voicepacksTab:drawGlobalVoicepacks(missionDir) end

--- Dessine la liste des voicepacks de la mission (voicepack.scanMission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:248
---@param missionDir string Dossier de la mission.
function editor_rallyEditor_voicepacksTab:drawMissionLocalVoicepacks(missionDir) end

--- Dessine les menus « Voicepack » et « Notebook » ; changer de sélection appelle setVoicepackPick ou loadNotebook de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:130
---@param missionDir string Dossier de la mission.
function editor_rallyEditor_voicepacksTab:drawPickers(missionDir) end

--- Constructeur : mémorise rallyEditor et crée le cache de validation audio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:20
---@param rallyEditor table Éditeur de rallye parent.
function editor_rallyEditor_voicepacksTab:init(rallyEditor) end

--- Appelé à la sélection de l'onglet : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:29
function editor_rallyEditor_voicepacksTab:selected() end

--- Définit le notebook courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:25
---@param path table|nil Notebook.
function editor_rallyEditor_voicepacksTab:setPath(path) end

--- Appelé quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/voicepacksTab.lua:33
function editor_rallyEditor_voicepacksTab:unselect() end

