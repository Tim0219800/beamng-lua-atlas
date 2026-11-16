---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/actionModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0) that blocks or allows input actions while a flowgraph project is running. It keeps a set of blocked actions and, in afterTrigger, pushes the list to core_input_actionFilter under the group 'fg_filter_<manager id>'. It also stores the walking mode (gameplay_walk) allowed state at start to restore it on stop.
--- Access: `require("extensions/flowgraph/modules/actionModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_actionModule
flowgraph_modules_actionModule = {}

--- Called by the manager after the graph tick. If changes occurred, recomputes the list of blocked actions and sends it to core_input_actionFilter (setGroup then addAction(0, group, true)). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.afterTrigger() end

--- Marks the actions of the registered list as to be allowed again (applied in afterTrigger). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@param id integer identifier returned by registerList
function flowgraph_modules_actionModule.allowActions(id) end

--- Marks the actions of the registered list as to be blocked (applied in afterTrigger). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@param id integer identifier returned by registerList
function flowgraph_modules_actionModule.blockActions(id) end

--- Resets the tables storedActions, actionsByName, addActions, removeActions and lists. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.clear() end

--- Called when the project starts: stores gameplay_walk.isTogglingEnabled(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.executionStarted() end

--- Called when the project stops: disables the filter group and restores the permission to toggle walking mode that was stored at start. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.executionStopped() end

--- Increments and returns a unique identifier for registering an action list. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@return integer  new identifier
function flowgraph_modules_actionModule.getFreeId() end

--- Called when the module is created: calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
function flowgraph_modules_actionModule.init() end

--- Registers a list of action names and returns its identifier, which can then be used with blockActions/allowActions. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:dyn
---@param list string[] input action names
---@return integer  list identifier
function flowgraph_modules_actionModule.registerList(list) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/actionModule.lua
---@class flowgraph_modules_actionModule_C
local flowgraph_modules_actionModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:44
function flowgraph_modules_actionModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:37
---@param id any
function flowgraph_modules_actionModule_C:allowActions(id) end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:30
---@param id any
function flowgraph_modules_actionModule_C:blockActions(id) end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:16
function flowgraph_modules_actionModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:71
function flowgraph_modules_actionModule_C:executionStarted() end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:62
function flowgraph_modules_actionModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:7
function flowgraph_modules_actionModule_C:getFreeId() end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:12
function flowgraph_modules_actionModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/actionModule.lua:24
---@param list any
function flowgraph_modules_actionModule_C:registerList(list) end

