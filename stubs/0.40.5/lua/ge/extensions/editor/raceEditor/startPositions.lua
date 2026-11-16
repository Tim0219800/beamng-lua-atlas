---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/startPositions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Start Positions window (windowDescription = 'Start Positions'). Instantiated with init(raceEditor).
---@class editor_raceEditor_startPositions
local editor_raceEditor_startPositions = {}

--- Commits a history action for the current position from the previous serialized state and the current state.
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:144
---@param name string Name of the action.
---@param old table Result of sp:onSerialize() before the modification.
function editor_raceEditor_startPositions:addHistory(name, old) end

--- Start of gizmo manipulation: stores the rotation and the serialized state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:102
function editor_raceEditor_startPositions:beginDrag() end

--- Displays the help and the preview (prisms) during the drag, then on release creates a position (position = anchor point, orientation = drag direction) via history.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:151
function editor_raceEditor_startPositions:createStartPosition() end

--- During manipulation: applies translation (pos) or rotation (rot).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:109
function editor_raceEditor_startPositions:dragging() end

--- Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the list and the panel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:211
---@param mouseInfo table Mouse info (valid, down, hold, up, camPos, rayDir, rayCast, _downPos, _holdPos, _upPos).
function editor_raceEditor_startPositions:draw(mouseInfo) end

--- Draws the position list and the current position panel: delete, move in the list, name, position, terrain, vehicle, group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:223
function editor_raceEditor_startPositions:drawStartPositions() end

--- End of manipulation: commits the "Moved Start Position by Gizmo" action.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:126
function editor_raceEditor_startPositions:endDragging() end

--- Returns the start position hovered by the mouse ray (3 m sphere), the one closest to the camera.
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:69
---@return table|nil  Hovered position.
function editor_raceEditor_startPositions:hoveringStartPosition() end

--- Stores raceEditor and sets the selection index to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:13
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_startPositions:init(raceEditor) end

--- Handles the mouse: with Shift, creation; otherwise click to select or deselect.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:86
function editor_raceEditor_startPositions:input() end

--- Called when the edit mode is activated: reselects the current position if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:205
function editor_raceEditor_startPositions:onEditModeActivate() end

--- Selects the position with ID id (nil for none): highlight, loads name and group, places the gizmo.
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:39
---@param id integer|nil Start position ID.
function editor_raceEditor_startPositions:selectStartPosition(id) end

--- Called when the tab becomes active: deselects, draws positions in "normal" and adds the Shift shortcut "Add New".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:22
function editor_raceEditor_startPositions:selected() end

--- Sets the race path being edited.
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:18
---@param path table gameplay/race/path object.
function editor_raceEditor_startPositions:setPath(path) end

--- Called when the tab is left: positions in "faded", removes the Shift shortcut.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:31
function editor_raceEditor_startPositions:unselect() end

--- Places the gizmo on the position (oriented along sp.rot in local alignment). No effect if the gizmo is forbidden.
---Source: lua/ge/extensions/editor/raceEditor/startPositions.lua:52
---@param index integer Position ID.
function editor_raceEditor_startPositions:updateTransform(index) end

