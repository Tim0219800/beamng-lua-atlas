---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mesh decimation for the Hero Road Editor, using the Ramer-Douglas-Peucker (RDP) algorithm. decimateStations reduces the number of stations (transverse slices) along the road; decimateCols reduces the number of columns (lateral points of a cross-section). Used by mesh.lua to build the levels of detail (LOD) and the collision mesh.
--- Access: extension `editor_heroRoadEditor_meshRefine`: `extensions.load("editor_heroRoadEditor_meshRefine")`, then the global `editor_heroRoadEditor_meshRefine`
---@class editor_heroRoadEditor_meshRefine
editor_heroRoadEditor_meshRefine = {}

--- Lateral decimation of the columns. Forces keeping column 1, the last one and any boundary between bands of different materials, then applies RDP to the interior columns with the MAXIMUM (o, dz) deviation over all stations: a column stays if the profile bends at any station (for example a crown that appears gradually keeps its apex columns).
---Source: lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua:129
---@param ptsA table ptsA[s] = cross-section of station s, an array of {o, dz} per column (lateral offset, vertical deviation).
---@param bandMat table One material per band (between columns c and c+1).
---@param tolM number Tolerance in meters.
---@param m integer Number of stations.
---@return integer[]  Sorted indices of the kept columns.
function editor_heroRoadEditor_meshRefine.decimateCols(ptsA, bandMat, tolM, m) end

--- Multi-channel RDP over stations 1..m: a station is kept if the centerline, the left edge (column 1) or the right edge (column numCols) deviates by more than the tolerance from the chord. Always keeps stations 1 and m and those in mustKeep. With tolZM, tolM only bounds the in-plane deviation and tolZM the vertical deviation (a plan chord only shifts an edge, a vertical chord creates a bump). A maxSegM cap reinserts original stations to cut overly long segments into roughly equal sub-segments (at best down to the original spacing).
---Source: lua/ge/extensions/editor/heroRoadEditor/meshRefine.lua:49
---@param centres table Centerline points per station (x, y, z).
---@param W table Grid of world points W[station][column]; only columns 1 and numCols are read.
---@param numCols integer Number of columns in the grid.
---@param tolM number Tolerance in meters (in-plane only if tolZM is provided, otherwise 3D deviation).
---@param m integer Number of stations.
---@param maxSegM number|nil Maximum arc length between two kept stations, in meters; nil or 0 to disable.
---@param mustKeep table<integer, boolean>|nil Set of station indices that must be kept.
---@param tolZM number|nil Vertical tolerance in meters; enables the two-tolerance mode.
---@return integer[]  Sorted indices of the kept stations.
function editor_heroRoadEditor_meshRefine.decimateStations(centres, W, numCols, tolM, m, maxSegM, mustKeep, tolZM) end

