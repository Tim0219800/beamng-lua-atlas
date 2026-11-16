---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/parkingSpots.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the constructor. Fields: sitesEditor, key, current (selected spot), list, isMultiSpot, multiSpotData (spotAmount, spotOffset, spotDirection, spotRotation), listDisplay (assigned by sitesEditor), requestGizmo.
---@class editor_sitesEditor_parkingSpots
local editor_sitesEditor_parkingSpots = {}

--- Duplicates the current spot (undoable action 'Duplicate Parking Spot') when a drag starts with Shift, and makes the list adopt the copy.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:258
function editor_sitesEditor_parkingSpots:_beginShiftDuplicate() end

--- Creates a spot at the given position with the 'Car' scale (undoable action 'Create Parking Spot') and returns it.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:197
---@param pos vec3 Position of the new spot.
---@return table  Created spot (self.current).
function editor_sitesEditor_parkingSpots:create(pos) end

--- Draws the spot editor: gizmo, size choice, rotation angles, 'Is MultiSpot' checkbox and its sliders (Amount of Spots 1 to 25, Offset 0 to 5, Spot Rotation -1.55 to 1.55).
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:277
---@param ps table Displayed spot.
---@param mouseInfo table Mouse info.
function editor_sitesEditor_parkingSpots:drawElement(ps, mouseInfo) end

--- Returns the spot whose box (or one of the multispot boxes) is hit closest by the mouse ray, only on click.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:111
---@param mouseInfo table Mouse info (camPos, rayDir, down).
---@param objects table Table of spots.
---@return table|nil  Hit spot or nil.
function editor_sitesEditor_parkingSpots:hitTest(mouseInfo, objects) end

--- Constructor: prepares the multispot values, the drag state and the transformUtil utility ('Edit Sites', 'Transform'). Also defines the method C:requestGizmo(mode) which schedules the gizmo (re)configuration over 3 frames.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:57
---@param sitesEditor table editor_sitesEditor module.
---@param key string 'parkingSpots'.
function editor_sitesEditor_parkingSpots:init(sitesEditor, key) end

--- Removes a spot (undoable action 'Remove Parking Spot').
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:204
---@param ps table Spot to remove.
function editor_sitesEditor_parkingSpots:remove(ps) end

--- Selects a spot: places the transform, enables editing and copies its multispot settings into the UI.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:97
---@param ps table|nil Spot to select.
function editor_sitesEditor_parkingSpots:select(ps) end

--- Sets the edited sites, restores the original rotations of the multispots and deselects.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:84
---@param sites table Sites object.
function editor_sitesEditor_parkingSpots:setSites(sites) end

--- Copies pos, rot, scl of the current spot into transformUtil.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:210
function editor_sitesEditor_parkingSpots:setTransform() end

--- Copies pos, rot, scl from transformUtil to the current spot (during a drag).
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:214
function editor_sitesEditor_parkingSpots:updateFromTransform() end

--- Copies the multispot settings from the UI to the current spot.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:248
function editor_sitesEditor_parkingSpots:updateMultiSpot() end

--- Records an undoable action 'Update Transform of ...' with the old and new values.
---Source: lua/ge/extensions/editor/sitesEditor/parkingSpots.lua:240
function editor_sitesEditor_parkingSpots:updateTransform() end

