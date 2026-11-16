# `gameplay_rallyStartClock`

*File: `lua/ge/extensions/gameplay/rallyStartClock.lua` · VM: Game Engine (GE) · 528 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rallyStartClock`: `extensions.load("gameplay_rallyStartClock")`, then the global `gameplay_rallyStartClock`

Manages the special stage start clocks (physical signs present in the levels) for rally. It loads the clock types from `lua/ge/extensions/gameplay/rally/startClocks/*.lua` (each must expose `textures`, `findClocks` and `draw`), creates a display TSStatic object for each clock found, draws the wall time, the "SS<n>" label and the countdown (with light code R, A or G) into dynamic textures, then, if the `rallyStartCountdownDisplay` setting is '3d', shows the clock nearest to the start line in an inset render view at the top of the screen with a frame colored according to the light. It feeds its state from the `onRallyDataUpdated` hook.

## Notes

- A valid clock type is a startClocks/ module that returns a table with `textures` (key -> {tag, width, height, clearColor} table), `findClocks()` (list of clocks {shapeName, transform, scale, anchor}) and `draw(textures, display)`. getView(clock, startLine, targetPos) is optional. Invalid modules are logged as errors.
- `display` table passed to draw: {clock = 'HH:MM:SS', clockSeconds, label = 'SSn', countdown, countdownSeconds, semaphore = 'R'|'A'|'G'}.
- Countdown: light R beyond 5 s, A at 5 s or less, G after the start (shows '0' then '-1' to '-5', 6 s in total); then '-' in red. Beyond 60 s, shown as m:ss.
- The wall time comes from the RallyLoopManager (getWallClockTimeSecs) if a loop is active, otherwise from rallyClock.wallClockSecs received by onRallyDataUpdated, otherwise from core_environment.getTimeOfDay (shifted by 12 h: (time + 0.5) % 1 x 86400).
- The clocks are searched once per second while none is valid; the textures are re-bound 4 times (every 0.5 s) after creation.
- The 3D view fades out 1.5 s after the end of the countdown and is available (isRenderViewAvailable) only from the second valid frame. The chosen clock is the one within 20 m of the special stage start line (gameplay_rally:getRallyManager():getSSStartLinePos()).
- Minor bug: getStageDisplay writes 'SS' .. tostring(label):gsub(...): gsub returns two values but the concatenation keeps only one, so with no visible effect.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rallyStartClock.getClockTypes()` | Loaded clock types. | 525 |
| `gameplay_rallyStartClock.isRenderViewAvailable()` | Indicates whether the countdown's 3D render view is active; rallyLoop uses it to hide the 2D countdown. | 524 |
| `gameplay_rallyStartClock.onExtensionLoaded()` | Load hook: loads (or reloads) the clock types from the startClocks folder. *(internal)* *(hook)* | 69 |
| `gameplay_rallyStartClock.onExtensionUnloaded()` | Unload hook: destroys the render view, the displays and resets the state. *(internal)* *(hook)* | 426 |
| `gameplay_rallyStartClock.onPreRender(dtReal, dtSim)` | Called before rendering, after all onUpdate: advances the local clock if no fresh data has arrived, redraws the textures if the display changed and draws the colored frame of the 3D view. *(internal)* *(hook)* | 499 |
| `gameplay_rallyStartClock.onRallyDataUpdated(data)` | Hook called when the rally data changes. Reads activeState (start and end of the countdown, 1.5 s delay of the 3D view), rallyClock.wallClockSecs and startClockCountdownData (or countdownData) to compute the start time (timeUntilLaunch in seconds, state 'launched'). *(internal)* *(hook)* | 440 |
| `gameplay_rallyStartClock.onRallySessionEnd()` | Hook emitted at the end of a rally session: same cleanup as unload. *(internal)* *(hook)* | 426 |
| `gameplay_rallyStartClock.onUpdate(dtReal, dtSim)` | Update hook: (re)detects the level's clocks every second if needed, rebinds the textures, runs the view delay and updates the 3D render view. *(internal)* *(hook)* | 476 |

### Parameter details

#### `gameplay_rallyStartClock.getClockTypes()`

Loaded clock types.

- **returns**: table[] List of {name, module} (name = file name without extension).

#### `gameplay_rallyStartClock.isRenderViewAvailable()`

Indicates whether the countdown's 3D render view is active; rallyLoop uses it to hide the 2D countdown.

- **returns**: boolean true if the 3D view is available.

#### `gameplay_rallyStartClock.onPreRender(dtReal, dtSim)`

Called before rendering, after all onUpdate: advances the local clock if no fresh data has arrived, redraws the textures if the display changed and draws the colored frame of the 3D view.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

#### `gameplay_rallyStartClock.onRallyDataUpdated(data)`

Hook called when the rally data changes. Reads activeState (start and end of the countdown, 1.5 s delay of the 3D view), rallyClock.wallClockSecs and startClockCountdownData (or countdownData) to compute the start time (timeUntilLaunch in seconds, state 'launched').

- `data` (*table*) : Rally data (activeState, rallyClock, startClockCountdownData, countdownData).

#### `gameplay_rallyStartClock.onUpdate(dtReal, dtSim)`

Update hook: (re)detects the level's clocks every second if needed, rebinds the textures, runs the view delay and updates the 3D render view.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).

## Calls into the engine (C++)

- `FS:` `findFiles`
- `Sim.` `getUniqueName`
- `core_environment.` `getTimeOfDay`
- `debugDrawer:` `currentRenderViewMaskClear`, `currentRenderViewMaskSet`, `drawLineInstance`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rallyStartClock.lua`.*
