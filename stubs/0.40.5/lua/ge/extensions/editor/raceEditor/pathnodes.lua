---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/pathnodes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pathnodes window (windowDescription = 'Pathnodes'). Instantiated by the module constructor with init(raceEditor). raceEditor.lua calls setPath, selected, unselect, draw and onEditModeActivate.
---@class editor_raceEditor_pathnodes
local editor_raceEditor_pathnodes = {}

--- Automatically creates a "recovery" group start position at the node's location (direction reversed if reverse) and assigns it to the node's recovery or reverseRecovery field.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:725
---@param reverse boolean true for reverse recovery (reverseRecovery field, reversed normal).
function editor_raceEditor_pathnodes:autoRecoverPos(reverse) end

--- Start of gizmo manipulation: stores the serialized state, rotation and radius of the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:80
function editor_raceEditor_pathnodes:beginDrag() end

--- Displays the help and the preview (sphere, direction prisms) during the drag, then on release creates a manual node (and a segment from the last node) via history.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:271
function editor_raceEditor_pathnodes:createManualPathnode() end

--- During manipulation: applies translation (manual mode only), normal rotation (if the node has one) or radius scaling.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:94
function editor_raceEditor_pathnodes:dragging() end

--- Called every frame: stores mouseInfo, handles gizmo and inputs if allowed, then draws the list and the node panel.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:262
---@param mouseInfo table Mouse info (valid, down, hold, up, camPos, rayDir, rayCast, _downPos, _holdPos, _upPos).
function editor_raceEditor_pathnodes:draw(mouseInfo) end

--- Draws the custom fields editor and the Copy Fields / Paste Fields buttons (copies into self.cfData).
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:705
---@param fields table Custom fields object (onSerialize/onDeserialized).
function editor_raceEditor_pathnodes:drawCustomFields(fields) end

--- Draws the node list (prefix "*" if useAsSplit, parentheses if not visible) and the current node panel: delete, move in the list, name, mode, position/radius, normal, visibility, split, recovery positions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:461
function editor_raceEditor_pathnodes:drawPathnodeList() end

--- End of manipulation: commits the history action with the node's before/after state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:147
function editor_raceEditor_pathnodes:endDragging() end

--- Simple drag mode: on click, allows dragging if the already selected node is clicked, otherwise selects the hovered node or deselects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:173
---@param hovered table|nil Node under the mouse.
function editor_raceEditor_pathnodes:handleMouseDown(hovered) end

--- Simple drag mode: while held, computes the position projected onto the ground by static raycast (forest disabled in collision) and draws a sphere and the node name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:224
function editor_raceEditor_pathnodes:handleMouseHold() end

--- Simple drag mode: on release, commits the "Manipulated Node via Simple Drag" action with the new position.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:234
function editor_raceEditor_pathnodes:handleMouseUp() end

--- Stores raceEditor, selection index nil, empty mouseInfo and creates a custom fields utility (customFieldsUtil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:18
---@param raceEditor table Module editor_raceEditor.
function editor_raceEditor_pathnodes:init(raceEditor) end

--- Handles the mouse: Alt = navgraph node, Shift = manual creation, otherwise selection (single click, or simple drag depending on the preference).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:416
function editor_raceEditor_pathnodes:input() end

--- Returns the node whose sphere (radius radius) is crossed by the mouse ray, the one closest to the camera.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:399
---@return table|nil  Hovered pathnode.
function editor_raceEditor_pathnodes:mouseOverPathnodes() end

--- Called when the edit mode is activated (see notes: ineffective).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:256
function editor_raceEditor_pathnodes:onEditModeActivate() end

--- Alt mode: hovers the navgraph's manual waypoints (map.getManualWaypoints) and lets you add one as a pathnode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:331
function editor_raceEditor_pathnodes:selectNavgraphNode() end

--- Selects the node with ID id (nil for none): highlights that node, places the gizmo, loads the name and custom fields.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:47
---@param id integer|nil Pathnode ID.
function editor_raceEditor_pathnodes:selectPathnode(id) end

--- Called when the tab becomes active: deselects, sets all nodes to "normal" drawing, adds the Shift shortcut "Add New" and fetches the map (map.getMap()).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:29
function editor_raceEditor_pathnodes:selected() end

--- Returns the selected node if it exists and is not missing.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:166
---@return table|nil  Selected pathnode.
function editor_raceEditor_pathnodes:selectedPathnode() end

--- Dropdown to choose a start position (or "None" = -1) in a node field, with a name preview in the world and an "Auto-Place" button if the field is empty and the node has a normal.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:747
---@param name string Label.
---@param fieldName string Node field (recovery or reverseRecovery).
---@param clrI ColorI|nil Background color of the in-world text.
---@param tt string|nil Tooltip.
function editor_raceEditor_pathnodes:selector(name, fieldName, clrI, tt) end

--- Sets the race path being edited.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:25
---@param path table gameplay/race/path object.
function editor_raceEditor_pathnodes:setPath(path) end

--- Called when the tab is left: nodes switch to "faded" drawing and the Shift shortcut is removed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:39
function editor_raceEditor_pathnodes:unselect() end

--- Places the axis gizmo on the node (oriented along its normal in local alignment if the node has one). No effect if the gizmo is not allowed.
---Source: lua/ge/extensions/editor/raceEditor/pathnodes.lua:60
---@param index integer Pathnode ID.
function editor_raceEditor_pathnodes:updateTransform(index) end

