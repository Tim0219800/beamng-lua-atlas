---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/state.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared state of the drag race editor: a single local State table (race data, current file, lane/facility/strip selection indices, mouse, undo/redo stack, displayed error, zone edit target, search). All other submodules access it via trivial getters/setters.
--- Access: extension `editor_dragRaceEditor_state`: `extensions.load("editor_dragRaceEditor_state")`, then the global `editor_dragRaceEditor_state`
---@class editor_dragRaceEditor_state
editor_dragRaceEditor_state = {}

--- Folder of the current file.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:104
---@return string  folder, "/levels/" by default
function editor_dragRaceEditor_state.getCurrentFileDir() end

--- Name of the current file.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:112
---@return string|nil  name
function editor_dragRaceEditor_state.getCurrentFileName() end

--- Race data being edited.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:48
---@return table|nil  dragRaceData
function editor_dragRaceEditor_state.getDragRaceData() end

--- Remaining time (s) for displaying the error.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:148
---@return number  seconds
function editor_dragRaceEditor_state.getErrorTimeout() end

--- ImGui boolean pointer "has an end camera".
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:160
---@return userdata  im.BoolPtr
function editor_dragRaceEditor_state.getHasEndCamera() end

--- Indicates whether there are unsaved changes.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:88
---@return boolean  flag
function editor_dragRaceEditor_state.getHasUnsavedChanges() end

--- Last displayed error message.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:140
---@return string|nil  message
function editor_dragRaceEditor_state.getLastError() end

--- Maximum number of undo steps (20).
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:136
---@return integer  20
function editor_dragRaceEditor_state.getMaxUndoSteps() end

--- Mouse info table filled by utils.updateMouseInfo.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:80
---@return table|nil  mouseInfo
function editor_dragRaceEditor_state.getMouseInfo() end

--- Redo stack.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:128
---@return table  stack
function editor_dragRaceEditor_state.getRedoStack() end

--- searchUtil object used for dropdowns with search.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:164
---@return table  searchUtil
function editor_dragRaceEditor_state.getSearch() end

--- Selected facility index (-1 if none).
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:64
---@return integer  index
function editor_dragRaceEditor_state.getSelectedFacilityIndex() end

--- Selected lane index (-1 if none).
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:56
---@return integer  index
function editor_dragRaceEditor_state.getSelectedLaneIndex() end

--- Selected strip index (-1 if none).
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:72
---@return integer  index
function editor_dragRaceEditor_state.getSelectedStripIndex() end

--- Returns the complete State table.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:40
---@return table  state
function editor_dragRaceEditor_state.getState() end

--- Table of editor transforms.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:96
---@return table  transforms
function editor_dragRaceEditor_state.getTransforms() end

--- Undo stack (copies of dragRaceData).
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:120
---@return table  stack
function editor_dragRaceEditor_state.getUndoStack() end

--- ImGui boolean pointer "uses prefabs".
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:156
---@return userdata  im.BoolPtr
function editor_dragRaceEditor_state.getUsingPrefabs() end

--- Editor edit mode that was active before entering zone editing.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:176
---@return any  mode
function editor_dragRaceEditor_state.getZoneEditPreviousEditMode() end

--- Zone edit target (type stripZone or laneZone, with strip/lane).
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:168
---@return table|nil  target
function editor_dragRaceEditor_state.getZoneEditTarget() end

--- Sets the folder of the current file.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:108
---@param dir string folder
function editor_dragRaceEditor_state.setCurrentFileDir(dir) end

--- Sets the name of the current file.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:116
---@param name string|nil name
function editor_dragRaceEditor_state.setCurrentFileName(name) end

--- Sets the race data.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:52
---@param data table|nil data
function editor_dragRaceEditor_state.setDragRaceData(data) end

--- Sets the remaining error display time.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:152
---@param timeout number seconds
function editor_dragRaceEditor_state.setErrorTimeout(timeout) end

--- Sets the unsaved changes flag.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:92
---@param value boolean flag
function editor_dragRaceEditor_state.setHasUnsavedChanges(value) end

--- Sets the error message.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:144
---@param error string|nil message
function editor_dragRaceEditor_state.setLastError(error) end

--- Sets the mouse info table.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:84
---@param info table|nil mouseInfo
function editor_dragRaceEditor_state.setMouseInfo(info) end

--- Replaces the redo stack.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:132
---@param stack table stack
function editor_dragRaceEditor_state.setRedoStack(stack) end

--- Sets the selected facility index.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:68
---@param index integer index
function editor_dragRaceEditor_state.setSelectedFacilityIndex(index) end

--- Sets the selected lane index.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:60
---@param index integer index
function editor_dragRaceEditor_state.setSelectedLaneIndex(index) end

--- Sets the selected strip index.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:76
---@param index integer index
function editor_dragRaceEditor_state.setSelectedStripIndex(index) end

--- Replaces the whole State table.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:44
---@param newState table new state
function editor_dragRaceEditor_state.setState(newState) end

--- Sets the transforms table.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:100
---@param transforms table transforms
function editor_dragRaceEditor_state.setTransforms(transforms) end

--- Replaces the undo stack.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:124
---@param stack table stack
function editor_dragRaceEditor_state.setUndoStack(stack) end

--- Stores the previous edit mode.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:180
---@param mode any mode
function editor_dragRaceEditor_state.setZoneEditPreviousEditMode(mode) end

--- Sets the zone edit target.
---Source: lua/ge/extensions/editor/dragRaceEditor/state.lua:172
---@param target table|nil target
function editor_dragRaceEditor_state.setZoneEditTarget(target) end

