---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet (windowDescription = 'System Pacenotes').
---@class editor_rallyEditor_systemPacenotesTab
local editor_rallyEditor_systemPacenotesTab = {}

--- Oublie le notebook et les pacenotes système affichés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:18
function editor_rallyEditor_systemPacenotesTab:clearState() end

--- Dessine l'onglet (message si mission non rallyStage, sinon bouton de rafraîchissement et tableau à 4 colonnes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:122
---@param mouseInfo table Informations souris (non utilisé).
function editor_rallyEditor_systemPacenotesTab:draw(mouseInfo) end

--- Constructeur : mémorise rallyEditor, liste vide de pacenotes système.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:11
---@param rallyEditor table Éditeur de rallye parent.
function editor_rallyEditor_systemPacenotesTab:init(rallyEditor) end

--- Appelé quand l'onglet est sélectionné : charge path:getSystemPacenotesForAudioMode() puis émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:36
function editor_rallyEditor_systemPacenotesTab:selected() end

--- Définit le notebook courant (le commentaire du code précise que « path » désigne le notebook) ; active l'affichage seulement si path:getMissionType() == 'rallyStage'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:25
---@param path table|nil Notebook.
function editor_rallyEditor_systemPacenotesTab:setPath(path) end

--- Appelé quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/systemPacenotesTab.lua:50
function editor_rallyEditor_systemPacenotesTab:unselect() end

