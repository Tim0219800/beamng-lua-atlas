---@meta
-- tim19Atlas stub generated from lua/vehicle/particlefilter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Particle emission filter for node collisions. main.lua fills the shared table particlefilter.particleData at each onNodeCollision then calls nodeCollision(p): if the perpendicular velocity exceeds a threshold tied to the penetration depth, it looks in the particle rules table (particles.getMaterialsParticlesTable, from particles.json) for the rules matching the material pair and, for those whose compareFunc(p) is true, emits the particles via obj:addParticleVelWidthTypeCount.
--- Access: global `particlefilter`
---@class particlefilter
---@field particleData table Reused table (avoids allocations) describing the current collision: id1 (node), pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialID1, materialID2. Filled by main.lua:onNodeCollision.
particlefilter = {}

--- Evaluates a node collision and emits particles if the speed threshold is exceeded and if a rule of the material pair accepts (compareFunc). Called by main.lua:onNodeCollision on each collision.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/particlefilter.lua:25
---@param p table Collision data in particleData format.
function particlefilter.nodeCollision(p) end

