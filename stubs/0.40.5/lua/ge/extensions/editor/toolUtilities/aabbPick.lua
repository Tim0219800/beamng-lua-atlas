---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/aabbPick.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ray picking utility against axis-aligned boxes (AABB), without allocation. Used by editor tools that need to pick a world object by its bounding box (e.g. placed building instances). Linear scan of the candidates.
--- Access: extension `editor_toolUtilities_aabbPick`: `extensions.load("editor_toolUtilities_aabbPick")`, then the global `editor_toolUtilities_aabbPick`
---@class editor_toolUtilities_aabbPick
editor_toolUtilities_aabbPick = {}

--- Returns the id of the closest box (by entry distance) that the ray crosses. The provider provider(visit) must call visit(id, minx, miny, minz, maxx, maxy, maxz) once per candidate box.
---Source: lua/ge/extensions/editor/toolUtilities/aabbPick.lua:49
---@param ox number Ray origin, x
---@param oy number Ray origin, y
---@param oz number Ray origin, z
---@param dx number Direction, x
---@param dy number Direction, y
---@param dz number Direction, z
---@param provider function function(visit) that enumerates the boxes via visit(id, minx, miny, minz, maxx, maxy, maxz).
---@return any|nil  Winning id, or nil if no box is hit.
---@return number  Entry distance of the winner (absent if nil).
function editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider) end

--- Ray/AABB test using the slab method. Returns the entry distance t along the ray (>= 0) if hit, otherwise nil.
---Source: lua/ge/extensions/editor/toolUtilities/aabbPick.lua:16
---@param ox number Ray origin, x
---@param oy number Ray origin, y
---@param oz number Ray origin, z
---@param dx number Direction, x
---@param dy number Direction, y
---@param dz number Direction, z
---@param minx number Min corner of the box, x
---@param miny number Min corner of the box, y
---@param minz number Min corner of the box, z
---@param maxx number Max corner of the box, x
---@param maxy number Max corner of the box, y
---@param maxz number Max corner of the box, z
---@return number|nil  Entry distance, or nil if the ray misses the box or if it is behind it.
function editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz) end

