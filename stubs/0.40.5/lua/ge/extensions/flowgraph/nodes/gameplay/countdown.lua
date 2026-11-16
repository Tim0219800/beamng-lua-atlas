---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_countdown_C
local flowgraph_nodes_gameplay_countdown_C = {}

--- Calls stopTimer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:50
function flowgraph_nodes_gameplay_countdown_C:_executionStopped() end

--- Decrements the timer by mgr.dtSim, displays every second and signals the end.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:93
function flowgraph_nodes_gameplay_countdown_C:countdown() end

--- Progress bar and state (Running, Done, Stopped) in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:126
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_countdown_C:drawMiddle(builder, style) end

--- Initializes the data options (useImgui, useMessages, playSounds, bigFinishMsg) and the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:28
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_gameplay_countdown_C:init(mgr, ...) end

--- Resets duration, timer and message to defaults.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:44
function flowgraph_nodes_gameplay_countdown_C:onExecutionStarted() end

--- Stops the countdown and resets the outputs to false.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:54
function flowgraph_nodes_gameplay_countdown_C:reset() end

--- Displays a flash message (ScenarioFlashMessage), and a Message if data.useMessages.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:79
---@param msg string Text
---@param big boolean Large size
---@param duration number|nil Duration in s (1.4 large, 0.95 small by default)
---@param luaCall string|nil Lua code executed by the UI (sound)
function flowgraph_nodes_gameplay_countdown_C:show(msg, big, duration, luaCall) end

--- Reads the duration, arms the timer, clears the previous flash message and starts.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:69
function flowgraph_nodes_gameplay_countdown_C:startTimer() end

--- Stops the timer and clears done and flags.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:61
function flowgraph_nodes_gameplay_countdown_C:stopTimer() end

--- Handles reset, starts the timer if flow is active, calls countdown and fills the outputs.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/countdown.lua:140
---@param args table Flowgraph arguments
function flowgraph_nodes_gameplay_countdown_C:work(args) end

