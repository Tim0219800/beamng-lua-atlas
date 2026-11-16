# `editor_ezObjectSelect_transformGizmo`

*File: `lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua` · VM: Game Engine (GE) · 111 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_transformGizmo`: `extensions.load("editor_ezObjectSelect_transformGizmo")`, then the global `editor_ezObjectSelect_transformGizmo`

3D visual guides of the Easy Object Select tool during a translation, scaling or rotation. Drawn with debugDrawer: arrows (line + prism) for translation, lines + spheres for scale, 64-segment ring and angle arc for rotation. Colors are red/green/blue for X/Y/Z; the guide length depends on the distance to the camera (0.16 × distance, clamped between 1.5 and 30 m).

## Notes

- The constraint parameter is {axis = "x"|"y"|"z", exclude = boolean}: without exclude only the axis is drawn, with exclude the other two (plane constraint). Without a constraint all three axes are drawn.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_transformGizmo.axisColors()` | Returns the axis color table {x, y, z} (ColorF). | 42 |
| `editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle)` | Draws the rotation ring around the given axis and, if the angle is not zero, a thick arc of the angle traveled from the start vector. | 92 |
| `editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint)` | Draws the scale guides (line ending in a sphere) for the concerned axes. | 64 |
| `editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint)` | Draws the translation arrows from the pivot for the axes concerned by the constraint. | 46 |

### Parameter details

#### `editor_ezObjectSelect_transformGizmo.axisColors()`

Returns the axis color table {x, y, z} (ColorF).

- **returns**: table<string, ColorF> Colors of the x, y, z axes.

#### `editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle)`

Draws the rotation ring around the given axis and, if the angle is not zero, a thick arc of the angle traveled from the start vector.

- `pivot` (*vec3*) : Rotation center.
- `axis` (*vec3*) : Rotation axis (normalized internally, default Z).
- `startVector` (*vec3|nil*) : Start vector projected onto the ring plane.
- `angle` (*number|nil*) : Angle in radians.

#### `editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint)`

Draws the scale guides (line ending in a sphere) for the concerned axes.

- `pivot` (*vec3*) : Scale center.
- `axes` (*table<string, vec3>*) : Directions of the x, y, z axes.
- `constraint` (*table|nil*) : Axis/plane constraint, or nil.

#### `editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint)`

Draws the translation arrows from the pivot for the axes concerned by the constraint.

- `pivot` (*vec3*) : Origin point of the arrows.
- `axes` (*table<string, vec3>*) : Directions of the x, y, z axes (world or local).
- `constraint` (*table|nil*) : Axis/plane constraint ({axis, exclude}), or nil for the three axes.

## Calls into the engine (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua`.*
