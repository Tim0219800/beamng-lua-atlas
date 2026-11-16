# `flowgraph_nodes_gameplay_isWalking`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua` · VM: Game Engine (GE) · 43 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/isWalking")` (file under extensions/ but not a regular extension)

Flowgraph node "Is Walking" (category repeat_instant, "walking" color/icon). Tests every frame whether the player is in walking mode via gameplay_walk.isWalking(). Output pins: walking (flow, true if the player is walking), nonWalking (flow, hidden, true otherwise), enteredWalking (pulse flow, hidden, true for one frame on entering walking mode), exitedWalking (pulse flow, hidden, true for one frame on exit). Depends on the gameplay_walk extension.

## Notes

- The node stores the initial state in self.prevWalk when execution starts (_executionStarted), but work() never updates prevWalk: enteredWalking/exitedWalking therefore stay true as long as the state differs from the one at start (behavior observed in the code, not a true single-frame pulse).

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class, instantiated by _flowgraph_createNode(C).

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Called when the graph starts; stores the current walking state in self.prevWalk. | 23 |
| `C:drawMiddle(builder, style)` | Draws a walker icon in the editor, green if the player is walking, grayed out otherwise. | 35 |
| `C:work(args)` | Every frame: reads gameplay_walk.isWalking() and fills the pins walking, nonWalking, enteredWalking, exitedWalking. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua`.*
