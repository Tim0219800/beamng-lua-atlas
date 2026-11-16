# `gameplay_crawl_debug`

*File: `lua/ge/extensions/gameplay/crawl/debug.lua` · VM: Game Engine (GE) · 363 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_crawl_debug`: `extensions.load("gameplay_crawl_debug")`, then the global `gameplay_crawl_debug`

ImGui debug window "Crawl Debug Window" of crawl mode, reserved for developers (disabled by default). Once enabled, it displays for the first active crawler: trail info, vehicle position and speed, status in the zone, penalty points (DNF threshold 50), infraction cooldowns, recovery point, zone exit point (DNF at 10 m), list of nodes with times, log of the last 20 events and trail status. The data comes from gameplay_crawl_utils.getCrawlState.

## Example

```lua
gameplay_crawl_debug.setEnableDebugWindow(true)
```

## Notes

- The window opens on onCrawlStarted only if enableDebugWindow is true.
- In drawDebugWindow, im.Begin receives a new im.BoolPtr(debugWindowOpen) every frame: the window's close button therefore does not modify debugWindowOpen (closing is only detected through the return value).
- getBoundaryStatus reads gameplay_crawl_general.activeTrail.boundary and calls boundary:containsPoint2D.
- Only the first active crawler found is displayed.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_crawl_debug.clearDebugData()` | Empties the displayed data. | 351 |
| `gameplay_crawl_debug.getEnableDebugWindow()` | Tells whether the debug window is enabled. | 347 |
| `gameplay_crawl_debug.onCrawlComplete(eventData)` | Hook called at the end of a crawl: marks the data as finished (isFinished). *(internal)* *(hook)* | 292 |
| `gameplay_crawl_debug.onCrawlDisqualified(eventData)` | Hook called on disqualification: marks the data as finished and disqualified. *(internal)* *(hook)* | 299 |
| `gameplay_crawl_debug.onCrawlStarted(eventData)` | Hook called at the start of a crawl: opens the window if debug is enabled. *(internal)* *(hook)* | 285 |
| `gameplay_crawl_debug.onExtensionLoaded()` | Hook called when the extension loads: resets the window state. *(internal)* *(hook)* | 307 |
| `gameplay_crawl_debug.onExtensionUnloaded()` | Hook called when the extension unloads: resets the window state. *(internal)* *(hook)* | 313 |
| `gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw)` | Hook called before rendering: updates the data from the first active crawler and draws the window. *(internal)* *(hook)* | 319 |
| `gameplay_crawl_debug.setEnableDebugWindow(enabled)` | Enables or disables the debug window; disabling it closes it and empties the data. | 338 |

### Parameter details

#### `gameplay_crawl_debug.getEnableDebugWindow()`

Tells whether the debug window is enabled.

- **returns**: boolean State.

#### `gameplay_crawl_debug.onCrawlComplete(eventData)`

Hook called at the end of a crawl: marks the data as finished (isFinished).

- `eventData` (*table*) : Event data (unused).

#### `gameplay_crawl_debug.onCrawlDisqualified(eventData)`

Hook called on disqualification: marks the data as finished and disqualified.

- `eventData` (*table*) : Event data (unused).

#### `gameplay_crawl_debug.onCrawlStarted(eventData)`

Hook called at the start of a crawl: opens the window if debug is enabled.

- `eventData` (*table*) : Event data (unused).

#### `gameplay_crawl_debug.onPreRender(dtReal, dtSim, dtRaw)`

Hook called before rendering: updates the data from the first active crawler and draws the window.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `gameplay_crawl_debug.setEnableDebugWindow(enabled)`

Enables or disables the debug window; disabling it closes it and empties the data.

- `enabled` (*boolean*) : true to enable.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: {'ui_imgui'}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/crawl/debug.lua`.*
