---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/groundModelDebugHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ajoute à l'éditeur l'entrée de menu Window > Debug > « GroundModel Debug », qui ouvre la fenêtre de l'extension util_groundModelDebug (extensions.util_groundModelDebug.openWindow()).
--- Accès : extension `editor_groundModelDebugHelper` : `extensions.load("editor_groundModelDebugHelper")`, puis la globale `editor_groundModelDebugHelper`
---@class editor_groundModelDebugHelper
editor_groundModelDebugHelper = {}

--- Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « GroundModel Debug » (groupe Debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/groundModelDebugHelper.lua:11
function editor_groundModelDebugHelper.onEditorInitialized() end

