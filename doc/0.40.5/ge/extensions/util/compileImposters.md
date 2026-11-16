# `util_compileImposters`

*File: `lua/ge/extensions/util/compileImposters.lua` · VM: Game Engine (GE) · 126 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_compileImposters`: `extensions.load("util_compileImposters")`, then the global `util_compileImposters`

Offline build tool: for a list of levels, starts each level in freeroam, waits for it to load then triggers imposter compilation (Engine.Render.updateImposters(true)). A counter tied to the console logs is used to wait for the engine to finish working. If the duration exceeds 6000 frames without the job finishing, the game exits (shutdown(0)).

## Example

```lua
util_compileImposters.compileImposters({'west_coast_usa', 'italy'})
```

## Notes

- The extension sets itself to manual unload (setExtensionUnloadMode) in onInit.
- Sequence per level: wait for core_levels and freeroam_freeroam, wait for mods to be activated (onModManagerReady), 10 s, level start (attempts every 8 s), 120 s, wait for a period without logs, updateImposters, 20 s, another wait without logs.
- logCooldown: set to 6000 on each log line (onConsoleLog), decremented every frame (onPreRender); the waits end when it reaches 0.
- Only one job at a time: a second call during processing logs an error and returns false. Otherwise the function returns nothing.
- A frame value is reset to 0 at the steps; if frame exceeds 6000 without being reset to 0, the game exits (timeout).

## Functions

| Function | Description | Line |
|---|---|---|
| `util_compileImposters.compileImposters(queue)` | Starts processing a queue of levels in a job (one job at a time). | 92 |
| `util_compileImposters.onConsoleLog(timer, lvl, origin, line)` | Hook called on each log line; resets logCooldown to 6000 (the engine is considered active). *(internal)* *(hook)* | 121 |
| `util_compileImposters.onInit()` | Initialization hook: sets the extension to manual unload. *(internal)* *(hook)* | 12 |
| `util_compileImposters.onModManagerReady(mod)` | Hook called when the mod manager is ready: allows the job to continue. *(internal)* *(hook)* | 117 |
| `util_compileImposters.onPreRender(dt)` | Hook called before each render: counts down logCooldown and monitors the maximum delay (6000 frames) during processing. *(internal)* *(hook)* | 101 |

### Parameter details

#### `util_compileImposters.compileImposters(queue)`

Starts processing a queue of levels in a job (one job at a time).

- `queue` (*string[]*) : Level names to process (passed to freeroam_freeroam.startFreeroamByName).
- **returns**: boolean|nil false if processing is already in progress, otherwise nil.

#### `util_compileImposters.onConsoleLog(timer, lvl, origin, line)`

Hook called on each log line; resets logCooldown to 6000 (the engine is considered active).

- `timer` (*any*) : Timestamp (unused).
- `lvl` (*string*) : Log level.
- `origin` (*string*) : Log origin.
- `line` (*string*) : Log text.

#### `util_compileImposters.onModManagerReady(mod)`

Hook called when the mod manager is ready: allows the job to continue.

- `mod` (*any*) : Not used.

#### `util_compileImposters.onPreRender(dt)`

Hook called before each render: counts down logCooldown and monitors the maximum delay (6000 frames) during processing.

- `dt` (*number*) : Frame duration (s).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/compileImposters.lua`.*
