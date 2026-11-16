# `core_vehicle_partpreview`

*File: `lua/ge/extensions/core/vehicle/partpreview.lua` · VM: Game Engine (GE) · 220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_partpreview`: `extensions.load("core_vehicle_partpreview")`, then the global `core_vehicle_partpreview`

GE extension `core_vehicle_partpreview`: temporary preview of parts in the configuration UI (hover in partpacks), without respawning the vehicle. Compares the meshes (flexbodies) of a slot's current part with those of a candidate part, hides the current part's meshes (alpha 0) and shows the candidate's (alpha 1), remembering the original alphas to restore them.

## Example

```lua
-- Preview of two candidate parts (slot -> part name)
core_vehicle_partpreview.previewPartMeshes({['pickup_hood'] = 'pickup_hood_vented'})
-- Back to normal state
core_vehicle_partpreview.clearPartPreview()
```

## Notes

- The keys of partsBySlot are slot identifiers (id of the partsTree node), the values are jbeam part names.
- previewPartMeshes calls dump(...) and getFlexmeshChanges (which logs at level I) on every call: noisy log output, apparently left over from development.
- The preview only changes the alpha of the meshes (flexbodies and props): no part is actually installed, the vehicle's physics and jbeam do not change.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_partpreview.clearPartPreview(inVehID)` | Restores the original alpha of all meshes modified by the preview for the vehicle and forgets the state. | 99 |
| `core_vehicle_partpreview.getFlexmeshChanges(partsBySlot, inVehID)` | Computes which flexbody meshes disappear or appear if the candidate parts replaced the current parts of their slots. | 110 |
| `core_vehicle_partpreview.previewPartMeshes(partsBySlot, inVehID)` | Shows the preview of the candidate parts: clears the previous preview, hides the current part's meshes for each slot and shows those of the candidate (flexbody and prop meshes). | 171 |
| `core_vehicle_partpreview.reset()` | Forgets all stored preview states, without restoring the alphas (use when vehicles have been recreated). | 210 |

### Parameter details

#### `core_vehicle_partpreview.clearPartPreview(inVehID)`

Restores the original alpha of all meshes modified by the preview for the vehicle and forgets the state.

- `inVehID` (*integer|nil*) : vehicle; nil = player 0

#### `core_vehicle_partpreview.getFlexmeshChanges(partsBySlot, inVehID)`

Computes which flexbody meshes disappear or appear if the candidate parts replaced the current parts of their slots.

- `partsBySlot` (*table<string, string>*) : [slot] = candidate part name (empty values ignored)
- `inVehID` (*integer|nil*) : vehicle; nil = player 0
- **returns**: table[] list of {slotName, oldPartName, newPartName, oldMesh, newMesh} (oldMesh nil = new mesh; newMesh nil = removed mesh)

#### `core_vehicle_partpreview.previewPartMeshes(partsBySlot, inVehID)`

Shows the preview of the candidate parts: clears the previous preview, hides the current part's meshes for each slot and shows those of the candidate (flexbody and prop meshes).

- `partsBySlot` (*table<string, string>*) : [slot] = candidate part name
- `inVehID` (*integer|nil*) : vehicle; nil = player 0

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/partpreview.lua`.*
