---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/waypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tool instance. Fields: crawlEditor (parent editor), path (edited path), index (id of the selected node, -1 by default), mouseInfo (last mouse info), fields (ImGui buffers of the custom fields).
---@class editor_crawlEditor_waypoints
local editor_crawlEditor_waypoints = {}

--- Start of gizmo manipulation: stores the serialized state, rotation and radius of the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:86
function editor_crawlEditor_waypoints:beginDrag() end

--- Displays "Add manual Pathnode (Click to place)" at the targeted point; on click, creates (undoable) a node at the raycast point, radius 5.0, name "Pathnode", and a segment from the last sorted node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:179
function editor_crawlEditor_waypoints:createManualPathnode() end

--- During manipulation: translation (gizmo position), rotation (new normal, if the node has one) or scale (radius).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:97
function editor_crawlEditor_waypoints:dragging() end

--- Called every frame: stores mouseInfo and, if the gizmo is allowed, updates the gizmo and processes input.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:328
---@param mouseInfo table editor mouse info
function editor_crawlEditor_waypoints:draw(mouseInfo) end

--- Draws the custom fields editor of a node (names/types/values tables; string type edited via a 4096-character field). Creates the tables if absent.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:546
---@param fields table {names, types, values}
function editor_crawlEditor_waypoints:drawCustomFields(fields) end

--- Draws the detail panel of a node (name, position, radius, normal, custom fields...) with undo history.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:461
---@param pathnode table node
---@param index integer node id
function editor_crawlEditor_waypoints:drawPathnodeDetail(pathnode, index) end

--- Draws the trail's node list with the "Add Pathnode" button (creates a node at the camera position, radius 5.0).
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:366
---@param trail table trail containing path.pathnodes
function editor_crawlEditor_waypoints:drawPathnodeList(trail) end

--- Draws a prism between each pair of consecutive sorted nodes with the label "Segment from-to"; more opaque in "Edit Pathnodes" mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:278
function editor_crawlEditor_waypoints:drawPathnodeSegments() end

--- Draws all nodes (highlight, normal or faded mode depending on the selection and the "Edit Pathnodes" edit mode), the segments and the status text.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:247
function editor_crawlEditor_waypoints:drawPathnodeSelectionIndicators() end

--- End of manipulation: records the "Manipulated Pathnode via Gizmo" action in the history with the old and new state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:139
function editor_crawlEditor_waypoints:endDragging() end

--- Returns the id of the selected node.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:538
---@return integer  id (-1 if none initially)
function editor_crawlEditor_waypoints:getSelectedPathnodeIndex() end

--- Click: selects the hovered node, or deselects if the gizmo is not clicked.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:167
---@param hovered table|nil hovered node
function editor_crawlEditor_waypoints:handleMouseDown(hovered) end

--- Constructor: stores the parent Crawl editor and initializes selection, fields and drag data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:33
---@param crawlEditorParam table editor_crawlEditor module (must provide allowGizmo())
function editor_crawlEditor_waypoints:init(crawlEditorParam) end

--- Processes input: indicators, manual creation with Shift, hover and selection on click. Does nothing if mouseInfo.valid is false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:336
function editor_crawlEditor_waypoints:input() end

--- Looks for the node closest to the camera whose distance to the mouse ray is ≤ 1.0 m.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:222
---@return table|nil  hovered node
function editor_crawlEditor_waypoints:mouseOverPathnodes() end

--- Selects the node with the given id: updates the drawing mode (highlight/normal) of the nodes, places the gizmo on it and clears the custom fields. Does nothing if id is nil.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:48
---@param id integer|nil node id
function editor_crawlEditor_waypoints:selectPathnode(id) end

--- Returns the selected node, or nil if there is none or if it is marked missing.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:159
---@return table|nil  node
function editor_crawlEditor_waypoints:selectedPathnode() end

--- Sets the path whose nodes are being edited.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:44
---@param pathParam table|nil path with pathnodes and segments
function editor_crawlEditor_waypoints:setPath(pathParam) end

--- Sets the selected id without updating the gizmo or the drawing (unlike selectPathnode).
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:542
---@param indexParam integer node id
function editor_crawlEditor_waypoints:setSelectedPathnodeIndex(indexParam) end

--- Places the gizmo on the node position (oriented according to its normal in local alignment). No effect if the gizmo is not allowed.
---Source: lua/ge/extensions/editor/crawlEditor/waypoints.lua:65
---@param index integer node id
function editor_crawlEditor_waypoints:updateTransform(index) end

