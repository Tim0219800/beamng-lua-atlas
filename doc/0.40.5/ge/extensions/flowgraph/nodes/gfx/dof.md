# `flowgraph_nodes_gfx_dof`

*File: `lua/ge/extensions/flowgraph/nodes/gfx/dof.lua` · VM: Game Engine (GE) · 115 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gfx/dof")` (file under extensions/ but not a regular extension)

Flowgraph node "DOF" (default category, tags gfx/dof). Fades in (blurIn) or out (blurOut) a depth-of-field blur over fadeTime seconds (default 1) by driving the variables $DOFPostFx::BlurMin, BlurMax, BlurCurveFar (target 430) and FocusRangeMax (3), then refreshes DOFPostEffect. Output blurDone when the fade is finished. The original values are saved and restored on reset or stop.

## Notes

- The savedBlurMin/Max/... backups are read then rewritten on every mode change, without being reset to nil.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset(). | 61 |
| `C:init(mgr, ...)` | Calls reset(). | 57 |
| `C:reset()` | Resets the timer and the mode to zero and restores the saved DOF variables. | 33 |
| `C:updateSettings()` | Calls DOFPostEffect.updateDOFSettings() if the effect exists. | 26 |
| `C:work()` | Detects the mode (in/out), saves the DOF settings then advances the fade with dtSim; sets blurDone to true at the end. | 65 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gfx/dof.lua`.*
