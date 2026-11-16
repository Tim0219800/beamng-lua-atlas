# `core_gamestate`

*File: `lua/ge/extensions/core/gamestate.lua` · VM: Game Engine (GE) · 258 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_gamestate`: `extensions.load("core_gamestate")`, then the global `core_gamestate`

GE extension `core_gamestate`: two roles. (1) Store the GAME state (freeroam, campaign… with app layout and menu items) and broadcast it to the extensions and the UI. (2) Drive the loading screen: modules request to show it (requestEnterLoadingScreen) and to close it (requestExitLoadingScreen); the screen only closes when ALL requesters have finished. A modder uses it to show the loading screen during a long task.

## Example

```lua
core_gamestate.requestEnterLoadingScreen('monMod', function()
  -- called when the loading screen is actually displayed
  -- ... load things ...
  core_gamestate.requestExitLoadingScreen('monMod')
end)
```

## Notes

- The state is a table {state, appLayout, menuItems, options}. setGameState only replaces the provided (non-nil) fields; M.state is rebuilt on every call.
- Loading screen: loadingScreenRequests[tag] = true/false; the screen closes when all entries are false. The requestEnterLoadingScreen callback is executed immediately if the screen is already active (loadingActive), otherwise queued until loadingScreenActive() (called by the UI). Safety net: if the UI does not respond, onUpdate forces the continuation after 1 s accumulated.
- In no-UI mode (command line argument -noui) or headless_mode, requestEnterLoadingScreen executes the callback immediately without showing a screen, and does not register it.
- On closing, if getMissionFilename() == '' (no level), the UI is sent to the main menu and the game state is reset.
- Events: extension hook onGameStateUpdate(state); onLoadingScreenInactive(state); UI: GameStateUpdate, LoadingScreen {active, gotoMainMenu, gameState}, ShowEntertainingBackground, requestUIInitialised.
- Inconsistencies: the ignoreMenuswitch parameter of requestExitLoadingScreen is unused; gameStateDecorator does a debug dump() on every call; onDeserialized is empty.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_gamestate.gameStateDecorator()` | Returns the game state name if it is non-empty (also displays the state via dump(), debug). | 43 |
| `core_gamestate.getGameState()` | Deep copy of the game state. | 39 |
| `core_gamestate.getLoadingStatus(tagName)` | State of a module's request. | 97 |
| `core_gamestate.loading()` | Indicates whether at least one module requests the loading screen. Not to be used during the loading process itself (the code advises against it); prefer getLoadingStatus. | 93 |
| `core_gamestate.loadingScreenActive()` | Called by the UI when the loading screen is actually displayed: sets loadingActive and executes the pending callbacks. *(internal)* | 169 |
| `core_gamestate.loadingScreenInactive(state)` | Called by the UI when the loading screen is closed: resets the audio parameters to 0, signals LoadingManager and emits the onLoadingScreenInactive hook. *(internal)* | 175 |
| `core_gamestate.onAfterRouteChange(context)` | UI route change hook: updates the main menu music if the global functions exist. *(internal)* *(hook)* | 224 |
| `core_gamestate.onDeserialized(data)` | Restore hook: does nothing. *(internal)* *(hook)* | 184 |
| `core_gamestate.onExtensionLoaded()` | Called when the extension loads: asks the UI to report its initialization (guihooks requestUIInitialised). *(internal)* *(hook)* | 202 |
| `core_gamestate.onUIInitialised()` | Hook (alias of uiReady) called when the UI is ready: if a loading was waiting for the UI, re-emits LoadingScreen {active = true}. *(internal)* *(hook)* | 187 |
| `core_gamestate.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: if callbacks have been waiting for the loading screen for more than 1 s (accumulated time capped at 1/30 s per frame), forces loadingScreenActive. *(internal)* *(hook)* | 210 |
| `core_gamestate.requestEnterLoadingScreen(tagName, func)` | Requests the display of the loading screen on behalf of a module. On the first request, sends LoadingScreen {active = true} and sets the audio parameters g_GameLoading=1 and g_FadeTimeMS=1000. func is called when the screen is ready. | 101 |
| `core_gamestate.requestExitLoadingScreen(tagName, ignoreMenuswitch)` | Indicates that the requester has finished. When all have finished, the loading screen is hidden (LoadingScreen {active = false, gotoMainMenu, gameState}) and the callback queue is cleared. | 141 |
| `core_gamestate.requestGameState()` | Broadcasts the current game state: onGameStateUpdate hook and UI event GameStateUpdate (alias of sendGameState). | 23 |
| `core_gamestate.requestMainMenuState()` | Tells the UI whether to show the main menu background (guihooks ShowEntertainingBackground): true when getMissionFilename() is empty. Does not change the UI route. | 59 |
| `core_gamestate.setGameState(state, appLayout, menuItems, options)` | Updates the game state (freeroam, campaign…) then broadcasts it. nil parameters keep the old value. | 29 |

### Parameter details

#### `core_gamestate.gameStateDecorator()`

Returns the game state name if it is non-empty (also displays the state via dump(), debug).

- **returns**: string|nil State name or nil.

#### `core_gamestate.getGameState()`

Deep copy of the game state.

- **returns**: table Copy of M.state.

#### `core_gamestate.getLoadingStatus(tagName)`

State of a module's request.

- `tagName` (*string*) : Requester identifier.
- **returns**: boolean|nil true = requested, false = finished, nil = never requested.

#### `core_gamestate.loading()`

Indicates whether at least one module requests the loading screen. Not to be used during the loading process itself (the code advises against it); prefer getLoadingStatus.

- **returns**: boolean true if a loading is requested.

#### `core_gamestate.loadingScreenInactive(state)`

Called by the UI when the loading screen is closed: resets the audio parameters to 0, signals LoadingManager and emits the onLoadingScreenInactive hook.

- `state` (*number|string*) : State sent by the UI (converted to a number if possible).

#### `core_gamestate.onAfterRouteChange(context)`

UI route change hook: updates the main menu music if the global functions exist.

- `context` (*table*) : Context with toRoute.name.

#### `core_gamestate.onDeserialized(data)`

Restore hook: does nothing.

- `data` (*any*) : Not used.

#### `core_gamestate.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: if callbacks have been waiting for the loading screen for more than 1 s (accumulated time capped at 1/30 s per frame), forces loadingScreenActive.

