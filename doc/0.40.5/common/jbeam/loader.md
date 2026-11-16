# `jbeam_loader`

*File: `lua/common/jbeam/loader.lua` · VM: Common (GE + vehicle) · 539 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/loader")`

Main jbeam vehicle loader: orchestrates all the steps that transform the .jbeam files and the chosen configuration into a vehicle data "bundle" (vdata) ready for the physics. Order: file reading (jbeam/io), part selection by the slot system, variable application, part unification, table schema, section merging, link and cid resolution, nodes/beams, wheels, groups, scaling, option default values, optimization, interaction. Then loadBundle creates engine-side: events, plates, colors, initial node positions, meshes, ropes, materials, faces, mirrors. Runs in both VMs (GE and vehicle, vmType). A modder mostly uses it to read the loaded config or to use the hooks onJbeamLoadingPhase1/2.

## Notes

- Beam type constants (defined in C, do not modify): NORMAL 0, ANISOTROPIC 1, BOUNDED 2, PRESSURED 3, LBEAM 4, BROKEN 5, HYDRO 6, SUPPORT 7.
- Default values applied to vehicle.options if absent: beamSpring = defaultBeamSpring (4300000), beamDeform = defaultBeamDeform (220000), beamDamp = defaultBeamDamp (580), beamStrength = defaultBeamStrength (math.huge), nodeWeight = defaultNodeWeight (25).
- Emitted hooks (extensions.hook): onJbeamLoadingPhase1(loadingProgress, objID, vehicle, unifyJournal, vehicleConfig, vars) after nodes/beams and before wheels; onJbeamLoadingPhase2(...) before optimization.
- occupantSlots and the camera are only handled in the GE VM (vmType == 'game'). loadBundle creates the visible objects only on the GE side (if the vehicle object is found), otherwise sets props and flexbodies to {}.
- A bundle cache (key = SHA256 of the folders + config) avoids reloading an identical vehicle; emptied by onFileChanged. The bundle is stored encoded and decoded on each reuse.
- The config parameter additionalVehicleData.indestructible makes all beams other than wheels/torsionbars/rails infinitely strong (beamStrength = huge) and removes triggers and actionsEnabled (code marked TODO: REMOVE TEST CODE).
- A gameEngineExtensions section of the parts allows automatically loading GE extensions (name = true, or name = {args} calls onVehicleExtensionLoaded(objID, args) on the extension).
- If the command-line argument -debugVehicleLoading is present, vehicleDebug_*.json files are written in the vehicle folder.
- M.materials and M.materialsMap (from particles.getMaterialsParticlesTable()) are exported fields missing from the automatic list.
- Minor bug: loadJbeam returns nil without closing the profilerPush when findParts fails (return before profilerPopEvent).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_loader.cacheVehicleBundleForEditor(vehicleId, vehicleBundle, vehicleObj)` | If the editor cache is enabled, stores an encoded copy of the bundle (temporarily adding editorTransform to the props) for the editor. | 73 |
| `jbeam_loader.getCachedVehicleBundle(vehicleId)` | Returns a decoded copy of the bundle cached for the editor. | 95 |
| `jbeam_loader.loadBundle(objID, vehicleBundle, loadingProgress)` | Creates engine-side everything that depends on the vehicle object: input events, plates, colors, paints, initial node positions and collisions, reference nodes, meshes, visual ropes, materials, occupant faces, mirrors, and loads the extensions listed in gameEngineExtensions. Without a vehicle object (vehicle VM), sets props and flexbodies to {}. | 367 |
| `jbeam_loader.loadJbeam(objID, loadingProgress, vehicleDirectories, vehicleConfig)` | Loads and assembles in memory all the vehicle's jbeam data (parts, variables, tables, links, cid, wheels, groups, optimization) without touching the 3D objects. | 144 |
| `jbeam_loader.loadJbeamOnlyConfig(vehicleDirectories, vehicleConfig)` | Like loadJbeam but only chooses the parts: returns the completed configuration (model, mainPartName, mainPartPath, partsTree). | 132 |
| `jbeam_loader.loadVehicleStage1(objID, vehicleDir, vehicleConfig)` | Vehicle loading entry point: normalizes the folder (leading and trailing slash), adds /vehicles/common/, consults the cache, calls loadJbeam then loadBundle and tracks progress in the LoadingManager (GE side). *(internal)* | 452 |
| `jbeam_loader.onFileChanged(filename, type)` | Hook called when a file changes: empties the bundle cache and the editor cache. *(internal)* *(hook)* | 525 |
| `jbeam_loader.setEditorCacheEnabled(enabled)` | Enables or disables the editor cache; disabling empties it. | 102 |

### Parameter details

#### `jbeam_loader.cacheVehicleBundleForEditor(vehicleId, vehicleBundle, vehicleObj)`

If the editor cache is enabled, stores an encoded copy of the bundle (temporarily adding editorTransform to the props) for the editor.

- `vehicleId` (*integer*) : Vehicle identifier.
- `vehicleBundle` (*table*) : Bundle to store.
- `vehicleObj` (*userdata*) : Engine vehicle object (to read the props' transforms).

#### `jbeam_loader.getCachedVehicleBundle(vehicleId)`

Returns a decoded copy of the bundle cached for the editor.

- `vehicleId` (*integer*) : Vehicle identifier.
- **returns**: table|nil Bundle or nil.

#### `jbeam_loader.loadBundle(objID, vehicleBundle, loadingProgress)`

Creates engine-side everything that depends on the vehicle object: input events, plates, colors, paints, initial node positions and collisions, reference nodes, meshes, visual ropes, materials, occupant faces, mirrors, and loads the extensions listed in gameEngineExtensions. Without a vehicle object (vehicle VM), sets props and flexbodies to {}.

- `objID` (*integer*) : Vehicle identifier.
- `vehicleBundle` (*table*) : Bundle produced by loadJbeam.
- `loadingProgress` (*table|nil*) : Progress object.
- **returns**: userdata|nil The engine vehicle object (GE only).

#### `jbeam_loader.loadJbeam(objID, loadingProgress, vehicleDirectories, vehicleConfig)`

Loads and assembles in memory all the vehicle's jbeam data (parts, variables, tables, links, cid, wheels, groups, optimization) without touching the 3D objects.

- `objID` (*integer*) : Vehicle identifier.
- `loadingProgress` (*table|nil*) : LoadingManager progress object (update method).
- `vehicleDirectories` (*string[]*) : Jbeam folders (the first is the vehicle folder).
- `vehicleConfig` (*table|nil*) : Vehicle configuration.
- **returns**: table|nil Vehicle bundle; nil if a step fails.

#### `jbeam_loader.loadJbeamOnlyConfig(vehicleDirectories, vehicleConfig)`

Like loadJbeam but only chooses the parts: returns the completed configuration (model, mainPartName, mainPartPath, partsTree).

- `vehicleDirectories` (*string[]*) : Jbeam folders.
- `vehicleConfig` (*table|nil*) : Starting configuration.
- **returns**: table|nil Completed vehicleConfig; nil if there is no main part.

#### `jbeam_loader.loadVehicleStage1(objID, vehicleDir, vehicleConfig)`

Vehicle loading entry point: normalizes the folder (leading and trailing slash), adds /vehicles/common/, consults the cache, calls loadJbeam then loadBundle and tracks progress in the LoadingManager (GE side).

- `objID` (*integer*) : Vehicle object identifier.
- `vehicleDir` (*string*) : Vehicle folder (e.g. 'vehicles/pickup').
- `vehicleConfig` (*table|nil*) : Configuration (chosen parts, colors/paints, variables, mainPartName...).
- **returns**: table|nil Bundle {id, vehicleDirectory, directoriesLoaded, vdata, config, mainPartName, ioCtx}; nil on failure.

#### `jbeam_loader.onFileChanged(filename, type)`

Hook called when a file changes: empties the bundle cache and the editor cache.

- `filename` (*string*) : Modified file.
- `type` (*string*) : Change type.

#### `jbeam_loader.setEditorCacheEnabled(enabled)`

Enables or disables the editor cache; disabling empties it.

- `enabled` (*boolean*) : true to enable.

## Fields

| Field | Type | Description |
|---|---|---|
| `_noSerialize` | boolean | true: the module is not serialized during a VM reload. |
| `data` | table | Empty table created at initialization (not filled in this file). |
| `defaultBeamDamp` | number | Default damping (580). |
| `defaultBeamDeform` | number | Default deformation threshold (220000 N). |
| `defaultBeamSpring` | number | Default beam stiffness (4300000 N/m). |
| `defaultBeamStrength` | number | Default beam strength: math.huge (infinite). |
| `defaultNodeWeight` | number | Default node mass (25 kg). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onJbeamLoadingPhase1` — listened to by 1 module(s)
- `onJbeamLoadingPhase2` — listened to by 1 module(s)

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/loader.lua`.*
