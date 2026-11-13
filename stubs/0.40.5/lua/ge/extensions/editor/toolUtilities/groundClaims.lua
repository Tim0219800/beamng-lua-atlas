---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundClaims.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_groundClaims` : `extensions.load("editor_toolUtilities_groundClaims")`, puis la globale `editor_toolUtilities_groundClaims`
---@class editor_toolUtilities_groundClaims
editor_toolUtilities_groundClaims = {}

---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:71
---@param owner any
function editor_toolUtilities_groundClaims.clear(owner) end

--- Every other owner's fingerprint and the box its ground covers, margin included: what a tool diffs to find WHERE somebody
--- else's ground moved, rather than only that it did.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:63
---@param owner any
function editor_toolUtilities_groundClaims.extents(owner) end

--- The same, but each ring grown by the margin its owner asked for -- what to subtract from ground of your own, as against
--- what to test a seam against. A claim asking for nothing comes back unchanged, which is the flush join.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:92
---@param out any
---@param owner any
function editor_toolUtilities_groundClaims.keepOut(out, owner) end

--- Everything near `ring` that its owner may not surface: the road rings it is HANDED, grown by `roadMargin`, plus every
--- other tool's claim grown by whatever that tool asked for. `pad` widens the box what counts as near is taken from. `skip`
--- leaves out every ring tagged with it: a site opened for editing is not in the way of itself where a copy of it stands.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:107
---@param ring any
---@param owner any
---@param roadRings any
---@param roadMargin any
---@param pad any
---@param skip any
function editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip) end

--- Every claim except one owner's own, appended to `out`. The exclusion is what lets a tool read this without subtracting its
--- own ground from itself. `flushOnly` keeps only the claims asking for no margin: the ground a surface meets as one.
--- `tags`, when given, gets each ring's tag (false for none) at the ring's index in `out`. A ring tagged 'buried' is ground
--- held over something under it, a tunnel's cover: plants may stand on it.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:77
---@param out any
---@param owner any
---@param flushOnly any
---@param tags any
function editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags) end

--- Everything this owner holds, replacing whatever it held before, and how far off it everyone else stops. Rings are taken as
--- given and not copied: a caller that goes on mutating its own outlines has to publish again anyway, which is the same rule
--- its own rebuild follows. `tags`, when given, names what each ring is a copy of, so a tool editing that very thing can
--- leave its own copies out (see `obstructions`).
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:32
---@param owner any
---@param rings any
---@param margin any
---@param tags any
function editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags) end

--- Bumped whenever anything is published. For a tool that has to notice somebody else's ground moved under its own, which it
--- cannot be told about directly without the two tools knowing each other.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:150
function editor_toolUtilities_groundClaims.sig() end

