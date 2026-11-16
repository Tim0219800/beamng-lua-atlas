---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/pacenote.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Co-driver call. Fields: path, id, name, pos (vec3), normal (vec3, default (0,1,0)), radius, note (text), segment (id, -1 if none), sortOrder (999999 by default), mode, navgraphName.
---@class gameplay_race_pacenote
local gameplay_race_pacenote = {}

--- Draws the sphere, the text (note, or "(name)" if empty) and the normal's arrows with debugDrawer.
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:116
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight' (default self._drawMode).
---@param clr number[]|nil Color {r,g,b,a} (default rainbow according to sortOrder).
---@param extraText string|nil Text appended to the label.
function gameplay_race_pacenote:drawDebug(drawMode, clr, extraText) end

--- Constructor: assigns the id (forceId or path:getNextUniqueIdentifier()), the default name "Pacenote <id>", the null position, the empty note and the segment -1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:8
---@param path table Owning race path.
---@param name string|nil Name.
---@param forceId integer|nil Forced id.
function gameplay_race_pacenote:init(path, name, forceId) end

--- Indicates whether a point is inside the call's sphere (and on the correct side of the normal if hasNormal).
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:59
---@param pos vec3 Point to test.
---@return boolean  true if inside.
function gameplay_race_pacenote:inside(pos) end

--- Tests whether one of the segments connecting a vehicle's corners (fromCorners[i] to toCorners[i]) crosses the call's plane inside the sphere.
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:69
---@param fromCorners vec3[] Corners at the previous frame.
---@param toCorners vec3[] Corners at the current frame.
---@return boolean  true if crossed.
---@return number  Smallest crossing parameter t (0..1), math.huge otherwise.
function gameplay_race_pacenote:intersectCorners(fromCorners, toCorners) end

--- Restores the call (manual mode) from serialized data; converts the segment id with oldIdMap.
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:108
---@param data table Data from onSerialize.
---@param oldIdMap table<integer, integer>|nil Old id -> new id mapping.
function gameplay_race_pacenote:onDeserialized(data, oldIdMap) end

--- Serializes the call: name, pos, radius, normal, oldId, note, segment.
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:95
---@return table  JSON data.
function gameplay_race_pacenote:onSerialize() end

--- Switches to manual mode with the given position, radius and normal (forgets the navgraph node name).
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:34
---@param pos vec3 Position.
---@param radius number Radius in meters.
---@param normal vec3 Normal.
function gameplay_race_pacenote:setManual(pos, radius, normal) end

--- Switches to navgraph mode: takes position and radius from a road map node, or from fallback if the node does not exist.
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:42
---@param navgraphName string Node name.
---@param fallback table|nil {pos, radius} used if the node is absent.
function gameplay_race_pacenote:setNavgraph(navgraphName, fallback) end

--- Sets the call's normal if its length exceeds 0.9 (it is then normalized).
---Source: lua/ge/extensions/gameplay/race/pacenote.lua:25
---@param normal vec3|nil Direction; nil causes an error (see notes).
function gameplay_race_pacenote:setNormal(normal) end

