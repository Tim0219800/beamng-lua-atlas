---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_race_raceEndScreen_C
local flowgraph_nodes_gameplay_race_raceEndScreen_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:154
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_afterTrigger() end

--- Sets all outputs to false and resets open/done to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:47
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_executionStarted() end

--- Closes the dialog if it is open and resets the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:147
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_executionStopped() end

--- Rereads options then calls updateButtons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:142
---@param nodeData table Serialized data.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_onDeserialized(nodeData) end

--- Saves the options list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:138
---@param res table Serialization table.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:_onSerialize(res) end

--- Called by a button click: sets the button's output to true, closes the dialog and marks done.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:165
---@param action string Name of the clicked button.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:buttonPushed(action) end

--- Navigates to the UI route 'play' and marks the screen closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:184
function flowgraph_nodes_gameplay_race_raceEndScreen_C:closeDialogue() end

--- Sets done = true (closing signaled by the UI).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:306
function flowgraph_nodes_gameplay_race_raceEndScreen_C:closed() end

--- Editor panel: rename, delete, add ("add") or remove ("rem") buttons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:56
---@return string|nil  Change reason.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:drawCustomProperties() end

--- Builds the Lua command string executed by the UI to call buttonPushed(action).
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:173
---@param action string Button name.
---@return string  Lua code to execute.
function flowgraph_nodes_gameplay_race_raceEndScreen_C:getCmd(action) end

--- Initializes the state (open, done, options) and the data options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:31
function flowgraph_nodes_gameplay_race_raceEndScreen_C:init() end

--- Mission end hook: sets open = false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:194
function flowgraph_nodes_gameplay_race_raceEndScreen_C:onClientEndMission() end

--- Hook: if the screen is open with the Retry button, closes it and marks done (info log).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:177
function flowgraph_nodes_gameplay_race_raceEndScreen_C:onResetGameplay() end

--- Builds the buttons and the stats (title, detailed times, highscores) then navigates to scenario.quickrace.end.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:212
function flowgraph_nodes_gameplay_race_raceEndScreen_C:openDialogue() end

--- Creates the default 'cont' button with the label "Continue".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:40
function flowgraph_nodes_gameplay_race_raceEndScreen_C:postInit() end

--- Resets done and open to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:160
function flowgraph_nodes_gameplay_race_raceEndScreen_C:reset() end

--- Recreates the string input pins and flow output pins for each button of self.options while preserving existing links.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:91
function flowgraph_nodes_gameplay_race_raceEndScreen_C:updateButtons() end

--- Handles reset and opens the dialog on first flow as long as done is false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceEndScreen.lua:311
function flowgraph_nodes_gameplay_race_raceEndScreen_C:work() end

