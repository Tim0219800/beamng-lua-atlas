# `core_ropeVisualTest`

*File: `lua/ge/extensions/core/ropeVisualTest.lua` · VM: Game Engine (GE) · 2137 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_ropeVisualTest`: `extensions.load("core_ropeVisualTest")`, then the global `core_ropeVisualTest`

Development sandbox for the engine's rope visuals: an ImGui interface lets you create, clone and tune ropes (anchors A and B, directions, node count, diameter, damping, bending stiffness, XPBD, collisions, stretch limit, Young's modulus, mass, gravity, wind, material), animate the anchors, move nodes with the mouse and measure simulation and rendering times. It is not meant for gameplay: it serves to test the rope system (global functions createRopeVisual, getAllRopeVisuals, getRopeVisual).

## Example

```lua
extensions.load('core_ropeVisualTest') -- the ImGui window is then displayed via onUpdate
```

## Notes

- Almost the whole file (over 2000 lines) is ImGui interface code in onUpdate; the extension only exports four hooks and no field.
- Available anchor animations: 0 none, 1 wiggle, 2 circle, 3 bumpy road, 4 rectangle, 5 random walk, 6 sinusoid, 7 direction sweep (Dir Sweep, only the direction rotates).
- onUpdate applies the animations to all tracked ropes, handles hover and dragging of nodes when the debug nodes are displayed, and draws with debugDrawer.
- The interface settings are kept across a Lua reload by onSerialize/onDeserialized (uiState field); they can also be saved to a JSON via the UI (rope_parameters.json by default).
- UI default values: 32 nodes, diameter 0.12 m, damping 0.995, bending stiffness 0.6, gravity (0, 0, -9.81), E = 1e7, 60 FPS simulation, anchors A (0,0,3) and B (5,0,3).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_ropeVisualTest.onDeserialized(serializedData)` | Hook called after reload: restores the interface state from serializedData.uiState, resets the clone offset to 0, then picks up the ropes that already exist in the engine (base positions, debug settings disabled) and selects the first one. *(internal)* *(hook)* | 2013 |
| `core_ropeVisualTest.onExtensionUnloaded()` | Unload hook: resets the base positions, the debug settings, the clone offset and the performance statistics. *(internal)* *(hook)* | 700 |
| `core_ropeVisualTest.onSerialize()` | Hook called before a reload of the Lua extensions: returns {uiState = ...} with the whole interface state (anchors, directions, rope properties, toggles, physics, rendering, animation, debug). *(internal)* *(hook)* | 617 |
| `core_ropeVisualTest.onUpdate(dt)` | Per-frame update hook: updates the performance statistics, the animation time, the base positions of the selected rope, applies the anchor animations to all ropes, handles interaction with the nodes and draws the ImGui interface and the debug aids. *(internal)* *(hook)* | 979 |

### Parameter details

#### `core_ropeVisualTest.onDeserialized(serializedData)`

Hook called after reload: restores the interface state from serializedData.uiState, resets the clone offset to 0, then picks up the ropes that already exist in the engine (base positions, debug settings disabled) and selects the first one.

- `serializedData` (*{uiState: table}|nil*) : Table produced by onSerialize.

#### `core_ropeVisualTest.onSerialize()`

Hook called before a reload of the Lua extensions: returns {uiState = ...} with the whole interface state (anchors, directions, rope properties, toggles, physics, rendering, animation, debug).

- **returns**: {uiState: table} Interface state to restore.

#### `core_ropeVisualTest.onUpdate(dt)`

Per-frame update hook: updates the performance statistics, the animation time, the base positions of the selected rope, applies the anchor animations to all ropes, handles interaction with the nodes and draws the ImGui interface and the debug aids.

- `dt` (*number*) : Frame duration in seconds.

## Calls into the engine (C++)

- `debugDrawer:` `drawArrow`, `drawLineInstance`, `drawSphere`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/ropeVisualTest.lua`.*
