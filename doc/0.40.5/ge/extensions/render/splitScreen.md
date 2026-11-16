# `render_splitScreen`

*File: `lua/ge/extensions/render/splitScreen.lua` · VM: Game Engine (GE) · 623 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_splitScreen`: `extensions.load("render_splitScreen")`, then the global `render_splitScreen`

Split screen (multiseat): creates a render view per player (RenderViewManagerInstance, views named 'splitscreen0', 'splitscreen1'...), computes the on-screen layout with render_splitScreenLayouts according to the number of players and the multiseatLayout<N> setting, manages per-player camera contexts, player labels and the 'multiseat' Vue HUD. The extension activates as soon as it is loaded (onExtensionLoaded calls enable) and deactivates on unload. A modder or a mission can force the player list with setCustomPlayers.

## Example

```lua
extensions.load('render_splitScreen')
render_splitScreen.setCustomPlayers({0, 1})  -- two views, players 0 and 1
-- ...
render_splitScreen.clearCustomPlayers()
extensions.unload('render_splitScreen')
```

## Notes

- Depends on core_playerPersonas, render_playerTags and render_playerCompassMarkers (loaded first).
- Maximum 64 views (one per player). Empty player list: returns {0}.
- To save rendering cost, each view receives a quality factor (meshDetailAdjust and groundCoverScale multiplied): 1.0 for 1 view, 0.75 for 2, 0.6 for 3, 0.5 for 4 and beyond. Vehicle mirrors and dynamic reflections are turned off except for the solo view. The user's graphics settings are not modified.
- When enabling the extension: the actions 'vehicleMenues' and 'nodegrabber' are blocked, the 'multiseat' setting is set to true and the 'multiseat' game route is installed.
- 'shared' mode (shared layout): a single main view is rendered; 'split' mode: one view per player.
- The 'performance preset' function (setPerformancePreset) exists but its call is commented out: unused.
- Emitted hooks: onSplitScreenChanged(enabled, playerCount, layoutId, mode) on activation and when players or layout change (false alone on deactivation), and onSplitScreenLayoutChanged() on every new layout computation. UI event: MultiseatHudData(count, layout, players, mode) or MultiseatHudData(0).

**Dependencies (loaded first):** `core_playerPersonas`, `render_playerTags`, `render_playerCompassMarkers`

## Functions

| Function | Description | Line |
|---|---|---|
| `render_splitScreen.beginSoloView(player, options)` | Temporarily shows a single player in full screen without changing the participant list or the HUD state. With options.mainView = true, uses the main view; otherwise enlarges the player's view with an 'orbit' camera. Player labels are removed during the solo view. | 482 |
| `render_splitScreen.clearCustomPlayers()` | Shortcut for setCustomPlayers(nil). | 377 |
| `render_splitScreen.endSoloView()` | Ends the solo view and restores the context camera and the layout. | 458 |
| `render_splitScreen.getCurrentConfiguration()` | Returns the current display configuration. | 562 |
| `render_splitScreen.getPlayers(result)` | Returns the ordered list of player indices that have a view: the custom list from setCustomPlayers if it exists, otherwise core_multiseat.getPlayers. Limited to 64; contains {0} if empty. | 82 |
| `render_splitScreen.isSharedView()` | True if split screen is active, rendered in shared view and without a solo view. | 567 |
| `render_splitScreen.onAfterRouteChange(context)` | UI route change hook: sends the HUD state back on each entry into the 'multiseat' route, since the Vue view is remounted with its route. *(internal)* *(hook)* | 433 |
| `render_splitScreen.onClientEndMission()` | End-of-mission hook: ends the solo view (endSoloView). *(internal)* *(hook)* | 458 |
| `render_splitScreen.onDeserialized(data)` | Hook called after a GE Lua reload: restores the saved player list and re-enables split screen. *(internal)* *(hook)* | 583 |
| `render_splitScreen.onExtensionLoaded(data)` | Extension load hook: restores customPlayers if data is provided and enables split screen. *(internal)* *(hook)* | 593 |
| `render_splitScreen.onExtensionUnloaded(preserveRoute)` | Unload hook: alias of disable(preserveRoute). Destroys the views, renders the world on the main view, resets exposure to zero and restores the 'play' game route unless preserveRoute. *(internal)* *(hook)* | 396 |
| `render_splitScreen.onSerialize(reason)` | Hook called before a GE Lua reload: returns {customPlayers} and disables split screen while keeping the route, to destroy the C++ views. *(internal)* *(hook)* | 571 |
| `render_splitScreen.onSettingsChanged()` | Hook called when settings change: rebuilds the view quality overrides, which are a snapshot of the global settings. *(internal)* *(hook)* | 448 |
| `render_splitScreen.onUpdate(dtReal, dtSim)` | Hook called every frame: recomputes the configuration (players, window size, layout) and updates the players' compass markers. *(internal)* *(hook)* | 440 |
| `render_splitScreen.refreshLayout()` | Forces the layout to be recomputed on the next pass (resets the remembered size) and does it right away if active. | 556 |
| `render_splitScreen.setCustomPlayers(players)` | Forces the list of players that must have a view (e.g. for a mission), or removes it with nil. An empty list is equivalent to nil. If split screen is active, recomputes right away. | 360 |
| `render_splitScreen.toggleFreeCam(player)` | Switches this player's own view to the next camera group (core_camera.cycleCameraGroup). | 549 |

### Parameter details

#### `render_splitScreen.beginSoloView(player, options)`

Temporarily shows a single player in full screen without changing the participant list or the HUD state. With options.mainView = true, uses the main view; otherwise enlarges the player's view with an 'orbit' camera. Player labels are removed during the solo view.

- `player` (*integer*) : Player index (converted by tonumber).
- `options` (*table|nil*) : {mainView = boolean}.
- **returns**: boolean false if player is not numeric or is not in the configured player list (or has no view); true otherwise.

#### `render_splitScreen.endSoloView()`

Ends the solo view and restores the context camera and the layout.

- **returns**: boolean true if a solo view was active.

#### `render_splitScreen.getCurrentConfiguration()`

Returns the current display configuration.

- **returns**: boolean false if split screen is inactive.
- **returns**: integer|nil Number of players.
- **returns**: string|nil Layout identifier.
- **returns**: string|nil Mode: 'shared' or 'split'.

#### `render_splitScreen.getPlayers(result)`

Returns the ordered list of player indices that have a view: the custom list from setCustomPlayers if it exists, otherwise core_multiseat.getPlayers. Limited to 64; contains {0} if empty.

- `result` (*integer[]|nil*) : Table to fill and return (reusable to avoid an allocation); created if nil.
- **returns**: integer[] Player indices.

#### `render_splitScreen.isSharedView()`

True if split screen is active, rendered in shared view and without a solo view.

- **returns**: boolean State.

#### `render_splitScreen.onAfterRouteChange(context)`

UI route change hook: sends the HUD state back on each entry into the 'multiseat' route, since the Vue view is remounted with its route.

- `context` (*table*) : Navigation context (context.toRoute.name).

#### `render_splitScreen.onDeserialized(data)`

Hook called after a GE Lua reload: restores the saved player list and re-enables split screen.

- `data` (*table*) : onSerialize data (customPlayers).

#### `render_splitScreen.onExtensionLoaded(data)`

Extension load hook: restores customPlayers if data is provided and enables split screen.

- `data` (*table|nil*) : Possible serialized data.

#### `render_splitScreen.onExtensionUnloaded(preserveRoute)`

Unload hook: alias of disable(preserveRoute). Destroys the views, renders the world on the main view, resets exposure to zero and restores the 'play' game route unless preserveRoute.

- `preserveRoute` (*boolean|nil*) : If true, does not change the game route.

#### `render_splitScreen.onSerialize(reason)`

Hook called before a GE Lua reload: returns {customPlayers} and disables split screen while keeping the route, to destroy the C++ views.

- `reason` (*string*) : Reason for serialization (used in the log).
- **returns**: table {customPlayers = ...}.

#### `render_splitScreen.onUpdate(dtReal, dtSim)`

Hook called every frame: recomputes the configuration (players, window size, layout) and updates the players' compass markers.

- `dtReal` (*number*) : Real frame duration (s).
- `dtSim` (*number*) : Simulated duration (s), unused.

#### `render_splitScreen.setCustomPlayers(players)`

Forces the list of players that must have a view (e.g. for a mission), or removes it with nil. An empty list is equivalent to nil. If split screen is active, recomputes right away.

- `players` (*integer[]|nil*) : Ordered player indices, or nil to clear the override.

#### `render_splitScreen.toggleFreeCam(player)`

Switches this player's own view to the next camera group (core_camera.cycleCameraGroup).

- `player` (*integer*) : Player index.
- **returns**: boolean false if the player has no split screen view (the caller can then use the main camera toggle).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded first: core_playerPersonas, render_playerTags, render_playerCompassMarkers. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onSplitScreenChanged` — listened to by 5 module(s)
- `onSplitScreenLayoutChanged` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `MultiseatHudData`

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/splitScreen.lua`.*
