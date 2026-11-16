# `client_core`

*File: `lua/ge/client/core.lua` · VM: Game Engine (GE) · 1220 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/core")`

Initialization of the client's graphics "core": creates from Lua code the base materials, shaders and state blocks that used to be Torque scripts. It covers the common materials (WarningMaterial, BlankWhite, Corona_Mat, BlackSky/BlueSky/GreySky skies, Grid512_* grids, track editor materials, spawn arrow), the sampling states (SamplerClampLinear/Point, SamplerWrapLinear/Point), the particle, reflection, foliage and terrain shaders, water (WaterMat, UnderwaterMat and "Basic" versions), the sky (ScatterSky atmosphere, SkyLut, stars, moon, Milky Way, meteors), clouds and the vehicle highlight and transparency material (VehicleHighlightMat, vehicleGhost). It also loads all *.materials.json files in the core/ folder.

## Notes

- createVehicleData chooses the shader model according to Engine.Render.getAdapterType(): Direct3D11 gives pixVersion 4, otherwise 6 with the define BNG_HLSL_MODEL=6.
- M.initialized (dynamically defined field, not declared at the top of the file) is true once initializeCore or reloadCore has run; initializeCore does nothing if it is already true.
- Under Direct3D11, the highlight shader VehicleHighlightShader and vehicleGhost use highlight.hlsl / ghost.hlsl in shaders/common/vehicle/.
- Most object creations are guarded by scenetree.findObject, which makes repeated calls safe.

## Functions

| Function | Description | Line |
|---|---|---|
| `client_core.initializeCore()` | Initializes the client only once: random seed (setRandomSeed(-1)), objectsRequiredForStartup, canvas creation, base materials, shaders, water, sky, clouds and vehicle data. *(internal)* | 1182 |
| `client_core.loadCoreMaterials()` | Creates the common materials and those of the track editor, then loads each core/**/*.materials.json file with loadJsonMaterialsFile. *(internal)* | 719 |
| `client_core.reloadCore()` | Recreates the canvas via initializeCanvas (useful after a window configuration change) and marks the core as initialized. Does not recreate the materials. *(internal)* | 1209 |

## Calls into the engine (C++)

- `FS:` `findFiles`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/core.lua`.*
