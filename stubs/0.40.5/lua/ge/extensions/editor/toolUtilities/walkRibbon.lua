---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/walkRibbon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generates a bordered sidewalk (curb and slabs) swept along two rails, as a single unique mesh, for the editor's road tools. The mesh parts are grouped by material (two sidewalks of the same stone share one mesh, so a single draw). Also handles curbs lowered at crosswalks: the sidewalk becomes flush over the crossing area and ramps back up on each side. Uses meshPart (face4, face4n) and kerbSpec (curb materials and dimensions).
--- Access: extension `editor_toolUtilities_walkRibbon`: `extensions.load("editor_toolUtilities_walkRibbon")`, then the global `editor_toolUtilities_walkRibbon`
---@class editor_toolUtilities_walkRibbon
---@field crossingDepthM number Default length of the flat part when the crossing gives no indication (3.5 m).
---@field crossingRampM number Length of the ramp on each side of a lowered crossing (1.5 m).
editor_toolUtilities_walkRibbon = {}

--- Sweeps the sidewalk between two matching rails: the curb line on the road and the bottom of the paving. Adds faces to opts.parts (one mesh per material). The options: parts (required, list of parts), paving (slab material, default that of kerbSpec), variant (curb variant), caps (close the ends, true by default), scale (curb height per station, 0 = curb removed), uvs (number of slabs per meter), worldUv (lay the paving from world x,y), uRail (rail on which to measure the lengthwise UVs), bury (buried depth), back (false to not close the bottom).
---Source: lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:73
---@param inner table Inner rail, list of { x, y, z } (curb line).
---@param outer table Outer rail, list of { x, y, z } (bottom of the paving).
---@param opts table Options described above; opts.parts required.
---@return integer  Number of triangles written (0 if nothing).
function editor_toolUtilities_walkRibbon.build(inner, outer, opts) end

--- Densifies inner/outer in the band of each crosswalk (about every 0.4 m) and returns the densified rails with the per-station lowering multiplier. Crosswalk centers are projected onto the rail from the position t along the centerline. Returns the ORIGINAL rails and nil if the road has no crosswalk or centerline.
---Source: lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:261
---@param crossings table|nil Crosswalks of the road, list of { t (0..1, 0.5 by default), depthM }.
---@param div table Centerline of the road (list of points).
---@param inner table Inner rail.
---@param outer table Outer rail.
---@return table  Inner rail (densified or original).
---@return table  Outer rail.
---@return number[]|nil  Multiplier per station, nil if there is no crosswalk.
function editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer) end

--- Curb height multiplier per station for a sidewalk crossed by crosswalks: 0 (flush) on each crosswalk, ramp on either side, 1 elsewhere. `cum`, `centres` and `depths` are arc-length abscissas along the rail. nil if no crosswalk reaches the sidewalk.
---Source: lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:190
---@param cum number[] Cumulative arc-length abscissa of each station.
---@param centres number[] Abscissa of the center of each crosswalk.
---@param depths number[]|nil Depth (m) of each crosswalk; 3.5 by default.
---@return number[]|nil  One multiplier per station between 0 and 1.
function editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths) end

--- Height of the walking surface above the road on which the inner rail rests (kerbH from kerbSpec).
---Source: lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:320
---@return number  Height in meters.
function editor_toolUtilities_walkRibbon.rise() end

--- Distance by which the outer rail must be offset from the inner one: the curb plus one slab (kerbW + slabW from kerbSpec).
---Source: lua/ge/extensions/editor/toolUtilities/walkRibbon.lua:315
---@return number  Width in meters.
function editor_toolUtilities_walkRibbon.width() end

