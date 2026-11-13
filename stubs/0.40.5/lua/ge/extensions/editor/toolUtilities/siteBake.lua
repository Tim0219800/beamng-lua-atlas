---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteBake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_siteBake` : `extensions.load("editor_toolUtilities_siteBake")`, puis la globale `editor_toolUtilities_siteBake`
---@class editor_toolUtilities_siteBake
editor_toolUtilities_siteBake = {}

--- The extent of everything the bake places, so the placer can frame a site, pick it under the cursor and know how much room
--- it needs before it has loaded a single mesh.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:253
---@param parts any
---@param instances any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteBake.bounds(parts, instances, ox, oy, oz) end

--- The kit placements, grouped by the shape they place. One group per distinct mesh becomes one instanced draw at the far
--- end, so a square with two hundred identical bollards costs one shape and two hundred transforms rather than two hundred
--- of each.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:109
---@param instances any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteBake.groupInstances(instances, ox, oy, oz) end

---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:153
---@param list any
---@param out any
function editor_toolUtilities_siteBake.harvestKit(list, out) end

--- How many pieces a group list stands, for a readout that wants to say so before anything is written.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:183
---@param groups any
function editor_toolUtilities_siteBake.instanceCount(groups) end

--- The shapes a site asks the ground to be cut to, in its own frame. Terraform takes a feature one of two ways and every
--- producer in the tools emits one of them: a graded QUAD, whose four corners carry their own heights, or a set of RINGS
--- sharing one height. So this needs to know nothing about what any particular feature is FOR -- a tier floor, a flight's
--- rake, a retaining band -- which is the point: an editor works out what it wants from the terrain and the placer carves it
--- without either of them having to agree about anything but these two shapes.
--- Ring points go out flat, because a ring's height is the feature's and saying it per point is a second copy of the same
--- number. Whatever reads this back makes them vec3 again, which is what terraform tests polygons with.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:59
---@param features any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteBake.localFeatures(features, ox, oy, oz) end

--- The lamps that go with the pieces, in the site's own frame like everything else here.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:190
---@param lights any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteBake.localLamps(lights, ox, oy, oz) end

--- The terrain paint a site lays, in its own frame. Each coat is `{ m, ring }` or `{ m, xs, ys }` (cell by cell) from the
--- editor, and goes out named by layer, since an index is only good for the one terrain it was read off.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:87
---@param coats any
---@param ox any
---@param oy any
function editor_toolUtilities_siteBake.localPaint(coats, ox, oy) end

--- Planting travels as anchors rather than as scattered items, because the forest belongs to the level and not to the site:
--- whatever places this re-scatters them when it burns.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:211
---@param anchors any
---@param ox any
---@param oy any
---@param oz any
function editor_toolUtilities_siteBake.localPlants(anchors, ox, oy, oz) end

--- A polyline the same way. Also does for the unit normals that go with one, called with a zero origin.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:34
---@param pts any
---@param ox any
---@param oy any
function editor_toolUtilities_siteBake.localPts(pts, ox, oy) end

--- One plan polygon, local to the bake origin. Nil for anything that is not a polygon, so a caller can collect the return
--- straight into a list and never has to check.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:26
---@param ring any
---@param ox any
---@param oy any
function editor_toolUtilities_siteBake.localRing(ring, ox, oy) end

--- A list of them, nil when nothing in it was a polygon: an absent key in the manifest reads as "this site has none of
--- these", which is what every reader of a ground plan already expects.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:42
---@param rings any
---@param ox any
---@param oy any
function editor_toolUtilities_siteBake.localRings(rings, ox, oy) end

--- How many plants a bake would carry, across every anchor. Only for the readout.
---Source : lua/ge/extensions/editor/toolUtilities/siteBake.lua:242
---@param anchors any
function editor_toolUtilities_siteBake.plantCount(anchors) end

