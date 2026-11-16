---@meta
-- tim19Atlas stub generated from lua/common/mathlib.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of mathlib (vec3, quat, scalar helpers, curves, geometry, StackVec3/push3), to be run with testFramework/TestManager. Also contains loop performance tests and "no garbage" tests that verify that in-place operations allocate no memory. Launch: `require('testFramework/TestManager'):runTestFiles('mathlib')` in the GE console. Useful to a modder as a catalog of usage examples of the mathlib functions.
--- Access: `require("mathlib.test")`
---@class mathlib_test
local mathlib_test = {}

--- Tests the curve interpolation helpers (spline families, Catmull-Rom, Bézier).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:455
---@param ctx table Test context.
function mathlib_test.testMathlibCurves(ctx) end

--- Tests the generic scalar helpers: sign, clamp, interpolation, medians, bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:399
---@param ctx table Test context.
function mathlib_test.testMathlibGeneric(ctx) end

--- Tests the families of geometric overlap, containment and intersection helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:472
---@param ctx table Test context.
function mathlib_test.testMathlibGeom(ctx) end

--- Tests StackVec3 (push3): parity with the basic vec3 operations.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:271
---@param ctx table Test context.
function mathlib_test.testMathlibPush3(ctx) end

--- Tests quaternion construction, algebra, interpolation and conversions.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:298
---@param ctx table Test context.
function mathlib_test.testMathlibQuat(ctx) end

--- Tests behavior on NaN, infinity and division by zero in the math helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:505
---@param ctx table Test context.
function mathlib_test.testMathlibSpecialValuesAndOddities(ctx) end

--- Tests the vec3 constructors, basic arithmetic, normalization and the helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:33
---@param ctx table Test context (TestManager).
function mathlib_test.testMathlibVec3Core(ctx) end

--- Tests the geometric methods of vec3: distances, barycentric coordinates, projection, orthonormal basis, mutators.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:122
---@param ctx table Test context.
function mathlib_test.testMathlibVec3Geom(ctx) end

--- Tests the noise/random generators of vec3 and the axis and line helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:230
---@param ctx table Test context.
function mathlib_test.testMathlibVec3NoiseAndHelpers(ctx) end

--- Verifies that the in-place quaternion operations (setMul2, setInvMul2, setMulInv2, normalize) allocate nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:712
---@param ctx table Test context.
function mathlib_test.testNoGarbageQuatInPlace(ctx) end

--- Verifies that the scalar helpers loop (sign, clamp, lerp, smoothstep, biasFun...) allocates nothing (budget 512 bytes, checkGarbage(0)).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:662
---@param ctx table Test context.
function mathlib_test.testNoGarbageScalarMathHelpers(ctx) end

--- Verifies that clamp, lerp, inverseLerp and smoothstep called once allocate no memory (budget 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:734
---@param ctx table Test context.
function mathlib_test.testNoGarbageScalarSingleShot(ctx) end

--- Verifies that the in-place vec3 operations (setAdd2, setSub, setScaled, setComponentMul, setLerp, setCross) allocate nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:687
---@param ctx table Test context.
function mathlib_test.testNoGarbageVec3InPlace(ctx) end

--- Benchmark: representative geometric queries in a tight loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:636
---@param ctx table Test context.
function mathlib_test.testPerfGeometryBatch(ctx) end

--- Benchmark: quaternion operations over 10000 iterations.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:591
---@param ctx table Test context.
function mathlib_test.testPerfQuatBatch(ctx) end

--- Benchmark: scalar math helpers in a tight loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:617
---@param ctx table Test context.
function mathlib_test.testPerfScalarBatch(ctx) end

--- Benchmark: vec3 arithmetic (dot, length, cross, normalized, sum) over 10000 iterations.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/mathlib.test.lua:567
---@param ctx table Test context.
function mathlib_test.testPerfVec3Batch(ctx) end

return mathlib_test
