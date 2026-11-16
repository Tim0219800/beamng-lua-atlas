# `trackbuilder_trackBuilder`

*File: `lua/ge/extensions/trackbuilder/trackBuilder.lua` · VM: Game Engine (GE) · 3654 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `trackbuilder_trackBuilder`: `extensions.load("trackbuilder_trackBuilder")`, then the global `trackbuilder_trackBuilder`

ImGui interface of the track editor (Track Builder). It drives the spline engine `util_trackBuilder_splineTrack` (loaded via `extensions['util_trackBuilder_splineTrack']`): adding and removing pieces, modifiers (width, banking, etc.), materials, borders, sub-tracks, saving with screenshot, drive mode and paint modes (Select, Paint, ChangeMesh, Merge). A modder mostly uses it to open or close the editor (enter, exit, toggleTrackBuilder) and to know whether it is active (isActive). The editor opens through the UI route `trackBuilder`, on the `glow_city` level by default.

## Example

```lua
-- open the Track Builder on glow_city (loads the level if needed)
trackbuilder_trackBuilder.enter('glow_city')
print(trackbuilder_trackBuilder.isActive())
trackbuilder_trackBuilder.exit()
```

## Notes

- The file is over 3600 lines long, mostly ImGui interface code (windows, toolbar, materials, saving); only the `M` functions below are the public API.
- The `tbFunctions` table (navigate, refreshPieceInfo, pieceDeleted, pieceUpdated, modifierChange, modifierRemove, modifierShift, drive, unDrive, refreshTrackPositionRotation, switchSubTrack, mergeMultiTrack) is local to the file and is not exported in M: these are internal functions called by the interface. The automatic page presents it as a class, but it is not an instantiable object.
- BUG: in toggleTrackBuilder, the variable `active` is read (`not freeCam and active`) before its declaration `local active = open[0]`; it is therefore nil (global variable) and the switch to the game camera on that line never happens.
- Minor BUG: a global variable `i` is assigned somewhere in the file (found by the automatic analysis).
- enter loads the requested level via `freeroam_freeroam.startFreeroam` if needed and opens the editor at the onClientStartMission hook; during this load `pendingEnter` prevents onClientEndMission from closing the editor. Its callback calls `trackbuilder_trackBuilder.showTrackBuilder()` through the global.
- The window is only drawn in onUpdate if the editor is initialized; during a save screenshot capture (hiddenForScreenshotTimer) nothing is displayed.
- In drive mode (tbFunctions.drive), the code resets vehicle 0, switches to the game camera and sends `ShowApps` to the UI; unDrive switches back to the free camera.

## Functions

| Function | Description | Line |
|---|---|---|
| `trackbuilder_trackBuilder.enter(levelName, forceLoad)` | Opens the Track Builder. If the requested level is not already loaded (or if forceLoad is true), loads it in freeroam then opens the editor; otherwise opens it directly. A level that cannot be found is logged as an error and nothing is done. | 3577 |
| `trackbuilder_trackBuilder.exit()` | Closes the Track Builder if it is active, without navigating itself (the router keeps the navigation), and releases the gameplay route. | 3599 |
| `trackbuilder_trackBuilder.exitToMainMenu()` | Cancels a pending entry, closes the editor if it is active, then calls `returnToMainMenu()`. | 3609 |
| `trackbuilder_trackBuilder.hideTrackBuilder()` | Closes the editor window, restores the BeamNG ImGui style and resets the state. If the closing is not driven by the router, gives the gameplay route back by navigating to `play`. No effect if not initialized. | 3530 |
| `trackbuilder_trackBuilder.isActive()` | Indicates whether the editor is initialized and its window open. | 3573 |
| `trackbuilder_trackBuilder.onClientEndMission()` | Hook called at the end of a mission/level. Closes the editor unless an entry is waiting for a level to load. *(internal)* *(hook)* | 3631 |
| `trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data)` | Hook called by the UI router on entering the `trackBuilder` route. Reserves the gameplay route and calls enter with `params.level` ("glow_city" by default) and `params.forceLoad`. *(internal)* *(hook)* | 3617 |
| `trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data)` | Hook called by the UI router when leaving the route: closes the editor if it is active. *(internal)* *(hook)* | 3625 |
| `trackbuilder_trackBuilder.onUpdate()` | Hook called every frame. Shows the main window or the drive mode bar, or nothing while the save screenshot is being taken. *(internal)* *(hook)* | 2894 |
| `trackbuilder_trackBuilder.onWindowResized(size)` | Hook called when the game window is resized. Remembers the display size used by the style. *(internal)* *(hook)* | 3343 |
| `trackbuilder_trackBuilder.showTrackBuilder()` | Shows the editor: switches to the game camera if the camera is not free, then opens the window. | 3521 |
| `trackbuilder_trackBuilder.showTrackBuilderWindow(show)` | Opens or closes the ImGui window. On open: initializes, gets the spline engine and applies the style; on close: deselects, hides the markers, and deletes the track if it has 2 pieces or fewer (except glow_city). Always emits the hook `onTrackBuilderWindowToggled(open)`. | 3477 |
| `trackbuilder_trackBuilder.toggleTrackBuilder()` | Opens the editor (by setting the gameplay route and navigating to `trackBuilder`) or closes it if it is open. | 3552 |

