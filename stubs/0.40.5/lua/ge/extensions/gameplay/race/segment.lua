---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/segment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Race segment. Fields: path, id, name ("Segment <id>" by default), mode ('waypoint' by default), from and to (pathnode ids, -1 if none), capsulePoints, sortOrder, _drawMode.
---@class gameplay_race_segment
local gameplay_race_segment = {}

--- Inserts a capsule at the given index (at the end by default).
---Source: lua/ge/extensions/gameplay/race/segment.lua:78
---@param pos vec3 Position.
---@param radius number Radius (m).
---@param name string|nil Name.
---@param index integer|nil Insertion position in capsulePoints.
function gameplay_race_segment:addCapsule(pos, radius, name, index) end

--- Indicates whether a point is inside the capsule stretch between points id and id+1 (distance to the segment less than the interpolated radius).
---Source: lua/ge/extensions/gameplay/race/segment.lua:96
---@param point vec3 Point to test.
---@param id integer Index of the first point of the stretch.
---@return boolean|nil  true if inside, nil otherwise.
function gameplay_race_segment:capsuleContains(point, id) end

--- Revalidates the mode after an end change: in 'navpath' mode, recomputes the path if possible, otherwise returns to 'waypoint'.
---Source: lua/ge/extensions/gameplay/race/segment.lua:43
function gameplay_race_segment:checkMode() end

--- Indicates whether the vehicle is inside the segment. In waypoint mode: true if it is already in this segment (state.currentSegments) or has just crossed the start pathnode. In 'capsules' or 'navpath' mode: true if it is inside one of the capsules.
---Source: lua/ge/extensions/gameplay/race/segment.lua:107
---@param point vec3 Vehicle position.
---@param state table currentSegments, previousCorners, currentCorners.
---@return boolean  true if inside.
---@return number|nil  0 in capsules/navpath mode (fixed value).
function gameplay_race_segment:contains(point, state) end

--- Draws the segment (prism between the two nodes in waypoint mode, capsules and edges otherwise) and its name. Draws nothing if the segment is invalid.
---Source: lua/ge/extensions/gameplay/race/segment.lua:176
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight' (default self._drawMode).
function gameplay_race_segment:drawDebug(drawMode) end

--- Fills the capsules with the intermediate nodes of the shortest path map.getPath between the navgraph nodes from and to (ends excluded).
---Source: lua/ge/extensions/gameplay/race/segment.lua:67
function gameplay_race_segment:fillNavpath() end

--- Indicates whether the vehicle has just crossed the end pathnode (intersectCorners).
---Source: lua/ge/extensions/gameplay/race/segment.lua:139
---@param point vec3 Position (not used).
---@param state table previousCorners, currentCorners.
---@return boolean  true if crossed.
---@return number  Crossing parameter t.
function gameplay_race_segment:finished(point, state) end

--- Indicates whether both end pathnodes are in navgraph mode (hence whether a navgraph path is possible).
---Source: lua/ge/extensions/gameplay/race/segment.lua:23
---@return boolean  true if possible.
function gameplay_race_segment:getBeNavpath() end

--- Number of capsule points, ends included (#capsulePoints + 2).
---Source: lua/ge/extensions/gameplay/race/segment.lua:86
---@return integer  Number of points.
function gameplay_race_segment:getCapsuleCount() end

--- Point i of the capsule chain: 1 = pathnode from, last = pathnode to, otherwise a capsulePoint.
---Source: lua/ge/extensions/gameplay/race/segment.lua:87
---@param i integer Index starting from 1.
---@return table|nil  Pathnode or capsule {pos, radius, name}.
function gameplay_race_segment:getCapsuleNode(i) end

--- Start pathnode.
---Source: lua/ge/extensions/gameplay/race/segment.lua:32
---@return table|nil  Pathnode.
function gameplay_race_segment:getFrom() end

--- End pathnode.
---Source: lua/ge/extensions/gameplay/race/segment.lua:33
---@return table|nil  Pathnode.
function gameplay_race_segment:getTo() end

--- Constructor: id, name, mode 'waypoint', from/to at -1, empty capsule list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/segment.lua:11
---@param path table Owning race path.
---@param name string|nil Name.
---@param forceId integer|nil Forced id.
function gameplay_race_segment:init(path, name, forceId) end

--- Indicates whether the from and to pathnodes exist, are not marked missing and are different.
---Source: lua/ge/extensions/gameplay/race/segment.lua:240
---@return boolean  true if valid.
function gameplay_race_segment:isValid() end

--- Restores the segment; converts from/to with oldIdMap, applies the mode then adds the saved capsules.
---Source: lua/ge/extensions/gameplay/race/segment.lua:160
---@param data table Data from onSerialize.
---@param oldIdMap table<integer, integer>|nil Old id -> new id mapping.
function gameplay_race_segment:onDeserialized(data, oldIdMap) end

--- Serializes the segment (name, mode, from, to, oldId, capsules).
---Source: lua/ge/extensions/gameplay/race/segment.lua:144
---@return table  JSON data.
function gameplay_race_segment:onSerialize() end

--- Removes the capsule at the given index.
---Source: lua/ge/extensions/gameplay/race/segment.lua:82
---@param index integer Index in capsulePoints.
function gameplay_race_segment:removeCapsule(index) end

--- Sets the start pathnode (by id) and revalidates the mode.
---Source: lua/ge/extensions/gameplay/race/segment.lua:34
---@param from integer Pathnode id.
function gameplay_race_segment:setFrom(from) end

--- Changes the mode: 'waypoint' clears the capsules; 'navpath' fills them from the navgraph.
---Source: lua/ge/extensions/gameplay/race/segment.lua:55
---@param mode string New mode.
function gameplay_race_segment:setMode(mode) end

--- Sets the end pathnode (by id) and revalidates the mode.
---Source: lua/ge/extensions/gameplay/race/segment.lua:38
---@param to integer Pathnode id.
function gameplay_race_segment:setTo(to) end

