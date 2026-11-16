---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundClaims.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared registry of "ground claims" between the editor tools that lay surfaces on the terrain. Each tool publishes, under an owner name, the rings (outlines) it occupies and the margin to respect; the other tools read these rings so as not to encroach on them. A revision counter and fingerprints (fp) make it possible to detect that another tool has moved its terrain.
--- Access: extension `editor_toolUtilities_groundClaims`: `extensions.load("editor_toolUtilities_groundClaims")`, then the global `editor_toolUtilities_groundClaims`
---@class editor_toolUtilities_groundClaims
editor_toolUtilities_groundClaims = {}

--- Clears an owner's claim (publish without a ring).
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:71
---@param owner any Owner name.
function editor_toolUtilities_groundClaims.clear(owner) end

--- For each other owner, its fingerprint fp and the box {x0, y0, x1, y1} that its terrain covers, margin included. Used to know WHERE another's terrain has moved.
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:63
---@param owner any Owner excluded from the result.
---@return table<any, table>  owner -> { fp, box }.
function editor_toolUtilities_groundClaims.extents(owner) end

--- Like others, but each ring is enlarged by the margin requested by its owner (geom.outsetClosedRing2D): what must be subtracted from one's own terrain. A claim without margin is returned as is.
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:92
---@param out table|nil Output list.
---@param owner any Excluded owner.
---@return table  The out list.
function editor_toolUtilities_groundClaims.keepOut(out, owner) end

--- Everything that is near ring and that its owner must not cover: the supplied road rings enlarged by roadMargin, plus the claim of each other tool enlarged by its margin. Only elements whose box touches that of ring are kept.
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:107
---@param ring table Outline tested (at least 3 points); otherwise returns two empty tables.
---@param owner any Excluded owner.
---@param roadRings table[]|nil Road rings supplied by the caller.
---@param roadMargin number|nil Margin applied to roads (m).
---@param pad number|nil Enlarges the box that defines "near".
---@param skip any|nil Ignores the rings carrying this label (a site being edited does not obstruct itself).
---@return table[]  Obstacle rings.
---@return table<table, boolean>  Set of the output rings that are roads.
function editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip) end

--- Adds to out all the rings of the other owners (without the margin). The exclusion prevents a tool from subtracting its own terrain from itself.
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:77
---@param out table|nil Output list (created if nil).
---@param owner any Excluded owner.
---@param flushOnly boolean|nil Keeps only the claims without margin (terrain that we join flush with).
---@param tags table|nil If provided, receives the label of each ring (false if none) at the ring's index in out.
---@return table  The out list.
function editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags) end

--- Replaces everything this owner holds with the given rings, with the margin that the others must respect. Increments the revision only if the content changed.
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:32
---@param owner any Owner name (table key); nil = no effect.
---@param rings table[]|nil Rings of points {x, y}; those with fewer than 3 points are ignored.
---@param margin number|nil Margin (m) that the other tools leave around; default 0 (flush junction).
---@param tags table|nil Label per ring (same index as rings), so that a tool editing this thing ignores its own copies (see obstructions).
function editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags) end

--- Revision counter, incremented on every publication that changes something. Lets a tool notice that another's terrain has moved without knowing it directly.
---Source: lua/ge/extensions/editor/toolUtilities/groundClaims.lua:150
---@return integer  Current revision.
function editor_toolUtilities_groundClaims.sig() end

