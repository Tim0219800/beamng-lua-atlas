# `core_metrics`

*File: `lua/ge/extensions/core/metrics.lua` · VM: Game Engine (GE) · 320 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_metrics`: `extensions.load("core_metrics")`, then the global `core_metrics`

GE extension `core_metrics`: performance display window (FPS, CPU/GPU times, memory, render statistics). It is displayed at the top left with ImGui, or as 3D debug text if ImGui is hidden. The toggle() function cycles through the display modes. A modder mainly uses it to measure the effect of their mod on the framerate.

## Example

```lua
extensions.load('core_metrics')
core_metrics.toggle()  -- mode 1: compact FPS line
core_metrics.toggle()  -- mode 2: FPS/percentiles table + memory
```

## Notes

- currentMode: 0 disabled, 1 small (one line), 2 simple (table and memory), 3 full (GFX, terrain, ground cover, forest, shadows, lights statistics). The code comment only mentions 0, 1, 2, but toggle does (mode + 1) % 4, so 4 modes exist.
- toggle() also enables the GPU timing overlay (Engine.Debug.setGpuTimingOverlayVisible) when the mode is not 0, writes the memory info to the log in mode 2, and unloads the extension (extensions.unload) when returning to mode 0.
- onInit sets the extension to manual unloading (setExtensionUnloadMode(M, 'manual')) so that it stays loaded.
- Probable bug: getConsoleNumber already adds '$' in front of the variable name (VariableRegistry.get('$'..name)). The mode 3 calls pass names that already start with '$' (e.g. '$GFXDeviceStatistics::polyCount'), which gives '$$...': these values are probably the default -1 / nil and can even make string.format (%d) fail if tonumber returns nil. 'GroundCover::renderedShapes' on the contrary has no '$' (the prefix is added).
- Probable bug: the variable `tableFlags` passed to im.BeginTable is not defined anywhere in the file (nil). Moreover the division 1000 / fps::min etc. can give infinity if the value is 0.
- The values read come from the engine's variable registry: fps::instantaneous, fps::avg, fps::min, fps::max, fps::p90/p95/p99, fps::cpuTime, fps::gpuTime (< 0 = unavailable, displayed N/A), fps::waitForGPU, fps::instantaneousUncap.

**Dependencies (loaded first):** `ui_imgui`, `ui_visibility`

## Functions

| Function | Description | Line |
|---|---|---|
| `core_metrics.onDeserialized(d)` | After a Lua reload: restores currentMode (d.currentMode, without default value) and the GPU overlay. *(internal)* *(hook)* | 307 |
| `core_metrics.onInit()` | Initialization hook: manual unloading and GPU overlay state according to currentMode. *(internal)* *(hook)* | 298 |
| `core_metrics.onSerialize()` | Before a Lua reload: stores the current mode. *(internal)* *(hook)* | 303 |
| `core_metrics.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: draws the metrics window (ImGui) or, if ImGui is hidden, debug text in the 3D view. Does nothing in mode 0. *(internal)* *(hook)* | 44 |
| `core_metrics.toggle()` | Switches to the next display mode (0 -> 1 -> 2 -> 3 -> 0). On returning to 0, the extension unloads itself. | 15 |

### Parameter details

#### `core_metrics.onDeserialized(d)`

After a Lua reload: restores currentMode (d.currentMode, without default value) and the GPU overlay.

- `d` (*table*) : Table returned by onSerialize.

#### `core_metrics.onSerialize()`

Before a Lua reload: stores the current mode.

- **returns**: table { currentMode }

#### `core_metrics.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: draws the metrics window (ImGui) or, if ImGui is hidden, debug text in the 3D view. Does nothing in mode 0.

- `dtReal` (*number*) : Elapsed real time (s), unused.
- `dtSim` (*number*) : Elapsed simulation time (s), unused.
- `dtRaw` (*number*) : Raw elapsed time (s), unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `currentMode` | integer | Current display mode: 0 disabled, 1 small, 2 simple, 3 full. Saved in onSerialize. |
| `dependencies` | string[] | { 'ui_imgui', 'ui_visibility' }. |

## Calls into the engine (C++)

- `Engine.` `isProgramFocused`
- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/metrics.lua`.*
