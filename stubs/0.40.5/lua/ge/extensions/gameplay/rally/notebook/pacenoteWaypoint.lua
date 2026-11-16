---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Waypoint instance. Fields: pacenote, id, name, waypointType, normal (vec3), pos (vec3), radius, intersectRadius, sortOrder (999999 by default), mode (nil or "manual"), routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.
---@class gameplay_rally_notebook_pacenoteWaypoint
local gameplay_rally_notebook_pacenoteWaypoint = {}

--- Waypoint color according to its type and the drawing mode: normal cs/ce colors, "adjacent" for 'previous' and 'next', "adjacent_bg" for 'background'.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:135
---@param pn_drawMode string|nil 'previous', 'next', 'background' or nil.
---@return table|nil  Color {r,g,b} (values 0-1) from the rally/util/colors module, nil if unknown type.
function gameplay_rally_notebook_pacenoteWaypoint:colorForWpType(pn_drawMode) end

--- Draws the waypoint: sphere of radius radius (or radius*radius_factor), optional text and a square prism representing the crossing plane. On hover, the opacity is replaced by the "hover" values.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:155
---@param hover boolean Hovered waypoint.
---@param text string|nil Text to display.
---@param clr_shape table Color {r,g,b} 0-1.
---@param alpha_shape number Shape opacity.
---@param alpha_text number Text opacity.
---@param clr_text_fg table|nil Text color.
---@param clr_text_bg table|nil Text background color.
---@param radius_factor number|nil Factor applied to the radius.
---@param globalOpacity number Opacity multiplier, used on hover.
function gameplay_rally_notebook_pacenoteWaypoint:drawDebug(hover, text, clr_shape, alpha_shape, alpha_text, clr_text_fg, clr_text_bg, radius_factor, globalOpacity) end

--- Recce mode drawing: the note's text above, a translucent plane and three cylinders forming a 6 m high gantry. The next waypoint (i == 1) is more opaque.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:225
---@param i integer Rank among the upcoming notes (1 = next).
---@param noteText string Text to display.
function gameplay_rally_notebook_pacenoteWaypoint:drawDebugRecce(i, noteText) end

--- Original distance to the route point's target.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:349
---@return number|nil  Distance.
function gameplay_rally_notebook_pacenoteWaypoint:getOriginalDistToTarget() end

--- Returns the stored route point.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:336
---@return table|nil  Road point.
function gameplay_rally_notebook_pacenoteWaypoint:getRoutePoint() end

--- Original distance to the static route point's target.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:353
---@return number|nil  Distance.
function gameplay_rally_notebook_pacenoteWaypoint:getStaticOriginalDistToTarget() end

--- Returns the static route point.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:345
---@return table|nil  Road point.
function gameplay_rally_notebook_pacenoteWaypoint:getStaticRoutePoint() end

--- Constructor. The id comes from forceId or pacenote:getNextUniqueIdentifier(), the type from pacenote:getNextWaypointType(), the default name is "Waypoint <id>".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:17
---@param pacenote table Owning pacenote.
---@param name string|nil Waypoint name.
---@param pos vec3|nil Position.
---@param forceId integer|nil Forced identifier (loading).
function gameplay_rally_notebook_pacenoteWaypoint:init(pacenote, name, pos, forceId) end

--- true if the type is cornerEnd.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:324
---@return boolean  Result.
function gameplay_rally_notebook_pacenoteWaypoint:isCe() end

--- true if the type is cornerStart.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:320
---@return boolean  Result.
function gameplay_rally_notebook_pacenoteWaypoint:isCs() end

--- true if the type is cornerStart or cornerEnd.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:307
---@return boolean  Result.
function gameplay_rally_notebook_pacenoteWaypoint:isLockable() end

--- true if the waypoint is lockable and the preference editor_rallyEditor.getPrefLockWaypoints() is enabled.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:311
---@return boolean  Result.
function gameplay_rally_notebook_pacenoteWaypoint:isLocked() end

--- Text "<pacenote name>[Cs|Ce]".
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:357
---@return string  Label.
function gameplay_rally_notebook_pacenoteWaypoint:nameWithPacenote() end

--- Restores type, name, position, radius and normal from the saved data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:90
---@param data table Data produced by onSerialize.
---@param oldIdMap table Not used here.
function gameplay_rally_notebook_pacenoteWaypoint:onDeserialized(data, oldIdMap) end

--- Returns the table to write as JSON: oldId, name, waypointType, pos, radius, normal (arrays of 3 numbers).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:79
---@return table  Serialized data.
function gameplay_rally_notebook_pacenoteWaypoint:onSerialize() end

--- Switches to "manual" mode and sets position, radius and normal.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:59
---@param pos vec3 Position.
---@param radius number Radius in meters.
---@param normal vec3 Normal (see setNormal).
function gameplay_rally_notebook_pacenoteWaypoint:setManual(pos, radius, normal) end

--- Sets the normal, normalized, if its length exceeds 0.9; otherwise unchanged.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:70
---@param normal vec3 Direction.
function gameplay_rally_notebook_pacenoteWaypoint:setNormal(normal) end

--- Sets the position (copy of the vec3).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:66
---@param newpos vec3 New position.
function gameplay_rally_notebook_pacenoteWaypoint:setPos(newpos) end

--- Stores the route point and its original distToTarget (which changes when the point becomes the first of the route).
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:328
---@param rp table Route point (distToTarget field).
function gameplay_rally_notebook_pacenoteWaypoint:setRoutePoint(rp) end

--- Same as setRoutePoint for the static route.
---Source: lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:340
---@param rp table Static road point.
function gameplay_rally_notebook_pacenoteWaypoint:setStaticRoutePoint(rp) end

