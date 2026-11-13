---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/logger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension d'éditeur vide (squelette). Elle déclare onEditorGui et onExtensionLoaded sans aucun code : aucune fenêtre ni aucun comportement n'est ajouté.
--- Accès : extension `editor_logger` : `extensions.load("editor_logger")`, puis la globale `editor_logger`
---@class editor_logger
editor_logger = {}

--- Hook appelé à chaque frame par l'éditeur pour dessiner l'interface. Corps vide ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/logger.lua:9
function editor_logger.onEditorGui() end

--- Hook appelé au chargement de l'extension. Corps vide ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/logger.lua:12
function editor_logger.onExtensionLoaded() end

