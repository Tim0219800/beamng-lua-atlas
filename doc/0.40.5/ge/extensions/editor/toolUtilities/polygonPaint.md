# `editor_toolUtilities_polygonPaint`

*File: `lua/ge/extensions/editor/toolUtilities/polygonPaint.lua` · VM: Game Engine (GE) · 197 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_polygonPaint`: `extensions.load("editor_toolUtilities_polygonPaint")`, then the global `editor_toolUtilities_polygonPaint`

Freehand polygon tool for the editor: the user holds the left click and drags over the terrain to lay points, releases to finish (closing is implicit between the last and the first point). The stroke is simplified by RDP to obtain a clean editable polygon. Draws a preview (blue spheres and lines) and the cursor.

## Example

```lua
local pp = extensions.editor_toolUtilities_polygonPaint
pp.start({stepMeters = 2, rdpTolMeters = 6})
-- every frame:
if pp.update() then
  local poly = pp.consumePolygon()
end
```

## Notes

- Drawing starts only if the mouse hovers over the terrain: prevents a click on the UI (e.g. a "New" button) from starting and ending a stroke.
- Points are placed at terrain height + 0.05 m (anti z-fighting).
- A stroke of fewer than 3 points (or fewer than 3 after RDP) is discarded and the tool stays armed.
- At the end of a valid stroke, active becomes false and finished becomes true until consumePolygon.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_polygonPaint.cancel()` | Disarms the tool and clears the points. | 61 |
| `editor_toolUtilities_polygonPaint.consumePolygon(out)` | Retrieves the finished simplified polygon and clears the finished flag. Returns nil if nothing is finished. | 75 |
| `editor_toolUtilities_polygonPaint.hasFinished()` | Tells whether a finished polygon is waiting to be retrieved by consumePolygon. | 71 |
| `editor_toolUtilities_polygonPaint.isActive()` | Tells whether the tool is armed. | 67 |
| `editor_toolUtilities_polygonPaint.start(opts)` | Arms the tool and resets the tables. stepMeters (default 2.0) is the minimum distance between two captured points, rdpTolMeters (default 6.0) the simplification tolerance. | 50 |
| `editor_toolUtilities_polygonPaint.update()` | To be called every frame while painting must be possible: draws the preview and the cursor, captures points while the left click is held down on the terrain, finishes on release. | 128 |

### Parameter details

#### `editor_toolUtilities_polygonPaint.consumePolygon(out)`

Retrieves the finished simplified polygon and clears the finished flag. Returns nil if nothing is finished.

- `out` (*table|nil*) : Reusable output table, emptied then filled; created if nil.
- **returns**: table|nil List of vec3 of the polygon.

#### `editor_toolUtilities_polygonPaint.hasFinished()`

Tells whether a finished polygon is waiting to be retrieved by consumePolygon.

- **returns**: boolean true if a polygon is ready.

#### `editor_toolUtilities_polygonPaint.isActive()`

Tells whether the tool is armed.

- **returns**: boolean true if armed.

#### `editor_toolUtilities_polygonPaint.start(opts)`

Arms the tool and resets the tables. stepMeters (default 2.0) is the minimum distance between two captured points, rdpTolMeters (default 6.0) the simplification tolerance.

- `opts` (*table|nil*) : { stepMeters = number, rdpTolMeters = number }

#### `editor_toolUtilities_polygonPaint.update()`

To be called every frame while painting must be possible: draws the preview and the cursor, captures points while the left click is held down on the terrain, finishes on release.

- **returns**: boolean true if a polygon finished during this frame.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/polygonPaint.lua`.*
