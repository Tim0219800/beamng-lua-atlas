# `flowgraph_nodes_logic_frameDelay`

*File: `lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/logic/frameDelay")` (file under extensions/ but not a regular extension)

Flowgraph node 'Frame Delay' (logic category). After the input flow appears, waits 'frames' calls of work before outputting flow. Requires a continuous flow. The impulse pin 'reset' resets the counter to zero. The 'frames' pin is hidden and hard-coded (default 1).

## Notes

- The code's description contains the typo 'inpulse'.
- The output is true from the start if frames <= 0; with frames=1, the output goes to true on the first frame of flow.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets counter and running to zero at start. | 28 |
| `C:_onDeserialized(res)` | Reads data.duration back. | 37 |
| `C:_onSerialize(res)` | Saves data.duration (legacy field, not used elsewhere). | 33 |
| `C:drawMiddle(builder, style)` | Progress bar counter/frames and Reset button. | 49 |
| `C:init(mgr, ...)` | Initializes counter=0 and running=false. | 23 |
| `C:updateCounter()` | If running, increments the counter and stops when it exceeds 'frames'. | 41 |
| `C:work(args)` | Handles reset, starts counting when there is flow, calls updateCounter; output flow = (counter >= frames). | 59 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua`.*
