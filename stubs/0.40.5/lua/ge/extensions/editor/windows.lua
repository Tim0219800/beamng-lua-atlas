---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/windows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Windows » de l'éditeur (menu Window > Window Position Reset...). Elle liste toutes les fenêtres enregistrées de l'éditeur (editor.getWindowsState()), triées par titre et filtrables, avec deux boutons par fenêtre : « Move to center » (recentre la fenêtre dans le viewport) et « Highlight » (entoure la fenêtre d'un rectangle orange pendant 3,5 s). Utile quand une fenêtre est perdue hors de l'écran.
--- Accès : extension `editor_windows` : `extensions.load("editor_windows")`, puis la globale `editor_windows`
---@class editor_windows
editor_windows = {}

--- Hook de l'éditeur appelé à chaque frame d'interface. Dessine la fenêtre « Windows » (filtre de recherche et tableau à deux colonnes) puis les rectangles de surbrillance en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/windows.lua:82
function editor_windows.onEditorGui() end

--- Hook de l'éditeur appelé à l'initialisation. Enregistre la fenêtre (taille 800x500) et ajoute l'entrée de menu « Window Position Reset... ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/windows.lua:126
function editor_windows.onEditorInitialized() end

