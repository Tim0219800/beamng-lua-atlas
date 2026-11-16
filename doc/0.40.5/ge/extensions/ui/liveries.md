# `ui_liveries`

*File: `lua/ge/extensions/ui/liveries.lua` · VM: Game Engine (GE) · 120 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_liveries`: `extensions.load("ui_liveries")`, then the global `ui_liveries`

UI livery editor (paint/decals) orchestrator. It relies on the editor API `editor_api_dynamicDecals`: on opening it stores the player vehicle's current skin, enables the `dynamicTextures` skin, prepares the layer stack (blank livery in the vehicle's color or existing save) and starts the camera. On closing it restores the original skin.

## Example

```lua
ui_liveries.setup()          -- blank livery
ui_liveries.setup('maSauvegarde') -- loads a save
-- ...
ui_liveries.teardown()
```

## Notes

- setup returns true without doing anything if the editor is already running; returns false if the decals API is missing.
- The value returned by setup is the success of loading the layer stack (false if the save could not be loaded: a blank livery is then created anyway).
- The live decal cursor is only displayed when the transform screen requests it (setProjectDynamicDecalsState(false) at startup).

**Dependencies (loaded first):** `editor_api_dynamicDecals`, `ui_liveries_camera`, `ui_liveries_fill`, `ui_liveries_saves`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_liveries.isRunning()` | Returns whether the livery editor is active. | 115 |
| `ui_liveries.onUpdate(dtReal, dtSim, dtRaw)` | Hook called every frame by the extension system; calls api.onUpdate_() while the editor is running. *(internal)* *(hook)* | 107 |
| `ui_liveries.setup(saveName)` | Starts the livery editor on the player vehicle (dynamicTextures skin, layers, history cleared, camera). | 60 |
| `ui_liveries.teardown()` | Stops the editor: camera, API deactivation, restoring the previous skin and cleaning up the fill. No effect if not started. | 90 |

### Parameter details

#### `ui_liveries.isRunning()`

Returns whether the livery editor is active.

- **returns**: boolean true between setup and teardown.

#### `ui_liveries.onUpdate(dtReal, dtSim, dtRaw)`

Hook called every frame by the extension system; calls api.onUpdate_() while the editor is running.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulated time delta (s).
- `dtRaw` (*number*) : Raw time delta (s).

#### `ui_liveries.setup(saveName)`

Starts the livery editor on the player vehicle (dynamicTextures skin, layers, history cleared, camera).

- `saveName` (*string|nil*) : Name of a save to load; nil = blank livery in the vehicle's color.
- **returns**: boolean true if the layer stack was initialized correctly.

#### `ui_liveries.teardown()`

Stops the editor: camera, API deactivation, restoring the previous skin and cleaning up the fill. No effect if not started.

- **returns**: nil 

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | editor_api_dynamicDecals, ui_liveries_camera, ui_liveries_fill, ui_liveries_saves. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/liveries.lua`.*
