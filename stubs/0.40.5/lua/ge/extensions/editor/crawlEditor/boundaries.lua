---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/boundaries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the boundaries tool, created by the constructor returned by the module. Main fields: crawlEditor, boundary (zone being edited), currentVertices (selected vertices), currentPlane (selected height plane), snapToTerrain, fields (imgui buffers of the custom fields).
---@class editor_crawlEditor_boundaries
local editor_crawlEditor_boundaries = {}

--- Start of gizmo manipulation: stores the gizmo position, those of the selected vertices and the plane rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:506
function editor_crawlEditor_boundaries:beginDrag() end

--- Clears the vertex and plane selection.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:113
function editor_crawlEditor_boundaries:clearSelection() end

--- During manipulation: translates (with terrain snap) or rotates the selected vertices around the centroid, or moves/orients the selected plane, then recomputes the zone (processVertices).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:519
function editor_crawlEditor_boundaries:dragging() end

--- Called every frame: updates the axis gizmo (begin/end/dragging), draws it, processes mouse input and updates its transform.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:625
---@param mouseInfo table Mouse table
function editor_crawlEditor_boundaries:draw(mouseInfo) end

--- Draws the list of boundaries with the "Add Boundary" button and a "Delete" context menu (right click). Fills selection.index and selection.clicked.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:118
---@param allBoundaries table List of boundaries, modified in place
---@param selection table Table with index (1 = first) and clicked
function editor_crawlEditor_boundaries:drawBoundariesList(allBoundaries, selection) end

--- Draws the detail panel of a boundary: Goto, statistics, name, file name, vertices, Auto Planes, High Res Fence, Create Decal Road, top/bottom limits, mouse position, custom fields.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:158
---@param boundary table Boundary to display
function editor_crawlEditor_boundaries:drawBoundaryDetail(boundary) end

--- Draws the detail of the current boundary, or "No boundary selected".
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:640
function editor_crawlEditor_boundaries:drawBoundaryEditor() end

--- Draws the custom fields editor (string, number, vec3 with 3D marker) with X, New String, New Number, Copy Fields and Paste Fields buttons.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:649
---@param fields table customFields object of the boundary (names, types, values, add, remove, onSerialize...)
function editor_crawlEditor_boundaries:drawCustomFields(fields) end

--- Places a point at the terrain height.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:586
---@param pos vec3 Position
---@return vec3  Copy of the position with the terrain z
---@return boolean  true if core_terrain is available
function editor_crawlEditor_boundaries:dropToTerrain(pos) end

--- End of manipulation: re-snaps to the terrain, records the "Manipulate Boundary Vertices" action in the history, marks the boundary as modified.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:595
function editor_crawlEditor_boundaries:endDragging() end

--- Draws spheres on the given points (orange if selected) and returns the one closest to the camera whose mouse ray passes through the sphere.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:378
---@param mouseInfo table Table from crawlEditor/input (camPos, rayDir...)
---@param objects table List of elements {pos, index|orig, radius}
---@return table|nil  Hit element, or nil
function editor_crawlEditor_boundaries:findVert(mouseInfo, objects) end

--- Creates a new empty zone named "New Boundary" via gameplay/sites/zone.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:374
---@return table  New zone
function editor_crawlEditor_boundaries:getNewBoundary() end

--- Initializes the instance (called by the constructor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:88
---@param crawlEditorParam table Parent crawlEditor instance/module
function editor_crawlEditor_boundaries:init(crawlEditorParam) end

--- Processes mouse input: Shift = vertex add, Alt = insertion, otherwise vertex selection (Ctrl = multiple).
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:436
---@param mouseInfo table Mouse table
function editor_crawlEditor_boundaries:input(mouseInfo) end

--- Sets the boundary being edited.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:109
---@param boundaryParam table|nil Zone to edit
function editor_crawlEditor_boundaries:setBoundary(boundaryParam) end

--- Copies the boundary's name and file name into the imgui input buffers.
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:102
---@param boundary table Boundary (zone)
function editor_crawlEditor_boundaries:setFields(boundary) end

--- Looks for a click on the middle of an edge (Alt held) and, if found, inserts a vertex via the history ("Insert Boundary Vertex").
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:413
---@param mouseInfo table Mouse table
function editor_crawlEditor_boundaries:tryInsert(mouseInfo) end

--- Places the axis gizmo at the centroid of the selected vertices, or on the selected height plane (oriented according to local/global alignment).
---Source: lua/ge/extensions/editor/crawlEditor/boundaries.lua:478
function editor_crawlEditor_boundaries:updateTransform() end

