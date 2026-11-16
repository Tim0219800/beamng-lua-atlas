---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/snaproad/normals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small normal computation utility for the points of a rally snaproad. From a point with prev/next links, it computes the "forward" normal vector using the available neighbors (rallyUtil.calculateForwardNormal).
--- Access: extension `gameplay_rally_snaproad_normals`: `extensions.load("gameplay_rally_snaproad_normals")`, then the global `gameplay_rally_snaproad_normals`
---@class gameplay_rally_snaproad_normals
gameplay_rally_snaproad_normals = {}

--- Computes the point's forward normal. Uses prev→next if both exist, otherwise current→next, otherwise prev→current; returns nil if no neighbor exists.
---Source: lua/ge/extensions/gameplay/rally/snaproad/normals.lua:19
---@param point table Point with pos, prev and next
---@return vec3|nil  Normal vector built from the x, y, z of the result of rallyUtil.calculateForwardNormal
function gameplay_rally_snaproad_normals.forwardNormalVec(point) end

--- Returns the triplet (previous point, current point, next point) of a point; returns nil, nil, nil if the point is nil.
---Source: lua/ge/extensions/gameplay/rally/snaproad/normals.lua:9
---@param point table|nil Point with prev and next fields (and pos)
---@return table|nil  point.prev
---@return table|nil  the point itself
---@return table|nil  point.next
function gameplay_rally_snaproad_normals.normalAlignPoints(point) end

