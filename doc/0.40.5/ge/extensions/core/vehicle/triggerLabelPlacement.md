# `core_vehicle_triggerLabelPlacement`

*File: `lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua` · VM: Game Engine (GE) · 359 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_triggerLabelPlacement`: `extensions.load("core_vehicle_triggerLabelPlacement")`, then the global `core_vehicle_triggerLabelPlacement`

GE extension `core_vehicle_triggerLabelPlacement`: computes where to place the UI label of a vehicle trigger (jbeam interaction zones) around its box projected on screen. Rebuilds the trigger's basis (axes) from the idRef/idX/idY nodes and its rotations (reproducing the C++ code's sequence), derives the half-dimensions, projects the 8 corners onto the screen and picks the side (right, left, top, bottom) with the most room. Utility functions with no persistent state, used by the trigger UI/debug tools and by core_vehicle_vehicleTriggerHighlight.

## Notes

- Screen coordinates are fractions 0..1 (worldToScreenPercent01 must return a {x, y} table in this range). The tables returned by computeForTrigger are reused from one call to the next (no copy): the caller must consume or copy the result right away.
- The side is 'bottom' if the projected box fits entirely in the central 15%-85% zone of the screen; otherwise it is the side that offers the most free space.
- Trigger size: a number gives a sphere of half-dimension |size|; a table/vector is read as full dimensions (converted to half-dimensions, default 0.2). Angles whose value exceeds 2π are considered to be degrees.
- If idRef/idX/idY are missing or degenerate, the basis falls back to the world axes (1,0,0), (0,1,0), (0,0,1).

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_triggerLabelPlacement.computeForTrigger(vehicleObj, triggerObj, triggerData, worldToScreenPercent01, p, centerWorld, centerScreen)` | Computes the placement of a trigger's label: projects the trigger's box on screen and chooses the label side with its position (labelX, labelY as screen fraction) and CSS offsets (labelTx, labelTy, with 0.6em margin). | 282 |
| `core_vehicle_triggerLabelPlacement.computeTriggerBasisAndHalfExtents(vehicleObj, triggerData)` | Returns the trigger's orthonormal basis and its half-dimensions, shared with the debug/highlight drawings to stay consistent with the placement. | 352 |

### Parameter details

#### `core_vehicle_triggerLabelPlacement.computeForTrigger(vehicleObj, triggerObj, triggerData, worldToScreenPercent01, p, centerWorld, centerScreen)`

Computes the placement of a trigger's label: projects the trigger's box on screen and chooses the label side with its position (labelX, labelY as screen fraction) and CSS offsets (labelTx, labelTy, with 0.6em margin).

- `vehicleObj` (*userdata*) : vehicle carrying the trigger
- `triggerObj` (*userdata|nil*) : trigger object (getCenter method); unnecessary if centerWorld is provided
- `triggerData` (*table*) : trigger jbeam data (idRef, idX, idY, size, baseRotation, rotation...)
- `worldToScreenPercent01` (*function|nil*) : function(worldPos, output) -> {x, y} in screen fractions
- `p` (*table|nil*) : optional profiler (add method) to measure the steps
- `centerWorld` (*vec3|nil*) : trigger center in world space (otherwise triggerObj:getCenter())
- `centerScreen` (*table|nil*) : center on screen, already computed (otherwise computed via worldToScreenPercent01)
- **returns**: table|nil {labelX, labelY, labelTx, labelTy, labelSide ('right'|'left'|'top'|'bottom'), bounds = {minX, maxX, minY, maxY, centerX, centerY}}; nil if projection is impossible

#### `core_vehicle_triggerLabelPlacement.computeTriggerBasisAndHalfExtents(vehicleObj, triggerData)`

Returns the trigger's orthonormal basis and its half-dimensions, shared with the debug/highlight drawings to stay consistent with the placement.

- `vehicleObj` (*userdata*) : vehicle carrying the trigger
- `triggerData` (*table*) : trigger data
- **returns**: vec3 X axis
- **returns**: vec3 Y axis
- **returns**: vec3 Z axis
- **returns**: number X half-dimension
- **returns**: number Y half-dimension
- **returns**: number Z half-dimension

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/triggerLabelPlacement.lua`.*
