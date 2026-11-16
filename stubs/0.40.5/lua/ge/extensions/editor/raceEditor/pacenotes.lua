---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/pacenotes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pacenotes window. Created by the constructor returned by the module, with init(raceEditor). windowDescription = 'Pacenotes'. The methods are called by raceEditor.lua (setPath, selected, unselect, draw, onEditModeActivate).
---@class editor_raceEditor_pacenotes
local editor_raceEditor_pacenotes = {}

--- Start of gizmo manipulation: stores the serialized state, rotation and radius of the pacenote (navRadiusScale in navgraph mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:87
function editor_raceEditor_pacenotes:beginDrag() end

--- Displays the creation help and the preview (sphere, prisms) during the drag, then on release creates a manual pacenote (radius 5 if the drag is ≤ 1 m) via history; the direction is given by the drag.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:174
function editor_raceEditor_pacenotes:createManualPacenote() end

--- During manipulation: applies gizmo translation (pos), rotation (normal) or scaling (radius, never negative) to the pacenote.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:101
function editor_raceEditor_pacenotes:dragging() end

--- Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the list and the detail panel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:165
---@param mouseInfo table Mouse info (valid, down, up, hold, camPos, rayDir, rayCast, _downPos, _holdPos, _upPos).
function editor_raceEditor_pacenotes:draw(mouseInfo) end

--- Draws the sorted pacenote list (+ "New..." entry) and the current pacenote panel (delete, move, fields).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:273
function editor_raceEditor_pacenotes:drawPacenoteList() end

--- End of manipulation: commits the "Manipulated Note via Gizmo" history action (before/after via onSerialize/onDeserialized).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:140
function editor_raceEditor_pacenotes:endDragging() end

--- Initializes the window: stores raceEditor, selection index nil and empty mouseInfo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:17
---@param raceEditor table Module editor_raceEditor (provides allowGizmo).
function editor_raceEditor_pacenotes:init(raceEditor) end

--- Handles the mouse: with Shift, manual creation; otherwise click on a pacenote to select it (or none).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:247
function editor_raceEditor_pacenotes:input() end

--- Returns the pacenote whose sphere is crossed by the mouse ray, the one closest to the camera.
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:230
---@return table|nil  Hovered pacenote or nil.
function editor_raceEditor_pacenotes:mouseOverPacenotes() end

--- Called when the race edit mode is activated (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:159
function editor_raceEditor_pacenotes:onEditModeActivate() end

--- Selects the pacenote with ID id (nil for none). See notes on the recursive call conditional on self.note.
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:49
---@param id integer|nil Pacenote ID.
function editor_raceEditor_pacenotes:selectPacenote(id) end

--- Called when the tab becomes active: deselects, draws pacenotes in "normal" mode, segments in "faded" mode, adds the Shift shortcut "Add New" and fetches the navigation map (map.getMap()).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:27
function editor_raceEditor_pacenotes:selected() end

--- Dropdown to choose a segment (or "None" = -1) in a field of the current pacenote, with a history action.
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:401
---@param name string Dropdown label.
---@param fieldName string Modified pacenote field (contains a segment ID).
---@param tt string|nil Tooltip.
function editor_raceEditor_pacenotes:selector(name, fieldName, tt) end

--- Sets the race path (gameplay/race/path) being edited.
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:23
---@param path table Race path object.
function editor_raceEditor_pacenotes:setPath(path) end

--- Called when the tab is left: hides pacenotes (_drawMode = 'none') and removes the Shift shortcut.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:41
function editor_raceEditor_pacenotes:unselect() end

--- Places the axis gizmo on the pacenote at the given index, oriented along its normal in local alignment. No effect if the gizmo is not allowed.
---Source: lua/ge/extensions/editor/raceEditor/pacenotes.lua:67
---@param index integer Pacenote ID.
function editor_raceEditor_pacenotes:updateTransform(index) end

