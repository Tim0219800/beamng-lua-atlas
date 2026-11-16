---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/funstuff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_funstuff`: "fun" actions of the sandbox mode radial menu: force field, vehicle boosts and flings, destruction (break, deflate, ignite, explode), opening hoods/doors, fuel level, random colors and vehicle, random route. The exported functions act on player vehicle 0 and return an instruction for the radial menu ({'hide'} or {'reload'}). registerFunstuffActions registers the entries in core_quickAccess.
--- Access: extension `core_funstuff`: `extensions.load("core_funstuff")`, then the global `core_funstuff`
---@class core_funstuff
---@field dependencies string[] {'core_jobsystem', 'gameplay_forceField'}.
core_funstuff = {}

--- Adds 25 m/s to the player vehicle in its forward direction.
---Source: lua/ge/extensions/core/funstuff.lua:61
---@return string[]  {'hide'}.
function core_funstuff.boost() end

--- Adds 25 m/s to the player vehicle backwards.
---Source: lua/ge/extensions/core/funstuff.lua:72
---@return string[]  {'hide'}.
function core_funstuff.boostBackwards() end

--- Breaks all breakgroups of the player vehicle (beamstate.breakAllBreakgroups). Error if there is no vehicle.
---Source: lua/ge/extensions/core/funstuff.lua:85
---@return string[]  {'hide'}.
function core_funstuff.breakAllBreakgroups() end

--- Breaks the hinges of the player vehicle (beamstate.breakHinges).
---Source: lua/ge/extensions/core/funstuff.lua:90
---@return string[]  {'hide'}.
function core_funstuff.breakHinges() end

--- Closes all latches of the player vehicle via the 'latchesClose' action.
---Source: lua/ge/extensions/core/funstuff.lua:253
---@return string[]  {'hide'}.
function core_funstuff.closeLatches() end

--- Deflates one random tire (beamstate.deflateRandomTire).
---Source: lua/ge/extensions/core/funstuff.lua:100
---@return string[]  {'hide'}.
function core_funstuff.deflateRandomTire() end

--- Deflates all tires of the player vehicle (beamstate.deflateTires).
---Source: lua/ge/extensions/core/funstuff.lua:95
---@return string[]  {'hide'}.
function core_funstuff.deflateTires() end

--- Explodes the player vehicle (see notes: temporary repulsive planet + fire.explodeVehicle + breaking all breakgroups). Runs in a core_jobsystem job.
---Source: lua/ge/extensions/core/funstuff.lua:133
---@return string[]|nil  {'hide'}; nil if there is no player vehicle.
function core_funstuff.explodeVehicle() end

--- Extinguishes the fire of the player vehicle (fire.extinguishVehicle).
---Source: lua/ge/extensions/core/funstuff.lua:110
---@return string[]  {'hide'}.
function core_funstuff.extinguishVehicle() end

--- Throws the player vehicle downwards at 15 m/s.
---Source: lua/ge/extensions/core/funstuff.lua:53
---@return string[]  {'hide'}.
function core_funstuff.flingDownward() end

--- Throws the player vehicle upwards at 15 m/s (reduced if it is already rising fast).
---Source: lua/ge/extensions/core/funstuff.lua:45
---@return string[]  {'hide'}.
function core_funstuff.flingUpward() end

--- Sets the player vehicle on fire (fire.igniteVehicle).
---Source: lua/ge/extensions/core/funstuff.lua:105
---@return string[]  {'hide'}.
function core_funstuff.igniteVehicle() end

--- Opens all latches (doors, hood, trunk) of the player vehicle via core_vehicleBridge.executeAction(…, 'latchesOpen').
---Source: lua/ge/extensions/core/funstuff.lua:248
---@return string[]  {'hide'}.
function core_funstuff.openLatches() end

--- Registers in core_quickAccess the radial menu levels '/root/sandbox/funStuff/' (home + Destruction, Forces, Other submenus) and their entries, respecting the actions blocked by core_input_actionFilter.
---Source: lua/ge/extensions/core/funstuff.lua:271
---@param entries any Not used.
function core_funstuff.registerFunstuffActions(entries) end

--- Cycles the force field through three states: inactive -> repulsion (multiplier 1) -> attraction (multiplier -0.5) -> inactive.
---Source: lua/ge/extensions/core/funstuff.lua:9
---@return string[]  {'reload'}: reloads the radial menu.
function core_funstuff.toggleForceField() end

