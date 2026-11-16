---@meta
-- tim19Atlas stub generated from lua/common/jbeam/materials.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE-side loading step that prepares a vehicle's dynamic material changes: (1) the jbeam glowMap section (materials that light up, with simpleFunction or advancedFunction driven by electrics values), (2) the flexbodies' deformation groups (deformGroup, deformMaterialBase, deformMaterialDamaged) linked to the beams with the same deformGroup. It creates the "material switches" via the engine, precompiles the materials by running them through their states, and stores the result in vehicle._materials for the vehicle VM.
--- Access: `require("jbeam/materials")`
---@class jbeam_materials
local jbeam_materials = {}

--- Prepares all the material switches (glowMap and deformation groups) for the vehicle and fills vehicle._materials. Runs each switch through its on/on_intense/off states to precompile the shaders.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/materials.lua:32
---@param vehicleObj userdata Engine vehicle object (getMeshsMaterialsTbl, getSwitchableMaterial, switchMaterial, resetMaterials, getMeshesContainingMaterial).
---@param vehicle table Vehicle jbeam data (flexbodies, beams, glowMap; _materials is written).
function jbeam_materials.process(vehicleObj, vehicle) end

return jbeam_materials
