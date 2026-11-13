---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topLeft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Déclare le conteneur d'apps « topLeft » (coin haut-gauche de l'interface) auprès de ui_appContainers. Le trigger UI est setTopLeftAppVisibility. Apps déclarées : messages et tasks (visibles par défaut), scoreboard, driftScores, dragInfo et dragDialControl (cachées par défaut).
--- Accès : extension `ui_appContainers_topLeft` : `extensions.load("ui_appContainers_topLeft")`, puis la globale `ui_appContainers_topLeft`
---@class ui_appContainers_topLeft
---@field dependencies table<integer, string> { "ui_appContainers" } : chargé avant ce module.
ui_appContainers_topLeft = {}

--- Appelé au chargement de l'extension : enregistre le conteneur topLeft via ui_appContainers.registerContainer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topLeft.lua:8
function ui_appContainers_topLeft.onExtensionLoaded() end

