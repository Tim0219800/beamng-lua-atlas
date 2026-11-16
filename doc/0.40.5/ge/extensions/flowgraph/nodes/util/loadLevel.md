# `flowgraph_nodes_util_loadLevel`

*File: `lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/util/loadLevel")` (file under extensions/ but not a regular extension)

Node "Load Level" (blue color, public icon). Loads a level: levelPath is relative to levels/ (info.json is added automatically). Inputs: flow, levelPath (templates = all levels), model and config (hidden, to spawn a specific vehicle). Output: flow, activated when the level is loaded. State machine: 1 starts the loading (core_levels.startLevel), 2 waits, 3 waits delayBufferFrames then emits onClientPostStartMission/onClientStartMission and reloads the map (map.assureLoad), 4 finished. Node data: preventPlayerSpawning, forceLevelLoad, delayBufferFrames, stopRunningOnClientEndMission, noLoadInEdit, customLoadingScreen.

## Notes

- If the editor is active, it is stopped during loading then reactivated.
- In work, self.stopRunningOnClientEndMission (node field) is used as the value of mgr.stopRunningOnClientEndMission, but it is never defined: it is nil.
- The config comment says "specific color" while the pin is the vehicle config.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Resets the state to 1, flow to false and clears mgr.__delayedLoadingScreenFunctions. | 34 |
| `C:drawMiddle(builder, style)` | Displays the current state in the node body. | 126 |
| `C:init()` | Initializes the state to 1, the flow pin to false and the default data (preventPlayerSpawning=true, forceLevelLoad=true, delayBufferFrames=0, noLoadInEdit=true, customLoadingScreen=false...). | 23 |
| `C:onLoadingScreenFadeout(missionFile)` | Hook called on the fade-out of the loading screen; goes to state 3 with the frame delay, unless already in state 4. | 51 |
| `C:postInit()` | Fills the templates of the levelPath pin with the sorted list from getAllLevelIdentifiers(). | 40 |
| `C:work()` | Advances the state machine. If the requested level is already loaded (and forceLevelLoad is false or the editor is active with noLoadInEdit), goes directly to 4. Otherwise starts core_levels.startLevel (disabling the automatic player spawn according to the data), then finalizes in state 3. | 59 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onClientPostStartMission` — listened to by 15 module(s)
- `onClientStartMission` — listened to by 40 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua`.*
