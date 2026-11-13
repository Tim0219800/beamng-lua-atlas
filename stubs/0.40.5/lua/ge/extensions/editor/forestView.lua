---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Forest View » de l'éditeur, destinée à lister les ForestItemData de la forêt (« theForest ») sous forme de boutons triés par nom. Le module est en grande partie inachevé : les hooks d'activation/désactivation du mode d'édition sont commentés à l'export, donc la liste n'est jamais remplie et la fenêtre reste vide.
--- Accès : extension `editor_forestView` : `extensions.load("editor_forestView")`, puis la globale `editor_forestView`
---@class editor_forestView
editor_forestView = {}

--- Hook appelé à l'activation de l'éditeur ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestView.lua:15
function editor_forestView.onEditorActivated() end

--- Hook appelé chaque frame par l'éditeur : dessine la fenêtre « Forest View » avec un bouton par entrée de forestItemsInfo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestView.lua:86
function editor_forestView.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre « forestEditorView » (220x320).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestView.lua:11
function editor_forestView.onEditorInitialized() end

