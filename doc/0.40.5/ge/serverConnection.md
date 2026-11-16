# `serverConnection`

*File: `lua/ge/serverConnection.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `serverConnection`

Disconnection of the local session (stopping the simulation, cleanup) and transition of the world-ready state. It is used when leaving a level to return to the menu: stopping the physics, restoring the cursor, stopping the mission lighting, destroying the local server and clearing the mission name. It also moves worldReadyState from 0 to 1 once the first camera is set.

## Example

```lua
serverConnection.disconnect(function() print('level left') end, true)
```

## Notes

- worldReadyState is a global variable (outside the module): 0 on load, set to 1 by onCameraHandlerSetInitial; the next step (2) is done in the frame update (code comment).
- disconnect (disconnectWrapper) goes through core_gamestate.requestEnterLoadingScreen when loadingScreen is true: the actual disconnection (disconnectActual) takes place only once the loading screen is displayed, asynchronously. The callback is called at the end of disconnectActual.
- disconnectActual is not exported: the code states that it must not be called directly (inconsistent game state).

## Functions

| Function | Description | Line |
|---|---|---|
| `serverConnection.disconnect(callback, loadingScreen, p)` | Leaves the current session: displays the loading screen (by default), then stops the physics, restores the cursor, turns off the mission lighting, destroys the server (server.destroy), clears the mission name, leaves the loading screen and calls callback. | 63 |
| `serverConnection.noLoadingScreenDisconnect(p)` | Immediate disconnection without a loading screen and without a callback (disconnect(nop, false, p)). Used from external code ('.cs' comment). | 79 |
| `serverConnection.onCameraHandlerSetInitial()` | Hook called when the first camera/control object is set by the server. If worldReadyState is 0, enables hiding of the idle cursor, sets worldReadyState to 1 and broadcasts the onWorldReadyState(1) hook. *(internal)* *(hook)* | 8 |

### Parameter details

#### `serverConnection.disconnect(callback, loadingScreen, p)`

Leaves the current session: displays the loading screen (by default), then stops the physics, restores the cursor, turns off the mission lighting, destroys the server (server.destroy), clears the mission name, leaves the loading screen and calls callback.

- `callback` (*function|nil*) : Function called at the end of the disconnection; its return value is ignored (disconnectWrapper returns nothing).
- `loadingScreen` (*boolean|nil*) : true by default (nil counts as true). false: disconnects immediately without a loading screen.
- `p` (*table|nil*) : Optional profiler (object with :add(label)) to measure the steps.

#### `serverConnection.noLoadingScreenDisconnect(p)`

Immediate disconnection without a loading screen and without a callback (disconnect(nop, false, p)). Used from external code ('.cs' comment).

- `p` (*table|nil*) : Optional profiler.

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onWorldReadyState` — listened to by 4 module(s)

## Calls into the engine (C++)

- `be:` `physicsStopSimulation`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/serverConnection.lua`.*
