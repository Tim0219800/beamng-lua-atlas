# `core_flowgraphManager`

*File: `lua/ge/extensions/core/flowgraphManager.lua` · VM: Game Engine (GE) · 436 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_flowgraphManager`: `extensions.load("core_flowgraphManager")`, then the global `core_flowgraphManager`

GE extension `core_flowgraphManager`: manager of the running Flowgraph projects (node-based visual scripts). It creates, loads, starts, deletes and serializes `manager` objects (one per .flow.json project), provides the catalogs of available nodes and state templates for the editor, and exposes helpers `_flowgraph_createNode / _flowgraph_createStateNode / _flowgraph_createModule` that node files use to declare themselves. A modder uses it to launch a flowgraph project by script or to find a node/module of an active project.

## Example

```lua
local mgr, ok = core_flowgraphManager.loadManager('/flowgraphEditor/monProjet.flow.json')
if ok then mgr:setRunning(true) end
-- single shared project (flowgraphEditor/<name>.flow.json), started automatically
local s = core_flowgraphManager.getSingleton('monProjet')
```

## Notes

- A 'manager' is an object created by require('/lua/ge/extensions/flowgraph/manager')(M): fields seen here: id, graphs[graphId].nodes[nodeId], modules[name], hidden, transient, savedDir, savedFilename, stopRunningOnClientEndMission; methods seen: setRunning, destroy, historySnapshot, broadcastCall, resolveHooksAndReset, _onSerialize/_onDeserialized. Their details are in the flowgraph/ folder.
- Managers with deferred start (startNextFrame) are launched at the next onUpdate; those in startOnLoadingScreenFadeout are launched when the onLoadingScreenFadeout hook is received and are marked stopRunningOnClientEndMission.
- onSerialize/onDeserialized are used when extensions are reloaded and also by reInitOnFileChange: modifying a node file (flowgraph/nodes or a *Node.lua of a project's customNodes folder) reloads all managers.
- 'transient' managers are not serialized; 'singletons' (getSingleton) are found again by name after a reload and restarted.
- Inconsistencies: the comment of getNextUniqueIdentifier says 'do not use ever'; getAvailableStateTemplates uses stateData.name which is never defined (so the last element of splitPath is not added) and builds sourcePath with the .lua extension whereas they are .flow.json files; mgrRunningChanged is an empty, non-exported local; the onFlowgraphSceneObjectAdd/Remove/Changed hooks only dump() to the console.
- Fields: M.dependencies is not defined at creation, but by refreshDependencies() (keys of runningProxies).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_flowgraphManager.addManager(data)` | Creates a manager, optionally from already decoded data, and adds it to the list. Does not start it. | 115 |
| `core_flowgraphManager.clearAllManagers()` | Destroys all managers and clears the list. | 59 |
| `core_flowgraphManager.controls(name)` | Broadcasts to all managers the control event 'onControlsReset' (name = 'reset') or 'onControlsAction' (name = 'action'). | 387 |
| `core_flowgraphManager.getAllManagers()` | List of all active managers (direct reference to the internal table). | 66 |
| `core_flowgraphManager.getAvailableNodeTemplates()` | Recursively scans '/lua/ge/extensions/flowgraph/nodes/' (*.lua), loads them with require (errors are logged and the node is skipped) and builds a category tree and a flat table. Result cached until a node file is modified. | 262 |
| `core_flowgraphManager.getAvailablePinTypes(node)` | Input/output pin types of a node according to its pinSchema; adds 'flow' as input and output for non-simple functional nodes (via ui_flowgraph_editor). | 302 |
| `core_flowgraphManager.getAvailableStateTemplates()` | Scans '/flowgraphEditor/states/' (*state.flow.json), reads each file and builds a tree and a flat table of state templates. Files directly at the root of the folder are ignored. | 326 |
| `core_flowgraphManager.getManagerByID(id)` | Looks up a manager by its id. | 70 |
| `core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId)` | Safely retrieves a node of a graph of an active manager; nil if one of the ids is invalid (preferable to direct access getManagerByID(m).graphs[g].nodes[n]). | 79 |
| `core_flowgraphManager.getManagerModule(mgrId, moduleName)` | Retrieves a module of an active manager by its name; nil if absent. | 89 |
| `core_flowgraphManager.getNextUniqueIdentifier()` | Unique identifier counter incremented on every call. The code says "do not use ever": reserved for the flowgraph implementation. *(internal)* | 9 |
| `core_flowgraphManager.getSingleton(name)` | Returns the single manager of this name; if it does not exist yet, loads it from 'flowgraphEditor/<name>.flow.json', starts it and stores it. | 367 |
| `core_flowgraphManager.loadManager(filepath, hidden, keepSavedDirs)` | Creates a manager and loads a .flow.json project into it. The manager is added to the list even if the file is not found (error logged, empty manager). | 97 |
| `core_flowgraphManager.onDeserialized(data)` | Restore hook: destroys the managers, recreates them from the data, restarts the singletons. *(internal)* *(hook)* | 244 |
| `core_flowgraphManager.onExtensionLoaded()` | Hook on load: defines the global functions _flowgraph_createNode, _flowgraph_createStateNode and _flowgraph_createModule (rawset in _G) used by the node/module files. *(internal)* *(hook)* | 29 |
| `core_flowgraphManager.onFileChanged(filename, type)` | File modification hook: if a base node or a '*Node.lua' of an active project's customNodes folder changes, reloads (serializes/deserializes) all managers. *(internal)* *(hook)* | 206 |
| `core_flowgraphManager.onFlowgraphSceneObjectAdd(id, name, fgPath)` | Hook called when a flowgraph scene object is added: only displays a debug dump. *(internal)* *(hook)* | 399 |
| `core_flowgraphManager.onFlowgraphSceneObjectChanged(id, name, fgPath)` | Hook for modification of a flowgraph scene object: debug dump only. *(internal)* *(hook)* | 407 |
| `core_flowgraphManager.onFlowgraphSceneObjectRemove(id, name, fgPath)` | Hook for removal of a flowgraph scene object: debug dump only. *(internal)* *(hook)* | 403 |
| `core_flowgraphManager.onLoadingScreenFadeout()` | Hook at the end of the loading screen: starts the managers of the startOnLoadingScreenFadeout list. *(internal)* *(hook)* | 153 |
| `core_flowgraphManager.onSerialize()` | Save hook before extensions reload: serializes the non-transient managers and the singletons index. *(internal)* *(hook)* | 224 |
| `core_flowgraphManager.onUpdate()` | Per-frame hook: resolves pending hooks and resets each manager, starts/deletes the scheduled ones then broadcasts 'onFlowgraphManagerPreUpdate' to each. *(internal)* *(hook)* | 166 |
| `core_flowgraphManager.refreshDependencies()` | Recomputes M.dependencies from the keys of M.runningProxies. | 21 |
| `core_flowgraphManager.removeManager(mgr)` | Destroys a manager and removes it from the list and from the singletons. No effect if the manager is not found (compared by id). | 124 |
| `core_flowgraphManager.removeNextFrame(mgr)` | Schedules the deletion of a manager at the next onUpdate (avoids destroying a manager while it is running). | 148 |
| `core_flowgraphManager.startNextFrame(mgr)` | Schedules setRunning(true) of a manager at the next onUpdate. | 145 |
| `core_flowgraphManager.startOnLoadingScreenFadeout(fg)` | Queues a manager to start at the end of the loading screen (onLoadingScreenFadeout hook), used by projects launched automatically with a level. | 161 |

