# `gameplay_race_path`

*File: `lua/ge/extensions/gameplay/race/path.lua` · VM: Game Engine (GE) · 648 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/race/path")` (file under extensions/ but not a regular extension)

Race path class: container of pathnodes, segments, start positions (startPositions) and pacenotes, with metadata (name, authors, difficulty, default laps, prefabs). It builds a route configuration (autoConfig: segment graph, branching, closed circuit, linear route), classifies it (classify), computes a path for the AI, serializes itself to JSON and can be converted from old formats (scenarios, scene checkpoints, 'tracks'). The module returns a factory: require('/lua/ge/extensions/gameplay/race/path')(name). It is used by the race editor and by race.lua.

## Notes

- init(name) ignores its argument: the name stays "Path" (hardcoded value). copy() passes a name, with no effect.
- copy() is broken: it calls cpy.onDeserialized(self.onSerialize()) with a dot instead of a colon, so without self (Lua error).
- autoConfig references a global variable reverse (never defined): targetNode is always seg.to.
- autoConfig assumes there is only one first segment; startNode must exist (otherwise empty config).
- classify() calls autoConfig then reads the startPositions and pathnodes of invalid ids: a 'missing' object is returned by sortedList for an absent id; classify fails if endNode matches nothing and the circuit is not validly closed.
- Identifier fields: startNode, endNode, defaultStartPosition, reverseStartPosition, rollingStartPosition, rollingReverseStartPosition (-1 if not defined); prefab fields: prefabs, forwardPrefabs, reversePrefabs.
- The four collections (pathnodes, segments, startPositions, pacenotes) are gameplay/util/sortedList with .objects (by id), .sorted (sorted list), create, clear.
- postCreate: the first pathnode created becomes startNode, the first start position becomes defaultStartPosition.
- getAiPath does not handle paths with branching; it uses map.findClosestRoad to associate each pathnode with a road node.
- reverse() swaps from/to of all segments and swaps startNode/endNode (if endNode is defined); the startPositions do not change.

## Class `C`

Race path. Main fields: id, name, description, authors, date, difficulty (24 by default), defaultLaps (1), config (autoConfig result), simplifyAiPath, hideMission, isReversed, aiPath, aiDetailedPath, aiPathDistance.

The module returns a constructor: `local obj = require("gameplay_race_path")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:autoConfig()` | Builds the automatic configuration in self.config: from the startNode, segment graph (successors, predecessors, lastInLap, targetNode, next visible segments), branching and closed indicators, linearPathnodes list for an unbranched route, and pacenotes associated with each segment (segmentToPacenotes). | 57 |
| `C:classify()` | Calls autoConfig and returns the path's classification: rolling start allowed, reversible, closed, branching. | 606 |
| `C:copy()` | Intended to duplicate the path; broken in this version (see notes). | 382 |
| `C:drawAiRouteDebug()` | Draws the AI's detailed path (1 m spheres and colored prisms) if it exists. | 222 |
| `C:drawDebug(drawMode)` | Draws pathnodes, segments, start positions and pacenotes. | 215 |
| `C:findSegments(from, to)` | Ids of the valid segments whose start equals from and/or whose end equals to (nil = no filter). | 194 |
| `C:findStartPositionByName(name)` | Looks for a start position by its name. | 311 |
| `C:fromCheckpointList(list, closed)` | Resets the path from scene objects (CameraBookmark/waypoints): one pathnode per object (radius = largest scale, normal if directionalWaypoint), segments in order. | 427 |
| `C:fromLapConfig(lapConfig, closed)` | Resets the path and builds it from a list of checkpoints of an old scenario (positions read from the active scenario extensions.scenario_scenarios), linked in order by segments; the last one joins the first if closed. | 399 |
| `C:fromTrack(trackInfo, usePrefabs)` | Resets the path from a track description (old format): start/finish line, lapConfig, optional prefabs (auto-detected _forward and _reverse), segments, metadata and start positions of the spawn spheres. | 469 |
| `C:getAiPath()` | Computes the AI path from the configuration: list of road nodes (names) close to each pathnode, then detailed path via the route module. Returns two empty tables if the configuration is not ready. Stops at branchings. | 245 |
| `C:getLastPathnode()` | Last pathnode of the sorted list. | 638 |
| `C:getNextUniqueIdentifier()` | Returns an increasing unique identifier for the path's objects. | 7 |
| `C:init(name)` | Constructor / reset: default values, empty collections. The name argument is ignored. | 14 |
| `C:onDeserialized(data)` | Restores the path from serialized data (clears then recreates the collections, converts the ids with an oldIdMap table). | 352 |
| `C:onSerialize()` | Serializes the path into a JSON table (metadata, collections, start/end ids, prefabs, classification, options). | 320 |
| `C:recalculateSegments()` | Recreates the segments by linking the pathnodes in sorted order. | 629 |
| `C:reverse()` | Reverses the path direction: swaps startNode and endNode, swaps from/to of the segments, toggles isReversed. | 389 |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/race/path.lua`.*
