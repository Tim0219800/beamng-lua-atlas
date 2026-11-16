# `core_cameraControllerRegistry`

*File: `lua/ge/extensions/core/cameraControllerRegistry.lua` · VM: Game Engine (GE) · 98 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_cameraControllerRegistry`: `extensions.load("core_cameraControllerRegistry")`, then the global `core_cameraControllerRegistry`

Optional routing layer placed in front of the camera input path. Registered 'controllers' (by id, with priority) can consume certain inputs (e.g. onRelativeInput, onEditorMouseWheel) when they are active; whatever is not consumed continues to the active camera as before. Loaded with require('core/cameraControllerRegistry') (it is not an extension). Used by core/cameraInput.lua. A modder uses it to intercept the mouse/wheel (e.g. a camera editing tool) without breaking normal cameras.

## Example

```lua
local reg = require('core/cameraControllerRegistry')
reg.register('monOutil', {
  onRelativeInput = function(axis, val, player) return false end, -- true = consumed
}, 10)
if reg.acquire('monOutil') then --[[ exclusive capture ]] end
reg.release('monOutil')
```

## Notes

- A controller is a table whose keys are method names (e.g. onRelativeInput, onEditorMouseWheel); a method consumes the event by returning exactly true.
- Call order: descending priority, then alphabetical id. If a controller has 'captured' (acquire), only that one receives events.
- acquire is only allowed if no other has captured and if the caller is the controller currently being dispatched, or the first in the order (highest priority): so you can only capture from your own callback or by being first.
- unregister automatically releases the capture if that controller held it.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_cameraControllerRegistry.acquire(id)` | Takes exclusive capture of the inputs for this controller (see notes for the conditions). | 70 |
| `core_cameraControllerRegistry.dispatch(method, ...)` | Sends an event to the controllers: to the capture owner only if there is one, otherwise to all in order until one returns true. | 51 |
| `core_cameraControllerRegistry.isOwner(id)` | Tests whether this controller holds the capture. | 88 |
| `core_cameraControllerRegistry.isRegistered(id, controller)` | Tests whether the id is registered (and, if controller is given, that it is this controller). | 92 |
| `core_cameraControllerRegistry.register(id, controller, priority)` | Registers a controller. Fails (false) if the id is not a non-empty string, if controller is not a table or if the id already exists. | 31 |
| `core_cameraControllerRegistry.release(id)` | Releases the capture if this controller holds it. | 82 |
| `core_cameraControllerRegistry.unregister(id, controller)` | Removes a controller. If controller is given, it must match the registered one. Releases the capture if needed. | 42 |

### Parameter details

#### `core_cameraControllerRegistry.acquire(id)`

Takes exclusive capture of the inputs for this controller (see notes for the conditions).

- `id` (*string*) : Identifier of a registered controller
- **returns**: boolean true if the capture is (or already was) held by this controller

#### `core_cameraControllerRegistry.dispatch(method, ...)`

Sends an event to the controllers: to the capture owner only if there is one, otherwise to all in order until one returns true.

- `method` (*string*) : Name of the method to call on the controllers
- `...` (*any*) : Arguments passed to the method
- **returns**: boolean true if a controller consumed the event

#### `core_cameraControllerRegistry.isOwner(id)`

Tests whether this controller holds the capture.

- `id` (*string*) : Identifier
- **returns**: boolean true if owner

#### `core_cameraControllerRegistry.isRegistered(id, controller)`

Tests whether the id is registered (and, if controller is given, that it is this controller).

- `id` (*string*) : Identifier
- `controller` (*table|nil*) : Expected controller
- **returns**: boolean true if registered

#### `core_cameraControllerRegistry.register(id, controller, priority)`

Registers a controller. Fails (false) if the id is not a non-empty string, if controller is not a table or if the id already exists.

- `id` (*string*) : Unique identifier
- `controller` (*table*) : Table of named callbacks
- `priority` (*number|nil*) : Priority (larger = called first), 0 by default
- **returns**: boolean true if registered

#### `core_cameraControllerRegistry.release(id)`

Releases the capture if this controller holds it.

- `id` (*string*) : Identifier
- **returns**: boolean true if released

#### `core_cameraControllerRegistry.unregister(id, controller)`

Removes a controller. If controller is given, it must match the registered one. Releases the capture if needed.

- `id` (*string*) : Identifier
- `controller` (*table|nil*) : Expected controller (optional check)
- **returns**: boolean true if removed

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/cameraControllerRegistry.lua`.*