### Parameter details

#### `core_flowgraphManager.addManager(data)`

Creates a manager, optionally from already decoded data, and adds it to the list. Does not start it.

- `data` (*table|nil*) : Serialized project data.
- **returns**: table Manager.

#### `core_flowgraphManager.controls(name)`

Broadcasts to all managers the control event 'onControlsReset' (name = 'reset') or 'onControlsAction' (name = 'action').

- `name` (*string*) : 'reset' or 'action'; other values are ignored.

#### `core_flowgraphManager.getAllManagers()`

List of all active managers (direct reference to the internal table).

- **returns**: table[] Managers.

#### `core_flowgraphManager.getAvailableNodeTemplates()`

Recursively scans '/lua/ge/extensions/flowgraph/nodes/' (*.lua), loads them with require (errors are logged and the node is skipped) and builds a category tree and a flat table. Result cached until a node file is modified.

- **returns**: table Tree: subfolder -> {nodes = {name -> template}, ...subfolders}.
- **returns**: table<string, table> Flat table path -> template (added fields: path, sourcePath, splitPath, availablePinTypes).

#### `core_flowgraphManager.getAvailablePinTypes(node)`

Input/output pin types of a node according to its pinSchema; adds 'flow' as input and output for non-simple functional nodes (via ui_flowgraph_editor).

- `node` (*table*) : Node definition (fields pinSchema, category).
- **returns**: table {_in = {type = true}, _out = {type = true}}.

#### `core_flowgraphManager.getAvailableStateTemplates()`

Scans '/flowgraphEditor/states/' (*state.flow.json), reads each file and builds a tree and a flat table of state templates. Files directly at the root of the folder are ignored.

- **returns**: table Tree by subfolder: {states = {…}}.
- **returns**: table<string, table> Flat table path -> {data, path, sourcePath, splitPath}.

#### `core_flowgraphManager.getManagerByID(id)`

