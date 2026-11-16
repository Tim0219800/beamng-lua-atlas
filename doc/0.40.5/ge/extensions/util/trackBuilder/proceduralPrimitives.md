# `util_trackBuilder_proceduralPrimitives`

*File: `lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua` · VM: Game Engine (GE) · 681 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_proceduralPrimitives`: `extensions.load("util_trackBuilder_proceduralPrimitives")`, then the global `util_trackBuilder_proceduralPrimitives`

Simple shape generators for Track Builder obstacles: torus (ring), cylinder, cone, cube, bump and ramp. Each function returns a procedural mesh table {verts, uvs, normals, faces, material} ready to be passed to ProceduralMesh:createMesh({{mesh}}) (verts and normals are {x,y,z}, uvs are {u,v}, faces are {v,n,u} 0-indexed). The default material is 'track_editor_A_border'.

## Example

```lua
local mesh = util_trackBuilder_proceduralPrimitives.createCylinder(2, 5)
local obj = createObject('ProceduralMesh')
obj:registerObject('monCylindre')
scenetree.MissionGroup:add(obj.obj)
obj:createMesh({{mesh}})
```

## Notes

- Parameters are first normalized (absolute value, default values); some are diameters: createCylinder and createCone divide the radius parameter by 2, and createRing multiplies radius by 2.
- The number of segments depends on the size (for example cylinder: radius*8 clamped between 12 and 72), so large objects are more detailed.
- createCube swaps the axes: size.x and size.y are inverted (size = vec3(|size.y|, |size.x|, |size.z|)).
- The file also contains createIcosphere (local, not exported, with a call to be:reloadCollision); it is not accessible from outside.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material)` | Bump (speed bump): base of length × width and top plateau of upperLength × upperWidth, with height height. | 289 |
| `util_trackBuilder_proceduralPrimitives.createCone(radius, height, material)` | Cone with a Z axis centered on the origin, tip pointing up. | 406 |
| `util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle)` | Cuboid centered on the origin. uvStyle chooses the UV layout (1 by default). | 472 |
| `util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material)` | Cylinder with a Z axis centered on the origin, with top and bottom faces. | 66 |
| `util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material)` | Ramp of length len, rising up to height hei. thinning narrows the width at the top, attack sets the curvature of the profile (power), twist adds a twist along the ramp. | 160 |
| `util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material)` | Torus (ring) centered on the origin, in the YZ plane. | 8 |

### Parameter details

#### `util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material)`

Bump (speed bump): base of length × width and top plateau of upperLength × upperWidth, with height height.

- `length` (*number|nil*) : Base length (2 by default).
- `width` (*number|nil*) : Base width (5 by default).
- `height` (*number|nil*) : Height (1 by default).
- `upperLength` (*number|nil*) : Plateau length (0.5 by default).
- `upperWidth` (*number|nil*) : Plateau width (4 by default).
- `material` (*string|nil*) : Material.
- **returns**: table Procedural mesh.

#### `util_trackBuilder_proceduralPrimitives.createCone(radius, height, material)`

Cone with a Z axis centered on the origin, tip pointing up.

- `radius` (*number*) : Base diameter (divided by 2 internally).
- `height` (*number*) : Height in meters.
- `material` (*string|nil*) : Material.
- **returns**: table Procedural mesh.

#### `util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle)`

Cuboid centered on the origin. uvStyle chooses the UV layout (1 by default).

- `size` (*vec3|nil*) : Dimensions; vec3(1,1,1) by default. x and y are swapped internally.
- `material` (*string|nil*) : Material.
- `uvStyle` (*any*) : UV style (1 by default; the value is compared to 1).
- **returns**: table Procedural mesh.

#### `util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material)`

Cylinder with a Z axis centered on the origin, with top and bottom faces.

- `radius` (*number*) : Diameter (divided by 2 internally).
- `height` (*number*) : Height in meters.
- `material` (*string|nil*) : Material.
- **returns**: table Procedural mesh.

#### `util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material)`

Ramp of length len, rising up to height hei. thinning narrows the width at the top, attack sets the curvature of the profile (power), twist adds a twist along the ramp.

- `width` (*number|nil*) : Base width (5 by default).
- `len` (*number|nil*) : Length (10 by default).
- `hei` (*number|nil*) : Final height (2 by default).
- `thinning` (*number|nil*) : Width factor at the top, clamped to [0, 2] (0.5 by default).
- `attack` (*number|nil*) : Exponent of the height profile, minimum 1.
- `twist` (*number|nil*) : Total twist (0 by default; unit inferred from code: radians).
- `material` (*string|nil*) : Material.
- **returns**: table Procedural mesh.

#### `util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material)`

Torus (ring) centered on the origin, in the YZ plane.

- `radius` (*number*) : Radius parameter; multiplied by 2 internally.
- `thickness` (*number*) : Tube thickness; divided by 2 internally.
- `material` (*string|nil*) : Material (default 'track_editor_A_border').
- **returns**: table Procedural mesh.

## Calls into the engine (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua`.*
