# `jbeam_materials`

*File: `lua/common/jbeam/materials.lua` · VM: Common (GE + vehicle) · 252 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/materials")`

GE-side loading step that prepares a vehicle's dynamic material changes: (1) the jbeam glowMap section (materials that light up, with simpleFunction or advancedFunction driven by electrics values), (2) the flexbodies' deformation groups (deformGroup, deformMaterialBase, deformMaterialDamaged) linked to the beams with the same deformGroup. It creates the "material switches" via the engine, precompiles the materials by running them through their states, and stores the result in vehicle._materials for the vehicle VM.

## Notes

- Produces vehicle._materials = {mv (variables read by the expressions), triggerList (names of the trigger variables), triggers (copy of the glowmaps without the compiled function), matState (current state per switch), deformMeshes (flexbodies with deformSound per deformGroup)}. The vehicle side recompiles the expressions from evalFunctionString.
- glowMap: for each original material, a switch is created for each mesh that contains it. simpleFunction is either a variable name or a table name -> coefficient (weighted sum); advancedFunction = {triggers = list of variables, cmd = Lua expression}. The expressions are compiled with load in an environment limited to mv.
- Each beam carrying a deformGroup receives b.deformSwitches (switch -> {switch, dmgMat, mesh, deformGroup}) so that broken beams change the flexbody's material; the damaged material is preloaded.
- The original material of a glowMap is created as a Material object (non-saveable) if it does not exist in the scenetree.
- Minor bug: the glowmap's "failed to create materialSwitch" error message uses the variable k (not defined at that point, hence nil) and switchName out of its scope; it will not display the right information.

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_materials.process(vehicleObj, vehicle)` | Prepares all the material switches (glowMap and deformation groups) for the vehicle and fills vehicle._materials. Runs each switch through its on/on_intense/off states to precompile the shaders. *(internal)* | 32 |

### Parameter details

#### `jbeam_materials.process(vehicleObj, vehicle)`

Prepares all the material switches (glowMap and deformation groups) for the vehicle and fills vehicle._materials. Runs each switch through its on/on_intense/off states to precompile the shaders.

- `vehicleObj` (*userdata*) : Engine vehicle object (getMeshsMaterialsTbl, getSwitchableMaterial, switchMaterial, resetMaterials, getMeshesContainingMaterial).
- `vehicle` (*table*) : Vehicle jbeam data (flexbodies, beams, glowMap; _materials is written).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/materials.lua`.*
