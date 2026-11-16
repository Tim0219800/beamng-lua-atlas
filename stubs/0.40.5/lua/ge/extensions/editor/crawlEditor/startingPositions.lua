---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/startingPositions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tool instance. Main fields: startingPosition (edited element), currentTransform ("area" or "icon" or nil), snapToTerrain, ImGui buffers name/fileName/description.
---@class editor_crawlEditor_startingPositions
local editor_crawlEditor_startingPositions = {}

--- Start of gizmo manipulation: stores the starting positions/rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:381
function editor_crawlEditor_startingPositions:beginDrag() end

--- Deselects the transform (currentTransform = nil), which hides the gizmo.
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:253
function editor_crawlEditor_startingPositions:clearSelection() end

--- During manipulation: applies the gizmo translation or rotation and snaps back to the terrain if snapToTerrain.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:394
function editor_crawlEditor_startingPositions:dragging() end

--- Called every frame: processes input, displays the placement preview with rotation and the axis gizmo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:460
---@param mouseInfo table mouse info
function editor_crawlEditor_startingPositions:draw(mouseInfo) end

--- Draws the detail panel (Goto button that places the camera 15 m above, name, description, radius, etc.) with changes recorded in the undo history.
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:108
---@param startingPosition table displayed position
function editor_crawlEditor_startingPositions:drawStartingPositionDetail(startingPosition) end

--- Draws in the 3D view the sphere of actual radius (translucent green), selection points sized according to camera distance, the orientation arrow (3 m) and the "Area:" and "Icon:" labels.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:520
---@param mouseInfo table must contain camPos
function editor_crawlEditor_startingPositions:drawStartingPositionIndicators(mouseInfo) end

--- Draws the "Add Starting Position" button and the selectable list; right click offers Delete. Updates selection.index and selection.clicked.
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:72
---@param allStartingPositions table[] all positions (modified in place)
---@param selection table {index, clicked}
function editor_crawlEditor_startingPositions:drawStartingPositionsList(allStartingPositions, selection) end

--- Places the position at the terrain height.
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:429
---@param pos vec3 position
---@return vec3  copy adjusted in z
---@return boolean  true if core_terrain is available
function editor_crawlEditor_startingPositions:dropToTerrain(pos) end

--- End of manipulation: snaps back to the terrain and records the action (zone or icon) in editor.history.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:438
function editor_crawlEditor_startingPositions:endDragging() end

--- Creates a default position: name "New Starting Position", position (0,0,0), identity rotation, radius 4.0, metadata version "1.0".
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:232
---@return table  new position
function editor_crawlEditor_startingPositions:getNewStartingPosition() end

--- Initializes the state (no selection, snapToTerrain = true, previous gizmo positions at zero).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:55
function editor_crawlEditor_startingPositions:init() end

--- Handles the mouse: Shift+click places the icon; Ctrl+click/drag places the zone with rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:257
---@param mouseInfo table editor mouse info (down, hold, _downPos, _holdPos, rayCast...)
function editor_crawlEditor_startingPositions:input(mouseInfo) end

--- Fills the ImGui buffers (name 256, file name 256, description 1024 characters) from the starting position.
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:65
---@param startingPosition table starting position
function editor_crawlEditor_startingPositions:setFields(startingPosition) end

--- Sets the starting position being edited.
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:249
---@param startingPositionParam table|nil position
function editor_crawlEditor_startingPositions:setStartingPosition(startingPositionParam) end

--- Places the axis gizmo on the zone (with its rotation) or on the icon depending on currentTransform.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/startingPositions.lua:365
function editor_crawlEditor_startingPositions:updateTransform() end

