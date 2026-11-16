---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/menuManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Decides which UI route (ui_router) to display when the player opens, closes or toggles the menu: main menu, pause menu v2, garage, mission or scenario screens, or return to the game. It emits the hooks onBeforeMenuOpened and onMenuToggled. A modder uses it to open/close the menu by script or to set the active game route (setGameplayRoute) or pause route (setPauseRoute).
--- Access: extension `ui_menuManager`: `extensions.load("ui_menuManager")`, then the global `ui_menuManager`
---@class ui_menuManager
ui_menuManager = {}

--- Navigates to a route: either a string (route name, alias, or "options" which becomes "pause.options" in a level), or a table {state, params}. Returns nothing.
---Source: lua/ge/extensions/ui/menuManager.lua:318
---@param data string|table Route name or {state = route, params = table}.
function ui_menuManager.MenuOpenModule(data) end

--- Returns to the active game route (emits onMenuToggled(false)), unless already on a game route or on "garage" or there is no current route.
---Source: lua/ge/extensions/ui/menuManager.lua:309
---@return table  {handled = true, ...}.
function ui_menuManager.closeMenu() end

--- Navigates directly to the "menu" route (main menu), without emitting onMenuToggled.
---Source: lua/ge/extensions/ui/menuManager.lua:305
---@return table  {handled = true, targetRoute = "menu", navigation}.
function ui_menuManager.closeToMenu() end

--- Returns the active game route.
---Source: lua/ge/extensions/ui/menuManager.lua:21
---@return string  "play" by default.
function ui_menuManager.getGameplayRoute() end

--- Returns whether pause menu v2 is active (always true in this version, see notes).
---Source: lua/ge/extensions/ui/menuManager.lua:339
---@return boolean  true.
function ui_menuManager.isPauseV2Enabled() end

--- Displays the menu (menu/pause route) if showMenu is true, otherwise the game route.
---Source: lua/ge/extensions/ui/menuManager.lua:327
---@param showMenu boolean true to display the menu.
---@return table  {handled = true, targetRoute, navigation}.
function ui_menuManager.menuHide(showMenu) end

--- Opens the menu (pause route or main menu) unless already there. Emits onBeforeMenuOpened then onMenuToggled(true).
---Source: lua/ge/extensions/ui/menuManager.lua:296
---@return table  {handled = true, ...}.
function ui_menuManager.openMenu() end

--- Sets the route considered as "game" ("play" if nil).
---Source: lua/ge/extensions/ui/menuManager.lua:13
---@param route string|nil Road name.
function ui_menuManager.setGameplayRoute(route) end

--- Sets a specific pause route, taking priority over "pause" when a level is loaded (nil to return to the default behavior).
---Source: lua/ge/extensions/ui/menuManager.lua:17
---@param route string|nil Road name.
function ui_menuManager.setPauseRoute(route) end

--- Toggles between the game and the menu (Escape key). Handles the cases of no level, garage, mission screens (mission.control), scenarios, game to menu, menu to game, otherwise navigates back.
---Source: lua/ge/extensions/ui/menuManager.lua:201
---@return table  {handled = boolean, ...} with targetRoute and navigation depending on the case.
function ui_menuManager.toggleMenu() end

