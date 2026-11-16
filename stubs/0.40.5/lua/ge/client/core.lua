---@meta
-- tim19Atlas stub generated from lua/ge/client/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Initialization of the client's graphics "core": creates from Lua code the base materials, shaders and state blocks that used to be Torque scripts. It covers the common materials (WarningMaterial, BlankWhite, Corona_Mat, BlackSky/BlueSky/GreySky skies, Grid512_* grids, track editor materials, spawn arrow), the sampling states (SamplerClampLinear/Point, SamplerWrapLinear/Point), the particle, reflection, foliage and terrain shaders, water (WaterMat, UnderwaterMat and "Basic" versions), the sky (ScatterSky atmosphere, SkyLut, stars, moon, Milky Way, meteors), clouds and the vehicle highlight and transparency material (VehicleHighlightMat, vehicleGhost). It also loads all *.materials.json files in the core/ folder.
--- Access: `require("client/core")`
---@class client_core
local client_core = {}

--- Initializes the client only once: random seed (setRandomSeed(-1)), objectsRequiredForStartup, canvas creation, base materials, shaders, water, sky, clouds and vehicle data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/core.lua:1182
function client_core.initializeCore() end

--- Creates the common materials and those of the track editor, then loads each core/**/*.materials.json file with loadJsonMaterialsFile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/core.lua:719
function client_core.loadCoreMaterials() end

--- Recreates the canvas via initializeCanvas (useful after a window configuration change) and marks the core as initialized. Does not recreate the materials.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/client/core.lua:1209
function client_core.reloadCore() end

return client_core
