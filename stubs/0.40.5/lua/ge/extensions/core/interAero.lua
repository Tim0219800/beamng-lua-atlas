---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/interAero.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_interAero`: simulates aerodynamic interactions BETWEEN vehicles (slipstream / drafting, "bump drafting" and side effect). On every simulation frame, for each pair of moving vehicles, it computes a local wind (vec3, in m/s) to apply to each vehicle via `veh:setWindAero(x, y, z)`. The extension has no public API to call: it runs on its own in onUpdate and its settings are local constants. A modder reads it to understand or reproduce the effect.
--- Access: extension `core_interAero`: `extensions.load("core_interAero")`, then the global `core_interAero`
---@class core_interAero
core_interAero = {}

--- Per-frame hook: computes the inter-vehicle aerodynamic effects (calculateAero) from dtSim and applies the resulting wind to each active vehicle via setWindAero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/interAero.lua:563
---@param dtReal number Real-time delta in seconds (used for the debug blinking).
---@param dtSim number Simulation time delta in seconds; used to estimate speeds.
---@param dtRaw number Raw time delta (unused).
function core_interAero.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook: a vehicle became active or inactive. Removes its entry from the cache so it is recomputed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/interAero.lua:260
---@param vehId integer Vehicle id.
function core_interAero.onVehicleActiveChanged(vehId) end

--- Hook on vehicle destruction: clears its cache entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/interAero.lua:260
---@param vehId integer Vehicle id.
function core_interAero.onVehicleDestroyed(vehId) end

--- Hook on vehicle creation: clears its cache entry (necessary when a vehicle replaces another with the same id).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/interAero.lua:260
---@param vehId integer Vehicle id.
function core_interAero.onVehicleSpawned(vehId) end

