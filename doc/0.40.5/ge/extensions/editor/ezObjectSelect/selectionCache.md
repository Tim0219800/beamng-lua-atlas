# `editor_ezObjectSelect_selectionCache`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua` · VM: Game Engine (GE) · 110 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionCache`: `extensions.load("editor_ezObjectSelect_selectionCache")`, then the global `editor_ezObjectSelect_selectionCache`

Selection cache of the Easy Select tool. It only rebuilds the selection data (list of projected "proxies") once the camera has been still for 0.12 s, or after an invalidation or a configuration change. Possible states: waiting, moving, building, ready.

## Notes

- The camera is compared with the previous one (position, rangeOrigin, forward, up, halfTan, width/height); the slightest change resets the state to "moving" and deletes the data.
- Times are measured with hptimer; buildTime is the value returned by timer:stopAndReset() (seconds or ms depending on hptimer, not specified here).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionCache.activate()` | Completely resets the cache state (status waiting). | 45 |
| `editor_ezObjectSelect_selectionCache.getStatus()` | Returns a snapshot of the cache state for debug. | 97 |
| `editor_ezObjectSelect_selectionCache.invalidate(reason)` | Deletes the cached data and restarts the stabilization delay. | 49 |
| `editor_ezObjectSelect_selectionCache.setClassificationTime(milliseconds)` | Records the classification duration for the debug display. | 93 |
| `editor_ezObjectSelect_selectionCache.update(camera, configKey, build)` | To be called every frame. Returns nil while the camera is moving, the configuration has just changed or the 0.12 s delay has not elapsed; then calls build() only once and returns its data, then returns them as-is. | 56 |

### Parameter details

#### `editor_ezObjectSelect_selectionCache.getStatus()`

Returns a snapshot of the cache state for debug.

- **returns**: table {status, reason, targetCount (number of proxies), buildTime, classificationTime}

#### `editor_ezObjectSelect_selectionCache.invalidate(reason)`

Deletes the cached data and restarts the stabilization delay.

- `reason` (*string|nil*) : Reason, stored for debug (default "invalidated")

#### `editor_ezObjectSelect_selectionCache.setClassificationTime(milliseconds)`

Records the classification duration for the debug display.

- `milliseconds` (*number|nil*) : Duration in ms (0 if nil)

#### `editor_ezObjectSelect_selectionCache.update(camera, configKey, build)`

To be called every frame. Returns nil while the camera is moving, the configuration has just changed or the 0.12 s delay has not elapsed; then calls build() only once and returns its data, then returns them as-is.

- `camera` (*table*) : Camera context (pos, rangeOrigin, forward, up, halfTan, width, height)
- `configKey` (*any*) : Configuration key; if it changes, the cache is invalidated (reason "settings")
- `build` (*function*) : Function with no arguments that builds the data (expects a table that may contain proxies)
- **returns**: table|nil Built data or nil if not ready

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua`.*
