---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/levelSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension d'éditeur minimale : enregistre un gestionnaire d'inspecteur pour le type de sélection « level_settings » (qui n'affiche que le texte « Level Settings ») et ajoute editor.showLevelSettings() pour sélectionner ce pseudo-objet.
--- Accès : extension `editor_levelSettings` : `extensions.load("editor_levelSettings")`, puis la globale `editor_levelSettings`
---@class editor_levelSettings
editor_levelSettings = {}

--- Appelé à l'activation de l'éditeur : enregistre le type d'inspecteur « level_settings » et définit editor.showLevelSettings.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelSettings.lua:21
function editor_levelSettings.onEditorActivated() end

--- Appelé à la désactivation de l'éditeur : retire le type d'inspecteur « level_settings ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelSettings.lua:26
function editor_levelSettings.onEditorDeactivated() end

--- Hook appelé au chargement de l'extension. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/levelSettings.lua:13
function editor_levelSettings.onExtensionLoaded() end

