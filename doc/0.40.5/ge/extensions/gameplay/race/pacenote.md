# `gameplay_race_pacenote`

*File: `lua/ge/extensions/gameplay/race/pacenote.lua` · VM: Game Engine (GE) · 168 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/race/pacenote")` (file under extensions/ but not a regular extension)

Class of a co-driver call (pacenote) of a race path: a positioned sphere (manually or on a navgraph node) with a normal, a note text and the id of an associated segment. The module returns a factory: require('/lua/ge/extensions/gameplay/race/pacenote')(path, name, forceId). It is used by the race editor and for path serialization.

## Notes

- setNormal: when normal is nil, the default value vec3(0,1,0) is set but the function continues and calls normal:length() on nil: Lua error (no return).
- setNavgraph uses self.navRadiusScale and inside reads self.hasNormal, two fields never initialized in init (unlike pathnode): setNavgraph fails on an existing node, inside only tests the sphere.
- intersectCorners ignores hasNormal: it always uses the normal's plane.
- Possible modes: 'manual' or 'navgraph' (local modes list).
- onSerialize does not save the mode: deserialization always recreates the note in manual mode.

## Class `C`

Co-driver call. Fields: path, id, name, pos (vec3), normal (vec3, default (0,1,0)), radius, note (text), segment (id, -1 if none), sortOrder (999999 by default), mode, navgraphName.

The module returns a constructor: `local obj = require("gameplay_race_pacenote")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:drawDebug(drawMode, clr, extraText)` | Draws the sphere, the text (note, or "(name)" if empty) and the normal's arrows with debugDrawer. | 116 |
| `C:init(path, name, forceId)` | Constructor: assigns the id (forceId or path:getNextUniqueIdentifier()), the default name "Pacenote <id>", the null position, the empty note and the segment -1. | 8 |
| `C:inside(pos)` | Indicates whether a point is inside the call's sphere (and on the correct side of the normal if hasNormal). | 59 |
| `C:intersectCorners(fromCorners, toCorners)` | Tests whether one of the segments connecting a vehicle's corners (fromCorners[i] to toCorners[i]) crosses the call's plane inside the sphere. | 69 |
| `C:onDeserialized(data, oldIdMap)` | Restores the call (manual mode) from serialized data; converts the segment id with oldIdMap. | 108 |
| `C:onSerialize()` | Serializes the call: name, pos, radius, normal, oldId, note, segment. | 95 |
| `C:setManual(pos, radius, normal)` | Switches to manual mode with the given position, radius and normal (forgets the navgraph node name). | 34 |
| `C:setNavgraph(navgraphName, fallback)` | Switches to navgraph mode: takes position and radius from a road map node, or from fallback if the node does not exist. | 42 |
| `C:setNormal(normal)` | Sets the call's normal if its length exceeds 0.9 (it is then normalized). | 25 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/race/pacenote.lua`.*
