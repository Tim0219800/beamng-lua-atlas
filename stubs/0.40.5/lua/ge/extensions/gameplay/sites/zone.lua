---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/sites/zone.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/sites/zone.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_sites_zone
local gameplay_sites_zone = {}

---Source : lua/ge/extensions/gameplay/sites/zone.lua:197
---@param point any
function gameplay_sites_zone:aabbCheck(point) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:72
---@param pos any
---@param index any
function gameplay_sites_zone:addVertex(pos, index) end

--- creates some automatically gnrated planes 5m above/below the highest/lowest vertex, aligned to the x/y plane.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:143
---@param ignoreTop any
---@param ignoreBot any
function gameplay_sites_zone:autoPlanes(ignoreTop, ignoreBot) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:132
function gameplay_sites_zone:changedPlanes() end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:252
---@param point any
function gameplay_sites_zone:containsPoint2D(point) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:275
---@param veh any
---@param basic any
function gameplay_sites_zone:containsVehicle(veh, basic) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:291
---@param drawMode any
---@param clr any
---@param customHeight any
---@param customDown any
---@param nearCam any
---@param drawDistance any
function gameplay_sites_zone:drawDebug(drawMode, clr, customHeight, customDown, nearCam, drawDistance) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:393
---@param from any
---@param to any
---@param clrI any
---@param down any
---@param up any
---@param usePlanes any
---@param nearCam any
---@param drawDistance any
---@param shapeAlpha any
function gameplay_sites_zone:drawFence(from, to, clrI, down, up, usePlanes, nearCam, drawDistance, shapeAlpha) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:380
---@param td any
function gameplay_sites_zone:drawMinimap(td) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:369
---@param plane any
---@param clrF any
function gameplay_sites_zone:drawPlane(plane, clrF) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:7
---@param sites any
---@param name any
---@param forceId any
function gameplay_sites_zone:init(sites, name, forceId) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:446
---@param maxStep any
function gameplay_sites_zone:makeHighResolutionFence(maxStep) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:51
---@param data any
function gameplay_sites_zone:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:26
function gameplay_sites_zone:onSerialize() end

--- returns if a point is located between the planes.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:167
---@param point any
function gameplay_sites_zone:pointBetweenPlanes(point) end

--- this does some precomputations.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:83
function gameplay_sites_zone:processVertices() end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:214
---@param rayPos any
---@param rayDir any
function gameplay_sites_zone:rayIntersectsZone(rayPos, rayDir) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:77
---@param index any
function gameplay_sites_zone:removeVertex(index) end

--- test if both planes are valid. normals of the planes have to point up/down respectively.
---Source : lua/ge/extensions/gameplay/sites/zone.lua:137
function gameplay_sites_zone:validPlanes() end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:181
---@param vertex any
---@param plane any
function gameplay_sites_zone:vertexPlaneIntersection(vertex, plane) end

---Source : lua/ge/extensions/gameplay/sites/zone.lua:476
function gameplay_sites_zone:zoneArea() end

