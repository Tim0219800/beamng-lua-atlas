# `flowgraph_nodes_gameplay_traffic_signals_sequenceSettings`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings")` (file under extensions/ but not a regular extension)

Flowgraph node "Signal Sequence Settings" (once_instant). Sets a traffic light sequence: active (setActive), timed (enableTimer), stepIndex (setStep, takes priority) or phaseIndex (setPhase). Only non-nil pins are applied.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Applies activation, timer, then jumps to the requested step (or, failing that, phase). | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/sequenceSettings.lua`.*
