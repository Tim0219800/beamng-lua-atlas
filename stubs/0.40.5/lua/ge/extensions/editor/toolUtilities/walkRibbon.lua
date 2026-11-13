---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/walkRibbon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_walkRibbon` : `extensions.load("editor_toolUtilities_walkRibbon")`, puis la globale `editor_toolUtilities_walkRibbon`
---@class editor_toolUtilities_walkRibbon
---@field crossingDepthM number
---@field crossingRampM number
editor_toolUtilities_walkRibbon = {}

--- Sweep the walk between two matching rails of { x, y, z }: the kerb line on the road and the back of the paving.
---  opts: parts, paving, variant, caps (default true), scale (per-station kerb height, 0 is dropped), uvs (paving flags to
---  the metre), worldUv (lay the paving from world x,y), uRail (line the along-run UVs are measured on), bury, back.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:73
---@param inner any
---@param outer any
---@param opts any
function editor_toolUtilities_walkRibbon.build(inner, outer, opts) end

--- Densifies inner/outer within each crossing band (to ~crossingSampleM) and returns the densified rails + the per-station
---  dip multiplier. Without the densification a coarse rail can have NO station inside the crossing band, so nothing
---  sinks and the walk stays full-height across the zebra -- exactly the "not dipping" case. `crossings` are a road's
---  { t, depthM } and `div` its centreline. Returns the ORIGINAL rails + nil when the road has no crossings.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:261
---@param crossings any
---@param div any
---@param inner any
---@param outer any
function editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer) end

--- The per-station kerb-height multiplier for a walk crossed by pedestrian crossings: flush over each crossing, ramped
---  either side. `cum`, `centres` and `depths` are all arc lengths on the rail the walk is swept along. nil where none reach.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:190
---@param cum any
---@param centres any
---@param depths any
function editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths) end

--- How far the walking surface stands above the road the inner rail sits on.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:320
function editor_toolUtilities_walkRibbon.rise() end

--- How far out from the inner rail the outer one belongs: the kerb plus one paving stone.
---Source : lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:315
function editor_toolUtilities_walkRibbon.width() end

