---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteBake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforms what an editor has just built in the world into what a site manifest carries. A site is designed at one place on the map and placed elsewhere: all bakes therefore subtract their origin (ox, oy, oz) from everything before writing (geometry, kit transforms, lamps, plantings, ground plan). The chosen origin matters little to the placer (it realigns on the bounds read) but must be the SAME for all lists of a manifest. Plan coordinates are rounded to the millimeter.
--- Access: extension `editor_toolUtilities_siteBake`: `extensions.load("editor_toolUtilities_siteBake")`, then the global `editor_toolUtilities_siteBake`
---@class editor_toolUtilities_siteBake
editor_toolUtilities_siteBake = {}

--- The extent of everything the bake places (part vertices and instance positions, relative to the origin), so that the placer can frame a site, pick it under the cursor and know the room it needs before loading a mesh. Returns two null corners if nothing.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:253
---@param parts table|nil Mesh parts with verts.
---@param instances table|nil Instances with px, py, pz.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@param oz number z of the origin.
---@return table  Minimum corner {x,y,z}.
---@return table  Maximum corner {x,y,z}.
function editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz) end

--- Groups the kit's placements by shape. One group per distinct mesh becomes a single instanced draw on arrival: a square with two hundred identical bollards costs one shape and two hundred transforms.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:109
---@param instances table|nil List of instances { shape, px, py, pz, ax, ay, az, ux, uy, uz, scl, glow, street, stand }.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@param oz number z of the origin.
---@return table  List of groups { shape, xf (12 numbers per instance), glow, street, stand }.
function editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz) end

--- Rereads the frames of kit pieces already placed in the scene and adds them to out as instance records accepted by groupInstances. Accepts either kit entries (obj field) or the objects themselves; vanished objects or those without shapeName are skipped; the night glow (nightEmissive) is reread.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:153
---@param list table|nil List of { obj } entries or scene objects.
---@param out table|nil List to complete (created if nil).
---@return table  Records { shape, glow, px, py, pz, ax.., ux.., scl = {x,y,z} }.
function editor_toolUtilities_siteBake.harvestKit(list, out) end

--- Number of pieces that a list of groups stands up (size of xf divided by 12), for display before writing.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:183
---@param groups table|nil Groups returned by groupInstances.
---@return number  Number of pieces.
function editor_toolUtilities_siteBake.instanceCount(groups) end

--- The shapes the site asks the ground to be carved to, in its frame. Each feature becomes { quad = 4 corners {local x,y,z}, mode, band } or { rings, z, mode, band }. Ignores what the feature is used for (landing, ramp, retaining wall).
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:59
---@param features table|nil List of features { quad } or { rings, z }, with mode ('carve' by default) and band.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@param oz number z of the origin.
---@return table|nil  List of local features, nil if there are none.
function editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz) end

--- The lamps that accompany the pieces, in the site's frame. The color comes from glow or col (white by default). A spotlight (dx present) comes out with dir and cone; a bulb does not.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:190
---@param lights table|nil List of light records { px, py, pz, radius, brightness, glow|col, street, dx, dy, dz, cone }.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@param oz number z of the origin.
---@return table|nil  List of local lamps, nil if empty.
function editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz) end

--- The terrain paint a site lays, in its frame. Each layer { m, ring } or { m, xs, ys } (cell by cell) comes out named by terrain material layer.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:87
---@param coats table|nil List of layers: m = material index, ring or xs/ys.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@return table|nil  List { layer, ring } or { layer, cells = {x1,y1,x2,y2,...} }; nil if no terrain block or nothing to paint.
function editor_toolUtilities_siteBake.localPaint(coats, ox, oy) end

--- Planting as anchors: { items } for already scattered plants (x, y, sp, s, a), or { points, species, speciesWeights, size, vary, seed, drape, street } for a scatter to redo (the seed is already computed, to obtain the same plants at the same places).
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:211
---@param anchors table|nil Editor anchors.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@param oz number z of the origin.
---@return table|nil  List of local anchors, nil if empty.
function editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz) end

--- A polyline in the same way (no minimum number of points). Also used for unit normals with a null origin.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:34
---@param pts table|nil List of {x,y} points.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@return table  Local polyline.
function editor_toolUtilities_siteBake.localPts(pts, ox, oy) end

--- A plan polygon, local to the bake origin, rounded to the millimeter. Returns nil if fewer than 3 points, so that a caller can collect the return directly into a list.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:26
---@param ring table|nil List of {x,y} points.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@return table|nil  Local ring.
function editor_toolUtilities_siteBake.localRing(ring, ox, oy) end

--- A list of local rings; nil if none was a polygon (a key absent from the manifest means "this site has none").
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:42
---@param rings table|nil List of rings.
---@param ox number x of the origin.
---@param oy number y of the origin.
---@return table|nil  List of local rings.
function editor_toolUtilities_siteBake.localRings(rings, ox, oy) end

--- Number of plants that a bake would carry, over all anchors (items or points). For display only.
---Source: lua/ge/extensions/editor/toolUtilities/siteBake.lua:242
---@param anchors table|nil Planting anchors.
---@return integer  Number of plants.
function editor_toolUtilities_siteBake.plantCount(anchors) end

