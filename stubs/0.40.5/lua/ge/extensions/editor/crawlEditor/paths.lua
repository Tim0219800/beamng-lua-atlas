---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/paths.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the paths tool. Main fields: crawlEditor, path (path being edited), selectedPathnodeIndex (-1 = none), currentPathnode, snapToTerrain (true by default), _isDragging.
---@class editor_crawlEditor_paths
local editor_crawlEditor_paths = {}

--- Adds a node 15 m in front of the camera, placed on the terrain (if snapToTerrain), and selects it.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:588
function editor_crawlEditor_paths:addNodeAtCamera() end

--- Orients each node (quatFromDir, up +Z) toward the next; the last keeps the incoming direction. Ignores segments of length <= 0.001. No effect with fewer than 2 nodes.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:614
function editor_crawlEditor_paths:autoOrientNodes() end

--- Start of gizmo manipulation: stores the node's position and rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:545
function editor_crawlEditor_paths:beginDrag() end

--- During manipulation: translates (with terrain snap) or rotates the node according to the gizmo.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:554
function editor_crawlEditor_paths:dragging() end

--- Called every frame: handles the axis gizmo if a node is selected, processes mouse input and updates the gizmo outside manipulation.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:720
---@param mouseInfo table Mouse table
function editor_crawlEditor_paths:draw(mouseInfo) end

--- Draws the detail of a path: Goto, name, file name (Rename), description, statistics (nodes, length, elevation change), tool buttons (Add Node, Add Node At Camera, Reverse Order, Auto-Orient Nodes, Renumber, Snap All To Terrain, Set All Radii, Validate Path), node list with Delete and the selected node editor (name, position, rotation, radius, recovery/bonus flags, JSON flags).
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:140
---@param path table Path to display
function editor_crawlEditor_paths:drawPathDetail(path) end

--- Draws in the world the nodes (sphere of their radius: orange selected, green recovery, gold bonus, white otherwise), direction arrows, labels "name (index) [RECOVERY/BONUS]", prisms between nodes and cumulative distance.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:740
---@param mouseInfo table Mouse table (camPos required)
function editor_crawlEditor_paths:drawPathnodeSelectionIndicators(mouseInfo) end

--- Draws the list of paths with "Add Path" and a "Delete" context menu. Fills selection.index and selection.clicked.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:101
---@param allPaths table List of paths, modified in place
---@param selection table Table with index and clicked
function editor_crawlEditor_paths:drawPathsList(allPaths, selection) end

--- Places a point at the terrain height.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:578
---@param pos vec3 Position
---@return vec3  Copy with the terrain z
---@return boolean  true if core_terrain is available
function editor_crawlEditor_paths:dropToTerrain(pos) end

--- End of manipulation: re-snaps to the terrain on translation, records "Manipulate Pathnode" in the history, marks the path as modified.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:698
function editor_crawlEditor_paths:endDragging() end

--- Draws spheres on the elements (orange if selected) and returns the one closest to the camera whose mouse ray crosses the sphere.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:427
---@param mouseInfo table Table from crawlEditor/input
---@param objects table List of elements {pos, index|orig, radius}
---@return table|nil  Hit element or nil
function editor_crawlEditor_paths:findPathnode(mouseInfo, objects) end

--- Creates an empty path table: name "New Path", description "A new path", empty nodes.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:401
---@return table  New path
function editor_crawlEditor_paths:getNewPath() end

--- Creates a default node and adds it at the end of the current path (creates a path if none).
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:410
---@return table  The new node
function editor_crawlEditor_paths:getNewPathnode() end

--- Returns the index of the selected node.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:93
---@return integer  Index, -1 if none
function editor_crawlEditor_paths:getSelectedPathnodeIndex() end

--- Initializes the instance (called by the constructor).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:60
---@param crawlEditorParam table Parent crawlEditor instance/module
function editor_crawlEditor_paths:init(crawlEditorParam) end

--- Processes mouse input: Shift = add, Alt = insertion, otherwise node selection.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:492
---@param mouseInfo table Mouse table
function editor_crawlEditor_paths:input(mouseInfo) end

--- Renames all nodes "Node N" in order.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:645
function editor_crawlEditor_paths:renumberNodes() end

--- Reverses the order of the nodes and deselects.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:603
function editor_crawlEditor_paths:reversePathOrder() end

--- Selects the node with the given index (1-based); an invalid index, nil or <= 0 deselects.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:84
---@param index integer|nil Node index
function editor_crawlEditor_paths:selectPathnode(index) end

--- Applies the same radius to all nodes.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:636
---@param radius number Radius in meters; must be > 0
function editor_crawlEditor_paths:setAllRadii(radius) end

--- Copies the path's name, file name and description into the imgui input buffers.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:73
---@param path table Path
function editor_crawlEditor_paths:setFields(path) end

--- Sets the path being edited.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:80
---@param pathParam table|nil Path to edit
function editor_crawlEditor_paths:setPath(pathParam) end

--- Alias of selectPathnode.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:97
---@param index integer|nil Node index
function editor_crawlEditor_paths:setSelectedPathnodeIndex(index) end

--- Places all nodes on the terrain.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:654
function editor_crawlEditor_paths:snapAllToTerrain() end

--- Detects a click on the middle of a segment and inserts a new node there, which it selects.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:459
---@param mouseInfo table Mouse table
function editor_crawlEditor_paths:tryInsert(mouseInfo) end

--- Places the axis gizmo on the position and rotation of the selected node.
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:535
function editor_crawlEditor_paths:updateTransform() end

--- Analyzes the path and returns the list of problems found (see notes).
---Source: lua/ge/extensions/editor/crawlEditor/paths.lua:665
---@return table<integer, string>  Messages; "No problems found." if everything is correct
function editor_crawlEditor_paths:validatePath() end

