# `unittests`

*File: `lua/console/unittests.lua` · VM: Console · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("unittests")`

Console unit tests for mathlib's vec3 type: correctness (constructor, tostring, operators + - * / and unary, equality) and performance (100001 iterations of the four operations). Both tests are launched on import.

## Notes

- The precision test expects vec3(0,133007.133,-1) to be displayed as "(0, 133007.141, -1)", which shows a loss of floating-point precision at large values.
- test_vec3_performance uses the globals a and b left by test_vec3_function; it logs a warning if the duration exceeds 850 ms.
- The assertions raise a Lua error if a test fails.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `test_vec3_function()` | Checks with assert the vec3 constructors, display (tostring) and operators. | 19 |
| `test_vec3_performance()` | Times 100001 loops of vec3 addition, subtraction, multiplication and division and logs a warning (level D) beyond 850 ms. | 47 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/console/unittests.lua`.*
