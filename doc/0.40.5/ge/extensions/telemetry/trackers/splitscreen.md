# `telemetry_trackers_splitscreen`

*File: `lua/ge/extensions/telemetry/trackers/splitscreen.lua` · VM: Game Engine (GE) · 184 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_splitscreen`: `extensions.load("telemetry_trackers_splitscreen")`, then the global `telemetry_trackers_splitscreen`

Split-screen telemetry tracker: split-screen sessions, usage duration of each configuration and multi-seat game modes played. splitScreenStarted and splitScreenStopped bracket a session in a level; the "splitScreenActive" activity restarts when the player count, layout or mode changes; "splitScreenGamemode" covers a multi-seat game mode.

## Notes

- A start request (onSplitScreenStartRequested) is remembered for at most 300 s to document the origin of the start (entry, activity, fromMainMenu).
- At the end of a round, only the result type (tie, presence of a winner) is reported, not player indices.
- Game mode end reasons: restarted, switched, stopped, levelEnded, gameExit. Session end reasons: disabled, levelEnded, gameExit.
- onExit and onExtensionUnloaded are the same function (closeAll).

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_splitscreen.onClientEndMission()` | Hook called at the end of the level: closes game mode, activity and session (reason levelEnded). *(internal)* *(hook)* | 160 |
| `telemetry_trackers_splitscreen.onClientStartMission()` | Hook called when a level starts: resynchronizes the split-screen state. *(internal)* *(hook)* | 156 |
| `telemetry_trackers_splitscreen.onExit()` | Hook called when the game exits: closes everything (reason gameExit). *(internal)* *(hook)* | 166 |
| `telemetry_trackers_splitscreen.onExtensionLoaded()` | Hook called on load: manual unload and synchronization with the current render_splitScreen configuration. *(internal)* *(hook)* | 151 |
| `telemetry_trackers_splitscreen.onExtensionUnloaded()` | Hook called on unload: closes everything (same function as onExit). *(internal)* *(hook)* | 166 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result)` | Hook called at a round's end screen: emits splitScreenGamemodeFinished (tied, hasWinner). *(internal)* *(hook)* | 132 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId)` | Hook called for each round started, including a restart from the end screen or the pause menu: ends the previous mode (restarted or switched) and starts the splitScreenGamemode activity. *(internal)* *(hook)* | 121 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeStopped()` | Hook called when the game mode stops: ends the activity with the reason "stopped". *(internal)* *(hook)* | 142 |
| `telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode)` | Hook called when the split-screen configuration changes: starts/updates the session and activity, or ends them if disabled. *(internal)* *(hook)* | 96 |
| `telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity)` | Hook called when the player requests split-screen start: remembers the origin. *(internal)* *(hook)* | 54 |

### Parameter details

#### `telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result)`

Hook called at a round's end screen: emits splitScreenGamemodeFinished (tied, hasWinner).

- `gamemodeId` (*string*) : Game mode ID.
- `result` (*table|nil*) : Result ({tied, winnerPlayer}).

#### `telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId)`

Hook called for each round started, including a restart from the end screen or the pause menu: ends the previous mode (restarted or switched) and starts the splitScreenGamemode activity.

- `gamemodeId` (*string*) : Game mode ID.

#### `telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode)`

Hook called when the split-screen configuration changes: starts/updates the session and activity, or ends them if disabled.

- `enabled` (*boolean*) : Split screen active.
- `playerCount` (*integer*) : Number of players.
- `layout` (*any*) : Layout.
- `mode` (*any*) : Mode.

#### `telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity)`

Hook called when the player requests split-screen start: remembers the origin.

- `entry` (*string*) : discover or multiseatSettings.
- `activity` (*string*) : Game mode ID or "freeroam".

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/splitscreen.lua`.*
