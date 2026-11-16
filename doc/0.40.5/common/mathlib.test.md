# `mathlib_test`

*File: `lua/common/mathlib.test.lua` · VM: Common (GE + vehicle) · 750 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("mathlib.test")`

Unit tests of mathlib (vec3, quat, scalar helpers, curves, geometry, StackVec3/push3), to be run with testFramework/TestManager. Also contains loop performance tests and "no garbage" tests that verify that in-place operations allocate no memory. Launch: `require('testFramework/TestManager'):runTestFiles('mathlib')` in the GE console. Useful to a modder as a catalog of usage examples of the mathlib functions.

## Example

```lua
require('testFramework/TestManager'):runTestFiles('mathlib')
```

## Notes

- Each function takes a context `ctx` provided by TestManager and is not meant to be called directly.
- Constant EPS = 1e-6 for float comparisons; assertVec3 compares x, y, z and assertFinite rejects NaN and ±inf.
- The "Perf" tests do 10000 iterations; the "NoGarbage" tests impose an allocation budget (allowGarbage 0 to 1024 bytes, checkGarbage(0)).

## Functions

| Function | Description | Line |
|---|---|---|
| `mathlib_test.testMathlibCurves(ctx)` | Tests the curve interpolation helpers (spline families, Catmull-Rom, Bézier). *(internal)* | 455 |
| `mathlib_test.testMathlibGeneric(ctx)` | Tests the generic scalar helpers: sign, clamp, interpolation, medians, bounds. *(internal)* | 399 |
| `mathlib_test.testMathlibGeom(ctx)` | Tests the families of geometric overlap, containment and intersection helpers. *(internal)* | 472 |
| `mathlib_test.testMathlibPush3(ctx)` | Tests StackVec3 (push3): parity with the basic vec3 operations. *(internal)* | 271 |
| `mathlib_test.testMathlibQuat(ctx)` | Tests quaternion construction, algebra, interpolation and conversions. *(internal)* | 298 |
| `mathlib_test.testMathlibSpecialValuesAndOddities(ctx)` | Tests behavior on NaN, infinity and division by zero in the math helpers. *(internal)* | 505 |
| `mathlib_test.testMathlibVec3Core(ctx)` | Tests the vec3 constructors, basic arithmetic, normalization and the helpers. *(internal)* | 33 |
| `mathlib_test.testMathlibVec3Geom(ctx)` | Tests the geometric methods of vec3: distances, barycentric coordinates, projection, orthonormal basis, mutators. *(internal)* | 122 |
| `mathlib_test.testMathlibVec3NoiseAndHelpers(ctx)` | Tests the noise/random generators of vec3 and the axis and line helpers. *(internal)* | 230 |
| `mathlib_test.testNoGarbageQuatInPlace(ctx)` | Verifies that the in-place quaternion operations (setMul2, setInvMul2, setMulInv2, normalize) allocate nothing. *(internal)* | 712 |
| `mathlib_test.testNoGarbageScalarMathHelpers(ctx)` | Verifies that the scalar helpers loop (sign, clamp, lerp, smoothstep, biasFun...) allocates nothing (budget 512 bytes, checkGarbage(0)). *(internal)* | 662 |
| `mathlib_test.testNoGarbageScalarSingleShot(ctx)` | Verifies that clamp, lerp, inverseLerp and smoothstep called once allocate no memory (budget 0). *(internal)* | 734 |
| `mathlib_test.testNoGarbageVec3InPlace(ctx)` | Verifies that the in-place vec3 operations (setAdd2, setSub, setScaled, setComponentMul, setLerp, setCross) allocate nothing. *(internal)* | 687 |
| `mathlib_test.testPerfGeometryBatch(ctx)` | Benchmark: representative geometric queries in a tight loop. *(internal)* | 636 |
| `mathlib_test.testPerfQuatBatch(ctx)` | Benchmark: quaternion operations over 10000 iterations. *(internal)* | 591 |
| `mathlib_test.testPerfScalarBatch(ctx)` | Benchmark: scalar math helpers in a tight loop. *(internal)* | 617 |
| `mathlib_test.testPerfVec3Batch(ctx)` | Benchmark: vec3 arithmetic (dot, length, cross, normalized, sum) over 10000 iterations. *(internal)* | 567 |

### Parameter details

#### `mathlib_test.testMathlibCurves(ctx)`

Tests the curve interpolation helpers (spline families, Catmull-Rom, Bézier).

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibGeneric(ctx)`

Tests the generic scalar helpers: sign, clamp, interpolation, medians, bounds.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibGeom(ctx)`

Tests the families of geometric overlap, containment and intersection helpers.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibPush3(ctx)`

Tests StackVec3 (push3): parity with the basic vec3 operations.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibQuat(ctx)`

Tests quaternion construction, algebra, interpolation and conversions.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibSpecialValuesAndOddities(ctx)`

Tests behavior on NaN, infinity and division by zero in the math helpers.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibVec3Core(ctx)`

Tests the vec3 constructors, basic arithmetic, normalization and the helpers.

- `ctx` (*table*) : Test context (TestManager).

#### `mathlib_test.testMathlibVec3Geom(ctx)`

Tests the geometric methods of vec3: distances, barycentric coordinates, projection, orthonormal basis, mutators.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testMathlibVec3NoiseAndHelpers(ctx)`

Tests the noise/random generators of vec3 and the axis and line helpers.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testNoGarbageQuatInPlace(ctx)`

Verifies that the in-place quaternion operations (setMul2, setInvMul2, setMulInv2, normalize) allocate nothing.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testNoGarbageScalarMathHelpers(ctx)`

Verifies that the scalar helpers loop (sign, clamp, lerp, smoothstep, biasFun...) allocates nothing (budget 512 bytes, checkGarbage(0)).

- `ctx` (*table*) : Test context.

#### `mathlib_test.testNoGarbageScalarSingleShot(ctx)`

Verifies that clamp, lerp, inverseLerp and smoothstep called once allocate no memory (budget 0).

- `ctx` (*table*) : Test context.

#### `mathlib_test.testNoGarbageVec3InPlace(ctx)`

Verifies that the in-place vec3 operations (setAdd2, setSub, setScaled, setComponentMul, setLerp, setCross) allocate nothing.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testPerfGeometryBatch(ctx)`

Benchmark: representative geometric queries in a tight loop.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testPerfQuatBatch(ctx)`

Benchmark: quaternion operations over 10000 iterations.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testPerfScalarBatch(ctx)`

Benchmark: scalar math helpers in a tight loop.

- `ctx` (*table*) : Test context.

#### `mathlib_test.testPerfVec3Batch(ctx)`

Benchmark: vec3 arithmetic (dot, length, cross, normalized, sum) over 10000 iterations.

- `ctx` (*table*) : Test context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/mathlib.test.lua`.*
