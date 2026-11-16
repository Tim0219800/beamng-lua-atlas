# `editor_roadDecorations`

*File: `lua/ge/extensions/editor/roadDecorations.lua` · VM: Game Engine (GE) · 183 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadDecorations`: `extensions.load("editor_roadDecorations")`, then the global `editor_roadDecorations`

Automatically places decorative objects (TSStatic, for example reflectors or posts) on each side of a DecalRoad, at regular intervals. The objects are placed at terrain height, registered under "decoration.<road>.<file>.<n>" and grouped in a SimGroup added to MissionGroup. A modder calls it from an editor script.

## Example

```lua
-- a reflector 2 m from the edge, every 25 m, left/right sides aligned
local grp = editor_roadDecorations.decorateProps('myRoad', 'levels/driver_training/art/shapes/objects/reflector.dae', 2, 25, nil, 0, true)
```

## Notes

- BUG: the group name is built with string.format('decorations.%d', tostring(roadName)); %d requires a number, so a non-numeric road name (string) raises an error. Only a numeric name (e.g. "9459") works.
- The code documentation says the function returns the table of created objects, but it actually returns group:getID() (the SimGroup identifier); the props table is built but never returned. Returns nil if the road does not exist.
- The props are oriented parallel to the road (quatFromDir of the flattened direction); the rotation parameter is a quaternion multiplied with this rotation (inferred from code), nil for none.
- Each row has 2 objects (right then left) per step; the loop stops when either side goes past the end of the road.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align)` | Creates a SimGroup and places in it, every `period` meters, a TSStatic on each side of the road (collisionType 'Collision Mesh', scale 1). The positions are snapped to the terrain (core_terrain.getTerrainHeight) then offset by zOff. | 112 |
| `editor_roadDecorations.findOffsetPoint(spline, length, distance, left)` | Searches a polyline (road edge) for the point located at the given length from the start, then offsets it laterally. Returns nil if the length exceeds the polyline. | 7 |

### Parameter details

#### `editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align)`

Creates a SimGroup and places in it, every `period` meters, a TSStatic on each side of the road (collisionType 'Collision Mesh', scale 1). The positions are snapped to the terrain (core_terrain.getTerrainHeight) then offset by zOff.

- `roadName` (*string|integer*) : Unique name of the DecalRoad (see bug: must be numeric).
- `shapeName` (*string*) : Path of the .dae file to place.
- `distance` (*number*) : Lateral offset from the road edge, in meters.
- `period` (*number*) : Interval between two pairs of objects, in meters.
- `rotation` (*quat|nil*) : Extra rotation applied to the objects (nil = none).
- `zOff` (*number*) : Vertical offset added to the terrain height.
- `align` (*boolean*) : true: the left side is placed as the exact opposite of the right side (same road length).
- **returns**: integer|nil Identifier of the created SimGroup, or nil if the road does not exist.

#### `editor_roadDecorations.findOffsetPoint(spline, length, distance, left)`

Searches a polyline (road edge) for the point located at the given length from the start, then offsets it laterally. Returns nil if the length exceeds the polyline.

- `spline` (*table<integer, vec3>*) : Points of the road edge (at least 2).
- `length` (*number*) : Distance from the start, in meters.
- `distance` (*number*) : Lateral offset toward the outside of the road, in meters.
- `left` (*boolean*) : true for the left edge (reversed direction), false for the right edge.
- **returns**: table|nil {point = offset vec3, rotation = quat, edgePos = vec3 on the edge, edgeIdx = integer (C++ index, 0-based)} or nil.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadDecorations.lua`.*
