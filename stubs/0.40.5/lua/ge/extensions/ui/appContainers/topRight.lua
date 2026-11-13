---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/appContainers/topRight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Déclare le conteneur d'apps « topRight » (coin haut-droit de l'interface) auprès de ui_appContainers, avec le trigger UI setTopRightAppVisibility. La liste d'apps est vide dans 0.40.5 : le conteneur existe mais ne gère aucune app.
--- Accès : extension `ui_appContainers_topRight` : `extensions.load("ui_appContainers_topRight")`, puis la globale `ui_appContainers_topRight`
---@class ui_appContainers_topRight
---@field dependencies table<integer, string> { "ui_appContainers" } : chargé avant ce module.
ui_appContainers_topRight = {}

--- Appelé au chargement de l'extension : enregistre le conteneur topRight (sans app) via ui_appContainers.registerContainer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/appContainers/topRight.lua:8
function ui_appContainers_topRight.onExtensionLoaded() end

