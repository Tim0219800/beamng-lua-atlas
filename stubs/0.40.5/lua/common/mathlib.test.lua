---@meta
-- tim19Atlas stub generated from lua/common/mathlib.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("mathlib.test")`
---@class mathlib_test
local mathlib_test = {}

--- Tests curve interpolation helpers (spline/Catmull-Rom/Bezier families).
---Source : lua/common/mathlib.test.lua:455
---@param ctx any
function mathlib_test.testMathlibCurves(ctx) end

--- Tests generic scalar helpers: sign, clamp, interpolation, medians, and bounds.
---Source : lua/common/mathlib.test.lua:399
---@param ctx any
function mathlib_test.testMathlibGeneric(ctx) end

--- Tests geometry overlap/containment/intersection helper families.
---Source : lua/common/mathlib.test.lua:472
---@param ctx any
function mathlib_test.testMathlibGeom(ctx) end

--- Tests StackVec3 (push3) parity with core vec3 operations.
---Source : lua/common/mathlib.test.lua:271
---@param ctx any
function mathlib_test.testMathlibPush3(ctx) end

--- Tests quaternion construction, algebra, interpolation, and conversions.
---Source : lua/common/mathlib.test.lua:298
---@param ctx any
function mathlib_test.testMathlibQuat(ctx) end

--- Tests NaN/inf/div-by-zero edge behavior across math helpers.
---Source : lua/common/mathlib.test.lua:505
---@param ctx any
function mathlib_test.testMathlibSpecialValuesAndOddities(ctx) end

--- Tests vec3 constructors, core arithmetic, normalization, and helpers.
---Source : lua/common/mathlib.test.lua:33
---@param ctx any
function mathlib_test.testMathlibVec3Core(ctx) end

--- Tests vec3 geometry methods (distances, barycentric, projection, basis, mutators).
---Source : lua/common/mathlib.test.lua:122
---@param ctx any
function mathlib_test.testMathlibVec3Geom(ctx) end

--- Tests vec3 noise/random generators and axis/line helper utilities.
---Source : lua/common/mathlib.test.lua:230
---@param ctx any
function mathlib_test.testMathlibVec3NoiseAndHelpers(ctx) end

--- Verifies in-place quaternion operations stay allocation-free under strict garbage allowance.
---Source : lua/common/mathlib.test.lua:712
---@param ctx any
function mathlib_test.testNoGarbageQuatInPlace(ctx) end

--- Verifies scalar helper loop stays allocation-free under strict garbage allowance.
---Source : lua/common/mathlib.test.lua:662
---@param ctx any
function mathlib_test.testNoGarbageScalarMathHelpers(ctx) end

--- Verifies single-shot scalar helpers stay allocation-free without loops.
---Source : lua/common/mathlib.test.lua:734
---@param ctx any
function mathlib_test.testNoGarbageScalarSingleShot(ctx) end

--- Verifies in-place vec3 operations stay allocation-free under strict garbage allowance.
---Source : lua/common/mathlib.test.lua:687
---@param ctx any
function mathlib_test.testNoGarbageVec3InPlace(ctx) end

--- Benchmarks representative geometric query helpers in a tight loop.
---Source : lua/common/mathlib.test.lua:636
---@param ctx any
function mathlib_test.testPerfGeometryBatch(ctx) end

--- Benchmarks representative quaternion math in a tight loop.
---Source : lua/common/mathlib.test.lua:591
---@param ctx any
function mathlib_test.testPerfQuatBatch(ctx) end

--- Benchmarks representative scalar helper math in a tight loop.
---Source : lua/common/mathlib.test.lua:617
---@param ctx any
function mathlib_test.testPerfScalarBatch(ctx) end

--- Benchmarks representative vec3 math in a tight loop.
---Source : lua/common/mathlib.test.lua:567
---@param ctx any
function mathlib_test.testPerfVec3Batch(ctx) end

return mathlib_test
