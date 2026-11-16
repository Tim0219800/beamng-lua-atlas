# `gameplay_lowPerformance`

*File: `lua/ge/extensions/gameplay/lowPerformance.lua` · VM: Game Engine (GE) · 365 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_lowPerformance`: `extensions.load("gameplay_lowPerformance")`, then the global `gameplay_lowPerformance`

Low frame rate detector in freeroam and split screen (only freeroam and multiseatGamemode modes; missions, scenarios, career and tutorials are never monitored). When the smoothed FPS average stays below 25 for 5 s, it switches to a "low performance" state, displays a warning toast and can ask for confirmation before a new vehicle spawns (confirmSpawn). A modder who spawns vehicles can go through confirmSpawn to respect this warning.

## Notes

- Constants: threshold 25 FPS, smoothing 5 s, enter after 5 s below the threshold, exit after 10 s above, grace period of 5 s, frames longer than 0.25 s ignored (considered loading stalls).
- Detection is disabled (gate) if no level is loaded, mode not monitored, first drive (isFirstDriveActive), active OpenXR session, or FPS limit enabled at a value <= 25.
- Sampling only happens if the screen is not fading, the game is not paused, the window has focus, the editor is inactive and the current UI route is "play"; otherwise the grace period restarts.
- The notifyLowPerformance setting (false) turns off toasts, spawn warning and pause notice, but detection continues; in simple menu (Engine.UI.isSimpleMenu) notifications always stay active.
- The ImGui debug window (onDrawDebug) exists in the file but its assignment is commented out: it is disabled.
- The confirmation dialog's callbacks are referenced by Lua string (luaCallback), which makes these four functions callable from the UI.

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_lowPerformance.cancelPendingSpawn()` | Abandons the pending spawn function (Cancel button). | 125 |
| `gameplay_lowPerformance.confirmPendingSpawn()` | Executes the pending spawn function, if any (Continue button). | 119 |
| `gameplay_lowPerformance.confirmSpawn(spawnFn)` | Executes spawnFn directly, unless the low performance state is active, the warning has not yet been shown for this episode and notifications are enabled: in that case displays a confirmation dialog (Cancel / Don't show again / Continue) and defers spawnFn. | 93 |
| `gameplay_lowPerformance.getPauseNotice()` | Returns the translated texts to display in the pause menu when low performance is active and notifications are allowed. | 141 |
| `gameplay_lowPerformance.isLowPerformance()` | Returns whether the game is currently considered in low performance, and whether detection is still applicable (gate active). | 88 |
| `gameplay_lowPerformance.muteAndConfirmPendingSpawn()` | Disables notifications (notifyLowPerformance setting = false), displays an info toast then executes the pending spawn. | 129 |
| `gameplay_lowPerformance.onScreenFadeState(state)` | Screen fade state hook: sampling is suspended as long as the state is not 3 (fade finished). *(internal)* *(hook)* | 196 |
| `gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame update hook: periodically (1 s) checks the gate, manages the grace period, smooths the FPS and toggles the low performance state. *(internal)* *(hook)* | 151 |
| `gameplay_lowPerformance.onVehicleSpawned()` | Vehicle spawn hook: restarts the grace period (spawning temporarily drops the FPS). *(internal)* *(hook)* | 192 |

### Parameter details

#### `gameplay_lowPerformance.confirmSpawn(spawnFn)`

Executes spawnFn directly, unless the low performance state is active, the warning has not yet been shown for this episode and notifications are enabled: in that case displays a confirmation dialog (Cancel / Don't show again / Continue) and defers spawnFn.

- `spawnFn` (*function*) : Function that performs the spawn.
- **returns**: any Result of spawnFn if executed immediately (nil if it returns nothing), or false while the player has to decide.

#### `gameplay_lowPerformance.getPauseNotice()`

Returns the translated texts to display in the pause menu when low performance is active and notifications are allowed.

- **returns**: table|nil {notice, hint, infoTitle, infoMessage} or nil.

#### `gameplay_lowPerformance.isLowPerformance()`

Returns whether the game is currently considered in low performance, and whether detection is still applicable (gate active).

- **returns**: boolean true if low performance.

#### `gameplay_lowPerformance.onScreenFadeState(state)`

Screen fade state hook: sampling is suspended as long as the state is not 3 (fade finished).

- `state` (*integer*) : Fade state; 3 = finished.

#### `gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame update hook: periodically (1 s) checks the gate, manages the grace period, smooths the FPS and toggles the low performance state.

- `dtReal` (*number*) : Real-time delta (unused).
- `dtSim` (*number*) : Simulation delta time (unused).
- `dtRaw` (*number*) : Raw delta time in seconds, used for timing and FPS.

**UI events (guihooks.trigger):** `showConfirmationDialog`, `toastrMsg`

## Calls into the engine (C++)

- `Engine.` `isProgramFocused`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/lowPerformance.lua`.*
