# `editor_roadArchitect_clothoid`

*File: `lua/ge/extensions/editor/roadArchitect/clothoid.lua` · VM: Game Engine (GE) · 305 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_clothoid`: `extensions.load("editor_roadArchitect_clothoid")`, then the global `editor_roadArchitect_clothoid`

Clothoid evaluation (Euler spirals, curvature varying linearly with arc length) for Road Architect. The code is largely based on the Clothoids library by Enrico Bertolazzi and Marco Frego (BSD license, copyright 2024 Bertolazzi, Frego and BeamNG): the generalized Fresnel integrals are computed internally (fresnelCS, evalXYaSmall, evalXYaLarge, generalizedFresnelCS). A modder uses it to get points on a transition curve (roads, junctions).

## Example

```lua
local clothoid = require('editor/roadArchitect/clothoid')
local p = clothoid.evaluate(vec3(0, 0, 0), 0, 0, 0.001, 20) -- point at 20 m, start heading 0, initial curvature 0, dKappa 0.001
```

## Notes

- Only evaluate is exported; the Fresnel routines are local.
- The returned vec3 only has x and y set (z = 0 by default): the height of start is not carried over.
- The heading theta0 is in radians; p is the arc length from the start point (world units, meters).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p)` | Evaluates a clothoid at parameter p (arc length, from 0 to the total geodesic length): computes the generalized Fresnel integral with a = dKappa·p², b = kappa·p and c = theta0, then returns start + p·(C, S). | 296 |

### Parameter details

#### `editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p)`

Evaluates a clothoid at parameter p (arc length, from 0 to the total geodesic length): computes the generalized Fresnel integral with a = dKappa·p², b = kappa·p and c = theta0, then returns start + p·(C, S).

- `start` (*vec3*) : Start point of the spiral (only x and y are used).
- `theta0` (*number*) : Initial heading in radians.
- `kappa` (*number*) : Initial curvature (1/m).
- `dKappa` (*number*) : Rate of change of curvature per unit length (1/m²).
- `p` (*number*) : Arc length to evaluate, between 0 and the spiral length.
- **returns**: vec3 Position (x, y) of the point on the clothoid, z at 0.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/clothoid.lua`.*
