---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/flowgraphManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_flowgraphManager`: manager of the running Flowgraph projects (node-based visual scripts). It creates, loads, starts, deletes and serializes `manager` objects (one per .flow.json project), provides the catalogs of available nodes and state templates for the editor, and exposes helpers `_flowgraph_createNode / _flowgraph_createStateNode / _flowgraph_createModule` that node files use to declare themselves. A modder uses it to launch a flowgraph project by script or to find a node/module of an active project.
--- Access: extension `core_flowgraphManager`: `extensions.load("core_flowgraphManager")`, then the global `core_flowgraphManager`
---@class core_flowgraphManager
---@field enableUsageTracking boolean Usage tracking flag (false by default); read by other flowgraph modules.
---@field nodePath string '/lua/ge/extensions/flowgraph/nodes/': folder of the base nodes.
---@field runningProxies table<string, any> Running proxy extensions; their keys are used to recompute M.dependencies (refreshDependencies).
---@field skipCountdowns boolean Flag to ignore countdowns (false by default); read by other flowgraph modules.
core_flowgraphManager = {}

--- Creates a manager, optionally from already decoded data, and adds it to the list. Does not start it.
---Source: lua/ge/extensions/core/flowgraphManager.lua:115
---@param data table|nil Serialized project data.
---@return table  Manager.
function core_flowgraphManager.addManager(data) end

--- Destroys all managers and clears the list.
---Source: lua/ge/extensions/core/flowgraphManager.lua:59
function core_flowgraphManager.clearAllManagers() end

--- Broadcasts to all managers the control event 'onControlsReset' (name = 'reset') or 'onControlsAction' (name = 'action').
---Source: lua/ge/extensions/core/flowgraphManager.lua:387
---@param name string 'reset' or 'action'; other values are ignored.
function core_flowgraphManager.controls(name) end

--- List of all active managers (direct reference to the internal table).
---Source: lua/ge/extensions/core/flowgraphManager.lua:66
---@return table[]  Managers.
function core_flowgraphManager.getAllManagers() end

--- Recursively scans '/lua/ge/extensions/flowgraph/nodes/' (*.lua), loads them with require (errors are logged and the node is skipped) and builds a category tree and a flat table. Result cached until a node file is modified.
---Source: lua/ge/extensions/core/flowgraphManager.lua:262
---@return table  Tree: subfolder -> {nodes = {name -> template}, ...subfolders}.
---@return table<string, table>  Flat table path -> template (added fields: path, sourcePath, splitPath, availablePinTypes).
function core_flowgraphManager.getAvailableNodeTemplates() end

--- Input/output pin types of a node according to its pinSchema; adds 'flow' as input and output for non-simple functional nodes (via ui_flowgraph_editor).
---Source: lua/ge/extensions/core/flowgraphManager.lua:302
---@param node table Node definition (fields pinSchema, category).
---@return table  {_in = {type = true}, _out = {type = true}}.
function core_flowgraphManager.getAvailablePinTypes(node) end

--- Scans '/flowgraphEditor/states/' (*state.flow.json), reads each file and builds a tree and a flat table of state templates. Files directly at the root of the folder are ignored.
---Source: lua/ge/extensions/core/flowgraphManager.lua:326
---@return table  Tree by subfolder: {states = {…}}.
---@return table<string, table>  Flat table path -> {data, path, sourcePath, splitPath}.
function core_flowgraphManager.getAvailableStateTemplates() end

--- Looks up a manager by its id.
---Source: lua/ge/extensions/core/flowgraphManager.lua:70
---@param id integer Manager id.
---@return table|nil  Manager or nil.
function core_flowgraphManager.getManagerByID(id) end

--- Safely retrieves a node of a graph of an active manager; nil if one of the ids is invalid (preferable to direct access getManagerByID(m).graphs[g].nodes[n]).
---Source: lua/ge/extensions/core/flowgraphManager.lua:79
---@param mgrId integer Manager id.
---@param graphId integer Graph id.
---@param nodeId integer Node id.
---@return table|nil  Node.
function core_flowgraphManager.getManagerGraphNode(mgrId, graphId, nodeId) end

--- Retrieves a module of an active manager by its name; nil if absent.
---Source: lua/ge/extensions/core/flowgraphManager.lua:89
---@param mgrId integer Manager id.
---@param moduleName string Module name.
---@return table|nil  Module.
function core_flowgraphManager.getManagerModule(mgrId, moduleName) end

--- Unique identifier counter incremented on every call. The code says "do not use ever": reserved for the flowgraph implementation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:9
---@return integer  Identifier.
function core_flowgraphManager.getNextUniqueIdentifier() end

--- Returns the single manager of this name; if it does not exist yet, loads it from 'flowgraphEditor/<name>.flow.json', starts it and stores it.
---Source: lua/ge/extensions/core/flowgraphManager.lua:367
---@param name string Project name without extension.
---@return table|nil  Manager; nil if the file is not found.
function core_flowgraphManager.getSingleton(name) end

--- Creates a manager and loads a .flow.json project into it. The manager is added to the list even if the file is not found (error logged, empty manager).
---Source: lua/ge/extensions/core/flowgraphManager.lua:97
---@param filepath string Path of the .flow.json file.
---@param hidden boolean|nil Marks the manager as hidden (mgr.hidden).
---@param keepSavedDirs boolean|nil true = keeps the file's savedDir/savedFilename instead of those of filepath.
---@return table  Manager.
---@return boolean  true if the file was read.
function core_flowgraphManager.loadManager(filepath, hidden, keepSavedDirs) end

--- Restore hook: destroys the managers, recreates them from the data, restarts the singletons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:244
---@param data table Data from onSerialize.
function core_flowgraphManager.onDeserialized(data) end

--- Hook on load: defines the global functions _flowgraph_createNode, _flowgraph_createStateNode and _flowgraph_createModule (rawset in _G) used by the node/module files.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:29
function core_flowgraphManager.onExtensionLoaded() end

--- File modification hook: if a base node or a '*Node.lua' of an active project's customNodes folder changes, reloads (serializes/deserializes) all managers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:206
---@param filename string File path.
---@param type any Not used.
function core_flowgraphManager.onFileChanged(filename, type) end

--- Hook called when a flowgraph scene object is added: only displays a debug dump.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:399
---@param id integer Object id.
---@param name string Name.
---@param fgPath string Flowgraph path.
function core_flowgraphManager.onFlowgraphSceneObjectAdd(id, name, fgPath) end

--- Hook for modification of a flowgraph scene object: debug dump only.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:407
---@param id integer Object id.
---@param name string Name.
---@param fgPath string Flowgraph path.
function core_flowgraphManager.onFlowgraphSceneObjectChanged(id, name, fgPath) end

--- Hook for removal of a flowgraph scene object: debug dump only.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:403
---@param id integer Object id.
---@param name string Name.
---@param fgPath string Flowgraph path.
function core_flowgraphManager.onFlowgraphSceneObjectRemove(id, name, fgPath) end

--- Hook at the end of the loading screen: starts the managers of the startOnLoadingScreenFadeout list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:153
function core_flowgraphManager.onLoadingScreenFadeout() end

--- Save hook before extensions reload: serializes the non-transient managers and the singletons index.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:224
---@return table  {mgrs, uniques}.
function core_flowgraphManager.onSerialize() end

--- Per-frame hook: resolves pending hooks and resets each manager, starts/deletes the scheduled ones then broadcasts 'onFlowgraphManagerPreUpdate' to each.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/flowgraphManager.lua:166
function core_flowgraphManager.onUpdate() end

--- Recomputes M.dependencies from the keys of M.runningProxies.
---Source: lua/ge/extensions/core/flowgraphManager.lua:21
function core_flowgraphManager.refreshDependencies() end

--- Destroys a manager and removes it from the list and from the singletons. No effect if the manager is not found (compared by id).
---Source: lua/ge/extensions/core/flowgraphManager.lua:124
---@param mgr table Manager.
function core_flowgraphManager.removeManager(mgr) end

--- Schedules the deletion of a manager at the next onUpdate (avoids destroying a manager while it is running).
---Source: lua/ge/extensions/core/flowgraphManager.lua:148
---@param mgr table Manager.
function core_flowgraphManager.removeNextFrame(mgr) end

--- Schedules setRunning(true) of a manager at the next onUpdate.
---Source: lua/ge/extensions/core/flowgraphManager.lua:145
---@param mgr table Manager.
function core_flowgraphManager.startNextFrame(mgr) end

--- Queues a manager to start at the end of the loading screen (onLoadingScreenFadeout hook), used by projects launched automatically with a level.
---Source: lua/ge/extensions/core/flowgraphManager.lua:161
---@param fg table Manager.
function core_flowgraphManager.startOnLoadingScreenFadeout(fg) end

