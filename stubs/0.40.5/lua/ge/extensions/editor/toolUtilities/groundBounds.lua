---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundBounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Answers the questions that any editor tool laying a surface on an outline drawn on the ground must ask: what is already there (roads, junctions, buildings, terrains of other tools), what remains of the outline once these obstacles are subtracted, and which sides are cut or flush. Also does the reverse: publishing what the tool occupies. Relies on groundClaims, networkState, polyBool and geom.
--- Access: extension `editor_toolUtilities_groundBounds`: `extensions.load("editor_toolUtilities_groundBounds")`, then the global `editor_toolUtilities_groundBounds`
---@class editor_toolUtilities_groundBounds
editor_toolUtilities_groundBounds = {}

--- Subtracts the obstacles from the outline and returns the remaining pieces to process one by one. Each piece is { ring, holes, cut, flush }: cut[i] true if side i comes from a subtraction (road or building on the other side), flush[i] true if it touches a terrain already laid by another tool (open junction).
---Source: lua/ge/extensions/editor/toolUtilities/groundBounds.lua:122
---@param ring table Outline (at least 3 points); otherwise returns {}.
---@param obs table[]|nil Obstacles (result of obstacles); without an obstacle, a single piece equal to the outline.
---@param owner any Owner to exclude.
---@param site any|nil Ignored site label.
---@return table[]  List of pieces { ring, holes, cut, flush }.
function editor_toolUtilities_groundBounds.clip(ring, obs, owner, site) end

--- Returns the largest piece (by absolute area), for a tool that lays only ONE thing on its outline.
---Source: lua/ge/extensions/editor/toolUtilities/groundBounds.lua:157
---@param areas table[]|nil Pieces from clip.
---@return table|nil  The largest piece, or nil.
function editor_toolUtilities_groundBounds.largest(areas) end

--- Lists what owner must not pave near this outline: road and junction surfaces (networkState.surfaces, with at least 0.10 m margin) and the claims of the other tools. Also returns a second list where roads are enlarged by 0.6 m, to place set-back elements there.
---Source: lua/ge/extensions/editor/toolUtilities/groundBounds.lua:40
---@param ring table Site outline (points {x, y}).
---@param owner any Name of the owner to exclude.
---@param site any|nil Folder (label) of the site being edited: where a copy already exists, it is the outline and not an obstacle.
---@param roadMargin number|nil Road margin greater than the default.
---@return table[]  Obstacle rings.
---@return table[]  Same obstacles, roads enlarged by 0.6 m.
function editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin) end

--- Indicates which piece a point falls on (inside the ring and outside its holes), or nil if it is on none.
---Source: lua/ge/extensions/editor/toolUtilities/groundBounds.lua:169
---@param areas table[]|nil Pieces from clip.
---@param x number World X.
---@param y number World Y.
---@return integer|nil  Index of the piece in areas, or nil.
function editor_toolUtilities_groundBounds.pieceAt(areas, x, y) end

--- Announces to the other terrain tools what this one occupies, without margin (groundClaims.publish with margin 0), so that two adjacent surfaces read as a single one.
---Source: lua/ge/extensions/editor/toolUtilities/groundBounds.lua:184
---@param owner any Owner name.
---@param rings table[] Occupied rings.
function editor_toolUtilities_groundBounds.publish(owner, rings) end

--- Fingerprint of everything that, outside the outline, determines its shape (road network and claims), to rebuild when a road or building moves. Computed every frame without building a ring.
---Source: lua/ge/extensions/editor/toolUtilities/groundBounds.lua:189
---@return number  networkState.sig() + groundClaims.sig() * 104729.
function editor_toolUtilities_groundBounds.sig() end

