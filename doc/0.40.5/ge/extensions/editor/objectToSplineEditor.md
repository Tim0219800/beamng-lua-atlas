# `editor_objectToSplineEditor`

*File: `lua/ge/extensions/editor/objectToSplineEditor.lua` · VM: Game Engine (GE) · 498 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_objectToSplineEditor`: `extensions.load("editor_objectToSplineEditor")`, then the global `editor_objectToSplineEditor`

"Object To Spline Editor" tool of the World Editor: copies an object (TSStatic or BeamNGVehicle) along a guide spline (DecalRoad or MeshRoad). You choose the object and the spline from the selection, then set the gap, the start and end offsets, the object's axis, the maximum number of copies (500 by default), the orientation along the terrain normal, an alternate mode, placement in a SimGroup and random variations (gap, position, rotation, Gaussian). The spline is drawn in green and the planned positions in yellow with debugDrawer.

## Notes

- The tool creates real objects in the scene (copies of the source object via Sim.getUniqueName) and can reload the collision (be:reloadCollision).
- The objId and guideId identifiers are set back to nil if the object no longer exists in the scenetree.
- The DecalRoad guide uses getMiddleEdgePosition, the MeshRoad getTopMiddleEdgePosition (raised by 1 cm for drawing).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_objectToSplineEditor.onEditorGui()` | Editor hook called every frame: draws the "Object To Spline Editor" window (object and spline selection, parameters, creation) and the guide spline. *(internal)* *(hook)* | 254 |
| `editor_objectToSplineEditor.onEditorInitialized()` | Hook called at editor initialization: registers the window (420x500) and the "Object To Spline Editor" menu entry. *(internal)* *(hook)* | 490 |

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `be:` `getSurfaceHeightBelow`, `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`
- `obj:` `getField`, `getId`, `getObjectBox`, `getPosition`, `getScale`, `getWorldBox`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/objectToSplineEditor.lua`.*
