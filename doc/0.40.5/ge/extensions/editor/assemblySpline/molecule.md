# `editor_assemblySpline_molecule`

*File: `lua/ge/extensions/editor/assemblySpline/molecule.lua` · VM: Game Engine (GE) · 822 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assemblySpline_molecule`: `extensions.load("editor_assemblySpline_molecule")`, then the global `editor_assemblySpline_molecule`

"Molecule" model of the Assembly Spline tool. An assembly kit is a folder of .dae files (names containing 'root', 'bridge', 'sag', 'var') whose 'nail.*' anchors (point, head, aux) define junctions of type nail (1 degree of freedom), fixed (0) or ball (3). The module loads the kit (getAssemblyKit), builds the molecule (rigids = rigid elements, bridges = elements linking two rigids, with their variations) and manages, per spline, the enabled/random/weight states of each mesh.

## Notes

- Naming constants: 'root' (root mesh), 'bridge' (bridges), 'sag' (sagging bridges), 'var' (variations, name of the form <base>_var...; the base mesh is <base>.dae), anchor prefix 'nail', anchors 'point', 'head', 'aux'.
- Pitfall on enabled states: if spline.rigidEnabledStates (or bridgeEnabledStates) does not exist, all meshes are enabled; as soon as the table exists, a mesh absent from the table is considered disabled (only == true counts). The code comment nevertheless says "only true if explicitly set to true".
- Random states default to false (round robin) and weights to 1.0.
- The getters/setters store the states in the spline: rigidEnabledStates, bridgeEnabledStates, rigidRandomStates, rigidRandomWeights, bridgeRandomStates, bridgeRandomWeights (keys = mesh id).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule)` | After deserialization, reapplies to the molecule the enabled states of the rigids, bridges and their variations stored in the spline. Does nothing if spline or molecule is nil. | 767 |
| `editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline)` | Builds the molecule from the kit: groups the variations (_var) with their base mesh, identifies root, rigids and bridges, computes the junctions from the nail.* anchors, then corrects the bridges' attachment points to place them at the mesh edges. | 425 |
| `editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath)` | Loads a kit: lists all .dae files in the folder and subfolders (FS:findFiles) and extracts for each its data (bounding box, anchors). Empty or nil path: returns an empty table and an empty string. | 127 |
| `editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId)` | Indicates whether the bridge mesh with the given id is enabled for the spline (same rule as getRigidEnabled). | 56 |
| `editor_assemblySpline_molecule.getBridgeRandom(spline, meshId)` | Indicates whether the distribution of the bridge group is random. Default false. | 99 |
| `editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId)` | Draw weight of a bridge mesh (default 1.0). | 113 |
| `editor_assemblySpline_molecule.getRigidEnabled(spline, meshId)` | Indicates whether the rigid mesh with the given id is enabled for the spline (see notes for the pitfall). | 41 |
| `editor_assemblySpline_molecule.getRigidRandom(spline, meshId)` | Indicates whether the distribution of the rigid group is random (otherwise round robin). Default false. | 71 |
| `editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId)` | Draw weight of a rigid mesh (default 1.0). | 85 |
| `editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled)` | Sets the enabled state of a bridge mesh. | 65 |
| `editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom)` | Sets the random distribution mode of a bridge. | 107 |
| `editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight)` | Sets the draw weight of a bridge mesh. | 121 |
| `editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled)` | Sets the enabled state of a rigid mesh for the spline (creates the table if needed). | 50 |
| `editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom)` | Sets the random distribution mode of a rigid. | 79 |
| `editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight)` | Sets the draw weight of a rigid mesh. | 93 |

### Parameter details

#### `editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule)`

After deserialization, reapplies to the molecule the enabled states of the rigids, bridges and their variations stored in the spline. Does nothing if spline or molecule is nil.

- `spline` (*table|nil*) : Spline.
- `molecule` (*table|nil*) : Molecule.

#### `editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline)`

Builds the molecule from the kit: groups the variations (_var) with their base mesh, identifies root, rigids and bridges, computes the junctions from the nail.* anchors, then corrects the bridges' attachment points to place them at the mesh edges.

- `assemblyKit` (*table*) : Result of getAssemblyKit.
- `spline` (*table*) : Spline used for the enabled/random states (inferred from code).
- **returns**: table Molecule with the rigids and bridges lists (each entry: mesh, variations, isRandom, randomWeight).

#### `editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath)`

Loads a kit: lists all .dae files in the folder and subfolders (FS:findFiles) and extracts for each its data (bounding box, anchors). Empty or nil path: returns an empty table and an empty string.

- `kitFolderPath` (*string*) : Kit folder (e.g. 'assets/meshes/props/assembly_kit/ak_wood_fence_001/').
- **returns**: table List of kit meshes (id, fileName, meshPath, anchors...).
- **returns**: string Empty string if the path is invalid (second value only in that case, inferred from code).

#### `editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId)`

Indicates whether the bridge mesh with the given id is enabled for the spline (same rule as getRigidEnabled).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- **returns**: boolean Enabled or not.

#### `editor_assemblySpline_molecule.getBridgeRandom(spline, meshId)`

Indicates whether the distribution of the bridge group is random. Default false.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- **returns**: boolean true if random.

#### `editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId)`

Draw weight of a bridge mesh (default 1.0).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- **returns**: number Weight.

#### `editor_assemblySpline_molecule.getRigidEnabled(spline, meshId)`

Indicates whether the rigid mesh with the given id is enabled for the spline (see notes for the pitfall).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- **returns**: boolean Enabled or not.

#### `editor_assemblySpline_molecule.getRigidRandom(spline, meshId)`

Indicates whether the distribution of the rigid group is random (otherwise round robin). Default false.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- **returns**: boolean true if random.

#### `editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId)`

Draw weight of a rigid mesh (default 1.0).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- **returns**: number Weight.

#### `editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled)`

Sets the enabled state of a bridge mesh.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- `enabled` (*boolean*) : Enabled.

#### `editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom)`

Sets the random distribution mode of a bridge.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- `isRandom` (*boolean*) : Random.

#### `editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight)`

Sets the draw weight of a bridge mesh.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- `weight` (*number*) : Weight.

#### `editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled)`

Sets the enabled state of a rigid mesh for the spline (creates the table if needed).

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- `enabled` (*boolean*) : Enabled.

#### `editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom)`

Sets the random distribution mode of a rigid.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- `isRandom` (*boolean*) : Random.

#### `editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight)`

Sets the draw weight of a rigid mesh.

- `spline` (*table*) : Assembly spline.
- `meshId` (*string*) : Mesh id.
- `weight` (*number*) : Weight.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `FS:` `findFiles`
- `obj:` `delete`, `getAnchorNames`, `getNodeTransform`, `getObjBox`, `registerObject`, `setField`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assemblySpline/molecule.lua`.*
