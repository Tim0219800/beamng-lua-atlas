# `telemetry_trackers_ui`

*File: `lua/ge/extensions/telemetry/trackers/ui.lua` · VM: Game Engine (GE) · 95 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_trackers_ui`: `extensions.load("telemetry_trackers_ui")`, then the global `telemetry_trackers_ui`

UI telemetry tracker. It tracks the screens (UI routes) the player opens and leaves: each screen is a `uiScreen` activity whose duration is the time spent on it, with the `from` field (origin screen) to reconstruct the path through the menus. Only route names are reported, never screen parameters. Depends on `telemetry_core`.

## Notes

- The screen load time (`loadMs`, `loadToMount`) is attached at the end of the activity rather than being a separate event, to limit data volume (uiScreen is already the most frequent).
- `loadEnterMs` and `loadReadyMs` are only added if the total load reaches `loadDetailMs` (250 ms).
- A cancelled or expired navigation never calls onRouteTiming: that screen is reported without load time.
- The code uses the modern hook onAfterRouteChange and not the old compatibility hook onUiChangedState.

**Dependencies (loaded first):** `telemetry_core`

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_trackers_ui.onAfterRouteChange(entry)` | Hook called by the UI router once a navigation is finished: the displayed screen is then `entry.request.name`. Closes the previous screen's activity then opens `uiScreen` with `screen` and `from` (`entry.origin.route`). Without a screen name, does nothing. *(internal)* *(hook)* | 56 |
| `telemetry_trackers_ui.onExit()` | Hook called when the game exits. Closes the open screen, otherwise the last one would have no duration. *(internal)* *(hook)* | 82 |
| `telemetry_trackers_ui.onExtensionLoaded()` | Hook called when the extension loads. Sets the extension to manual unload. *(internal)* *(hook)* | 77 |
| `telemetry_trackers_ui.onExtensionUnloaded()` | Hook called when the extension is unloaded (a Lua reload does not go through onExit). Closes the open screen. *(internal)* *(hook)* | 32 |
| `telemetry_trackers_ui.onRouteTiming(routeName, timings)` | Hook called by the router after it has validated the route, so just after the activity is opened. Remembers the timings if the route matches the current screen; they are sent on close. *(internal)* *(hook)* | 72 |

### Parameter details

#### `telemetry_trackers_ui.onAfterRouteChange(entry)`

Hook called by the UI router once a navigation is finished: the displayed screen is then `entry.request.name`. Closes the previous screen's activity then opens `uiScreen` with `screen` and `from` (`entry.origin.route`). Without a screen name, does nothing.

- `entry` (*table*) : Router navigation entry; fields read: `request.name` and `origin.route`.

#### `telemetry_trackers_ui.onRouteTiming(routeName, timings)`

Hook called by the router after it has validated the route, so just after the activity is opened. Remembers the timings if the route matches the current screen; they are sent on close.

- `routeName` (*string*) : Name of the route concerned.
- `timings` (*table*) : Navigation timings; fields read: total, mountAcked, enter, ready.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions to load before this one: `{'telemetry_core'}`. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/trackers/ui.lua`.*
