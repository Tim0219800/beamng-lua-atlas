# `editor_ezObjectSelect_stats`

*File: `lua/ge/extensions/editor/ezObjectSelect/stats.lua` · VM: Game Engine (GE) · 145 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_stats`: `extensions.load("editor_ezObjectSelect_stats")`, then the global `editor_ezObjectSelect_stats`

Usage statistics displayed in the Easy Object Select tool panel: number of selections, transformed distance, number of translations/rotations/scalings, breakdown of world/local operations and rotations by R key/wheel, plus the cumulative volume (m^3) of the selection. draw() displays them in ImGui with a "Reset Stats" button.

## Notes

- The counters are local to the module and only reset by the Reset Stats button.
- The selection volume is cached and recomputed when the selection changes, when an object disappears or when the selection contains a BeamNGVehicle.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_stats.activate(isLocal)` | Initializes the coordinate mode and invalidates the volume cache. | 63 |
| `editor_ezObjectSelect_stats.draw(selectedIds)` | Displays the "Stats" block in ImGui (selected volume, counters, World/Local and R/Wheel progress bars, Reset Stats button). | 108 |
| `editor_ezObjectSelect_stats.invalidateVolume()` | Forces recomputation of the selection volume at the next draw. | 99 |
| `editor_ezObjectSelect_stats.recordOperation(operation, source, distance)` | Records a transform operation: increments the world/local counter, then transforms (and the cumulative distance), rotates (with source "r" or "wheel") or scales. | 77 |
| `editor_ezObjectSelect_stats.recordSelection()` | Increments the selection counter and invalidates the volume. | 72 |
| `editor_ezObjectSelect_stats.setCoordinateMode(isLocal)` | Changes the coordinate mode used to classify operations (world or local). | 68 |

### Parameter details

#### `editor_ezObjectSelect_stats.activate(isLocal)`

Initializes the coordinate mode and invalidates the volume cache.

- `isLocal` (*boolean*) : true if the coordinate space is local.

#### `editor_ezObjectSelect_stats.draw(selectedIds)`

Displays the "Stats" block in ImGui (selected volume, counters, World/Local and R/Wheel progress bars, Reset Stats button).

- `selectedIds` (*integer[]|nil*) : IDs of the selected objects, for the volume computation.

#### `editor_ezObjectSelect_stats.recordOperation(operation, source, distance)`

Records a transform operation: increments the world/local counter, then transforms (and the cumulative distance), rotates (with source "r" or "wheel") or scales.

- `operation` (*string*) : "transform", "rotate" or "scale".
- `source` (*string|nil*) : For a rotation: "r" (R key) or "wheel" (mouse wheel).
- `distance` (*number|nil*) : Distance traveled (m), counted for "transform".

#### `editor_ezObjectSelect_stats.setCoordinateMode(isLocal)`

Changes the coordinate mode used to classify operations (world or local).

- `isLocal` (*boolean*) : true for local.

## Calls into the engine (C++)

- `obj:` `isSubClassOf`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/stats.lua`.*
