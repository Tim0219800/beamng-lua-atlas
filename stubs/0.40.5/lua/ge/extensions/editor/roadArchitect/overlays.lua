---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/overlays.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generation of the overlay roads of Road Architect junctions: fictitious trajectory lines crossing the junction, from an entry lane to an exit lane. Each function adds to the roads array a road marked isOverlay, isJctRoad and not drivable (isDrivable = false), with a profile created by profileMgr.createOverlayProfile, and adds its name to jct.roads. Lanes and exits are drawn at random with math.randomseed(jct.seed[0]), so the result is reproducible for the same seed. The number of overlays is jct.numCrossings[0]. Called by the Road Architect junction manager when finalizing a junction.
--- Access: extension `editor_roadArchitect_overlays`: `extensions.load("editor_roadArchitect_overlays")`, then the global `editor_roadArchitect_overlays`
---@class editor_roadArchitect_overlays
editor_roadArchitect_overlays = {}

--- Adds jct.numCrossings[0] overlay roads to a 4-branch crossroads (roads jct.roads[5..8]): a trajectory between an exit lane of one branch and an entry lane of another, smoothed by chordal Catmull-Rom points.
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:17
---@param jct table Junction table (roads, seed, numCrossings, laneWidthX...).
function editor_roadArchitect_overlays.addCrossroadsOverlays(jct) end

--- Adds overlay roads to a highway merge junction (roads jct.roads[1..3]): one trajectory per crossing that starts from a lane of road 1, passes onto road 2 (with a possible random one-lane change) then onto road 3.
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:367
---@param jct table Junction table (numLanesX, laneWidthX, numCrossings, seed, roads).
function editor_roadArchitect_overlays.addHighwayMergeOverlays(jct) end

--- Adds overlay roads to a highway junction with slip roads (main roads jct.roads[1..4] and entry/exit slip roads jct.roads[5] and [6]).
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:457
---@param jct table Slip road junction table.
function editor_roadArchitect_overlays.addHighwaySlipOverlays(jct) end

--- Adds overlay roads to a highway-urban transition junction (roads jct.roads[1..3]), on the same principle as the highway merge.
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:412
---@param jct table Transition junction table.
function editor_roadArchitect_overlays.addHighwayTransOverlays(jct) end

--- Adds overlay roads to a roundabout (branches jct.roads[5..8], ring jct.roads[9]): each trajectory goes through an arc of the ring, built by rotating the radius vector around the vertical axis in 45-degree steps (17 points) for each of the ring's jct.numRBLanes[0] lanes.
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:265
---@param jct table Roundabout junction table.
---@param cen vec3 Center of the roundabout.
function editor_roadArchitect_overlays.addRoundaboutOverlays(jct, cen) end

--- Adds jct.numCrossings[0] overlay roads to a T junction (roads jct.roads[4..6]), with the same lane drawing and smoothing method as for a crossroads.
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:121
---@param jct table T junction table.
function editor_roadArchitect_overlays.addTJunctionOverlays(jct) end

--- Adds overlay roads to a Y junction. Handles one-way branches (jct.isYOneWay[0]) and their orientation (isY1Outwards, isY2Outwards) to reverse the point direction if needed.
---Source: lua/ge/extensions/editor/roadArchitect/overlays.lua:205
---@param jct table Y junction table.
function editor_roadArchitect_overlays.addYJunctionOverlays(jct) end

