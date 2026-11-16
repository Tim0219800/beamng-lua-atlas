---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone object. Fields: sites, id, name, color, vertices (list of {pos, radius, index, next, prev}), center, labelPos, aabb {xMin..zMax, invalid}, top / bot ({pos, normal, active}), fenceDown, fenceHeight, usePlanes, customFields, locations and parkingSpots (filled by finalizeSites).
---@class gameplay_sites_zone
local gameplay_sites_zone = {}

--- Quick x/y test against the bounding box (z ignored).
---Source: lua/ge/extensions/gameplay/sites/zone.lua:197
---@param point vec3 Point to test.
---@return boolean  false if outside the box or aabb invalid.
function gameplay_sites_zone:aabbCheck(point) end

--- Inserts a vertex (at the end or at the given index) and recalculates the derived data.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:72
---@param pos vec3 Vertex position.
---@param index integer|nil Insertion position (default: at the end).
function gameplay_sites_zone:addVertex(pos, index) end

--- Automatically creates horizontal planes 5 m above the highest vertex and 5 m below the lowest, centered on the zone.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:143
---@param ignoreTop boolean|nil Do not create the top plane.
---@param ignoreBot boolean|nil Do not create the bottom plane.
function gameplay_sites_zone:autoPlanes(ignoreTop, ignoreBot) end

--- To call after modifying the top/bot planes; reruns processVertices.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:132
function gameplay_sites_zone:changedPlanes() end

--- Tests whether a point is inside the polygon (x/y) and between the planes.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:252
---@param point vec3 Point to test.
---@return boolean  true if inside the zone.
function gameplay_sites_zone:containsPoint2D(point) end

--- Tests whether a vehicle is inside the zone, based on its spawn bounding box: center only in basic mode, otherwise the four bottom/top corners used (points 0, 3, 4 and 7) must all be inside the zone.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:275
---@param veh userdata Vehicle object (getSpawnWorldOOBB).
---@param basic boolean|nil Test only the center.
---@return boolean  true if contained.
function gameplay_sites_zone:containsVehicle(veh, basic) end

--- Draws the zone in debug (translucent fence, name, planes depending on the mode). Only draws if the camera is close enough.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:291
---@param drawMode string|nil 'none', 'faded', 'normal' or 'highlight'.
---@param clr table|nil Color {r,g,b}.
---@param customHeight number|nil Custom fence height.
---@param customDown number|nil Custom fence depth.
---@param nearCam boolean|nil Only draw the segments close to the camera.
---@param drawDistance number|nil Draw distance.
function gameplay_sites_zone:drawDebug(drawMode, clr, customHeight, customDown, nearCam, drawDistance) end

--- Draws a fence panel (two triangles, double-sided) between two points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/zone.lua:393
---@param from vec3 Segment start.
---@param to vec3 Segment end.
---@param clrI table ColorI (its a field is overwritten).
---@param down number|nil Downward offset (default 0).
---@param up number|nil Height (default 5).
---@param usePlanes boolean|nil Bound the fence by the active planes.
---@param nearCam boolean|nil Limit to camera proximity with fade.
---@param drawDistance number|nil Draw distance (default 30).
---@param shapeAlpha number|nil Opacity 0..1 (default 0.5).
function gameplay_sites_zone:drawFence(from, to, clrI, down, up, usePlanes, nearCam, drawDistance, shapeAlpha) end

--- Draws the zone outline on the UI minimap (white lines).
---Source: lua/ge/extensions/gameplay/sites/zone.lua:380
---@param td any Minimap drawing object (line method), inferred from code.
function gameplay_sites_zone:drawMinimap(td) end

--- Draws a plane (top or bottom) with lines linking its anchor point to the projected vertices, and its normal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/zone.lua:369
---@param plane table Plane {pos, normal, active}.
---@param clrF any ColorF color.
function gameplay_sites_zone:drawPlane(plane, clrF) end

--- Constructor. sites may be nil (identifier -1). Default values: fenceDown 0, fenceHeight 5, planes inactive.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/sites/zone.lua:7
---@param sites table|nil Parent sites object.
---@param name string|nil Name; default "Zone <id>".
---@param forceId integer|nil Imposed identifier.
function gameplay_sites_zone:init(sites, name, forceId) end

--- Replaces the vertices with a version sampled every maxStep meters (at least 1), snapped to the terrain height.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:446
---@param maxStep number|nil Maximum step in meters; default 3, floor 1.
function gameplay_sites_zone:makeHighResolutionFence(maxStep) end

--- Restores the zone from the data and calls processVertices.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:51
---@param data table Data from onSerialize.
function gameplay_sites_zone:onDeserialized(data) end

--- Serializes name, vertices, color, custom fields and top/bot planes.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:26
---@return table  JSON-compatible data.
function gameplay_sites_zone:onSerialize() end

--- Indicates whether a point is between the active planes (an inactive plane is ignored).
---Source: lua/ge/extensions/gameplay/sites/zone.lua:167
---@param point vec3 Point to test.
---@return boolean  true if between the planes.
function gameplay_sites_zone:pointBetweenPlanes(point) end

--- Precomputations: bounding box (aabb), center, label position, vertex chaining, aabb extension by the planes. If a plane is not active, the corresponding z bound is infinite.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:83
function gameplay_sites_zone:processVertices() end

--- Intersection distance of a ray with the "fence" (vertical walls along the outline, bounded by fenceDown/fenceHeight or by the planes).
---Source: lua/ge/extensions/gameplay/sites/zone.lua:214
---@param rayPos vec3 Ray origin.
---@param rayDir vec3 Ray direction.
---@return number  Distance of the nearest hit, math.huge if none.
function gameplay_sites_zone:rayIntersectsZone(rayPos, rayDir) end

--- Removes the vertex at the given index and recalculates.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:77
---@param index integer Vertex index.
function gameplay_sites_zone:removeVertex(index) end

--- Tests that both planes are active and that their normals point up (top) and down (bot) respectively.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:137
---@return boolean  true if valid.
function gameplay_sites_zone:validPlanes() end

--- Vertically projects (z axis) a vertex onto a plane. Returns the vertex unchanged if the plane is inactive or aligned with the z axis (error logged).
---Source: lua/ge/extensions/gameplay/sites/zone.lua:181
---@param vertex vec3 Point to project.
---@param plane table Plane {pos, normal, active}.
---@return vec3  Intersection point.
function gameplay_sites_zone:vertexPlaneIntersection(vertex, plane) end

--- Polygon area in m² (shoelace formula, x/y). 0 if fewer than 3 vertices.
---Source: lua/ge/extensions/gameplay/sites/zone.lua:476
---@return number  Area in m².
function gameplay_sites_zone:zoneArea() end

