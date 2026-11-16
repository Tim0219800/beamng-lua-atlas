# `ui_uiStateManager`

*File: `lua/ge/extensions/ui/uiStateManager.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_uiStateManager`: `extensions.load("ui_uiStateManager")`, then the global `ui_uiStateManager`

Tracks the availability state of the interface frameworks ('vue' and 'angular') and chooses the initial screen. When both have announced uiReady, it emits the onAllUiReady hook then navigates to the startup screen (online consent, button layout, game, onboarding or menu) via ui_router. It also handles route resynchronization after an F5 reload of the UI.

## Notes

- The unload mode is set to 'manual' on load: the extension does not unload automatically.
- Unknown uiType (other than 'vue' or 'angular'): a warning is logged and the call is ignored.
- After initialization, a new uiReady (F5 reload) emits 'ui_router_routeRefresh' for the announced framework and for those already ready.

**Dependencies (loaded first):** `ui_router`, `ui_router_routeManager`, `ui_menuManager`, `ui_legal`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_uiStateManager._checkAllUiReady()` | If all frameworks are ready, sets initialized to true, emits onAllUiReady and starts navigateToInitialScreen. *(internal)* | 110 |
| `ui_uiStateManager.checkAndSyncRoute(uiType)` | After an F5 reload, sends the current route back to the UI via guihooks 'ui_router_routeRefresh' ({request, resolved, refreshedBy}) for each concerned framework. | 53 |
| `ui_uiStateManager.initialize(headlessMode)` | Entry point. In headless mode, directly emits the onUiReady hook; otherwise loads the ui_router extension. *(internal)* | 15 |
| `ui_uiStateManager.isUiReady(uiType)` | Returns whether a given framework, or all if there is no argument, is ready. | 39 |
| `ui_uiStateManager.navigateToInitialScreen()` | Chooses the starting screen. Without a valid license: 'legal.onlineFeatures' if online consent is missing, then 'buttonLayout' if the layout window (showedInputLayoutPopupV37) has not been seen. Otherwise 'play' if entering the game (freeroam or loading state), 'onboarding' if not shown, otherwise 'menu'. *(internal)* | 86 |
| `ui_uiStateManager.onExtensionLoaded()` | Hook called on load: disables automatic unloading of the extension. *(internal)* *(hook)* | 78 |
| `ui_uiStateManager.uiReady(uiType)` | Called by the UI when a framework is loaded. Emits onUiReady(uiType), marks the framework ready, then either resynchronizes the route (already initialized) or checks whether all are ready. | 23 |

### Parameter details

#### `ui_uiStateManager.checkAndSyncRoute(uiType)`

After an F5 reload, sends the current route back to the UI via guihooks 'ui_router_routeRefresh' ({request, resolved, refreshedBy}) for each concerned framework.

- `uiType` (*string*) : Framework that just announced itself again.
- **returns**: boolean false if not yet initialized, otherwise true.

#### `ui_uiStateManager.initialize(headlessMode)`

Entry point. In headless mode, directly emits the onUiReady hook; otherwise loads the ui_router extension.

- `headlessMode` (*boolean*) : true if the game runs without an interface.

#### `ui_uiStateManager.isUiReady(uiType)`

Returns whether a given framework, or all if there is no argument, is ready.

- `uiType` (*string|nil*) : Framework to test, or nil for all.
- **returns**: boolean true if ready.

#### `ui_uiStateManager.uiReady(uiType)`

Called by the UI when a framework is loaded. Emits onUiReady(uiType), marks the framework ready, then either resynchronizes the route (already initialized) or checks whether all are ready.

- `uiType` (*string*) : 'vue' or 'angular'.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_router, ui_router_routeManager, ui_menuManager, ui_legal. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAllUiReady`
- `onUiReady` — listened to by 6 module(s)

**UI events (guihooks.trigger):** `ui_router_routeRefresh`

**Loads extensions:** `ui_router`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/uiStateManager.lua`.*
