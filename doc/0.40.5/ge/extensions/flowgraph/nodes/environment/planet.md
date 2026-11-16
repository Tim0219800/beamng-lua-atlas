# `flowgraph_nodes_environment_planet`

*File: `lua/ge/extensions/flowgraph/nodes/environment/planet.lua` · VM: Game Engine (GE) · 485 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/planet")` (file under extensions/ but not a regular extension)

Flowgraph node "Planet" (category once_p_duration, vehicle color/icon). Gives a vehicle planetary gravity (obj:setPlanets with position, radius and mass) and also generates a real solid planet: six procedural mesh faces (ProceduralMesh) deformed into a sphere from a cube-cross PNG height map (default "cubemap_small.png"), placed at the given position, with a "procheightmapMat" material created on the fly. Inputs: vehId (otherwise player), position (vec3), heightmap (PNG path), surfaceHeight (relief scale, 1 by default), radius (≥ 1), mass. On stop or reset, removes the vehicle's planets and deletes the created objects. The game notes that documentation of the parameters is missing.

## Notes

- Game C.todo: "Needs further documentation on what each parameter does and how it should be used."
- workOnce does nothing if position, radius or mass is nil or if |radius| < 1; does not check that the vehicle exists (nil veh crashes).
- The local function `test` (end of the file) references M which does not exist in this file and is never called.
- warpSphere (unused by workOnce) is an old version; workOnce uses warpSphereCubic.
- Old pin renamed: vehID -> vehId. Constant C.gConst = 6.6742e-11.
- In the editor, data.showDebug (true) draws the sphere, the mass, the force and the distance in drawMiddle.

## Class `C`

Node class, with the planet generation functions.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls onNodeReset. | 37 |
| `C:createheightmapMesh(heightmap, uvScale, material)` | Builds the mesh data (vertices, UVs, smoothed normals, faces, material) from a grid of points with a border. | 163 |
| `C:drawMiddle(builder, style)` | Editor: debug drawing and surface gravity (G*mass/radius²). | 123 |
| `C:getSquare(grid, size, identifier, dimensions)` | Extracts from the cross map the requested cube face (f, r, b, l, u, d), with a one-point border copied from the neighboring faces (blLookup table), and scales the x/y coordinates to the dimensions. | 378 |
| `C:heightmapFromPNG(path, scale, invertColors)` | Loads a PNG (GBitmap) and returns a grid of vec3(x, y, z) where z = average brightness 0-1 (sign inverted by default). | 323 |
| `C:init()` | Enables showDebug. | 32 |
| `C:normalFromPoints(p1, p3, p2)` | Normal (positive z) of triangle p1, p3, p2. | 289 |
| `C:onNodeReset()` | Removes the vehicle's planets (obj:setPlanets({})) and deletes the created ProceduralMesh objects. | 41 |
| `C:placeObject(name, mesh, pos, rot)` | Creates an unsaved ProceduralMesh in MissionGroup with the given mesh, position and rotation. | 301 |
| `C:warpSphere(sphereRadius, heightmap, surfaceHeight)` | Deforms a flat grid into a spherical cap (angular method, unused by workOnce). | 247 |
| `C:warpSphereCubic(sphereRadius, heightmap, cLength, surfaceHeight)` | Projects a cube face onto a sphere of given radius, with relief = z * surfaceHeight. | 264 |
| `C:workOnce()` | Applies planetary gravity to the vehicle, creates the material, loads the height map, generates the six faces of the planet and reloads collisions (be:reloadCollision). | 57 |

## Calls into the engine (C++)

- `be:` `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawText`
- `obj:` `delete`, `getId`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/planet.lua`.*
