# `particlefilter`

*File: `lua/vehicle/particlefilter.lua` · VM: Vehicle · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `particlefilter`

Particle emission filter for node collisions. main.lua fills the shared table particlefilter.particleData at each onNodeCollision then calls nodeCollision(p): if the perpendicular velocity exceeds a threshold tied to the penetration depth, it looks in the particle rules table (particles.getMaterialsParticlesTable, from particles.json) for the rules matching the material pair and, for those whose compareFunc(p) is true, emits the particles via obj:addParticleVelWidthTypeCount.

## Notes

- Threshold: perpendicularVel > depth x (0.5 / physicsDt), where physicsDt is the main.lua global (physics step).
- Lookup key: materialID1 x 10000 + materialID2 in materialsMap. Each rule r provides compareFunc, veloMult, width, particleType, count.
- The initial values of particleData are 0s (even for pos, normal, nodeVel which are then filled with vectors). The field is named materialID1/materialID2 (capital D) whereas the main.lua parameter is called materialId1/materialId2.
- The debug comment in the code mentions p.particleType which does not exist in particleData.

## Functions

| Function | Description | Line |
|---|---|---|
| `particlefilter.nodeCollision(p)` | Evaluates a node collision and emits particles if the speed threshold is exceeded and if a rule of the material pair accepts (compareFunc). Called by main.lua:onNodeCollision on each collision. *(internal)* | 25 |

### Parameter details

#### `particlefilter.nodeCollision(p)`

Evaluates a node collision and emits particles if the speed threshold is exceeded and if a rule of the material pair accepts (compareFunc). Called by main.lua:onNodeCollision on each collision.

- `p` (*table*) : Collision data in particleData format.

## Fields

| Field | Type | Description |
|---|---|---|
| `particleData` | table | Reused table (avoids allocations) describing the current collision: id1 (node), pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialID1, materialID2. Filled by main.lua:onNodeCollision. |

## Calls into the engine (C++)

- `obj:` `addParticleVelWidthTypeCount`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/particlefilter.lua`.*
