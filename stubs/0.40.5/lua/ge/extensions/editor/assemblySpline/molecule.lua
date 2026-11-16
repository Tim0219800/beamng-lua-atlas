---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/molecule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Molecule" model of the Assembly Spline tool. An assembly kit is a folder of .dae files (names containing 'root', 'bridge', 'sag', 'var') whose 'nail.*' anchors (point, head, aux) define junctions of type nail (1 degree of freedom), fixed (0) or ball (3). The module loads the kit (getAssemblyKit), builds the molecule (rigids = rigid elements, bridges = elements linking two rigids, with their variations) and manages, per spline, the enabled/random/weight states of each mesh.
--- Access: extension `editor_assemblySpline_molecule`: `extensions.load("editor_assemblySpline_molecule")`, then the global `editor_assemblySpline_molecule`
---@class editor_assemblySpline_molecule
editor_assemblySpline_molecule = {}

--- After deserialization, reapplies to the molecule the enabled states of the rigids, bridges and their variations stored in the spline. Does nothing if spline or molecule is nil.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:767
---@param spline table|nil Spline.
---@param molecule table|nil Molecule.
function editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule) end

--- Builds the molecule from the kit: groups the variations (_var) with their base mesh, identifies root, rigids and bridges, computes the junctions from the nail.* anchors, then corrects the bridges' attachment points to place them at the mesh edges.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:425
---@param assemblyKit table Result of getAssemblyKit.
---@param spline table Spline used for the enabled/random states (inferred from code).
---@return table  Molecule with the rigids and bridges lists (each entry: mesh, variations, isRandom, randomWeight).
function editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline) end

--- Loads a kit: lists all .dae files in the folder and subfolders (FS:findFiles) and extracts for each its data (bounding box, anchors). Empty or nil path: returns an empty table and an empty string.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:127
---@param kitFolderPath string Kit folder (e.g. 'assets/meshes/props/assembly_kit/ak_wood_fence_001/').
---@return table  List of kit meshes (id, fileName, meshPath, anchors...).
---@return string  Empty string if the path is invalid (second value only in that case, inferred from code).
function editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath) end

--- Indicates whether the bridge mesh with the given id is enabled for the spline (same rule as getRigidEnabled).
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:56
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@return boolean  Enabled or not.
function editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId) end

--- Indicates whether the distribution of the bridge group is random. Default false.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:99
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@return boolean  true if random.
function editor_assemblySpline_molecule.getBridgeRandom(spline, meshId) end

--- Draw weight of a bridge mesh (default 1.0).
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:113
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@return number  Weight.
function editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId) end

--- Indicates whether the rigid mesh with the given id is enabled for the spline (see notes for the pitfall).
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:41
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@return boolean  Enabled or not.
function editor_assemblySpline_molecule.getRigidEnabled(spline, meshId) end

--- Indicates whether the distribution of the rigid group is random (otherwise round robin). Default false.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:71
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@return boolean  true if random.
function editor_assemblySpline_molecule.getRigidRandom(spline, meshId) end

--- Draw weight of a rigid mesh (default 1.0).
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:85
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@return number  Weight.
function editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId) end

--- Sets the enabled state of a bridge mesh.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:65
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@param enabled boolean Enabled.
function editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled) end

--- Sets the random distribution mode of a bridge.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:107
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@param isRandom boolean Random.
function editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom) end

--- Sets the draw weight of a bridge mesh.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:121
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@param weight number Weight.
function editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight) end

--- Sets the enabled state of a rigid mesh for the spline (creates the table if needed).
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:50
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@param enabled boolean Enabled.
function editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled) end

--- Sets the random distribution mode of a rigid.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:79
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@param isRandom boolean Random.
function editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom) end

--- Sets the draw weight of a rigid mesh.
---Source: lua/ge/extensions/editor/assemblySpline/molecule.lua:93
---@param spline table Assembly spline.
---@param meshId string Mesh id.
---@param weight number Weight.
function editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight) end