- `dtReal` (*number*) : Real-time delta in seconds.
- `dtSim` (*number*) : Simulation delta.
- `dtRaw` (*number*) : Raw delta.

#### `core_gamestate.requestEnterLoadingScreen(tagName, func)`

Requests the display of the loading screen on behalf of a module. On the first request, sends LoadingScreen {active = true} and sets the audio parameters g_GameLoading=1 and g_FadeTimeMS=1000. func is called when the screen is ready.

- `tagName` (*string*) : Requester identifier (same name to reuse for the exit). nil: ignored.
- `func` (*function|nil*) : Callback to execute when the screen is displayed.

#### `core_gamestate.requestExitLoadingScreen(tagName, ignoreMenuswitch)`

Indicates that the requester has finished. When all have finished, the loading screen is hidden (LoadingScreen {active = false, gotoMainMenu, gameState}) and the callback queue is cleared.

- `tagName` (*string*) : Same identifier as for the entry. An unknown tag produces a warning.
- `ignoreMenuswitch` (*boolean|nil*) : Not used in the code.

#### `core_gamestate.requestMainMenuState()`

Tells the UI whether to show the main menu background (guihooks ShowEntertainingBackground): true when getMissionFilename() is empty. Does not change the UI route.

- **returns**: boolean true if no level is loaded.

#### `core_gamestate.setGameState(state, appLayout, menuItems, options)`

Updates the game state (freeroam, campaign…) then broadcasts it. nil parameters keep the old value.

- `state` (*string|nil*) : Name of the game state.
- `appLayout` (*any*) : UI apps layout (inferred from code).
- `menuItems` (*any*) : Menu items (inferred from code).
- `options` (*any*) : Additional options.

## Fields

| Field | Type | Description |
|---|---|---|
| `state` | table | Current game state {state, appLayout, menuItems, options}; {} at start and after a return to the main menu. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameStateUpdate` — listened to by 3 module(s)
- `onLoadingScreenInactive` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `GameStateUpdate`, `LoadingScreen`, `ShowEntertainingBackground`, `requestUIInitialised`

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/gamestate.lua`.*
