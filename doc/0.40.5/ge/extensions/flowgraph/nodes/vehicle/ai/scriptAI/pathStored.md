# `flowgraph_nodes_vehicle_ai_scriptAI_pathStored`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua` · VM: Game Engine (GE) · 99 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored")` (file under extensions/ but not a regular extension)

Node "Stored AI Path" (provider, color ai). Stores in the project a ScriptAI path recorded with the ScriptAIManager editor and provides it. Output: path (type aiPath) = {path = aiPath}. The inspector allows opening ScriptAIManager, choosing a current recording and loading it into the node; the path is drawn in debug (magenta prisms).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Does nothing. | 26 |
| `C:_onDeserialized(nodeData)` | Restores aiPath (empty by default). | 94 |
| `C:_onSerialize(res)` | Saves aiPath in the project. | 90 |
| `C:drawCustomProperties()` | Displays the number of elements, the debug path, the button to open ScriptAIManager, the recording selector and the load button. | 50 |
| `C:drawDebugPath()` | Draws the stored path with debugDrawer:drawSquarePrism for the points close to the camera (100 to 200 m). | 33 |
| `C:drawMiddle(builder, style)` | Displays the number of elements of the path. | 85 |
| `C:init()` | Initializes an empty path and the identifier "Select...". | 21 |
| `C:work()` | Publishes {path = self.aiPath} on the path output. | 81 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSquarePrism`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua`.*
