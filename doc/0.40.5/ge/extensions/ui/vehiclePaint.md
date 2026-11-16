# `ui_vehiclePaint`

*File: `lua/ge/extensions/ui/vehiclePaint.lua` · VM: Game Engine (GE) · 103 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_vehiclePaint`: `extensions.load("ui_vehiclePaint")`, then the global `ui_vehiclePaint`

Small "Metallic paint" imgui debug window to adjust the metallic paint parameters of the player's vehicle live (3 paints: metallic, roughness, clearcoat, clearcoat roughness). It reads and writes the object field `metallicPaintData` of the vehicle as a string of 4 numbers.

## Example

```lua
extensions.load('ui_vehiclePaint'); ui_vehiclePaint.show()
```

## Notes

- The 4 values of metallicPaintData are, in order: [1] Roughness, [2] Metallic, [3] Coat, [4] Coat roughness (from the indices passed to sliderUI). Each slider goes from 0 to 1.
- changeData always writes only to paint 0: its index parameter designates the array component, not the paint.

**Dependencies (loaded first):** `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_vehiclePaint.changeData(change, index)` | Modifies one component of metallicPaintData of player 0's vehicle paint 0 and rewrites the field. | 91 |
| `ui_vehiclePaint.onExtensionLoaded()` | Hook called on load: creates the visibility boolean pointer (false) and the float pointer of the sliders. *(internal)* *(hook)* | 82 |
| `ui_vehiclePaint.onUpdate()` | Hook called every frame: if the window is open and a player vehicle exists, draws the sliders of paints 0, 1 and 2 and applies the changes via setField. *(internal)* *(hook)* | 41 |
| `ui_vehiclePaint.show()` | Opens the 'Metallic paint' window (the window is drawn in onUpdate). | 78 |

### Parameter details

#### `ui_vehiclePaint.changeData(change, index)`

Modifies one component of metallicPaintData of player 0's vehicle paint 0 and rewrites the field.

- `change` (*number*) : New value.
- `index` (*integer*) : Index (1 to 4) in the array of 4 values.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_imgui. |

## Calls into the engine (C++)

- `ui_imgui.` `BoolPtr`, `FloatPtr`, `SliderFloat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/vehiclePaint.lua`.*