### Parameter details

#### `trackbuilder_trackBuilder.enter(levelName, forceLoad)`

Opens the Track Builder. If the requested level is not already loaded (or if forceLoad is true), loads it in freeroam then opens the editor; otherwise opens it directly. A level that cannot be found is logged as an error and nothing is done.

- `levelName` (*string|nil*) : Level name (for example "glow_city").
- `forceLoad` (*boolean|nil*) : Forces the level to reload even if it is already loaded.

#### `trackbuilder_trackBuilder.isActive()`

Indicates whether the editor is initialized and its window open.

- **returns**: boolean true if active.

#### `trackbuilder_trackBuilder.onRouteEnter(context, toRoute, fromRoute, data)`

Hook called by the UI router on entering the `trackBuilder` route. Reserves the gameplay route and calls enter with `params.level` ("glow_city" by default) and `params.forceLoad`.

- `context` (*any*) : Route context (not used).
- `toRoute` (*table*) : Destination route; its `params` field is read.
- `fromRoute` (*any*) : Source route (not used).
- `data` (*any*) : Route data (not used).

#### `trackbuilder_trackBuilder.onRouteLeave(context, toRoute, fromRoute, data)`

Hook called by the UI router when leaving the route: closes the editor if it is active.

- `context` (*any*) : Route context (not used).
- `toRoute` (*any*) : Destination route (not used).
- `fromRoute` (*any*) : Source route (not used).
- `data` (*any*) : Route data (not used).

#### `trackbuilder_trackBuilder.onWindowResized(size)`

Hook called when the game window is resized. Remembers the display size used by the style.

- `size` (*table*) : Screen size with fields `x` and `y`.

#### `trackbuilder_trackBuilder.showTrackBuilderWindow(show)`

Opens or closes the ImGui window. On open: initializes, gets the spline engine and applies the style; on close: deselects, hides the markers, and deletes the track if it has 2 pieces or fewer (except glow_city). Always emits the hook `onTrackBuilderWindowToggled(open)`.

- `show` (*boolean*) : true to open, false to close.

## Class `tbFunctions`

Local table of internal interface functions (not exported). They modify the track through the spline engine then refresh the displayed values; `currentIndex` is the selected piece.

| Method | Description | Line |
|---|---|---|
| `tbFunctions.drive(index)` | Starts drive mode: high-quality track, markers hidden, reset of vehicle 0 and placement on the given piece, game camera. | 3102 |
| `tbFunctions.mergeMultiTrack(segments)` | Merges track segments via the spline engine. | 3148 |
| `tbFunctions.modifierChange(field)` | Applies a modifier's value to the current piece and rebuilds the track. | 3070 |
| `tbFunctions.modifierRemove(field)` | Removes a modifier from the current piece. | 3078 |
| `tbFunctions.modifierShift(name, offset)` | Moves a modifier to the previous or next piece. | 3085 |
| `tbFunctions.navigate(off)` | Moves the cursor: 1 next, -1 previous (with wraparound), 'first' or 'last'. Recenters the marker and rereads the piece info. | 2966 |
| `tbFunctions.pieceDeleted()` | Deletes the current piece (if the index is greater than 2), rebuilds the track and steps back one piece. | 3020 |
| `tbFunctions.pieceUpdated(replace)` | Adds or replaces a piece with the interface parameters. Ctrl replaces, Shift inserts after the current piece, no key appends at the end. Puts the cursor back at the start if the track has just closed. | 3031 |
| `tbFunctions.refreshPieceInfo()` | Rereads the current piece's parameters and the modifier values into the interface. | 2983 |
| `tbFunctions.refreshTrackPositionRotation()` | Rereads the track's position and heading (heading converted to degrees) into the interface. | 3127 |
| `tbFunctions.switchSubTrack(index)` | Switches to another sub-track and selects its last piece. | 3135 |
| `tbFunctions.unDrive()` | Ends drive mode: free camera, markers shown again, Select mode. | 3117 |

**Globals assigned:** `i`

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTrackBuilderWindowToggled` — listened to by 1 module(s)

**UI events (guihooks.trigger):** `ShowApps`

## Calls into the engine (C++)

- `FS:` `findFiles`
- `be:` `resetVehicle`
- `core_environment.` `getFogDensity`, `getTimeOfDay`, `setFogDensity`, `setTimeOfDay`
- `debugDrawer:` `drawLine`, `drawSphere`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/trackbuilder/trackBuilder.lua`.*
