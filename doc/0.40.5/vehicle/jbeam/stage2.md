# `v`

*File: `lua/vehicle/jbeam/stage2.lua` · VM: Vehicle · 617 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `v`

Second step of vehicle loading, on the vehicle VM side: takes the jbeam data already assembled by the game (stage 1, in the game VM) and "pushes" it into the C++ physics by calling obj:setNode, obj:setBeam, obj:setWheel, obj:addRail, obj:addSlidenode, obj:setTorsionbar, obj:setTriangle, obj:setReferenceNodes then obj:finishLoading. main.lua loads it as the global `v` (v = require('jbeam/stage2')): after loadVehicleStage2, `v.data` contains the vehicle data (nodes, beams, wheels, hydros, powertrain, refNodes, input, information…), and `v.config` the configuration (parts, paints, additionalVehicleData…). It is therefore the source of all jbeam reads by the other modules.

## Example

```lua
-- in a vehicle module (after spawn):
for _, node in pairs(v.data.nodes) do print(node.name, node.cid, node.pos.x) end
local wheelLock = v.data.input and v.data.input.steeringWheelLock
local partConfig = v.config.parts
```

## Notes

- Order of sending to the physics (pushToPhysics): obj:requestReset(RESET_PHYSICS), then nodes, beams, wheels, rails, slidenodes, torsionhydros, torsionbars, collision triangles, reference nodes, finally obj:finishLoading(). Each element receives a `cid` field (identifier on the C++ side) assigned by the setXxx.
- Beam types (values defined in C, do not modify): normal 0, anisotropic 1, bounded 2, pressured 3, lbeam 4, broken 5, support 7. Node types: normal 0, fixed 1, noncollidable 2.
- Useful defaults: beamStrength = vehicle.options.beamStrength or math.huge (unbreakable); a beamStrength as a string is accepted if it represents a number. A degenerate triangle is reported by an error log. If the reference nodes (refNodes[0]) are missing, dummy nodes (ref 0, back 1, left 2, up 0) are installed with an error log.
- loadVehicleStage2 sets vdata.format = 'parsed', publishes M.data, M.config and, for compatibility, M.vehicleDirectory = M.data.vehicleDirectory, and measures the loading time (log 'Vehicle loading took: … ms').
- This module only runs once per spawn (called by main.lua:init). Later modifications of v.data are not sent back to the C++ physics: they only affect the Lua modules.

## Functions

| Function | Description | Line |
|---|---|---|
| `v.loadVehicleStage2(vdataStage1)` | Sends the jbeam data to the physics (nodes, beams, wheels, rails, slidenodes, torsions, triangles, reference nodes) then publishes v.data and v.config. Called once by main.lua:init with the decoded spawn data. *(internal)* | 590 |

### Parameter details

#### `v.loadVehicleStage2(vdataStage1)`

Sends the jbeam data to the physics (nodes, beams, wheels, rails, slidenodes, torsions, triangles, reference nodes) then publishes v.data and v.config. Called once by main.lua:init with the decoded spawn data.

- `vdataStage1` (*table*) : Spawn table {vdata = assembled jbeam data, config = vehicle configuration}.
- **returns**: table|nil vdata (the vehicle data) on success; nil if vdata is not a table.

## Calls into the engine (C++)

- `obj:` `addRail`, `addRailLink`, `addSlidenode`, `addWheelNode`, `finishLoading`, `getWheel`, `requestReset`, `setBeam`, `setBeamAnisotropic`, `setBeamBounded`, `setBeamDeformationTriggerRatio`, `setBeamLbeam`, `setBeamPressured`, `setNode`, `setNodePair2WheelId`, `setReferenceNodes`, `setTorsionbar`, `setTriangle`, `setWheel`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/jbeam/stage2.lua`.*
