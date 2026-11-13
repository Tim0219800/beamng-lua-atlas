---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/polyBool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_polyBool` : `extensions.load("editor_toolUtilities_polyBool")`, puis la globale `editor_toolUtilities_polyBool`
---@class editor_toolUtilities_polyBool
editor_toolUtilities_polyBool = {}

--- Sort a boolean result's flat ring list into outer rings each carrying its own holes, wound CCW outside and CW inside so a
--- triangulator can take them as they come. Nesting is by containment depth: even is solid, odd is a hole.
--- The companion to `difference` -- subtracting one shape from another is what produces a ring list that has to be read this
--- way, and every caller that cuts real ground out of real ground needs the same answer from it.
---Source : lua/ge/extensions/editor/toolUtilities/polyBool.lua:829
---@param regions any
function editor_toolUtilities_polyBool.areas(regions) end

--- Boolean difference: subject minus clip; accepts the same flexible input as normalize. Local-frame like unionMany.
---Source : lua/ge/extensions/editor/toolUtilities/polyBool.lua:774
---@param subject any
---@param clip any
function editor_toolUtilities_polyBool.difference(subject, clip) end

--- Unions many polys. Works in a local frame near the origin so the absolute epsilon does not underflow at world coords.
---Source : lua/ge/extensions/editor/toolUtilities/polyBool.lua:744
---@param polys any
function editor_toolUtilities_polyBool.unionMany(polys) end

