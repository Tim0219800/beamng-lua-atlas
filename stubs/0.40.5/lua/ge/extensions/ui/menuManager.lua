---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/menuManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Décide quelle route de l'interface (ui_router) afficher quand le joueur ouvre, ferme ou bascule le menu : menu principal, menu pause v2, garage, écrans de mission ou de scénario, ou retour au jeu. Il émet les hooks onBeforeMenuOpened et onMenuToggled. Un moddeur l'utilise pour ouvrir/fermer le menu par script ou pour définir la route de jeu (setGameplayRoute) ou de pause (setPauseRoute) actives.
--- Accès : extension `ui_menuManager` : `extensions.load("ui_menuManager")`, puis la globale `ui_menuManager`
---@class ui_menuManager
ui_menuManager = {}

--- Navigue vers une route : soit une chaîne (nom de route, alias, ou « options » qui devient « pause.options » en niveau), soit une table {state, params}. Ne renvoie rien.
---Source : lua/ge/extensions/ui/menuManager.lua:318
---@param data string|table Nom de route ou {state = route, params = table}.
function ui_menuManager.MenuOpenModule(data) end

--- Revient à la route de jeu active (émet onMenuToggled(false)), sauf si on est déjà sur une route de jeu ou sur « garage » ou s'il n'y a pas de route courante.
---Source : lua/ge/extensions/ui/menuManager.lua:309
---@return table  {handled = true, ...}.
function ui_menuManager.closeMenu() end

--- Navigue directement vers la route « menu » (menu principal), sans émettre onMenuToggled.
---Source : lua/ge/extensions/ui/menuManager.lua:305
---@return table  {handled = true, targetRoute = "menu", navigation}.
function ui_menuManager.closeToMenu() end

--- Renvoie la route de jeu active.
---Source : lua/ge/extensions/ui/menuManager.lua:21
---@return string  « play » par défaut.
function ui_menuManager.getGameplayRoute() end

--- Indique si le menu pause v2 est actif (toujours true dans cette version, voir notes).
---Source : lua/ge/extensions/ui/menuManager.lua:339
---@return boolean  true.
function ui_menuManager.isPauseV2Enabled() end

--- Affiche le menu (route de menu/pause) si showMenu est vrai, sinon la route de jeu.
---Source : lua/ge/extensions/ui/menuManager.lua:327
---@param showMenu boolean true pour afficher le menu.
---@return table  {handled = true, targetRoute, navigation}.
function ui_menuManager.menuHide(showMenu) end

--- Ouvre le menu (route de pause ou menu principal) sauf si on y est déjà. Émet onBeforeMenuOpened puis onMenuToggled(true).
---Source : lua/ge/extensions/ui/menuManager.lua:296
---@return table  {handled = true, ...}.
function ui_menuManager.openMenu() end

--- Définit la route considérée comme « jeu » (« play » si nil).
---Source : lua/ge/extensions/ui/menuManager.lua:13
---@param route string|nil Nom de route.
function ui_menuManager.setGameplayRoute(route) end

--- Définit une route de pause spécifique, prioritaire sur « pause » quand un niveau est chargé (nil pour revenir au comportement par défaut).
---Source : lua/ge/extensions/ui/menuManager.lua:17
---@param route string|nil Nom de route.
function ui_menuManager.setPauseRoute(route) end

--- Bascule entre le jeu et le menu (touche Échap). Gère les cas sans niveau, garage, écrans de mission (mission.control), scénarios, jeu vers menu, menu vers jeu, sinon navigue en arrière.
---Source : lua/ge/extensions/ui/menuManager.lua:201
---@return table  {handled = boolean, ...} avec targetRoute et navigation selon le cas.
function ui_menuManager.toggleMenu() end

