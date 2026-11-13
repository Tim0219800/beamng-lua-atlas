---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/networkState.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_networkState` : `extensions.load("editor_toolUtilities_networkState")`, puis la globale `editor_toolUtilities_networkState`
---@class editor_toolUtilities_networkState
editor_toolUtilities_networkState = {}

--- The crossings this owner wants, as the sites above cut down to the ones it will have, in place of whatever it asked for
--- last time. An empty list takes its crossings back off the roads. Crossings placed by hand, or asked for by somebody
--- else, are left where they are. Answers how many were put down and how many were taken off.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:114
---@param owner any
---@param list any
function editor_toolUtilities_networkState.applyCrossings(owner, list) end

--- Whether what the network answers now is still on its way to being right: not loaded yet, roads and junctions waiting
--- to be rebuilt, which after a load or a Lua reload goes on for many frames, or a node still being dragged. Ground laid
--- against the roads meanwhile is laid against half of them, so a tool doing that waits for this to clear.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:76
function editor_toolUtilities_networkState.busy() end

--- Where the network would take a pedestrian crossing, if somebody wanted one: a site on every approach of the junctions
--- that matter, `density` of them kept and `depthM` deep. Each site says which road it is on, where along it, and the two
--- points its band would reach to -- enough for a paver to keep only the ones it has paved both sides of, and no more than
--- that. Sites the road already carries a crossing at are left out, so a caller relaying its own takes those off first.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:106
---@param density any
---@param depthM any
function editor_toolUtilities_networkState.crossingSites(density, depthM) end

--- What the network has told the terrain to do: the ground it has graded and the structures it has stood in it.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:88
function editor_toolUtilities_networkState.features() end

--- Everything paved on one road's verges, merged across owners. Nil where nobody has paved it, which is what the network
--- reads as "paint the blend right along".
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:129
---@param groupId any
function editor_toolUtilities_networkState.footwayFor(groupId) end

--- Which of a road's segments lie on the ground, per divPoint segment, rather than on a flying deck or in a tunnel: a bridge's
--- abutments count, the ground being brought up level with the deck there. Nil when all do.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:42
---@param road any
function editor_toolUtilities_networkState.groundSegs(road) end

--- How far past a road's surface edge its grade still holds the ground at the road's own height, outranking anything a site
--- lays there. `paved` is for a verge somebody else has posted as footway, where the road keeps no bare shoulder of its own.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:96
---@param paved any
function editor_toolUtilities_networkState.heldPastEdge(paved) end

--- The surfaces are cached, and this is how a tool that has just moved something says so.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:63
function editor_toolUtilities_networkState.invalidate() end

--- Whether a ring lands on any of that. Asked of the network rather than worked out from `surfaces`, because a junction is
--- bounded partly by lines and testing against those is the network's own business.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:57
---@param ring any
function editor_toolUtilities_networkState.overRoad(ring) end

--- The network's side of the board, filled in once as the road tool loads. Everything below is a thin pass to one of these.
--- Fields: roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:29
---@param t any
function editor_toolUtilities_networkState.provide(t) end

--- The verges this owner has paved over, as `{ [groupId] = { left = spans, right = spans } }`, replacing whatever it posted
--- before. The network is told at once, because the blend under those slabs is painted terrain and has to be repainted.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:121
---@param owner any
---@param byGroup any
function editor_toolUtilities_networkState.publishFootway(owner, byGroup) end

--- Bumped whenever a road or junction is rebuilt, heights and all, for a tool that stands something on a road's surface.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:82
function editor_toolUtilities_networkState.rev() end

--- Every road the network has laid, as its plan geometry: `id`, `divPoints`, `tangents`, `binormals`. Junction hubs and
--- anything else that is not a road are left out, so a reader never has to know what kinds there are.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:35
function editor_toolUtilities_networkState.roads() end

--- Bumped whenever the network's surfaces change, for a tool that has to notice the road moved under its own ground.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:68
function editor_toolUtilities_networkState.sig() end

--- Every stretch of ground the network has surfaced, in plan: the closed rings of carriageway and sealed junction, and the
--- edge lines that bound no area of their own.
---Source : lua/ge/extensions/editor/toolUtilities/networkState.lua:49
function editor_toolUtilities_networkState.surfaces() end

