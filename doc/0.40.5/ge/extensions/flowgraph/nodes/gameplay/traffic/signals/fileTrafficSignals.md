# `flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua` · VM: Game Engine (GE) · 73 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals")` (file under extensions/ but not a regular extension)

Flowgraph node "File Traffic Signals" (once_p_duration, depends on core_trafficSignals). Loads a traffic signals file (core_trafficSignals.loadSignals(file)), or the level's own file if data.useDefaultFileFromLevel (default true) and no file is given. Activates the simulation (setActive(true, true)) and outputs signalsData. Node error if loading fails. On stop, reloads the map's default file.

**Dependencies (loaded first):** `core_trafficSignals`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Clears the output and reloads the map's default signals file. | 47 |
| `C:drawCustomProperties()` | Draws the node's custom properties in the flowgraph editor panel (ImGui). | 35 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 24 |
| `C:onNodeReset()` | Clears the signalsData output. | 43 |
| `C:postInit()` | Called after the node's pins are created; used to adjust the pins (value templates, file filters, dynamic keys). | 29 |
| `C:work()` | On the first call, loads the signals, activates the simulation and publishes core_trafficSignals.getData() on signalsData. | 54 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua`.*
