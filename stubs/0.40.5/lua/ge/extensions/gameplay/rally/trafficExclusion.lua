---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/trafficExclusion.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes spherical exclusion zones for AI traffic along the rally special stages, then applies them to the navgraph (`map.setTrafficExclusionZones` + `map.reset`) so that traffic does not drive on the course. The zones come from the driveline (drivelineV3) of each `rallyStage` mission, sampled every 1.5 x radius, and, for a loop, from an optional `trafficGatedRoads.grzones.json` file in the mission folder. Default radius: 10 m.
--- Access: extension `gameplay_rally_trafficExclusion`: `extensions.load("gameplay_rally_trafficExclusion")`, then the global `gameplay_rally_trafficExclusion`
---@class gameplay_rally_trafficExclusion
gameplay_rally_trafficExclusion = {}

--- Applies the traffic exclusion for a loop: finds the missions via extractMissionIdsFromRallyLoop, creates the zones, adds the spheres of the optional trafficGatedRoads.grzones.json file (spheres field with pos {x,y,z} and radius), then calls map.setTrafficExclusionZones and map.reset().
---Source: lua/ge/extensions/gameplay/rally/trafficExclusion.lua:211
---@param loopMission table Loop mission.
---@param radius number|nil Radius of the zones coming from the special stages; default 10.
---@return table[]  Applied zones ({pos, radius}); empty table if loopMission is nil.
function gameplay_rally_trafficExclusion.applyForRallyLoop(loopMission, radius) end

--- Removes all the exclusion zones (map.clearTrafficExclusionZones) and reloads the navgraph (map.reset).
---Source: lua/ge/extensions/gameplay/rally/trafficExclusion.lua:258
function gameplay_rally_trafficExclusion.clearTrafficExclusion() end

--- Builds the list of exclusion zones for rally missions. For each `rallyStage` mission, loads the driveline and samples its points every 1.5 x radius.
---Source: lua/ge/extensions/gameplay/rally/trafficExclusion.lua:101
---@param missions table[]|nil Missions (gameplay_missions_missions objects). If empty or nil, uses the rally editor's mission.
---@param radius number|nil Radius of the zones in meters; default 10.
---@return table[]  List of {pos = vec3, radius = number}; empty if nothing is available.
function gameplay_rally_trafficExclusion.createZones(missions, radius) end

--- Reads mission.fgVariables of a loop mission and returns the ids of the missions used, in order: for each stage 1 to 4, the road section (`stageN_rallyRoadSection`) then the special stage (`stageN_rallyStage`), finally `return_rallyRoadSection`. The values have the format "Name (id)"; `<none>` is ignored.
---Source: lua/ge/extensions/gameplay/rally/trafficExclusion.lua:151
---@param mission table Loop-type mission (with fgVariables).
---@return string[]  Mission ids; empty if fgVariables is absent.
function gameplay_rally_trafficExclusion.extractMissionIdsFromRallyLoop(mission) end

--- Returns the default radius of the zones.
---Source: lua/ge/extensions/gameplay/rally/trafficExclusion.lua:268
---@return number  10 (meters).
function gameplay_rally_trafficExclusion.getDefaultRadius() end

