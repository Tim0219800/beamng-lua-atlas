# `editor_toolUtilities_polyBool`

*File: `lua/ge/extensions/editor/toolUtilities/polyBool.lua` · VM: Game Engine (GE) · 879 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_polyBool`: `extensions.load("editor_toolUtilities_polyBool")`, then the global `editor_toolUtilities_polyBool`

In-house 2D polygon booleans (union, difference), Martinez-like, adapted from the polybooljs approach (MIT). A polygon is a table { regions = { ring, ... }, inverted = bool } where each ring is a list of {x,y} points. Computations are done in a local frame near the origin so that the absolute epsilon does not get crushed at world coordinates. areas then sorts a list of rings into outer rings with their holes, ready for triangulation.

## Example

```lua
local pb = extensions.editor_toolUtilities_polyBool
local res = pb.difference(terrainRing, roadRing)
for _, a in ipairs(pb.areas(res.regions)) do
  -- a.ring (CCW), a.holes (list of CW rings)
end
```

## Notes

- difference accepts flexible input: { regions }, a single ring, or a list of rings; points can be {x=,y=} or {[1],[2]}.
- unionMany, in contrast, expects tables with the regions field (and inverted) for each element.
- Rings of fewer than 3 points are ignored. If the clip is empty, difference returns the subject as is.
- Internal tolerances: eps 1e-10 for the sweep, SNAP 1e-6 for the input grid, WELD 1e-4 to weld nearly coincident corners.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_polyBool.areas(regions)` | Sorts the flat list of rings of a boolean result into outer rings each carrying their holes. Nesting is deduced from containment depth: even = solid, odd = hole. Outer rings oriented CCW, holes CW. Each hole is attached to the deepest ring that contains it. | 829 |
| `editor_toolUtilities_polyBool.difference(subject, clip)` | Boolean difference: subject minus clip. Works in a local frame like unionMany. | 774 |
| `editor_toolUtilities_polyBool.unionMany(polys)` | Merges several polygons into one. Returns an empty polygon if the list is empty. | 744 |

### Parameter details

#### `editor_toolUtilities_polyBool.areas(regions)`

Sorts the flat list of rings of a boolean result into outer rings each carrying their holes. Nesting is deduced from containment depth: even = solid, odd = hole. Outer rings oriented CCW, holes CW. Each hole is attached to the deepest ring that contains it.

- `regions` (*table*) : List of {x,y} rings (e.g. result.regions from difference).
- **returns**: table List of { ring = ring, holes = { ring, ... } }.

#### `editor_toolUtilities_polyBool.difference(subject, clip)`

Boolean difference: subject minus clip. Works in a local frame like unionMany.

- `subject` (*table*) : Polygon, ring or list of rings to subtract from.
- `clip` (*table*) : Polygon, ring or list of rings to subtract.
- **returns**: table Result polygon { regions, inverted }.

#### `editor_toolUtilities_polyBool.unionMany(polys)`

Merges several polygons into one. Returns an empty polygon if the list is empty.

- `polys` (*table*) : List of polygons { regions = {ring,...}, inverted = bool }.
- **returns**: table Result polygon { regions, inverted } in world coordinates.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/polyBool.lua`.*