Looks up a manager by its id.

- `id` (*integer*) : Manager id.
- **returns**: table|nil Manager or nil.

#### `core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId)`

Safely retrieves a node of a graph of an active manager; nil if one of the ids is invalid (preferable to direct access getManagerByID(m).graphs[g].nodes[n]).

- `mgrId` (*integer*) : Manager id.
- `graphId` (*integer*) : Graph id.
- `nodeId` (*integer*) : Node id.
- **returns**: table|nil Node.

#### `core_flowgraphManager.getManagerModule(mgrId, moduleName)`

Retrieves a module of an active manager by its name; nil if absent.

- `mgrId` (*integer*) : Manager id.
- `moduleName` (*string*) : Module name.
- **returns**: table|nil Module.

#### `core_flowgraphManager.getNextUniqueIdentifier()`

Unique identifier counter incremented on every call. The code says "do not use ever": reserved for the flowgraph implementation.

- **returns**: integer Identifier.

#### `core_flowgraphManager.getSingleton(name)`

Returns the single manager of this name; if it does not exist yet, loads it from 'flowgraphEditor/<name>.flow.json', starts it and stores it.

- `name` (*string*) : Project name without extension.
- **returns**: table|nil Manager; nil if the file is not found.

#### `core_flowgraphManager.loadManager(filepath, hidden, keepSavedDirs)`

Creates a manager and loads a .flow.json project into it. The manager is added to the list even if the file is not found (error logged, empty manager).

- `filepath` (*string*) : Path of the .flow.json file.
- `hidden` (*boolean|nil*) : Marks the manager as hidden (mgr.hidden).
- `keepSavedDirs` (*boolean|nil*) : true = keeps the file's savedDir/savedFilename instead of those of filepath.
- **returns**: table Manager.
- **returns**: boolean true if the file was read.

#### `core_flowgraphManager.onDeserialized(data)`

Restore hook: destroys the managers, recreates them from the data, restarts the singletons.

- `data` (*table*) : Data from onSerialize.

#### `core_flowgraphManager.onFileChanged(filename, type)`

File modification hook: if a base node or a '*Node.lua' of an active project's customNodes folder changes, reloads (serializes/deserializes) all managers.

- `filename` (*string*) : File path.
- `type` (*any*) : Not used.

#### `core_flowgraphManager.onFlowgraphSceneObjectAdd(id, name, fgPath)`

Hook called when a flowgraph scene object is added: only displays a debug dump.

- `id` (*integer*) : Object id.
- `name` (*string*) : Name.
- `fgPath` (*string*) : Flowgraph path.

#### `core_flowgraphManager.onFlowgraphSceneObjectChanged(id, name, fgPath)`

Hook for modification of a flowgraph scene object: debug dump only.

- `id` (*integer*) : Object id.
- `name` (*string*) : Name.
- `fgPath` (*string*) : Flowgraph path.

#### `core_flowgraphManager.onFlowgraphSceneObjectRemove(id, name, fgPath)`

Hook for removal of a flowgraph scene object: debug dump only.

- `id` (*integer*) : Object id.
- `name` (*string*) : Name.
- `fgPath` (*string*) : Flowgraph path.

#### `core_flowgraphManager.onSerialize()`

Save hook before extensions reload: serializes the non-transient managers and the singletons index.

- **returns**: table {mgrs, uniques}.

#### `core_flowgraphManager.removeManager(mgr)`

Destroys a manager and removes it from the list and from the singletons. No effect if the manager is not found (compared by id).

- `mgr` (*table*) : Manager.

#### `core_flowgraphManager.removeNextFrame(mgr)`

Schedules the deletion of a manager at the next onUpdate (avoids destroying a manager while it is running).

- `mgr` (*table*) : Manager.

#### `core_flowgraphManager.startNextFrame(mgr)`

Schedules setRunning(true) of a manager at the next onUpdate.

- `mgr` (*table*) : Manager.

#### `core_flowgraphManager.startOnLoadingScreenFadeout(fg)`

Queues a manager to start at the end of the loading screen (onLoadingScreenFadeout hook), used by projects launched automatically with a level.

- `fg` (*table*) : Manager.

## Fields

| Field | Type | Description |
|---|---|---|
| `enableUsageTracking` | boolean | Usage tracking flag (false by default); read by other flowgraph modules. |
| `nodePath` | string | '/lua/ge/extensions/flowgraph/nodes/': folder of the base nodes. |
| `runningProxies` | table<string, any> | Running proxy extensions; their keys are used to recompute M.dependencies (refreshDependencies). |
| `skipCountdowns` | boolean | Flag to ignore countdowns (false by default); read by other flowgraph modules. |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/flowgraphManager.lua`.*
