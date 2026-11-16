# `client_canvas`

*File: `lua/ge/client/canvas.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/canvas")`

Manages the GuiCanvas (the render window) on the client side: one-time creation of the "Canvas" object and showing/hiding the mouse cursor. Called at game startup (initializeCanvas); a modder can use showCursor/hideCursor to release or lock the mouse.

## Notes

- createCanvas reuses the "Canvas" object if it already exists in the scenetree; otherwise it creates it with displayWindow = false.
- If the variable $forceFullscreen is true, $pref::Video::displayOutputDevice is cleared; if $pref::Video::autoDetect is true, core_settings_graphic.autoDetectApplyGraphicsQuality() is called.
- showCursor and hideCursor also call lockMouse (false / true) in addition to changing the canvas cursor's visibility.

## Functions

| Function | Description | Line |
|---|---|---|
| `client_canvas.createCanvas(windowPlacement)` | Returns the GuiCanvas object "Canvas", creating and registering it if it does not exist. Applies the fullscreen and graphics auto-detection preferences. *(internal)* | 8 |
| `client_canvas.hideCursor()` | Locks the mouse (lockMouse(true)) and hides the canvas cursor. | 57 |
| `client_canvas.initializeCanvas()` | Creates the canvas only once (logs an error if already created), reads WindowPlacement from the graphics options, and calls quit() if creation fails. *(internal)* | 28 |
| `client_canvas.showCursor()` | Unlocks the mouse (lockMouse(false)) and makes the canvas cursor visible. | 48 |

### Parameter details

#### `client_canvas.createCanvas(windowPlacement)`

Returns the GuiCanvas object "Canvas", creating and registering it if it does not exist. Applies the fullscreen and graphics auto-detection preferences.

- `windowPlacement` (*any*) : Window placement; not used in the function body (inferred from code).
- **returns**: userdata The Canvas object.

#### `client_canvas.initializeCanvas()`

Creates the canvas only once (logs an error if already created), reads WindowPlacement from the graphics options, and calls quit() if creation fails.

- **returns**: userdata|nil The canvas, or nil if already created.

## Fields

| Field | Type | Description |
|---|---|---|
| `canvasCreated` | boolean | True once the canvas has been created by initializeCanvas; prevents a second creation. |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/canvas.lua`.*
