---@meta
-- tim19Atlas stub generated from lua/vehicle/material.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Handles the dynamic change of vehicle materials (lights, headlights, luminous dials, broken body). At init the jbeam compiles a table v.data._materials (mv, triggerList, triggers, deformMeshes). Every frame, material.updateGFX rereads the electrics.values listed in triggerList; if one has changed it re-evaluates the function _anon(evalFunctionString) of each trigger and switches the mesh material (obj:switchMaterial) or resets it (obj:resetMaterials), optionally with an emissivity scale. It also handles "broken" materials tied to deformation groups.
--- Access: global `material`
---@class material
material = {}

--- Immediately and unconditionally resets all modified materials (state set to false + obj:resetMaterials), clears the stored values and the broken materials.
---Source: lua/vehicle/material.lua:123
function material.forceReset() end

--- Loads v.data._materials: compiles the evaluation string of each trigger in the mv environment, converts materialEmissiveScaling into scaleEmissiveMaterial*, resets the state of broken materials. Called by main.lua (initSystems) at the beginning.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/material.lua:141
function material.init() end

--- On vehicle reset: resets (obj:resetMaterials) all modified materials, clears the broken materials and the last values.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/material.lua:133
function material.reset() end

--- Applies the damage materials (dmgMat) of the meshes tied to a beam that breaks (beam.deformSwitches): disables the props of the deformation group, plays the mesh's deformation sound (only once per mesh) and adds 500 damage to beamstate. Called by beamstate.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/material.lua:33
---@param beam table Broken beam, with deformSwitches {msc -> {deformGroup, dmgMat}} and id1.
function material.switchBrokenMaterial(beam) end

--- Called every frame by main.lua (after props.updateGFX): detects changes in the tracked electrics values and updates materials and emissivity.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/material.lua:51
function material.updateGFX() end

