# `gameplay_race_pathnode`

*File: `lua/ge/extensions/gameplay/race/pathnode.lua` · VM: Game Engine (GE) · 319 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/race/pathnode")` (file under extensions/ but not a regular extension)

Class of a race path checkpoint (pathnode): a sphere with radius and optional normal, positioned manually or on a navgraph node. Handles the recovery zones (recovery/reverseRecovery), side padding (sidePadding), custom fields, associated road points and the generation of scenery transforms on the sides. The module returns a factory: require('/lua/ge/extensions/gameplay/race/pathnode')(path, name, forceId).

## Notes

- Fields: id, name, mode ('manual' or 'navgraph'), pos, normal (nil without direction), hasNormal, radius, navRadiusScale (1), visible (true), useAsSplit (true, counts as a split time), recovery and reverseRecovery (startPosition id, -1 if none), sidePadding (vec3: x = left, y = right), customFields, sortOrder.
- getSideTransforms temporarily disables forest collision during its raycasts (core_forest).
- getPaddedCenter uses self.normal: error if the pathnode has no normal (hasNormal false).
- setNavRadiusScale reads map.getMap().nodes[navgraphName] without checking that the node exists.
- onSerialize does not save the list of road points (they are recomputed).

## Class `C`

Race checkpoint. The angles passed to getSideTransforms are in radians.

The module returns a constructor: `local obj = require("gameplay_race_pathnode")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:convertRayHitToTransform(hit, pRot, zOff, scl, side, alignMode)` | Converts the result of a raycast into a scenery object transform: position offset by zOff along the ground normal, scale, rotation according to alignMode. | 248 |
| `C:drawDebug(drawMode, clr, extraText)` | Draws sphere, label (prefix '*' if useAsSplit, in parentheses if invisible), numeric custom fields (if the editor preference raceEditor.general.showCustomFields is active) and normal arrows. | 174 |
| `C:getPaddedCenter()` | Center and width of the pathnode's useful area once the sidePadding side paddings are removed. | 168 |
| `C:getRecovery()` | Associated recovery start position (path.startPositions.objects[recovery]). | 87 |
| `C:getReverseRecovery()` | Reverse recovery start position (reverseRecovery). | 90 |
| `C:getRoutePoint()` | Associated road point. | 301 |
| `C:getSideTransforms(posOffset, rotOffset, sclOffset, alignMode)` | Computes two scenery transforms, to the left and right of the pathnode, by casting rays toward the ground on each side (10 m radius). Returns an empty table if the pathnode has no normal. | 269 |
| `C:getStaticRoutePoint()` | Static road point. | 309 |
| `C:init(path, name, forceId)` | Constructor: id, default name "Pathnode <id>", manual mode, default field values. | 7 |
| `C:inside(pos)` | Indicates whether a point is inside the sphere (and in front of the normal's plane if hasNormal). | 78 |
| `C:intersectCorners(fromCorners, toCorners)` | Tests whether a segment connecting a vehicle's corners crosses the pathnode: the normal's plane within the sphere if hasNormal, otherwise the sphere itself. | 94 |
| `C:onDeserialized(data, oldIdMap)` | Restores the pathnode from serialized data; converts the recovery ids with oldIdMap. | 148 |
| `C:onSerialize()` | Serializes the pathnode (name, mode, scale, position, radius, normal, navgraphName, recovery, visible, useAsSplit, sidePadding, customFields). | 128 |
| `C:setManual(pos, radius, normal)` | Switches to manual mode with the given position, radius and normal. | 47 |
| `C:setNavRadiusScale(scl)` | Changes the navgraph radius scale and recomputes the radius in navgraph mode. | 71 |
| `C:setNavgraph(navgraphName, fallback)` | Switches to navgraph mode: position and radius (× navRadiusScale) of the road map node, or from fallback if the node does not exist. Clears the normal. | 55 |
| `C:setNormal(normal)` | Sets the normal (length > 0.9 required, then normalized, hasNormal true); otherwise clears it. | 33 |
| `C:setRoutePoint(rp)` | Stores the associated road point (vehicle tracking). | 294 |
| `C:setStaticRoutePoint(rp)` | Stores the static road point (not modified by vehicle tracking). | 305 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/race/pathnode.lua`.*
