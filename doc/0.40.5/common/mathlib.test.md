# `mathlib_test`

*Fichier : `lua/common/mathlib.test.lua` · VM : Commun (GE + véhicule) · 750 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("mathlib.test")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mathlib_test.testMathlibCurves(ctx)` | Tests curve interpolation helpers (spline/Catmull-Rom/Bezier families). | 455 |
| `mathlib_test.testMathlibGeneric(ctx)` | Tests generic scalar helpers: sign, clamp, interpolation, medians, and bounds. | 399 |
| `mathlib_test.testMathlibGeom(ctx)` | Tests geometry overlap/containment/intersection helper families. | 472 |
| `mathlib_test.testMathlibPush3(ctx)` | Tests StackVec3 (push3) parity with core vec3 operations. | 271 |
| `mathlib_test.testMathlibQuat(ctx)` | Tests quaternion construction, algebra, interpolation, and conversions. | 298 |
| `mathlib_test.testMathlibSpecialValuesAndOddities(ctx)` | Tests NaN/inf/div-by-zero edge behavior across math helpers. | 505 |
| `mathlib_test.testMathlibVec3Core(ctx)` | Tests vec3 constructors, core arithmetic, normalization, and helpers. | 33 |
| `mathlib_test.testMathlibVec3Geom(ctx)` | Tests vec3 geometry methods (distances, barycentric, projection, basis, mutators). | 122 |
| `mathlib_test.testMathlibVec3NoiseAndHelpers(ctx)` | Tests vec3 noise/random generators and axis/line helper utilities. | 230 |
| `mathlib_test.testNoGarbageQuatInPlace(ctx)` | Verifies in-place quaternion operations stay allocation-free under strict garbage allowance. | 712 |
| `mathlib_test.testNoGarbageScalarMathHelpers(ctx)` | Verifies scalar helper loop stays allocation-free under strict garbage allowance. | 662 |
| `mathlib_test.testNoGarbageScalarSingleShot(ctx)` | Verifies single-shot scalar helpers stay allocation-free without loops. | 734 |
| `mathlib_test.testNoGarbageVec3InPlace(ctx)` | Verifies in-place vec3 operations stay allocation-free under strict garbage allowance. | 687 |
| `mathlib_test.testPerfGeometryBatch(ctx)` | Benchmarks representative geometric query helpers in a tight loop. | 636 |
| `mathlib_test.testPerfQuatBatch(ctx)` | Benchmarks representative quaternion math in a tight loop. | 591 |
| `mathlib_test.testPerfScalarBatch(ctx)` | Benchmarks representative scalar helper math in a tight loop. | 617 |
| `mathlib_test.testPerfVec3Batch(ctx)` | Benchmarks representative vec3 math in a tight loop. | 567 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/mathlib.test.lua`.*
