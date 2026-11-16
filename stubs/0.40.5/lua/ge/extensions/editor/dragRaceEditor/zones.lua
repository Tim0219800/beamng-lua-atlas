---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/zones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drag race zone editor (strip zone or lane zone), following the same principle as the crawl editor boundaries. It relies on the gameplay/sites/zone class: mouse vertex selection, adding/inserting vertices, moving and rotating with the editor's axis gizmo, optional terrain snapping, undo/redo via editor.history. init() returns an editor instance; zoneFromData/zoneToData convert between a serialized table and a Zone object.
--- Access: extension `editor_dragRaceEditor_zones`: `extensions.load("editor_dragRaceEditor_zones")`, then the global `editor_dragRaceEditor_zones`
---@class editor_dragRaceEditor_zones
---@field zoneFromData function Alias of C.zoneFromData.
---@field zoneToData function Alias of C.zoneToData.
editor_dragRaceEditor_zones = {}

--- Creates and returns an initialized zone editor instance (class C).
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:334
---@return table  instance with the methods setZone, clearZone, syncBack, draw...
function editor_dragRaceEditor_zones.init() end

--- Zone editor returned by init(). Fields: zone, target, currentVertices (selected vertices), currentPlane, snapToTerrain.
---@class editor_dragRaceEditor_zones_C
local editor_dragRaceEditor_zones_C = {}

--- Start of gizmo move: stores the starting positions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:226
function editor_dragRaceEditor_zones_C:beginDrag() end

--- Forgets the current zone and target.
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:75
function editor_dragRaceEditor_zones_C:clearZone() end

--- During gizmo move: translates (with terrain snapping) or rotates the selected vertices around their centroid.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:237
function editor_dragRaceEditor_zones_C:dragging() end

--- To be called every frame in zone edit mode: updates/displays the gizmo, handles input and draws the zone as debug.
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:318
---@param mouseInfo table mouse info (see input.getMouseInfo)
function editor_dragRaceEditor_zones_C:draw(mouseInfo) end

--- Projects a position onto the terrain height (core_terrain.getTerrainHeight).
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:129
---@param pos vec3 position
---@return vec3  new position
---@return boolean  true if core_terrain exists
function editor_dragRaceEditor_zones_C:dropToTerrain(pos) end

--- End of move: re-snaps to terrain if enabled and records the history action "Manipulate Zone Vertices".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:295
function editor_dragRaceEditor_zones_C:endDragging() end

--- Among objects {pos, index}, finds the one hit by the mouse ray (selection radius = camera distance/40) that is closest to the camera; also draws the spheres (orange if already selected).
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:99
---@param mouseInfo table camPos, rayDir...
---@param objects table objects with pos
---@return table|nil  hit object
function editor_dragRaceEditor_zones_C:findVert(mouseInfo, objects) end

--- Initializes the fields (no zone, snapToTerrain=true).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:57
function editor_dragRaceEditor_zones_C:init() end

--- Handles mouse input: vertex addition (Shift or empty zone), insertion (Alt), otherwise single or multiple (Ctrl) vertex selection.
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:157
---@param mouseInfo table mouse info
function editor_dragRaceEditor_zones_C:input(mouseInfo) end

--- Sets the edited zone and its target; resets the vertex selection.
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:68
---@param zoneInstance table Zone
---@param target table {type, strip, lane}
function editor_dragRaceEditor_zones_C:setZone(zoneInstance, target) end

--- Writes the zone back to strip.stripZone or lane.zone, marks the strip _dirty and flags unsaved changes. No effect if there is no zone or target.
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:83
function editor_dragRaceEditor_zones_C:syncBack() end

--- Finds the hovered edge midpoint; on click, inserts a vertex there (history action "Insert Zone Vertex"). Requires at least 2 vertices.
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:138
---@param mouseInfo table mouse info
function editor_dragRaceEditor_zones_C:tryInsert(mouseInfo) end

--- Places the axis gizmo at the centroid of the selected vertices (or at the point of the current plane).
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:201
function editor_dragRaceEditor_zones_C:updateTransform() end

--- Static function: builds a Zone from a serialized table (deep copy; vertices and customFields default to empty, so an empty zone is allowed).
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:41
---@param data table|nil strip.stripZone or lane.zone
---@return table|nil  Zone instance, nil if data is nil
function editor_dragRaceEditor_zones_C.zoneFromData(data) end

--- Static function: serializes a Zone via zone:onSerialize().
---Source: lua/ge/extensions/editor/dragRaceEditor/zones.lua:52
---@param zone table|nil Zone instance
---@return table|nil  serialized table
function editor_dragRaceEditor_zones_C.zoneToData(zone) end

