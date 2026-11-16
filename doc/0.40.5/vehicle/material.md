# `material`

*File: `lua/vehicle/material.lua` · VM: Vehicle · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `material`

Handles the dynamic change of vehicle materials (lights, headlights, luminous dials, broken body). At init the jbeam compiles a table v.data._materials (mv, triggerList, triggers, deformMeshes). Every frame, material.updateGFX rereads the electrics.values listed in triggerList; if one has changed it re-evaluates the function (evalFunctionString) of each trigger and switches the mesh material (obj:switchMaterial) or resets it (obj:resetMaterials), optionally with an emissivity scale. It also handles "broken" materials tied to deformation groups.

## Notes

- Does nothing if v.data._materials does not exist (init returns early).
- Each trigger has: msc (mesh/material id), evalFunctionString (Lua code evaluated in the environment `mv` which contains the tracked electrics values, booleans being converted to 1/0), on, on_intense (materials), materialEmissiveScaling {on_max, on_intense_max}. The evaluated value > 0.0001 activates `on`; > 0.5 and if on_intense is defined, `on_intense`. If the function returns nil, the trigger is abandoned (marked broken) and updateGFX stops for this frame.
- Emissivity scale: if defined, setMaterialEmissiveFactor receives a gray proportional (0..255) to the value divided by on_max / on_intense_max.
- Inconsistency: in updateGFX, the immediate `return` when a function returns nil exits the whole update (changes already computed for the other triggers are not applied this frame).
- On a compilation error of the evaluation function, an error log is written and evalFunction becomes nop (returns nil, so the trigger will be marked broken at the first evaluation).

## Functions

| Function | Description | Line |
|---|---|---|
| `material.forceReset()` | Immediately and unconditionally resets all modified materials (state set to false + obj:resetMaterials), clears the stored values and the broken materials. | 123 |
| `material.init()` | Loads v.data._materials: compiles the evaluation string of each trigger in the mv environment, converts materialEmissiveScaling into scaleEmissiveMaterial*, resets the state of broken materials. Called by main.lua (initSystems) at the beginning. *(internal)* | 141 |
| `material.reset()` | On vehicle reset: resets (obj:resetMaterials) all modified materials, clears the broken materials and the last values. *(internal)* | 133 |
| `material.switchBrokenMaterial(beam)` | Applies the damage materials (dmgMat) of the meshes tied to a beam that breaks (beam.deformSwitches): disables the props of the deformation group, plays the mesh's deformation sound (only once per mesh) and adds 500 damage to beamstate. Called by beamstate. *(internal)* | 33 |
| `material.updateGFX()` | Called every frame by main.lua (after props.updateGFX): detects changes in the tracked electrics values and updates materials and emissivity. *(internal)* | 51 |

### Parameter details

#### `material.switchBrokenMaterial(beam)`

Applies the damage materials (dmgMat) of the meshes tied to a beam that breaks (beam.deformSwitches): disables the props of the deformation group, plays the mesh's deformation sound (only once per mesh) and adds 500 damage to beamstate. Called by beamstate.

- `beam` (*table*) : Broken beam, with deformSwitches {msc -> {deformGroup, dmgMat}} and id1.

## Calls into the engine (C++)

- `obj:` `resetMaterials`, `setMaterialEmissiveFactor`, `switchMaterial`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/material.lua`.*
