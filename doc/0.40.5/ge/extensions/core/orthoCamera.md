# `core_orthoCamera`

*File: `lua/ge/extensions/core/orthoCamera.lua` · VM: Game Engine (GE) · 208 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_orthoCamera`: `extensions.load("core_orthoCamera")`, then the global `core_orthoCamera`

GE extension `core_orthoCamera`: enables an orthographic view (no perspective) on the main view of the OnlyGui object, via scenetree.OnlyGui:setOrthoMainView. You set the near and far planes and the size of the orthographic window (either left/right/top/bottom, or a `size` with the window ratio). Also contains an ImGui debug window (debugMode, hardcoded off).

## Example

```lua
core_orthoCamera.enable(true, {size = 20, nearClip = 1, farClip = 5000})
-- then
core_orthoCamera.enable(false)
```

## Notes

- With useWindowAspectRatio (true by default), left/right/top/bottom are recomputed from `size`: height = size, width = size * ratio of the GraphicDisplayResolutions setting resolution (1280x720 if absent). The ratio is recomputed on every onWindowResized.
- If useWindowAspectRatio is false, the left/right/top/bottom bounds given to enable are used as is (defaults -1, 1, 1, -1).
- Default values of enable: nearClip 1, farClip 5000, size 1. setOptions changes neither the bounds nor the enabled state, only size, nearClip and farClip, then recomputes the bounds if the window ratio is used.
- The units of sizes and clip planes are world units (meters), inferred from code.
- No specific disable code: enable(false) simply sends enabled = false to setOrthoMainView. Before the first enable, the hooks do nothing (enabled == nil).
- Potential bug: updateAspectRatio does w, h = resolutionString:match(...) then tonumber(w); if the string does not match the pattern, w is nil and the w / h computation fails.
- The `size` parameter of the onWindowResized hook shadows the module's local variable `size` (unused).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_orthoCamera.enable(_enabled, options)` | Enables or disables the main orthographic view and sets its parameters (bounds, clip planes, size). | 52 |
| `core_orthoCamera.getSize()` | Returns the current vertical size of the orthographic view. | 85 |
| `core_orthoCamera.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: displays the ImGui debug window 'OnlyGui OrthoMainView' only if debugMode is true (false in the shipped code, so inactive). *(internal)* *(hook)* | 106 |
| `core_orthoCamera.onWindowResized(size)` | Hook called when the window is resized: recomputes the ratio and reapplies the view. *(internal)* *(hook)* | 89 |
| `core_orthoCamera.setOptions(options)` | Updates size, nearClip and farClip (defaults 1, 1, 5000) and reapplies the orthographic view if it has already been configured. | 75 |

### Parameter details

#### `core_orthoCamera.enable(_enabled, options)`

Enables or disables the main orthographic view and sets its parameters (bounds, clip planes, size).

- `_enabled` (*boolean*) : true to enable.
- `options` (*table|nil*) : { left, right, top, bottom, nearClip, farClip, size, useWindowAspectRatio }; useWindowAspectRatio is true if absent.

#### `core_orthoCamera.getSize()`

Returns the current vertical size of the orthographic view.

- **returns**: number size (1 by default).

#### `core_orthoCamera.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: displays the ImGui debug window 'OnlyGui OrthoMainView' only if debugMode is true (false in the shipped code, so inactive).

- `dtReal` (*number*) : Not used.
- `dtSim` (*number*) : Not used.
- `dtRaw` (*number*) : Not used.

#### `core_orthoCamera.onWindowResized(size)`

Hook called when the window is resized: recomputes the ratio and reapplies the view.

- `size` (*any*) : New window size (unused).

#### `core_orthoCamera.setOptions(options)`

Updates size, nearClip and farClip (defaults 1, 1, 5000) and reapplies the orthographic view if it has already been configured.

- `options` (*table|nil*) : { size, nearClip, farClip }

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/orthoCamera.lua`.*
