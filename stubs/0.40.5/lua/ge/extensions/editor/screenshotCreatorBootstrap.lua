---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/screenshotCreatorBootstrap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit amorçage de l'éditeur : ajoute l'entrée de menu Fenêtre > Vehicles > « Vehicle Screenshot Creator » qui ouvre la fenêtre de l'extension util_screenshotCreator (captures de véhicules).
--- Accès : extension `editor_screenshotCreatorBootstrap` : `extensions.load("editor_screenshotCreatorBootstrap")`, puis la globale `editor_screenshotCreatorBootstrap`
---@class editor_screenshotCreatorBootstrap
editor_screenshotCreatorBootstrap = {}

--- Appelé à l'initialisation de l'éditeur : crée l'élément de menu « Vehicle Screenshot Creator » (groupe de menu « Vehicles »). Son clic appelle extensions.util_screenshotCreator.openWindow().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/screenshotCreatorBootstrap.lua:13
function editor_screenshotCreatorBootstrap.onEditorInitialized() end

