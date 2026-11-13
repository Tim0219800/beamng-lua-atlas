---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/testTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet Test, créée par le constructeur renvoyé par le module (appelle init). Possède windowDescription = 'Test'.
---@class editor_rallyEditor_testTab
local editor_rallyEditor_testTab = {}

--- Dessine les trois boutons de test (imgui). Ne fait rien sans notebook.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:42
function editor_rallyEditor_testTab:draw() end

--- Point d'entrée de dessin debug en vue 3D ; vide ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:71
function editor_rallyEditor_testTab:drawDebugEntrypoint() end

--- Constructeur : mémorise rallyEditor, path = nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:13
---@param rallyEditor table Module éditeur de rallye parent.
function editor_rallyEditor_testTab:init(rallyEditor) end

--- Appelé par l'éditeur de rallye quand l'onglet est sélectionné ; relance le hook onEditorEditModeChanged(nil, nil) pour redessiner la légende des raccourcis.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:25
function editor_rallyEditor_testTab:selected() end

--- Définit le notebook courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:20
---@param path table|nil Notebook (objet rallye).
function editor_rallyEditor_testTab:setPath(path) end

--- Affiche dans la console le nom d'un pacenote système aléatoire de type 'precountdown' (path:getRandomSystemPacenote).
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:64
function editor_rallyEditor_testTab:test1() end

--- Appelé quand l'onglet est quitté ; émet aussi onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/testTab.lua:36
function editor_rallyEditor_testTab:unselect() end

