---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/locations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the module constructor. Fields: sitesEditor, key, current (selected location), sites, list.
---@class editor_sitesEditor_locations
local editor_sitesEditor_locations = {}

--- Start of a gizmo drag: stores the starting position and radius.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:69
function editor_sitesEditor_locations:beginDrag() end

--- Creates a location at the given position (undoable action 'Create Location') and returns it.
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:121
---@param pos vec3 Position of the new location.
---@return table  Created location (self.current).
function editor_sitesEditor_locations:create(pos) end

--- During the drag: in translation mode updates pos, in scale mode recomputes radius (minimum 0.1) from the gizmo factor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:74
function editor_sitesEditor_locations:dragging() end

--- Draws the element editor: gizmo (if allowGizmo) and the text of the closest road segment.
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:134
---@param loc table Displayed location.
function editor_sitesEditor_locations:drawElement(loc) end

--- End of drag: records an undoable action 'Update Transform of ...' (old and new pos/radius).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:93
function editor_sitesEditor_locations:endDragging() end

--- Returns the location closest to the camera whose sphere (radius node.radius) is crossed by the mouse ray.
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:28
---@param mouseInfo table Mouse info (camPos, rayDir) built by sitesEditor.
---@param objects table Table of locations.
---@return table|nil  Hit location or nil.
function editor_sitesEditor_locations:hitTest(mouseInfo, objects) end

--- Constructor (called by the module): stores sitesEditor and the key, with no selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:9
---@param sitesEditor table editor_sitesEditor module.
---@param key string Key in the sites object ('locations').
function editor_sitesEditor_locations:init(sitesEditor, key) end

--- Removes a location (undoable action 'Remove Location').
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:128
---@param loc table Location to remove.
function editor_sitesEditor_locations:remove(loc) end

--- Selects a location and places the gizmo on it.
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:21
---@param loc table|nil Location to select.
function editor_sitesEditor_locations:select(loc) end

--- Sets the edited sites, keeps the list sites[key] and deselects.
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:15
---@param sites table Sites object.
function editor_sitesEditor_locations:setSites(sites) end

--- Places the gizmo on the position of the current location.
---Source: lua/ge/extensions/editor/sitesEditor/locations.lua:45
function editor_sitesEditor_locations:updateTransform() end

