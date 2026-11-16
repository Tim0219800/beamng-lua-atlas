---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/basenode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Base class of all flowgraph nodes. It creates the pins from the derived node's C.pinSchema, manages the behaviors (once, duration, simple...) according to C.category, runs work()/workOnce() under xpcall (errors become node errors displayed in red), draws the node in the editor (header, pins, tooltip, context menu) and serializes/deserializes the node (position, custom color, hardcoded pins, hidden pins). A modder who writes a custom node inherits from this class and overrides work, init, postInit, drawMiddle, etc.
--- Access: extension `flowgraph_basenode`: `extensions.load("flowgraph_basenode")`, then the global `flowgraph_basenode`
---@class flowgraph_basenode
flowgraph_basenode = {}

--- Creates a node object with C as metatable and calls init(...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1533
---@param ... any mgr, graph, forceId (passed to C:init)
---@return table  base node
function flowgraph_basenode.createBase(...) end

--- Creates a base node, copies the derived class on top, then calls _preInit (output pins), init (if redefined) and _postInit (input pins, categories, postInit).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1541
---@param mgr table flowgraph manager
---@param graph table graph containing the node
---@param forceId integer|nil forced id (otherwise mgr:getNextFreeGraphNodeId())
---@param derivedClass table class of the concrete node type
---@return table  initialized node
function flowgraph_basenode.use(mgr, graph, forceId, derivedClass) end

--- Flowgraph node. Main fields: mgr, graph, id, name, description, color, iconColor, type ('node' by default, 'simple', 'variable'), tags, behaviour, triggerCount, workCount, data, dynamicMode, durationState, pinIn, pinInLocal, pinOut, pinList (display order), nodePosition ({x, y}), customName/customColor/customIcon/customIconColor, _error.
---@class flowgraph_basenode_C
local flowgraph_basenode_C = {}

--- Converts HSV to RGB via the global function HSVtoRGB after reducing h to its fractional part and clamping s and v to [0, 1].
---Source: lua/ge/extensions/flowgraph/basenode.lua:647
---@param h number hue (the integer part is ignored)
---@param s number saturation 0..1
---@param v number value 0..1
---@return table  {r, g, b}
function flowgraph_basenode_C:HSVtoRGB(h, s, v) end

--- Called by the manager at start: clears the node error, sets outputs back to nil if clearOutPinsOnStart, resets _frameLastUsed and _dynamicDone, then calls _executionStarted.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:622
function flowgraph_basenode_C:__executionStarted() end

--- Called by the manager on stop: calls _executionStopped and sets _dynamicDone back to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:615
function flowgraph_basenode_C:__executionStopped() end

--- Returns the error message of a category.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1509
---@param category string category
---@return string|nil  error message
function flowgraph_basenode_C:__getNodeError(category) end

--- Restores position, customizations, data (known properties only), dynamic mode, saved pins, hardcoded values, quickAccess and hidden pins. Logs warnings if a pin cannot be found.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1381
---@param nodeData table data produced by __onSerialize
function flowgraph_basenode_C:__onDeserialized(nodeData) end

--- Serializes the node: data (without cdata), type, position, custom name/color/icon, identifier, dynamic mode, pins (if savePins), hardcoded pins, quickAccess, hidden pins, timeline.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1298
---@return table  node data for the graph file
function flowgraph_basenode_C:__onSerialize() end

--- Records an error for a category (log E); called without a category, clears all errors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1497
---@param category string|nil category ('work', 'onNodeReset'...) or nil to clear everything
---@param err string|nil message; nil removes the category
function flowgraph_basenode_C:__setNodeError(category, err) end

--- Calls self:destroy().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:105
function flowgraph_basenode_C:_destroy() end

--- Calls self:doubleClicked() if that function exists on the derived node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:574
function flowgraph_basenode_C:_doubleClicked() end

--- Draws the central area according to the display mode (flowLevel, simple, debug, default, heatmap, geometry); calls drawMiddle if the derived node defines it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:824
---@param builder table flowgraph builder
---@param style table ImGui style
---@param drawType string value of the preference flowgraph.debug.viewMode
function flowgraph_basenode_C:_drawMiddle(builder, style, drawType) end

--- Empty internal hook called at start.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:620
function flowgraph_basenode_C:_executionStarted() end

--- Empty internal hook called when execution stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:613
function flowgraph_basenode_C:_executionStopped() end

--- Empty (the call to _executionStopped is commented out there).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:609
function flowgraph_basenode_C:_onClear() end

--- Empty hook called during deserialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1378
---@param nodeData table node data
function flowgraph_basenode_C:_onDeserialized(nodeData) end

--- Calls onLink.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:584
---@param link table link
function flowgraph_basenode_C:_onLink(link) end

--- Calls onNodeReset under xpcall then sets all pinOut values back to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:336
function flowgraph_basenode_C:_onNodeReset() end

--- Empty hook allowing the derived node to add fields to the serialized table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1295
---@param res table output table
function flowgraph_basenode_C:_onSerialize(res) end

--- Calls onSetHardcode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:598
---@param pin table pin
---@param value any value
---@param forceType string|nil forced type
function flowgraph_basenode_C:_onSetHardcode(pin, value, forceType) end

--- Calls onUnlink.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:591
---@param link table link
function flowgraph_basenode_C:_onUnlink(link) end

--- Calls onUnsetHardcode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:605
---@param pin table pin
function flowgraph_basenode_C:_onUnsetHardcode(pin) end

--- Empty hook called after the full deserialization of the graph.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1515
function flowgraph_basenode_C:_postDeserialize() end

--- Creates the input pins from pinSchema (with hardcoded values if requested), creates a reset pin if the mode is 'once', calls handleNodeCategories then postInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:135
function flowgraph_basenode_C:_postInit() end

--- Creates the output pins described in pinSchema (hidden, impulse, chainFlow, tableType).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:113
function flowgraph_basenode_C:_preInit() end

--- Sets (val not nil) or removes (val nil) a constant value on an input pin: creates a dummy entry in pinIn with hardCodeType, sets pin.pinMode to 'hardcoded' or 'normal' and calls the hooks.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1251
---@param pin table input pin
---@param val any value, or nil to remove
---@param forceType string|nil forced type; otherwise the pin's type (or defaultHardCodeType if multiple or 'any')
---@return string|nil  type retained when a value is set
function flowgraph_basenode_C:_setHardcodedDummyInputPin(pin, val, forceType) end

--- Creates self.timeline {beginTime, endTime, lane = 0} and defines empty (nop) onTimelineBegin/End/Trigger if absent.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1283
---@param beginTime number start
---@param endTime number end
function flowgraph_basenode_C:_setupTimeline(beginTime, endTime) end

--- 'once' mode: handles the reset (pinIn.reset), calls workOnce once then work on each call while the flow is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:351
function flowgraph_basenode_C:_workDynamicOnce() end

--- Runs work under xpcall, applies checkAutomatedFlow, increments workCount and records any error (node error + manager event).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:321
function flowgraph_basenode_C:_workDynamicRepeat() end

--- Enables a behavior in self.behaviour.
---Source: lua/ge/extensions/flowgraph/basenode.lua:234
---@param behaviour string 'once', 'duration', 'simple', 'singleActive' or 'obsolete'
function flowgraph_basenode_C:addBehaviour(behaviour) end

--- Empty hook called when the node is added to a graph.
---Source: lua/ge/extensions/flowgraph/basenode.lua:109
---@param graph table graph
function flowgraph_basenode_C:addedToGraph(graph) end

--- Aligns the node to the 14 px grid (offset 10, 8), optionally after setting a position, then updates the editor.
---Source: lua/ge/extensions/flowgraph/basenode.lua:1520
---@param x number|nil new x position (with y)
---@param y number|nil new y position
function flowgraph_basenode_C:alignToGrid(x, y) end

--- Like createPin, but only if no pin with the same name/direction exists, then moves the pin to the position imposed by pinOrder for functional nodes.
---Source: lua/ge/extensions/flowgraph/basenode.lua:251
---@param direction string 'in' or 'out'
---@param type string|table pin type (e.g. 'flow', 'number')
---@param name string pin name
---@param default any default value (inputs)
---@param description string displayed description
---@param extra any additional data (pin.extraData)
---@param fixed boolean|nil pin that cannot be removed/modified
---@return table|nil  the created pin, or nil if it already existed
function flowgraph_basenode_C:autoCreatePin(direction, type, name, default, description, extra, fixed) end

--- Copies pinIn.flow to pinOut.flow for non-simple functional nodes and drives incomplete/complete/completed for f_duration nodes. 'completed' falls back to false after one frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:397
function flowgraph_basenode_C:checkAutomatedFlow() end

--- Creates a pin on the node (flowgraph/pin module), adds it to pinInLocal/pinOut, to pinList and to graph.pins. Refuses empty or duplicate names (except autoNumber, which adds a suffix 2..101).
---Source: lua/ge/extensions/flowgraph/basenode.lua:465
---@param direction string 'in' or 'out'
---@param type string|table pin type or list of types
---@param name string unique pin name
---@param default any default value
---@param description string help text
---@param autoNumber boolean|nil number automatically in case of duplicate
---@param extra any additional data (pin.extraData)
---@param fixed boolean|nil fixed pin
---@return table|nil  created pin, nil on error
function flowgraph_basenode_C:createPin(direction, type, name, default, description, autoNumber, extra, fixed) end

--- Creates a 'reset' flow input pin (impulse) and adds the 'once' behavior, if it does not exist.
---Source: lua/ge/extensions/flowgraph/basenode.lua:301
function flowgraph_basenode_C:createResetPin() end

--- Empty hook to add entries to the node's context menu.
---Source: lua/ge/extensions/flowgraph/basenode.lua:1096
function flowgraph_basenode_C:customContextMenu() end

--- Empty hook called when the node is destroyed; override to free resources.
---Source: lua/ge/extensions/flowgraph/basenode.lua:102
function flowgraph_basenode_C:destroy() end

--- Draws the whole node in the editor: styles according to error/recent activity, header, input pins, middle (under xpcall), output pins, behavior icons. Ignores types other than node, simple, variable.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:892
---@param builder table flowgraph builder
---@param style table ImGui style
function flowgraph_basenode_C:draw(builder, style) end

--- Draws the node header (icon, name, [ERROR] if error, id if preference set, heatmap color according to the age of _frameLastUsed).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:653
---@param builder table flowgraph builder
---@param style table current ImGui style
function flowgraph_basenode_C:drawHeader(builder, style) end

--- Drawing hook for the middle of the node, to be overridden; the base version simply calls builder:Middle().
---Source: lua/ge/extensions/flowgraph/basenode.lua:888
---@param builder table flowgraph builder
---@param style table ImGui style
function flowgraph_basenode_C:drawMiddle(builder, style) end

--- Draws the tooltip of the hovered node: activity in heatmap mode, name, custom name, behaviors, obsolescence, description, TODO, errors.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:710
function flowgraph_basenode_C:drawTooltip() end

--- Returns the self.data table (the node's editable properties).
---Source: lua/ge/extensions/flowgraph/basenode.lua:86
---@return table  node data
function flowgraph_basenode_C:getData() end

--- Walks the graph's links and returns those arriving at the node, then those leaving it.
---Source: lua/ge/extensions/flowgraph/basenode.lua:634
---@return table  links whose target is the node
---@return table  links whose source is the node
function flowgraph_basenode_C:getLinks() end

--- Returns self.pinIn.
---Source: lua/ge/extensions/flowgraph/basenode.lua:94
---@return table  table of named input pins
function flowgraph_basenode_C:getPinIn() end

--- Returns the constant value of an input pin if it was set as hardcoded, otherwise nil.
---Source: lua/ge/extensions/flowgraph/basenode.lua:1086
---@param pinName string input pin name
---@return any  constant value or nil
function flowgraph_basenode_C:getPinInConstValue(pinName) end

--- According to self.category, adds the behaviors and automatically creates the flow, reset, incomplete, complete, completed pins. Logs an error if a 'simple' node has flow pins or if a 'provider' has inputs. Without a category, forces the 'repeat' mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:169
function flowgraph_basenode_C:handleNodeCategories() end

--- Returns whether pinSchema contains a 'flow' pin.
---Source: lua/ge/extensions/flowgraph/basenode.lua:279
---@return boolean  true if so
function flowgraph_basenode_C:hasFlowPins() end

--- Returns whether pinSchema contains an input pin.
---Source: lua/ge/extensions/flowgraph/basenode.lua:290
---@return boolean  true if so
function flowgraph_basenode_C:hasInputPins() end

--- Empty hook called when the selection leaves the node.
---Source: lua/ge/extensions/flowgraph/basenode.lua:572
function flowgraph_basenode_C:hideProperties() end

--- Initializes all node fields (identifier, name 'unknown', default color, pin tables, alignment pin). Checks for duplicate identifiers if mgr.__safeIds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:36
---@param mgr table flowgraph manager
---@param graph table owning graph
---@param forceId integer|nil imposed id
function flowgraph_basenode_C:init(mgr, graph, forceId) end

--- Supposed to tell whether a flow dependency is active, but always returns true (see notes).
---Source: lua/ge/extensions/flowgraph/basenode.lua:562
function flowgraph_basenode_C:isFlowActive() end

--- Empty hook: the duration state becomes 'finished'.
---Source: lua/ge/extensions/flowgraph/basenode.lua:439
function flowgraph_basenode_C:onDurationFinished() end

--- Empty hook: the duration state becomes 'inactive'.
---Source: lua/ge/extensions/flowgraph/basenode.lua:435
function flowgraph_basenode_C:onDurationInactive() end

--- Empty hook: the duration state becomes 'started'.
---Source: lua/ge/extensions/flowgraph/basenode.lua:437
function flowgraph_basenode_C:onDurationStarted() end

--- Empty hook called when a link is created on a pin of the node.
---Source: lua/ge/extensions/flowgraph/basenode.lua:581
---@param link table created link
function flowgraph_basenode_C:onLink(link) end

--- Empty hook called when the node is reset (reset pin in 'once' mode).
---Source: lua/ge/extensions/flowgraph/basenode.lua:334
function flowgraph_basenode_C:onNodeReset() end

--- Empty hook called when a constant (hardcoded) value is set on an input pin.
---Source: lua/ge/extensions/flowgraph/basenode.lua:595
---@param pin table pin concerned
---@param value any constant value
---@param forceType string|nil forced type
function flowgraph_basenode_C:onSetHardcode(pin, value, forceType) end

--- Empty hook called when a link is deleted.
---Source: lua/ge/extensions/flowgraph/basenode.lua:588
---@param link table deleted link
function flowgraph_basenode_C:onUnlink(link) end

--- Empty hook called when a pin's constant value is removed.
---Source: lua/ge/extensions/flowgraph/basenode.lua:602
---@param pin table pin concerned
function flowgraph_basenode_C:onUnsetHardcode(pin) end

--- Draws a large semi-transparent icon over the node (call commented out in draw, so unused).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:800
function flowgraph_basenode_C:overDraw() end

--- Empty hook called at the end of _postInit, once all pins are created.
---Source: lua/ge/extensions/flowgraph/basenode.lua:316
function flowgraph_basenode_C:postInit() end

--- Disables a behavior (sets the value to false).
---Source: lua/ge/extensions/flowgraph/basenode.lua:243
---@param behaviour string behavior name
function flowgraph_basenode_C:removeBehaviour(behaviour) end

--- Removes a pin: first removes the graph links that use it, then removes the pin from the tables and from pinList. The code comment notes that other side effects remain to be checked.
---Source: lua/ge/extensions/flowgraph/basenode.lua:503
---@param pin table pin to remove
function flowgraph_basenode_C:removePin(pin) end

--- Removes the 'reset' pin and the 'once' behavior.
---Source: lua/ge/extensions/flowgraph/basenode.lua:309
function flowgraph_basenode_C:removeResetPin() end

--- Renames an input pin in pinInLocal. Refuses (with a warning) if the new name is already taken by another pin. Handles input pins only.
---Source: lua/ge/extensions/flowgraph/basenode.lua:528
---@param pin table pin to rename
---@param newName string new name
function flowgraph_basenode_C:renamePin(pin, newName) end

--- Returns nil by default; nodes that represent a subgraph return that graph.
---Source: lua/ge/extensions/flowgraph/basenode.lua:110
---@return table|nil  represented graph
function flowgraph_basenode_C:representsGraph() end

--- Replaces self.data.
---Source: lua/ge/extensions/flowgraph/basenode.lua:90
---@param data table new data table
function flowgraph_basenode_C:setData(data) end

--- Changes the state of an f_duration category node and signals the change; checkAutomatedFlow then updates the incomplete/complete/completed pins and calls onDurationXxx.
---Source: lua/ge/extensions/flowgraph/basenode.lua:389
---@param state string 'inactive', 'started' or 'finished'
function flowgraph_basenode_C:setDurationState(state) end

--- Sets the dynamic mode; creates the reset pin for 'once', removes it for 'repeat'.
---Source: lua/ge/extensions/flowgraph/basenode.lua:453
---@param mode string 'repeat' or 'once'
function flowgraph_basenode_C:setDynamicMode(mode) end

--- Replaces self.pinIn.
---Source: lua/ge/extensions/flowgraph/basenode.lua:98
---@param data table new pinIn table
function flowgraph_basenode_C:setPinIn(data) end

--- Swaps a pin in pinList with its neighbor (circular) to change the display order.
---Source: lua/ge/extensions/flowgraph/basenode.lua:540
---@param idInList integer index (1-based) of the pin in pinList
---@param direction integer +1 or -1
function flowgraph_basenode_C:shiftPin(idInList, direction) end

--- Shows the context menu (copy, delete, show/hide pins, create a subgraph, ungroup, comment, development tools depending on preferences).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:1097
---@param menuPos ImVec2 menu position (not used in the body)
function flowgraph_basenode_C:showContextMenu(menuPos) end

--- Empty hook called when the node is selected to display its properties.
---Source: lua/ge/extensions/flowgraph/basenode.lua:571
function flowgraph_basenode_C:showProperties() end

--- Returns a string "name (nodeType / id) in graph" for logs.
---Source: lua/ge/extensions/flowgraph/basenode.lua:1513
---@return string  node description
function flowgraph_basenode_C:toString() end

--- Toggles between 'repeat' and 'once' if the category is dynamic.
---Source: lua/ge/extensions/flowgraph/basenode.lua:442
function flowgraph_basenode_C:toggleDynamicMode() end

--- Triggers the node via self._trigger (function compiled by the manager) if the graph is not stopped; increments triggerCount and updates _frameLastUsed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/basenode.lua:549
function flowgraph_basenode_C:trigger() end

--- Applies nodePosition to the node in the editor (SetNodePosition). Call it only when the manager is open in the editor.
---Source: lua/ge/extensions/flowgraph/basenode.lua:1366
function flowgraph_basenode_C:updateEditorPosition() end

--- Reads the node's position in the ImGui editor and stores it in nodePosition (if within ±2e8).
---Source: lua/ge/extensions/flowgraph/basenode.lua:1355
function flowgraph_basenode_C:updateNodePosition() end

--- Main function of the node, to be overridden. Called by the manager each time the flow passes, in an xpcall. In 'once' mode, it is called after workOnce.
---Source: lua/ge/extensions/flowgraph/basenode.lua:318
---@param args any not used by the base
function flowgraph_basenode_C:work(args) end

--- Empty hook called only once (dynamic 'once' mode) when the flow arrives, before the work calls. Re-armed by a reset.
---Source: lua/ge/extensions/flowgraph/basenode.lua:349
function flowgraph_basenode_C:workOnce() end

