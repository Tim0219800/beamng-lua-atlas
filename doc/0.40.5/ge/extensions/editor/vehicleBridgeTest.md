# `editor_vehicleBridgeTest`

*File: `lua/ge/extensions/editor/vehicleBridgeTest.lua` · VM: Game Engine (GE) · 56 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleBridgeTest`: `extensions.load("editor_vehicleBridgeTest")`, then the global `editor_vehicleBridgeTest`

Small test window for `core_vehicleBridge` in the editor (menu Window > Vehicles > 'Vehicle Bridge Test'). You choose a vehicle (ID or list of BeamNGVehicle), enter a key (default 'ignition') and the 'Get Value!' button calls core_vehicleBridge.requestValue; the asynchronous reply is displayed with dumps().

## Example

```lua
extensions.load("editor_vehicleBridgeTest")
```

## Notes

- The reply is not immediate: the text 'Waiting for Reply...' stays until the callback M.callback receives the arguments.
- The callback is called via editor_vehicleBridgeTest.callback(...) (global), so the extension must be loaded under this name.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleBridgeTest.callback(...)` | Receives the reply of core_vehicleBridge.requestValue and stores all its arguments in a table displayed in the window. | 53 |
| `editor_vehicleBridgeTest.onEditorGui()` | Editor GUI render hook: draws the window (vehicle ID input, vehicle combo, key, Get Value! button, result). *(internal)* *(hook)* | 13 |
| `editor_vehicleBridgeTest.onEditorInitialized()` | Registers the 'Vehicle Bridge Test' window (400x600), adds its menu entry (Vehicles group) and loads the core_vehicleBridge extension. *(internal)* *(hook)* | 44 |

### Parameter details

#### `editor_vehicleBridgeTest.callback(...)`

Receives the reply of core_vehicleBridge.requestValue and stores all its arguments in a table displayed in the window.

- `...` (*any*) : Values returned by the bridge for the requested key.

## Calls into the engine (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

**Loads extensions:** `core_vehicleBridge`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleBridgeTest.lua`.*
