# `career_modules_debug_insuranceDebug`

*File: `lua/ge/extensions/career/modules/debug/insuranceDebug.lua` · VM: Game Engine (GE) · 16 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_insuranceDebug`: `extensions.load("career_modules_debug_insuranceDebug")`, then the global `career_modules_debug_insuranceDebug`

"Insurance" career debug tab. Adds a single menu entry '> Reset insurance data' that calls career_modules_insurance_insurance.resetPlPolicyData() (resets the player's insurance policy data).

## Notes

- Development tool; debugOrder = 1.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_insuranceDebug.drawDebugFunctions()` | Draws the '> Reset insurance data' entry; on click, resets the insurance policy data. *(internal)* | 9 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Insurance'. |
| `debugOrder` | number | Sort order (1). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/insuranceDebug.lua`.*
