---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteWater.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Standing and falling water of a "site" (open space editor): waterfall basins, sheets that overflow between them, jets, sprays and foam jets (particle emitter BNGP_sprinkler). Water is not a mesh and therefore cannot be baked into a shell; the site manifest carries it as numbers and everything that assembles the site recreates the objects (WaterBlock, River, ParticleEmitterNode). Everything starts from a single record, expressed in the site's frame: an anchor point and an angle set the whole placement.
--- Access: extension `editor_toolUtilities_siteWater`: `extensions.load("editor_toolUtilities_siteWater")`, then the global `editor_toolUtilities_siteWater`
---@class editor_toolUtilities_siteWater
editor_toolUtilities_siteWater = {}

--- Floods what the point of interest has placed (basins), then attaches a sheet to each face of each basin that overflows, with foam sprays, then the crowns (jets and weirs). Empties the folder first.
---Source: lua/ge/extensions/editor/toolUtilities/siteWater.lua:305
---@param ca table|nil Editor record: pools, falls, crowns, flow, sprayPow, sprayVar, spraySeed.
---@param folder userdata|nil Scene folder (SimGroup) that receives the objects.
---@param tag string|nil Name of the site that assembles the water, so that two identical sites on a map do not have the same object names (default 'site').
---@return table|nil  Ids of the created objects (nil if no basins or no folder).
---@return table|nil  Names of the created objects.
function editor_toolUtilities_siteWater.build(ca, folder, tag) end

--- Makes each object persistent (canSave and cansave set to true) and returns their names, which is used to undo a burn.
---Source: lua/ge/extensions/editor/toolUtilities/siteWater.lua:338
---@param ids table|nil Ids returned by build.
---@return table<integer, string>  Names of the objects found and named.
function editor_toolUtilities_siteWater.commit(ids) end

--- Produces the manifest record, in the site's frame: only what build reads (basins, crowns, sheets, flow, sprays). Positions relative to (ox, oy, oz), basins and crowns relative to the anchor.
---Source: lua/ge/extensions/editor/toolUtilities/siteWater.lua:356
---@param ca table|nil Editor record (must have non-empty pools).
---@param ox number X of the site origin.
---@param oy number Y of the site origin.
---@param oz number Z of the site origin.
---@return table|nil  Manifest record, nil if there is no basin.
function editor_toolUtilities_siteWater.localise(ca, ox, oy, oz) end

--- Inverse operation: places a manifest record at a position and heading, ready for build. The anchor rotates around the placement and the angle is added to its own. (ox, oy) is the point of the site's frame around which the placement rotates (the middle of the footprint).
---Source: lua/ge/extensions/editor/toolUtilities/siteWater.lua:391
---@param rec table|nil Manifest record (with pools).
---@param px number World X of the placement.
---@param py number World Y of the placement.
---@param pz number Base world Z.
---@param yaw number|nil Heading in radians (0 by default).
---@param ox number|nil X of the pivot point in the site's frame (0 by default).
---@param oy number|nil Y of the pivot point in the site's frame (0 by default).
---@return table|nil  World record, with ct and sn (cosine and sine of the heading); nil if rec is invalid.
function editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy) end

--- Removes everything wet under a folder: objects of the WaterBlock, River and ParticleEmitterNode classes.
---Source: lua/ge/extensions/editor/toolUtilities/siteWater.lua:293
---@param folder userdata|nil Scene folder; no effect if nil.
function editor_toolUtilities_siteWater.remove(folder) end

