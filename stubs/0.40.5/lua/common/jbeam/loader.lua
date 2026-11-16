---@meta
-- tim19Atlas stub generated from lua/common/jbeam/loader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main jbeam vehicle loader: orchestrates all the steps that transform the .jbeam files and the chosen configuration into a vehicle data "bundle" (vdata) ready for the physics. Order: file reading (jbeam/io), part selection by the slot system, variable application, part unification, table schema, section merging, link and cid resolution, nodes/beams, wheels, groups, scaling, option default values, optimization, interaction. Then loadBundle creates engine-side: events, plates, colors, initial node positions, meshes, ropes, materials, faces, mirrors. Runs in both VMs (GE and vehicle, vmType). A modder mostly uses it to read the loaded config or to use the hooks onJbeamLoadingPhase1/2.
--- Access: `require("jbeam/loader")`
---@class jbeam_loader
---@field _noSerialize boolean true: the module is not serialized during a VM reload.
---@field data table Empty table created at initialization (not filled in this file).
---@field defaultBeamDamp number Default damping (580).
---@field defaultBeamDeform number Default deformation threshold (220000 N).
---@field defaultBeamSpring number Default beam stiffness (4300000 N/m).
---@field defaultBeamStrength number Default beam strength: math.huge (infinite).
---@field defaultNodeWeight number Default node mass (25 kg).
local jbeam_loader = {}

--- If the editor cache is enabled, stores an encoded copy of the bundle (temporarily adding editorTransform to the props) for the editor.
---Source: lua/common/jbeam/loader.lua:73
---@param vehicleId integer Vehicle identifier.
---@param vehicleBundle table Bundle to store.
---@param vehicleObj userdata Engine vehicle object (to read the props' transforms).
function jbeam_loader.cacheVehicleBundleForEditor(vehicleId, vehicleBundle, vehicleObj) end

--- Returns a decoded copy of the bundle cached for the editor.
---Source: lua/common/jbeam/loader.lua:95
---@param vehicleId integer Vehicle identifier.
---@return table|nil  Bundle or nil.
function jbeam_loader.getCachedVehicleBundle(vehicleId) end

--- Creates engine-side everything that depends on the vehicle object: input events, plates, colors, paints, initial node positions and collisions, reference nodes, meshes, visual ropes, materials, occupant faces, mirrors, and loads the extensions listed in gameEngineExtensions. Without a vehicle object (vehicle VM), sets props and flexbodies to {}.
---Source: lua/common/jbeam/loader.lua:367
---@param objID integer Vehicle identifier.
---@param vehicleBundle table Bundle produced by loadJbeam.
---@param loadingProgress table|nil Progress object.
---@return userdata|nil  The engine vehicle object (GE only).
function jbeam_loader.loadBundle(objID, vehicleBundle, loadingProgress) end

--- Loads and assembles in memory all the vehicle's jbeam data (parts, variables, tables, links, cid, wheels, groups, optimization) without touching the 3D objects.
---Source: lua/common/jbeam/loader.lua:144
---@param objID integer Vehicle identifier.
---@param loadingProgress table|nil LoadingManager progress object (update method).
---@param vehicleDirectories string[] Jbeam folders (the first is the vehicle folder).
---@param vehicleConfig table|nil Vehicle configuration.
---@return table|nil  Vehicle bundle; nil if a step fails.
function jbeam_loader.loadJbeam(objID, loadingProgress, vehicleDirectories, vehicleConfig) end

--- Like loadJbeam but only chooses the parts: returns the completed configuration (model, mainPartName, mainPartPath, partsTree).
---Source: lua/common/jbeam/loader.lua:132
---@param vehicleDirectories string[] Jbeam folders.
---@param vehicleConfig table|nil Starting configuration.
---@return table|nil  Completed vehicleConfig; nil if there is no main part.
function jbeam_loader.loadJbeamOnlyConfig(vehicleDirectories, vehicleConfig) end

--- Vehicle loading entry point: normalizes the folder (leading and trailing slash), adds /vehicles/common/, consults the cache, calls loadJbeam then loadBundle and tracks progress in the LoadingManager (GE side).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/loader.lua:452
---@param objID integer Vehicle object identifier.
---@param vehicleDir string Vehicle folder (e.g. 'vehicles/pickup').
---@param vehicleConfig table|nil Configuration (chosen parts, colors/paints, variables, mainPartName...).
---@return table|nil  Bundle {id, vehicleDirectory, directoriesLoaded, vdata, config, mainPartName, ioCtx}; nil on failure.
function jbeam_loader.loadVehicleStage1(objID, vehicleDir, vehicleConfig) end

--- Hook called when a file changes: empties the bundle cache and the editor cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/jbeam/loader.lua:525
---@param filename string Modified file.
---@param type string Change type.
function jbeam_loader.onFileChanged(filename, type) end

--- Enables or disables the editor cache; disabling empties it.
---Source: lua/common/jbeam/loader.lua:102
---@param enabled boolean true to enable.
function jbeam_loader.setEditorCacheEnabled(enabled) end

return jbeam_loader
