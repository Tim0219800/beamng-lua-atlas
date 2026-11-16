# `aiDebugDraw`

*File: `lua/vehicle/aiDebugDraw.lua` · VM: Vehicle · 447 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("aiDebugDraw")`

Debug drawing for the vehicle AI (spheres, cylinders, texts via obj.debugDrawProxy). Loaded by ai.lua (require 'aiDebugDraw'); ai.setVehicleDebugMode enables or disables it depending on ai.debugMode. It reads a context (ego, twt, current route, map, scriptai...) provided by ai.lua via setContextBinder, and only writes to ai.debugDraw (function called by the main loop to draw). A modder does not normally call it directly.

## Notes

- Modes drawn according to ai.debugMode: 'target', 'route', 'speeds', 'trajectory', 'rays'. In 'script' mode with scriptai active, scriptai.debugDraw() is also called.
- enable() initializes the context on the first call (via the binder), then replaces ai.debugDraw with the drawing function; disable() resets ai.debugDraw = nop.
- Minor bug: in onDebugModeChanged, when the mode is not 'speeds', it is visDebug.trajecRec that is emptied (and not a buffer specific to speeds), even though this buffer is already emptied outside 'trajectory'.

## Functions

| Function | Description | Line |
|---|---|---|
| `aiDebugDraw.disable()` | Disables debug drawing (ai.debugDraw = nop). | 442 |
| `aiDebugDraw.enable()` | Enables debug drawing: binds the context if necessary then puts the drawing function in ai.debugDraw. | 435 |
| `aiDebugDraw.init(context)` | Stores the context used by the drawing. *(internal)* | 409 |
| `aiDebugDraw.onDebugModeChanged(debugMode)` | Hook called by ai.setVehicleDebugMode when the debug mode changes: empties the drawing histories (trajectory, route) that no longer match the chosen mode. *(internal)* *(hook)* | 413 |
| `aiDebugDraw.reset()` | Empties the drawing histories (trajectory and route). Called by ai.setMode. *(internal)* | 428 |
| `aiDebugDraw.setContextBinder(fn)` | Registers the function that will build the context (ego, twt, route/map/scriptai access, castRay...) at the first enable(). *(internal)* | 405 |

### Parameter details

#### `aiDebugDraw.init(context)`

Stores the context used by the drawing.

- `context` (*table*) : Table with ego, twt, lastCommand, player (function), getCurrentRoute, getMapData, getScriptai, roadNaturalContinuation, castRay, populateOBBinRange.

#### `aiDebugDraw.onDebugModeChanged(debugMode)`

Hook called by ai.setVehicleDebugMode when the debug mode changes: empties the drawing histories (trajectory, route) that no longer match the chosen mode.

- `debugMode` (*string*) : New ai.debugMode ('off', 'target', 'route', 'speeds', 'trajectory', 'rays', 'all').

#### `aiDebugDraw.setContextBinder(fn)`

Registers the function that will build the context (ego, twt, route/map/scriptai access, castRay...) at the first enable().

- `fn` (*function*) : Function with no argument that calls aiDebugDraw.init(context).

## Calls into the engine (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawText`
- `obj:` `getObjectFrontPosition`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/aiDebugDraw.lua`.*
