---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/buttonModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0) that manages custom buttons shown in the UI during a flowgraph project. Each button has a label, a style, an active state, an order, and clicked/complete variables stored in a variableStorage. In afterTrigger, the list of active buttons, sorted by order then id, is sent to the UI via guihooks.trigger('CustomFGButtons', data). The click comes back through a Lua command that calls buttonClicked.
--- Access: `require("extensions/flowgraph/modules/buttonModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_buttonModule
flowgraph_modules_buttonModule = {}

--- Adds a button and returns its id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param data table optional fields label (default 'Button <id>'), style (default 'default'), active (default true), order (default id)
---@return integer  button id
function flowgraph_modules_buttonModule.addButton(data) end

--- Called after the graph tick: finalizes the variables, sends the sorted active buttons to the UI if modified, then sets clicked back to false. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.afterTrigger() end

--- Called when the UI reports a click: sets clicked and complete to true. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer button id
function flowgraph_modules_buttonModule.buttonClicked(id) end

--- Clears variables and buttons, resets the id counter to 0 and sends an empty list to the UI (CustomFGButtons). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.clear() end

--- Called when the project stops: calls clear() (the buttons disappear from the UI). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.executionStopped() end

--- Returns the button's table (variable-type fields: label, style, active, order, clicked, complete). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer button id
---@return table|nil  button
function flowgraph_modules_buttonModule.getButton(id) end

--- Builds the Lua command string executed by the UI on click: gets the manager's 'button' module and calls buttonClicked(id). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer button id
---@return string  Lua code
function flowgraph_modules_buttonModule.getCmd(id) end

--- Increments and returns a button id. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@return integer  id
function flowgraph_modules_buttonModule.getFreeId() end

--- Creates the variableStorage and calls clear(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
function flowgraph_modules_buttonModule.init() end

--- Changes a button field via the variableStorage (applied at the end of the tick) and marks the list as modified. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:dyn
---@param id integer button id
---@param field string label, style, active, order, clicked or complete
---@param val any new value
function flowgraph_modules_buttonModule.set(id, field, val) end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/buttonModule.lua
---@class flowgraph_modules_buttonModule_C
local flowgraph_modules_buttonModule_C = {}

--- adds a new Button.
---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:27
---@param data any
function flowgraph_modules_buttonModule_C:addButton(data) end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:67
function flowgraph_modules_buttonModule_C:afterTrigger() end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:57
---@param id any
function flowgraph_modules_buttonModule_C:buttonClicked(id) end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:18
function flowgraph_modules_buttonModule_C:clear() end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:93
function flowgraph_modules_buttonModule_C:executionStopped() end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:51
---@param id any
function flowgraph_modules_buttonModule_C:getButton(id) end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:62
---@param id any
function flowgraph_modules_buttonModule_C:getCmd(id) end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:8
function flowgraph_modules_buttonModule_C:getFreeId() end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:13
function flowgraph_modules_buttonModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/buttonModule.lua:55
---@param id any
---@param field any
---@param val any
function flowgraph_modules_buttonModule_C:set(id, field, val) end

