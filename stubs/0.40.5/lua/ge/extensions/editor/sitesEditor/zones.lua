---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/zones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the constructor. Fields: sitesEditor, key, current (zone), currentVertices (selected vertices), currentPlane (top or bot plane being edited).
---@class editor_sitesEditor_zones
local editor_sitesEditor_zones = {}

--- Start of drag: stores the gizmo position, the vertices' position and the plane rotation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:154
function editor_sitesEditor_zones:beginDrag() end

--- Creates a zone (undoable action 'Create Zone') and returns it.
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:294
---@return table  Created zone.
function editor_sitesEditor_zones:create() end

--- During the drag: translation or rotation of the vertices (around their centroid), of the plane, with terrain snapping.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:167
function editor_sitesEditor_zones:dragging() end

--- Draws the zone editor: gizmo, buttons (Select All Vertices, Delete Current Vertices, Auto Planes, Divide), checkboxes Snap To Terrain, Top Plane, Bottom Plane, and info (vertex count, area, computation time, player inside).
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:307
---@param zone table Displayed zone.
function editor_sitesEditor_zones:drawElement(zone) end

--- Projects a position onto the terrain height.
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:234
---@param pos vec3 Position to project.
---@return vec3  Copy of the position with the terrain z.
---@return boolean  true if core_terrain is available.
function editor_sitesEditor_zones:dropToTerrain(pos) end

--- End of drag: snaps to the terrain, recomputes the vertices (processVertices) and records the undoable action 'Dragged Vertices'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:257
function editor_sitesEditor_zones:endDragging() end

--- Draws a sphere per vertex (orange if selected) and returns the vertex closest to the camera hit by the mouse ray (sphere radius = camera distance / 40).
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:33
---@param mouseInfo table Mouse info.
---@param objects table List of vertices (or insertion points).
---@return table|nil  Hit vertex.
function editor_sitesEditor_zones:findVert(mouseInfo, objects) end

--- Returns the zone crossed by the mouse ray at the smallest distance (obj:rayIntersectsZone).
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:389
---@param mouseInfo table Mouse info.
---@param objects table Table of zones.
---@return table|nil  Hit zone.
function editor_sitesEditor_zones:findZone(mouseInfo, objects) end

--- Constructor: stores sitesEditor, the key and an empty vertex selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:11
---@param sitesEditor table editor_sitesEditor module.
---@param key string 'zones'.
function editor_sitesEditor_zones:init(sitesEditor, key) end

--- Handles the mouse: zone selection by click (Ctrl to toggle), vertex addition with Shift, insertion with Alt, otherwise vertex selection.
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:88
---@param mouseInfo table Mouse info.
function editor_sitesEditor_zones:input(mouseInfo) end

--- Removes a zone (undoable action 'Remove Zone').
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:301
---@param zone table Zone to remove.
function editor_sitesEditor_zones:remove(zone) end

--- Selects a zone, repositions the gizmo and clears the vertex and plane selection.
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:24
---@param zone table|nil Zone to select.
function editor_sitesEditor_zones:select(zone) end

--- Sets the edited sites and deselects.
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:18
---@param sites table Sites object.
function editor_sitesEditor_zones:setSites(sites) end

--- With Alt: tests the edge midpoints and, on click, inserts a vertex there.
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:67
---@param mouseInfo table Mouse info.
function editor_sitesEditor_zones:tryInsert(mouseInfo) end

--- Places the gizmo at the centroid of the selected vertices, or on the plane being edited (local or world orientation).
---Source: lua/ge/extensions/editor/sitesEditor/zones.lua:128
function editor_sitesEditor_zones:updateTransform() end

