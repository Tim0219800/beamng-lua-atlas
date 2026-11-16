---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilities of the drag race editor: error display, unsaved changes flag, undo/redo stack on dragRaceData, validation and creation of default race/lane data, mouse update, creation of a transformUtil and ImGui header widgets.
--- Access: extension `editor_dragRaceEditor_utils`: `extensions.load("editor_dragRaceEditor_utils")`, then the global `editor_dragRaceEditor_utils`
---@class editor_dragRaceEditor_utils
editor_dragRaceEditor_utils = {}

--- Clears the unsaved changes flag.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:34
function editor_dragRaceEditor_utils.clearUnsavedChanges() end

--- Creates a default dragRaceData: context activity, type headsUpRace, 4 phases (stage, countdown, race, stop), prefabs (christmasTree .500, displaySign, paths, decorations) unused.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:116
---@return table  data
function editor_dragRaceEditor_utils.createNewDragRaceData() end

--- Creates a default lane: names "Lane N", color blue, stage and endLine waypoints, boundary, all with the default transform.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:94
---@param laneIndex integer lane number (laneOrder)
---@return table  lane
function editor_dragRaceEditor_utils.createNewLane(laneIndex) end

--- ImGui-safe header text: "Untitled" if empty, otherwise the string without # characters.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:227
---@param s string|nil text
---@return string  label
function editor_dragRaceEditor_utils.dragHeaderLabel(s) end

--- Draws a CollapsingHeader with larger padding.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:235
---@param visibleLabel string|nil displayed text
---@param idSuffix string ImGui ID suffix (e.g. "##xyz")
---@param defaultOpen boolean open by default
---@return boolean  true if the section is open
function editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen) end

--- Stores the message as the last error, displays it for 3 s and writes it to the log (level E, tag DragRaceEditor).
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:11
---@param message string error text
function editor_dragRaceEditor_utils.logError(message) end

--- Marks the state as modified and unsaved.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:30
function editor_dragRaceEditor_utils.markUnsavedChanges() end

--- Restores the undone state: the current one returns to the undo stack.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:62
function editor_dragRaceEditor_utils.redo() end

--- Moves an element of an array from position old to new, shifting the others (modifies t in place).
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:163
---@param t table array
---@param old integer source index
---@param new integer destination index
function editor_dragRaceEditor_utils.reorderLanes(t, old, new) end

--- Pushes a deep copy of dragRaceData (removes the oldest if the stack is full) and clears the redo stack.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:38
function editor_dragRaceEditor_utils.saveToUndoStack() end

--- Creates a transformUtil (gizmo) initialized from a transform table {position, rotation, scale}.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:212
---@param label string name/identifier of the transformUtil
---@param transform table position {x,y,z}, quaternion rotation {x,y,z,w}, scale {x,y,z}
---@param allowTranslate boolean|nil false only if explicitly false
---@param allowRotate boolean|nil false only if explicitly false
---@param allowScale boolean|nil false only if explicitly false
---@return table  transformUtil
function editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale) end

--- Displays the current error in red until its delay has elapsed; decrements the delay with the ImGui DeltaTime. To be called every frame.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:17
function editor_dragRaceEditor_utils.showError() end

--- Pops the previous state: the current one goes to the redo stack. Does nothing if the stack is empty.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:50
function editor_dragRaceEditor_utils.undo() end

--- Updates the state's mouse table (camera ray, raycast, left button click/hold/release if ImGui does not capture the mouse).
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:173
function editor_dragRaceEditor_utils.updateMouseInfo() end

--- Checks that a dragRaceData is usable.
---Source: lua/ge/extensions/editor/dragRaceEditor/utils.lua:74
---@param data table|nil data to check
---@return boolean  validity
---@return string|nil  error message if invalid
function editor_dragRaceEditor_utils.validateDragRaceData(data) end

