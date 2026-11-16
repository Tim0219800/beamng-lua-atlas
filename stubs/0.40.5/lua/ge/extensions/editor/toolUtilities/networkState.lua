---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/networkState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exchange table between the editor's road network and the tools that build against it (parcels, sidewalks, parking lots). The network publishes its data once with provide(t) when the road tool loads; the other tools read (roads, surfaces, overRoad...). In the other direction, a tool that has paved verges publishes them (publishFootway) and can request pedestrian crossings (crossingSites, applyCrossings). Neither side knows the other.
--- Access: extension `editor_toolUtilities_networkState`: `extensions.load("editor_toolUtilities_networkState")`, then the global `editor_toolUtilities_networkState`
---@class editor_toolUtilities_networkState
editor_toolUtilities_networkState = {}

--- Places the crossings wanted by this owner (list of sites reduced to those retained) in place of its previous request. Empty list: removes its crossings. Crossings placed by hand or requested by another owner are left alone.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:114
---@param owner any Owner name (nil = nothing).
---@param list table[] Retained sites.
---@return integer  Number placed.
---@return integer  Number removed (0, 0 without a network or without owner).
function editor_toolUtilities_networkState.applyCrossings(owner, list) end

--- True if the network's answers are still stabilizing (see notes).
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:76
---@return boolean  true if the network is not ready.
function editor_toolUtilities_networkState.busy() end

--- Where the network would place a pedestrian crossing: one site on each approach of the junctions that count. Each site gives the road, the position along it and the two points its strip would reach. Sites that already have a crossing are omitted.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:106
---@param density number Proportion of sites kept.
---@param depthM number Depth of the strip (m).
---@return table[]  Crossing sites.
function editor_toolUtilities_networkState.crossingSites(density, depthM) end

--- What the network asked of the terrain: the ground it leveled and the structures it placed there.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:88
---@return table  Leveled ground items.
---@return table  Structure items.
function editor_toolUtilities_networkState.features() end

--- Everything paved on a road's verges, merged across owners. Returns nil if nobody has paved there (the network understands: paint the blend over the whole length).
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:129
---@param groupId any Road group id.
---@return table|nil  { left, right } lists of spans, or nil.
function editor_toolUtilities_networkState.footwayFor(groupId) end

--- Indicates, per divPoint segment, which segments of a road rest on the ground (and not on a deck or in a tunnel); bridge abutments count as ground. Returns nil if all segments are on the ground.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:42
---@param road table Road (element of roads()).
---@return table|nil  Per-segment markers, or nil.
function editor_toolUtilities_networkState.groundSegs(road) end

--- Distance beyond the edge of a road's surface over which its slope still holds the terrain at the road's height, taking priority over what a site places there.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:96
---@param paved boolean|nil For a verge that another tool has declared a sidewalk: the road keeps no bare shoulder there.
---@return number  Distance in meters (0 without a network).
function editor_toolUtilities_networkState.heldPastEdge(paved) end

--- The surfaces are cached: this call tells the network that a tool has just moved something.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:63
function editor_toolUtilities_networkState.invalidate() end

--- Tells whether a ring falls on a network surface. Asked of the network rather than computed from surfaces, because a junction is partly bounded by lines.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:57
---@param ring table Ring of points.
---@return boolean  true if the ring overlaps the network (false if the network is not provided).
function editor_toolUtilities_networkState.overRoad(ring) end

--- Network side: registers the road network's function table. Called once when the road tool loads; everything else in the module refers back to it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:29
---@param t table Table with roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged, etc.
function editor_toolUtilities_networkState.provide(t) end

--- Paving tool side: publishes the verges this owner has paved, { [groupId] = { left = spans, right = spans } }, replacing its previous publication. The network is notified immediately (footwayChanged) because the blend under the slabs is painted terrain that must be repainted.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:121
---@param owner any Owner name; nil = no effect.
---@param byGroup table Left/right spans per road group id.
function editor_toolUtilities_networkState.publishFootway(owner, byGroup) end

--- Counter incremented on each rebuild of a road or junction (heights included), for tools that place something on a road's surface.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:82
---@return number  Revision (0 without a network).
function editor_toolUtilities_networkState.rev() end

--- All placed roads, in plan geometry: id, divPoints, tangents, binormals. Junction nodes and the rest are excluded.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:35
---@return table[]  Roads (shared empty table if the network is not provided).
function editor_toolUtilities_networkState.roads() end

--- Counter incremented when the network's surfaces change, so that a tool notices that a road has moved under its terrain.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:68
---@return number  Signature (0 without a network).
function editor_toolUtilities_networkState.sig() end

--- Everything the network has paved, in plan: the closed rings of roadway and sealed junction, then the edge lines that bound no area of their own.
---Source: lua/ge/extensions/editor/toolUtilities/networkState.lua:49
---@return table[]  Closed rings.
---@return table[]  Edge lines.
function editor_toolUtilities_networkState.surfaces() end

