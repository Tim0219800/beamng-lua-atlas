# `editor_ezObjectSelect_objectBoxAnchors`

*File: `lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua` · VM: Game Engine (GE) · 149 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_objectBoxAnchors`: `extensions.load("editor_ezObjectSelect_objectBoxAnchors")`, then the global `editor_ezObjectSelect_objectBoxAnchors`

Computes anchor points on the bottom of an object's bounding box for the Easy Select tool. Three patterns are produced: shortEdge (middle of the short side, at z min), longEdge (middle of the long side) and shortEdgeOrigin (like shortEdge but at local z = 0, at the origin level). The "long" axis is X if the scaled extent in X >= that in Y. Used to describe reference edges for moving/snapping.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_objectBoxAnchors.describeBox(box, scale)` | Describes a local box (methods getCenter/getExtents and minExtents/maxExtents). Returns nil if the box is not valid. | 54 |
| `editor_ezObjectSelect_objectBoxAnchors.describeMeshBox(meshBox, scale)` | Same as describeBox for a simple mesh box {minExtents, maxExtents, center, extents}. nil if a field is missing. | 59 |
| `editor_ezObjectSelect_objectBoxAnchors.describeObject(obj)` | Describes a scene object in world coordinates. Uses getObjBox + getTransform + getScale if possible; otherwise falls back to the world box getWorldBox. Each pattern contains first, second, firstOffset, secondOffset, centerOffset (offsets relative to the object's position). | 88 |

### Parameter details

#### `editor_ezObjectSelect_objectBoxAnchors.describeBox(box, scale)`

Describes a local box (methods getCenter/getExtents and minExtents/maxExtents). Returns nil if the box is not valid.

- `box` (*table*) : Local bounding box
- `scale` (*vec3|nil*) : Object scale (default 1,1,1)
- **returns**: table|nil {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin}, each edge having firstLocal/secondLocal

#### `editor_ezObjectSelect_objectBoxAnchors.describeMeshBox(meshBox, scale)`

Same as describeBox for a simple mesh box {minExtents, maxExtents, center, extents}. nil if a field is missing.

- `meshBox` (*table*) : Mesh box
- `scale` (*vec3|nil*) : Scale (default 1,1,1)
- **returns**: table|nil Same structure as describeBox

#### `editor_ezObjectSelect_objectBoxAnchors.describeObject(obj)`

Describes a scene object in world coordinates. Uses getObjBox + getTransform + getScale if possible; otherwise falls back to the world box getWorldBox. Each pattern contains first, second, firstOffset, secondOffset, centerOffset (offsets relative to the object's position).

- `obj` (*userdata*) : Scene object (must have getPosition)
- **returns**: table|nil {isLongX, scaledX, scaledY, shortEdge, longEdge, shortEdgeOrigin} or nil if no valid box

## Calls into the engine (C++)

- `obj:` `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getWorldBox`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/objectBoxAnchors.lua`.*
