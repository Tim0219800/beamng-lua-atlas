# `util_groundModelDebug`

*File: `lua/ge/extensions/util/groundModelDebug.lua` · VM: Game Engine (GE) · 578 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_groundModelDebug`: `extensions.load("util_groundModelDebug")`, then the global `util_groundModelDebug`

ImGui window for debugging and tuning ground models (friction, surface fluid, collision type). It can display in 3D, around the mouse pointer (or the debugger's focus point), the ground models height map, its depth and the static collision triangles, with one color per ground model, and a collision triangle density per tile. Each ground model can be modified live (be:setGroundModel, aliases included) then saved to /art/groundmodels.json; the "Default" button reloads the original values. The display settings are stored in settings/editor/groundModelDebug_settings.json.

## Example

```lua
extensions.load('util_groundModelDebug')
extensions.util_groundModelDebug.openWindow()
```

## Notes

- The editable properties of a ground model: collisiontype (physical material index), defaultDepth (m), dragAnisotropy, flowBehaviorIndex, flowConsistencyIndex, fluidDensity (kg/m3), hydrodynamicFriction, roughnessCoefficient, shearStrength, skidMarks, slidingFrictionCoefficient, staticFrictionCoefficient, strength, stribeckVelocity (m/s). The window's tooltips explain each one.
- Changes are applied live on the game side; they are written to /art/groundmodels.json only by the Save button (the file is replaced entirely; alias ground models are not written but listed in the aliases field of their parent).
- The window rebuilds itself (setup) when core_environment.groundModels is replaced (for example when loading a level).
- When the window closes, the display of static triangles and density is disabled (Engine.setStaticColDebugEnabled(false)).
- The detailed static collision display block is commented out in the code because it caused large framerate drops.

**Dependencies (loaded first):** `ui_imguiUtils`

## Functions

| Function | Description | Line |
|---|---|---|
| `util_groundModelDebug.onDeserialized(data)` | Deserialization hook: restores the saved state and re-enables static collision debugging on the engine side if needed. *(internal)* *(hook)* | 563 |
| `util_groundModelDebug.onExtensionLoaded()` | Called on load: builds the ground models list from core_environment.groundModels and re-reads the saved settings. *(internal)* *(hook)* | 551 |
| `util_groundModelDebug.onSerialize()` | Serialization hook before an extension reload: keeps the open state of the window, of the static triangles display and of the density. *(internal)* *(hook)* | 555 |
| `util_groundModelDebug.onUpdate(dt)` | Hook called every frame: as long as the window is open, determines the focus point (mouse raycast or Lua.lastDebugFocusPos), draws the debug visualizations of each active ground model and the ImGui interface. *(internal)* *(hook)* | 232 |
| `util_groundModelDebug.openWindow()` | Opens the "GroundModel Debug Window". | 207 |

### Parameter details

#### `util_groundModelDebug.onDeserialized(data)`

Deserialization hook: restores the saved state and re-enables static collision debugging on the engine side if needed.

- `data` (*table*) : Data returned by onSerialize

#### `util_groundModelDebug.onSerialize()`

Serialization hook before an extension reload: keeps the open state of the window, of the static triangles display and of the density.

- **returns**: table {windowOpen, staticDebug, colDensityEnabled}

#### `util_groundModelDebug.onUpdate(dt)`

Hook called every frame: as long as the window is open, determines the focus point (mouse raycast or Lua.lastDebugFocusPos), draws the debug visualizations of each active ground model and the ImGui interface.

- `dt` (*number*) : Time delta in seconds (unused)

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"ui_imguiUtils"}: used to load the editor icon atlas |

## Calls into the engine (C++)

- `Engine.` `setStaticColDebugEnabled`, `setStaticColDebugPosShrink`
- `be:` `setGroundModel`
- `core_environment.` `reloadGroundModels`
- `debugDrawer:` `drawSphere`, `renderGroundModelDebug`, `renderStaticColCounter`, `renderStaticColDebug`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/groundModelDebug.lua`.*
