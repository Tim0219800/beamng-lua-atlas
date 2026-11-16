---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/pathnode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Race checkpoint. The angles passed to getSideTransforms are in radians.
---@class gameplay_race_pathnode
local gameplay_race_pathnode = {}

--- Converts the result of a raycast into a scenery object transform: position offset by zOff along the ground normal, scale, rotation according to alignMode.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:248
---@param hit table|nil Result of Engine.castRay (pt, norm).
---@param pRot quat Offset rotation.
---@param zOff number Offset along the ground normal (m).
---@param scl vec3 Scale.
---@param side string 'l' or 'r'.
---@param alignMode string 'terrain', 'pathnode' or 'absolute'.
---@return table|nil  {pos, scl, rot, side}, nil if no hit.
function gameplay_race_pathnode:convertRayHitToTransform(hit, pRot, zOff, scl, side, alignMode) end

--- Draws sphere, label (prefix '*' if useAsSplit, in parentheses if invisible), numeric custom fields (if the editor preference raceEditor.general.showCustomFields is active) and normal arrows.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:174
---@param drawMode string|nil 'none', 'faded', 'normal', 'highlight' (default self._drawMode).
---@param clr number[]|nil Color {r,g,b,a}.
---@param extraText string|nil Text appended to the label.
function gameplay_race_pathnode:drawDebug(drawMode, clr, extraText) end

--- Center and width of the pathnode's useful area once the sidePadding side paddings are removed.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:168
---@return vec3  Offset center.
---@return number  Useful width (m).
function gameplay_race_pathnode:getPaddedCenter() end

--- Associated recovery start position (path.startPositions.objects[recovery]).
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:87
---@return table|nil  startPosition or nil.
function gameplay_race_pathnode:getRecovery() end

--- Reverse recovery start position (reverseRecovery).
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:90
---@return table|nil  startPosition or nil.
function gameplay_race_pathnode:getReverseRecovery() end

--- Associated road point.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:301
---@return table|nil  Road point.
function gameplay_race_pathnode:getRoutePoint() end

--- Computes two scenery transforms, to the left and right of the pathnode, by casting rays toward the ground on each side (10 m radius). Returns an empty table if the pathnode has no normal.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:269
---@param posOffset vec3 Position offset (x, y lateral, z height).
---@param rotOffset vec3 Offset Euler rotation, symmetric between the sides.
---@param sclOffset vec3 Scale.
---@param alignMode string|nil 'terrain' (default), 'pathnode' or 'absolute'.
---@return table  {leftTransform, rightTransform} (each can be nil without a hit).
function gameplay_race_pathnode:getSideTransforms(posOffset, rotOffset, sclOffset, alignMode) end

--- Static road point.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:309
---@return table|nil  Road point.
function gameplay_race_pathnode:getStaticRoutePoint() end

--- Constructor: id, default name "Pathnode <id>", manual mode, default field values.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:7
---@param path table Owning race path.
---@param name string|nil Name.
---@param forceId integer|nil Forced id.
function gameplay_race_pathnode:init(path, name, forceId) end

--- Indicates whether a point is inside the sphere (and in front of the normal's plane if hasNormal).
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:78
---@param pos vec3 Point to test.
---@return boolean  true if inside.
function gameplay_race_pathnode:inside(pos) end

--- Tests whether a segment connecting a vehicle's corners crosses the pathnode: the normal's plane within the sphere if hasNormal, otherwise the sphere itself.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:94
---@param fromCorners vec3[] Corners at the previous frame.
---@param toCorners vec3[] Corners at the current frame.
---@return boolean  true if crossed.
---@return number  Smallest parameter t (0..1), math.huge otherwise.
function gameplay_race_pathnode:intersectCorners(fromCorners, toCorners) end

--- Restores the pathnode from serialized data; converts the recovery ids with oldIdMap.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:148
---@param data table Data from onSerialize.
---@param oldIdMap table<integer, integer>|nil Old id -> new id mapping.
function gameplay_race_pathnode:onDeserialized(data, oldIdMap) end

--- Serializes the pathnode (name, mode, scale, position, radius, normal, navgraphName, recovery, visible, useAsSplit, sidePadding, customFields).
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:128
---@return table  JSON data.
function gameplay_race_pathnode:onSerialize() end

--- Switches to manual mode with the given position, radius and normal.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:47
---@param pos vec3 Position.
---@param radius number Radius (m).
---@param normal vec3|nil Normal (optional).
function gameplay_race_pathnode:setManual(pos, radius, normal) end

--- Changes the navgraph radius scale and recomputes the radius in navgraph mode.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:71
---@param scl number|nil Scale (default 1).
function gameplay_race_pathnode:setNavRadiusScale(scl) end

--- Switches to navgraph mode: position and radius (× navRadiusScale) of the road map node, or from fallback if the node does not exist. Clears the normal.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:55
---@param navgraphName string Node name.
---@param fallback table|nil {pos, radius} used if the node is absent.
function gameplay_race_pathnode:setNavgraph(navgraphName, fallback) end

--- Sets the normal (length > 0.9 required, then normalized, hasNormal true); otherwise clears it.
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:33
---@param normal vec3|nil Crossing direction.
function gameplay_race_pathnode:setNormal(normal) end

--- Stores the associated road point (vehicle tracking).
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:294
---@param rp table Road point.
function gameplay_race_pathnode:setRoutePoint(rp) end

--- Stores the static road point (not modified by vehicle tracking).
---Source: lua/ge/extensions/gameplay/race/pathnode.lua:305
---@param rp table Road point.
function gameplay_race_pathnode:setStaticRoutePoint(rp) end

