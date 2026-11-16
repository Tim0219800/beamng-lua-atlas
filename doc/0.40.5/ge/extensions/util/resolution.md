# `util_resolution`

*File: `lua/ge/extensions/util/resolution.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_resolution`: `extensions.load("util_resolution")`, then the global `util_resolution`

Helper to read and change the game window resolution via GFXDevice. getVideoModeSnapshot returns the current width, height and display mode; setWindowedResolution forces a specific resolution in windowed mode (not borderless). Handy for fixed-size screenshots or UI tests.

## Example

```lua
extensions.reload('util_resolution')
extensions.util_resolution.setWindowedResolution(1280, 720)
```

## Notes

- setWindowedResolution does nothing (with a log) if the resolution and the "Window" mode are already active, and rejects non-numeric arguments.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_resolution.getVideoModeSnapshot()` | Reads the current video mode from GFXDevice. | 9 |
| `util_resolution.setWindowedResolution(width, height)` | Switches the window to "Window" mode at the given resolution (GFXDevice.setVideoMode). | 30 |

### Parameter details

#### `util_resolution.getVideoModeSnapshot()`

Reads the current video mode from GFXDevice.

- **returns**: table|nil {width, height, displayMode} or nil if GFXDevice.getVideoMode is unavailable

#### `util_resolution.setWindowedResolution(width, height)`

Switches the window to "Window" mode at the given resolution (GFXDevice.setVideoMode).

- `width` (*number*) : Width in pixels
- `height` (*number*) : Height in pixels

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/resolution.lua`.*
