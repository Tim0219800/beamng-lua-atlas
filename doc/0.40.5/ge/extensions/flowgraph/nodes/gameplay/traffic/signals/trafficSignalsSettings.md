# `flowgraph_nodes_gameplay_traffic_signals_trafficSignalsSettings`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings")` (file under extensions/ but not a regular extension)

Flowgraph node "Traffic Signals Settings" (once_instant, depends on core_trafficSignals). Pins: signalsActive (core_trafficSignals.setActive) and simpleLights (debugLevel 1 if true, otherwise 0: simple state visuals). On stop, reactivates the signals and resets debugLevel to 0.

**Dependencies (loaded first):** `core_trafficSignals`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Reactivates the signals and resets core_trafficSignals.debugLevel to 0. | 23 |
| `C:workOnce(args)` | Applies signalsActive and simpleLights if not nil. | 28 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/trafficSignalsSettings.lua`.*
