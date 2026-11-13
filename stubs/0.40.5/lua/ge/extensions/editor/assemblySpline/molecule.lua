---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/molecule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_assemblySpline_molecule` : `extensions.load("editor_assemblySpline_molecule")`, puis la globale `editor_assemblySpline_molecule`
---@class editor_assemblySpline_molecule
editor_assemblySpline_molecule = {}

--- Apply enabled states to a molecule after deserialisation.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:767
---@param spline any
---@param molecule any
function editor_assemblySpline_molecule.applyEnabledStatesToMolecule(spline, molecule) end

--- Build the molecule from the given assembly kit.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:425
---@param assemblyKit any
---@param spline any
function editor_assemblySpline_molecule.buildMolecule(assemblyKit, spline) end

--- Gets the assembly kit from the selected .dae file (will take all siblings and extract bounding box data).
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:127
---@param kitFolderPath any
function editor_assemblySpline_molecule.getAssemblyKit(kitFolderPath) end

--- Checks if the bridge mesh with the given id is enabled or disabled for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:56
---@param spline any
---@param meshId any
function editor_assemblySpline_molecule.getBridgeEnabled(spline, meshId) end

--- Gets the random distribution flag for the bridge mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:99
---@param spline any
---@param meshId any
function editor_assemblySpline_molecule.getBridgeRandom(spline, meshId) end

--- Gets the random weight for the bridge mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:113
---@param spline any
---@param meshId any
function editor_assemblySpline_molecule.getBridgeRandomWeight(spline, meshId) end

--- Checks if the rigid mesh with the given id is enabled or disabled for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:41
---@param spline any
---@param meshId any
function editor_assemblySpline_molecule.getRigidEnabled(spline, meshId) end

--- Gets the random distribution flag for the rigid mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:71
---@param spline any
---@param meshId any
function editor_assemblySpline_molecule.getRigidRandom(spline, meshId) end

--- Gets the random weight for the rigid mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:85
---@param spline any
---@param meshId any
function editor_assemblySpline_molecule.getRigidRandomWeight(spline, meshId) end

--- Sets the enabled state for the bridge mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:65
---@param spline any
---@param meshId any
---@param enabled any
function editor_assemblySpline_molecule.setBridgeEnabled(spline, meshId, enabled) end

--- Sets the random distribution flag for the bridge mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:107
---@param spline any
---@param meshId any
---@param isRandom any
function editor_assemblySpline_molecule.setBridgeRandom(spline, meshId, isRandom) end

--- Sets the random weight for the bridge mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:121
---@param spline any
---@param meshId any
---@param weight any
function editor_assemblySpline_molecule.setBridgeRandomWeight(spline, meshId, weight) end

--- Sets the enabled state for the rigid mesh with the given id for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:50
---@param spline any
---@param meshId any
---@param enabled any
function editor_assemblySpline_molecule.setRigidEnabled(spline, meshId, enabled) end

--- Sets the random distribution flag for the rigid mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:79
---@param spline any
---@param meshId any
---@param isRandom any
function editor_assemblySpline_molecule.setRigidRandom(spline, meshId, isRandom) end

--- Sets the random weight for the rigid mesh with the given ID for the given spline.
---Source : lua/ge/extensions/editor/assemblySpline/molecule.lua:93
---@param spline any
---@param meshId any
---@param weight any
function editor_assemblySpline_molecule.setRigidRandomWeight(spline, meshId, weight) end

