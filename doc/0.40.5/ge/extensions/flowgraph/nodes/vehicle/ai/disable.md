# `flowgraph_nodes_vehicle_ai_disable`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/disable")` (file under extensions/ but not a regular extension)

Node "AI Disable" (color ai, repeat_p_duration). Disables the AI mode of a vehicle. Input: aiVehId (no value = player vehicle). Data: useScriptStop (false: uses ai:scriptStop instead of ai.setState disabled), handBrakeWhenFinished, straightenWheelsWhenFinished.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the node's three data fields to false. | 20 |
| `C:work()` | Sends ai:scriptStop(handBrake, straightenWheels) to the vehicle if useScriptStop, otherwise ai.setState({mode = "disabled"}). | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua`.*
