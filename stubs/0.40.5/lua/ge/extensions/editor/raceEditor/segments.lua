---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/segments.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Segments window (windowDescription = 'Segments'). Instantiated with init(raceEditor).
---@class editor_raceEditor_segments
local editor_raceEditor_segments = {}

--- Commits a history action for the current segment from the previous serialized state and the current state; undo/redo restore the segment and the selected capsule.
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:135
---@param name string Name of the action.
---@param old table Result of segment:onSerialize() before the modification.
function editor_raceEditor_segments:addHistory(name, old) end

--- Start of gizmo manipulation: stores the capsule radius and the segment's serialized state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:81
function editor_raceEditor_segments:beginDrag() end

--- During manipulation: applies translation (pos) or scaling (radius, never negative) to the capsule.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:88
function editor_raceEditor_segments:dragging() end

--- Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the segment list and the panel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:142
---@param mouseInfo table Mouse info (valid, down, camPos, rayDir, rayCast, closestNodeHovered...).
function editor_raceEditor_segments:draw(mouseInfo) end

--- Draws the segment list ("(!)" if a node is missing), the Create button and the segment panel: delete, move, name, From/To, mode, and the capsules (list, position, radius, Add Before/After, Remove).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:239
function editor_raceEditor_segments:drawSegmentList() end

--- End of manipulation: tries to commit the "Manipulated Capsule Node via Gizmo" history action (see notes: nil undo/redo functions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:112
function editor_raceEditor_segments:endDragging() end

--- Stores raceEditor; segment and capsule indices set to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:12
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_segments:init(raceEditor) end

--- Handles the mouse for the selected segment: Alt/Shift + click on a node to change source/target; in capsules mode, click to select a capsule and Ctrl + click between two capsules to add one.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:151
function editor_raceEditor_segments:input() end

--- Camera-to-point distance if the mouse ray crosses the point's sphere, otherwise -1.
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:222
---@param point table Table with pos (vec3) and radius.
---@param mouseInfo table Mouse info (camPos, rayDir).
---@return number  Distance in meters, or -1 if not hovered.
function editor_raceEditor_segments:mouseDistanceTo(point, mouseInfo) end

--- Selects a capsule point of the current segment and places the gizmo on it.
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:63
---@param index integer|nil Capsule point index (1-based).
function editor_raceEditor_segments:selectCapsule(index) end

--- Selects the segment with ID index (nil for none): highlights, loads the name, sets the Shift "Set Target" / Alt "Set Source" shortcuts and shows only this segment's pacenotes.
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:39
---@param index integer|nil Segment ID.
function editor_raceEditor_segments:selectSegment(index) end

--- Called when the tab becomes active: deselects and draws segments in "normal".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:22
function editor_raceEditor_segments:selected() end

--- Sets the race path being edited.
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:18
---@param path table gameplay/race/path object.
function editor_raceEditor_segments:setPath(path) end

--- Called when the tab is left: segments in "faded", removes the Shift and Alt shortcuts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:30
function editor_raceEditor_segments:unselect() end

--- Places the gizmo on the selected capsule (no effect if the gizmo is forbidden or no capsule is chosen).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/segments.lua:68
function editor_raceEditor_segments:updateTransform() end

