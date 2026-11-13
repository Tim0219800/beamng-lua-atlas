---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundBounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_groundBounds` : `extensions.load("editor_toolUtilities_groundBounds")`, puis la globale `editor_toolUtilities_groundBounds`
---@class editor_toolUtilities_groundBounds
editor_toolUtilities_groundBounds = {}

--- The outline minus everything above, as a list of `{ ring, holes, cut, flush }` to surface one at a time.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:122
---@param ring any
---@param obs any
---@param owner any
---@param site any
function editor_toolUtilities_groundBounds.clip(ring, obs, owner, site) end

--- The biggest of them, for a tool that lays ONE thing on its outline rather than one per piece. A car park cut in two by a
--- road is two car parks, and the second is a second lot to draw -- not something to infer from the first.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:157
---@param areas any
function editor_toolUtilities_groundBounds.largest(areas) end

--- Everything near this outline that `owner` may not pave: road and junction surfaces, and every claim another ground tool
--- has staked -- a placed building's footprint, a park. `site` is the shelf folder of the site being edited, if it has one:
--- wherever a copy of it already stands, that copy is this outline and not something in its way. `roadMargin` keeps it
--- further off the roads than the default.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:40
---@param ring any
---@param owner any
---@param site any
---@param roadMargin any
function editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin) end

--- Which clipped piece a point is on, if it is on one at all. What everything standing round the perimeter asks before it
--- stands -- a flight of steps, a lamp on the wall -- and the flights want the piece itself, since the wall is laid one
--- piece at a time and a flight has to open the one it comes through.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:169
---@param areas any
---@param x any
---@param y any
function editor_toolUtilities_groundBounds.pieceAt(areas, x, y) end

--- Tell the other ground tools what this one is standing on. No margin: two surfaces meeting should read as one, and a gap
--- would show as a strip of bare terrain the width of whatever was allowed.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:184
---@param owner any
---@param rings any
function editor_toolUtilities_groundBounds.publish(owner, rings) end

--- A fingerprint of everything outside an outline that its shape depends on, so a road or a building moved under one rebuilds
--- it. Asked every frame of every outline, so neither half builds a ring to answer: the roads fingerprint what a scan would
--- read without scanning, and a claim is counted when it is published rather than measured here.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:189
function editor_toolUtilities_groundBounds.sig() end

