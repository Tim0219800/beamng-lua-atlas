# `flowgraph_nodes_events_controlsReset`

*File: `lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua` · VM: Game Engine (GE) · 78 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/events/controlsReset")` (file under extensions/ but not a regular extension)

Flowgraph node "Controls Reset" (category logic, event). Lets flow through when the player presses Reset. When it is used, the default freeroam reset no longer happens (data.blocksOnResetGameplay = true). Pins: flow (input), flow (pulse output) and value (hidden bool).

## Notes

- Records an event in the flowgraph log (logEvent) on each press.
- Adds a "Reset" button to the game context interface (onGatherGameContextUiButtons), active only if the node is in an active state and was used in the current frame.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Resets self.reset to false after triggering. | 43 |
| `C:_executionStarted()` | Resets self.reset to false. | 34 |
| `C:_executionStopped()` | Resets self.reset to false. | 29 |
| `C:drawMiddle(builder, style)` | Node drawing in the editor. | 47 |
| `C:init(mgr, ...)` | Initializes self.reset and data.blocksOnResetGameplay. | 24 |
| `C:onGatherGameContextUiButtons(results)` | Hook: adds to results the button {id='controlsReset', label='Reset', order=0, active}. | 64 |
| `C:onResetGameplay()` | Hook called by extensions.hook("onResetGameplay"): stores the press. | 39 |
| `C:work(args)` | Sets flow and value to true one frame after a reset, otherwise to false. | 51 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/events/controlsReset.lua`.*
