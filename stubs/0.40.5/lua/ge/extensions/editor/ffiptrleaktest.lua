---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ffiptrleaktest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de test interne de l'éditeur (fuites de pointeurs FFI avec ImGui). Elle ouvre une fenêtre « ffi ptr leak test » avec des widgets de test (case à cocher, sliders, champ texte, image) et la fenêtre de démo ImGui. Elle est désactivée dans cette version : le fichier exécute `do return M end` juste après `local M = {}`, donc les hooks ne sont jamais exportés.
--- Accès : extension `editor_ffiptrleaktest` : `extensions.load("editor_ffiptrleaktest")`, puis la globale `editor_ffiptrleaktest`
---@class editor_ffiptrleaktest
editor_ffiptrleaktest = {}

--- Hook d'éditeur appelé chaque frame GUI : dessine la fenêtre de test ImGui. Non exporté tant que le fichier est désactivé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ffiptrleaktest.lua:22
function editor_ffiptrleaktest.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre « ffi ptr leak test », son entrée de menu Window et charge la texture de test. Non exporté tant que le fichier est désactivé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/ffiptrleaktest.lua:48
function editor_ffiptrleaktest.onEditorInitialized() end

