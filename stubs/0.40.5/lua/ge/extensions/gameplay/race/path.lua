---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/race/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Race path. Main fields: id, name, description, authors, date, difficulty (24 by default), defaultLaps (1), config (autoConfig result), simplifyAiPath, hideMission, isReversed, aiPath, aiDetailedPath, aiPathDistance.
---@class gameplay_race_path
local gameplay_race_path = {}

--- Builds the automatic configuration in self.config: from the startNode, segment graph (successors, predecessors, lastInLap, targetNode, next visible segments), branching and closed indicators, linearPathnodes list for an unbranched route, and pacenotes associated with each segment (segmentToPacenotes).
---Source: lua/ge/extensions/gameplay/race/path.lua:57
function gameplay_race_path:autoConfig() end

--- Calls autoConfig and returns the path's classification: rolling start allowed, reversible, closed, branching.
---Source: lua/ge/extensions/gameplay/race/path.lua:606
---@return table  {allowRollingStart, reversible, closed, branching}
function gameplay_race_path:classify() end

--- Intended to duplicate the path; broken in this version (see notes).
---Source: lua/ge/extensions/gameplay/race/path.lua:382
---@return table  New path (in theory).
function gameplay_race_path:copy() end

--- Draws the AI's detailed path (1 m spheres and colored prisms) if it exists.
---Source: lua/ge/extensions/gameplay/race/path.lua:222
function gameplay_race_path:drawAiRouteDebug() end

--- Draws pathnodes, segments, start positions and pacenotes.
---Source: lua/ge/extensions/gameplay/race/path.lua:215
---@param drawMode string|nil Pathnode draw mode ('none', 'faded', 'normal', 'highlight').
function gameplay_race_path:drawDebug(drawMode) end

--- Ids of the valid segments whose start equals from and/or whose end equals to (nil = no filter).
---Source: lua/ge/extensions/gameplay/race/path.lua:194
---@param from integer|nil Start pathnode id.
---@param to integer|nil End pathnode id.
---@return integer[]  Segment ids.
function gameplay_race_path:findSegments(from, to) end

--- Looks for a start position by its name.
---Source: lua/ge/extensions/gameplay/race/path.lua:311
---@param name string Name.
---@return table|nil  startPosition found.
function gameplay_race_path:findStartPositionByName(name) end

--- Resets the path from scene objects (CameraBookmark/waypoints): one pathnode per object (radius = largest scale, normal if directionalWaypoint), segments in order.
---Source: lua/ge/extensions/gameplay/race/path.lua:427
---@param list userdata[] Scene objects (checkpoints).
---@param closed boolean|nil true for a closed circuit.
function gameplay_race_path:fromCheckpointList(list, closed) end

--- Resets the path and builds it from a list of checkpoints of an old scenario (positions read from the active scenario extensions.scenario_scenarios), linked in order by segments; the last one joins the first if closed.
---Source: lua/ge/extensions/gameplay/race/path.lua:399
---@param lapConfig string[] Checkpoint names.
---@param closed boolean|nil true for a closed circuit.
function gameplay_race_path:fromLapConfig(lapConfig, closed) end

--- Resets the path from a track description (old format): start/finish line, lapConfig, optional prefabs (auto-detected _forward and _reverse), segments, metadata and start positions of the spawn spheres.
---Source: lua/ge/extensions/gameplay/race/path.lua:469
---@param trackInfo table Track data (originalInfo.lapConfig, startLineCheckpoint, finishLineCheckpoint, closed, spawnSpheres, prefabs, lapCount...).
---@param usePrefabs boolean|nil true to temporarily spawn the prefabs during the conversion.
---@return boolean|nil  true if successful, nil if a checkpoint is not found.
function gameplay_race_path:fromTrack(trackInfo, usePrefabs) end

--- Computes the AI path from the configuration: list of road nodes (names) close to each pathnode, then detailed path via the route module. Returns two empty tables if the configuration is not ready. Stops at branchings.
---Source: lua/ge/extensions/gameplay/race/path.lua:245
---@return string[]  Road node names (base path).
---@return table[]  Detailed path (points with pos and wp).
function gameplay_race_path:getAiPath() end

--- Last pathnode of the sorted list.
---Source: lua/ge/extensions/gameplay/race/path.lua:638
---@return table|nil  Pathnode.
function gameplay_race_path:getLastPathnode() end

--- Returns an increasing unique identifier for the path's objects.
---Source: lua/ge/extensions/gameplay/race/path.lua:7
---@return integer  New id.
function gameplay_race_path:getNextUniqueIdentifier() end

--- Constructor / reset: default values, empty collections. The name argument is ignored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/race/path.lua:14
---@param name string|nil Ignored.
function gameplay_race_path:init(name) end

--- Restores the path from serialized data (clears then recreates the collections, converts the ids with an oldIdMap table).
---Source: lua/ge/extensions/gameplay/race/path.lua:352
---@param data table|nil Data from onSerialize.
function gameplay_race_path:onDeserialized(data) end

--- Serializes the path into a JSON table (metadata, collections, start/end ids, prefabs, classification, options).
---Source: lua/ge/extensions/gameplay/race/path.lua:320
---@return table  JSON data.
function gameplay_race_path:onSerialize() end

--- Recreates the segments by linking the pathnodes in sorted order.
---Source: lua/ge/extensions/gameplay/race/path.lua:629
function gameplay_race_path:recalculateSegments() end

--- Reverses the path direction: swaps startNode and endNode, swaps from/to of the segments, toggles isReversed.
---Source: lua/ge/extensions/gameplay/race/path.lua:389
function gameplay_race_path:reverse() end

