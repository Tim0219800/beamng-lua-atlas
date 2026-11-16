# `util_optickRollingCapture`

*File: `lua/ge/extensions/util/optickRollingCapture.lua` · VM: Game Engine (GE) · 34 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_optickRollingCapture`: `extensions.load("util_optickRollingCapture")`, then the global `util_optickRollingCapture`

"Rolling" capture for the Optick profiler. A first call to toggle() starts a recording that keeps only the last 20 seconds; a second call stops the recording, saves the capture to <user folder>/optick/optick_rolling_<date>.opt and opens Optick if the global function launchOptick exists. A 10 s UI message confirms each step.

## Example

```lua
extensions.util_optickRollingCapture.toggle()
```

## Notes

- The window duration (20 s) is set in the file (windowSeconds).
- The state is determined by Engine.Profiler.isCapturing(): any Optick capture already in progress will be stopped and saved by toggle().

## Functions

| Function | Description | Line |
|---|---|---|
| `util_optickRollingCapture.toggle()` | Starts a 20 s rolling capture if no capture is in progress; otherwise stops the capture, saves it to the user's optick/ folder and launches Optick on it. | 18 |

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `getUserPath`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/optickRollingCapture.lua`.*
