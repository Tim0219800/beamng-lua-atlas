---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/aeroDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aerodynamic debug extension for the workbench: measures the total aerodynamic force and moment of the vehicle around its center of gravity, expresses them in the vehicle frame (right, forward, up) and estimates the distribution of lift (downforce) between front and rear axle from the provided wheel names.
--- Access: extension `aeroDebug`: `extensions.load (vehicle VM)("aeroDebug")`, then the global `aeroDebug`
---@class aeroDebug
aeroDebug = {}

--- Disables the computation and clears wheelNameStrings.
---Source: lua/vehicle/extensions/aeroDebug.lua:142
function aeroDebug.disable() end

--- Enables the computation and fills wheelNameStrings with the names of all wheels if not already done.
---Source: lua/vehicle/extensions/aeroDebug.lua:132
function aeroDebug.enable() end

--- Returns the current aeroData table (see notes for its fields).
---Source: lua/vehicle/extensions/aeroDebug.lua:121
---@return table  Aerodynamic data.
function aeroDebug.getAeroData() end

--- Initialization hook: disables the computation.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/aeroDebug.lua:17
function aeroDebug.onInit() end

--- Specifies the names of the four wheels for the per-axle distribution.
---Source: lua/vehicle/extensions/aeroDebug.lua:125
---@param FL string Name of the front left wheel.
---@param FR string Front right wheel.
---@param RL string Rear left wheel.
---@param RR string Rear right wheel.
function aeroDebug.setWheelNames(FL, FR, RL, RR) end

--- Called every frame: if enabled, computes aerodynamic forces and moments and the front/rear downforce distribution.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/aeroDebug.lua:21
---@param dt number Time step in seconds (unused).
function aeroDebug.updateGFX(dt) end

