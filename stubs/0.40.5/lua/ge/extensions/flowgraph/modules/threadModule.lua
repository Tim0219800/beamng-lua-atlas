---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/threadModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 1000) that lets a flowgraph project launch others (child projects) and exchange messages with them. Received messages are queued then distributed at the start of the next update (onFlowgraphManagerPreUpdate hook) to the nodes via broadcastCall. On stop, all launched children are stopped and removed.
--- Access: `require("extensions/flowgraph/modules/threadModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_threadModule
flowgraph_modules_threadModule = {}

--- Called after the graph tick (does nothing). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.afterTrigger() end

--- Clears the children and the messages, sets parentId = -1 back. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.clear() end

--- Called when the project starts (does nothing). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.executionStarted() end

--- Called when the project stops: immediately stops each child, removes them on the next frame, then calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.executionStopped() end

--- Called when the module is created: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.init() end

--- Hook called before the managers update: broadcasts then clears the queue of received messages. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
function flowgraph_modules_threadModule.onFlowgraphManagerPreUpdate() end

--- Adds a message to the receive queue and logs it. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
---@param message table message
---@param sourceId integer id of the sender manager
function flowgraph_modules_threadModule.receiveMessage(message, sourceId) end

--- Sends a message to the target manager (or to the parent if targetId is -1). Logs the send. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
---@param targetId integer id of the target flowgraph manager, -1 for the parent
---@param message table message (optional fields name, hook, data)
---@param sourceNode table|nil sender node, for the log
---@return boolean  true if the target exists
function flowgraph_modules_threadModule.sendMessage(targetId, message, sourceNode) end

--- Loads a flowgraph project from a file (core_flowgraphManager.loadManager), starts it, registers it as a child and gives it this manager as parent. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:dyn
---@param file string project path
---@param sourceNode table|nil originating node, for the log
---@return integer  id of the child manager
function flowgraph_modules_threadModule.startProjectFromFilepath(file, sourceNode) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/threadModule.lua
---@class flowgraph_modules_threadModule_C
local flowgraph_modules_threadModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:18
function flowgraph_modules_threadModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:12
function flowgraph_modules_threadModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:74
function flowgraph_modules_threadModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:62
function flowgraph_modules_threadModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:8
function flowgraph_modules_threadModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:32
function flowgraph_modules_threadModule_C:onFlowgraphManagerPreUpdate() end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:43
---@param message any
---@param sourceId any
function flowgraph_modules_threadModule_C:receiveMessage(message, sourceId) end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:21
---@param targetId any
---@param message any
---@param sourceNode any
function flowgraph_modules_threadModule_C:sendMessage(targetId, message, sourceNode) end

---Source: lua/ge/extensions/flowgraph/modules/threadModule.lua:49
---@param file any
---@param sourceNode any
function flowgraph_modules_threadModule_C:startProjectFromFilepath(file, sourceNode) end

