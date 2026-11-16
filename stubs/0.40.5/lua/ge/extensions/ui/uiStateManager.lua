---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/uiStateManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tracks the availability state of the interface frameworks ('vue' and 'angular') and chooses the initial screen. When both have announced uiReady, it emits the onAllUiReady hook then navigates to the startup screen (online consent, button layout, game, onboarding or menu) via ui_router. It also handles route resynchronization after an F5 reload of the UI.
--- Access: extension `ui_uiStateManager`: `extensions.load("ui_uiStateManager")`, then the global `ui_uiStateManager`
---@class ui_uiStateManager
---@field dependencies string[] ui_router, ui_router_routeManager, ui_menuManager, ui_legal.
ui_uiStateManager = {}

--- If all frameworks are ready, sets initialized to true, emits onAllUiReady and starts navigateToInitialScreen.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiStateManager.lua:110
function ui_uiStateManager._checkAllUiReady() end

--- After an F5 reload, sends the current route back to the UI via guihooks 'ui_router_routeRefresh' ({request, resolved, refreshedBy}) for each concerned framework.
---Source: lua/ge/extensions/ui/uiStateManager.lua:53
---@param uiType string Framework that just announced itself again.
---@return boolean  false if not yet initialized, otherwise true.
function ui_uiStateManager.checkAndSyncRoute(uiType) end

--- Entry point. In headless mode, directly emits the onUiReady hook; otherwise loads the ui_router extension.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiStateManager.lua:15
---@param headlessMode boolean true if the game runs without an interface.
function ui_uiStateManager.initialize(headlessMode) end

--- Returns whether a given framework, or all if there is no argument, is ready.
---Source: lua/ge/extensions/ui/uiStateManager.lua:39
---@param uiType string|nil Framework to test, or nil for all.
---@return boolean  true if ready.
function ui_uiStateManager.isUiReady(uiType) end

--- Chooses the starting screen. Without a valid license: 'legal.onlineFeatures' if online consent is missing, then 'buttonLayout' if the layout window (showedInputLayoutPopupV37) has not been seen. Otherwise 'play' if entering the game (freeroam or loading state), 'onboarding' if not shown, otherwise 'menu'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiStateManager.lua:86
function ui_uiStateManager.navigateToInitialScreen() end

--- Hook called on load: disables automatic unloading of the extension.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/uiStateManager.lua:78
function ui_uiStateManager.onExtensionLoaded() end

--- Called by the UI when a framework is loaded. Emits onUiReady(uiType), marks the framework ready, then either resynchronizes the route (already initialized) or checks whether all are ready.
---Source: lua/ge/extensions/ui/uiStateManager.lua:23
---@param uiType string 'vue' or 'angular'.
function ui_uiStateManager.uiReady(uiType) end

