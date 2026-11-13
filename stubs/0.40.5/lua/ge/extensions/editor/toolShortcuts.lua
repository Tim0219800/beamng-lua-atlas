---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolShortcuts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Edit Mode Shortcuts » de l'éditeur : permet d'assigner un mode d'édition (editor.editModes) à chacune des touches F2 à F10 (9 emplacements). Les assignations sont lues/écrites dans settings/editor/editModeShortcuts.json. Sans fichier, les défauts sont objectSelect, createObject puis les modes avec icône triés par nom de clé. L'extension crée aussi editor.openTool1 … editor.openTool9 qui activent le mode assigné.
--- Accès : extension `editor_toolShortcuts` : `extensions.load("editor_toolShortcuts")`, puis la globale `editor_toolShortcuts`
---@class editor_toolShortcuts
editor_toolShortcuts = {}

--- Hook de rendu de l'éditeur : dessine, pour chaque touche F2-F10, l'icône du mode, un combo de recherche pour choisir le mode, et le bouton « Reset to Defaults ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/toolShortcuts.lua:112
function editor_toolShortcuts.onEditorGui() end

--- Hook d'initialisation de l'éditeur : charge les assignations, enregistre la fenêtre (380x380) et définit editor.openTool1…openTool9.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/toolShortcuts.lua:167
function editor_toolShortcuts.onEditorInitialized() end

--- Affiche la fenêtre « Edit Mode Shortcuts » (editor.showWindow).
---Source : lua/ge/extensions/editor/toolShortcuts.lua:108
function editor_toolShortcuts.openWindow() end

