---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/imguiCDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de l'éditeur qui ajoute l'entrée de menu « ImGui Demo » (groupe Debug du menu Window). Elle ouvre la fenêtre de démonstration intégrée de Dear ImGui (ui_imgui.ShowDemoWindow), utile à un moddeur pour voir tous les widgets ImGui disponibles. Elle n'écrit aucune donnée.
--- Accès : extension `editor_imguiCDemo` : `extensions.load("editor_imguiCDemo")`, puis la globale `editor_imguiCDemo`
---@class editor_imguiCDemo
editor_imguiCDemo = {}

--- Appelé à chaque frame par l'éditeur ; si la fenêtre est ouverte, affiche la fenêtre de démo ImGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/imguiCDemo.lua:9
function editor_imguiCDemo.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur ; enregistre le menu « ImGui Demo » dans le groupe Debug via editor.addWindowMenuItem.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/imguiCDemo.lua:19
function editor_imguiCDemo.onEditorInitialized() end

