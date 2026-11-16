---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/lanes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the list of drag race lanes in the editor: loading from gameplay_drag_saveSystem, selection, adding, removing, saving to a <id>.lane.json file in the level's drag folder, and drawing the ImGui UI (list and details: ID, names, color, order, boundaryId).
--- Access: extension `editor_dragRaceEditor_lanes`: `extensions.load("editor_dragRaceEditor_lanes")`, then the global `editor_dragRaceEditor_lanes`
---@class editor_dragRaceEditor_lanes
editor_dragRaceEditor_lanes = {}

--- Adds a "New Lane" lane (color blue, next laneOrder, empty waypointIds, metadata created/modified), selects it and marks unsaved changes.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:49
function editor_dragRaceEditor_lanes.addLane() end

--- Draws a solid box as debug (colored triangles and black edges) from a corner and three axis vectors.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:245
---@param corner vec3 box corner
---@param x vec3 first edge vector
---@param y vec3 second edge vector
---@param z vec3 third edge vector
---@param clr ColorF fill color
function editor_dragRaceEditor_lanes.drawAxisBox(corner, x, y, z, clr) end

--- Draws the ImGui panel of the selected lane's details (Basics, Waypoints, Boundary); fields modify the lane and mark unsaved changes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:146
function editor_dragRaceEditor_lanes.drawLaneDetails() end

--- Draws the ImGui panel of the lane list (Add Lane, Remove, Save buttons, selectable list with tooltip).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:97
function editor_dragRaceEditor_lanes.drawLanesSection() end

--- Displays the text "Lane: <name>" at the origin as 3D debug for the selected lane.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:238
function editor_dragRaceEditor_lanes.drawTransformsPreview() end

--- Returns the list of loaded lanes.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:22
---@return table  array of lanes
function editor_dragRaceEditor_lanes.getAllLanes() end

--- Returns the selected lane.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:34
---@return table|nil  lane or nil if the index is out of bounds
function editor_dragRaceEditor_lanes.getSelectedLane() end

--- Index (1-based) of the selected lane, -1 if none.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:26
---@return integer  index
function editor_dragRaceEditor_lanes.getSelectedLaneIndex() end

--- Loads all lanes via dragSaveSystem.getAllLanes().
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:17
function editor_dragRaceEditor_lanes.loadAllLanes() end

--- Removes the selected lane and moves the selection to the previous one; -1 if the list becomes empty.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:70
function editor_dragRaceEditor_lanes.removeSelectedLane() end

--- Saves the lane to <level drag folder>/<lane.id>.lane.json via dragSaveSystem.saveLane.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:84
---@param lane table lane to save
---@return boolean  false if there is no lane or no level loaded, otherwise the result of dragSaveSystem.saveLane
function editor_dragRaceEditor_lanes.saveLane(lane) end

--- Selects the lane at the given index and logs its name.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:41
---@param index integer 1-based index
function editor_dragRaceEditor_lanes.selectLane(index) end

--- Sets the selected index without logging.
---Source: lua/ge/extensions/editor/dragRaceEditor/lanes.lua:30
---@param index integer 1-based index, -1 for none
function editor_dragRaceEditor_lanes.setSelectedLaneIndex(index) end

