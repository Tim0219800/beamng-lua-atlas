---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for cargo containers (jbeam section cargoStorage): lets the GE gameplay virtually fill the containers (target volume and density) and read their state. The filling is smoothed over time and translates into node mass changes and stiffness/damping/strength changes of the beams linked to the group via jbeam functions (nodeWeightFunction, beamSpringFunction...).
--- Access: extension `gameplayInterfaceModules_interactCargoContainers`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactCargoContainers")`, then the global `gameplayInterfaceModules_interactCargoContainers`
---@class gameplayInterfaceModules_interactCargoContainers
---@field moduleActions table<string, function> Exposed actions: setCargoContainers.
---@field moduleLookups table<string, function> Exposed lookups: getCargoContainers.
gameplayInterfaceModules_interactCargoContainers = {}

--- Called at load: disables the update, fills moduleActions/moduleLookups and clears the cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:332
function gameplayInterfaceModules_interactCargoContainers.onExtensionLoaded() end

--- Called at vehicle reset: disables the update and clears the container cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:340
function gameplayInterfaceModules_interactCargoContainers.onReset() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:328
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactCargoContainers.requestRegistration(gi) end

--- Enables or disables this extension's updateGFX loop (with extensions.hookUpdate('updateGFX')).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:238
---@param enabled boolean true to start the container smoothing.
function gameplayInterfaceModules_interactCargoContainers.setUpdateEnabled(enabled) end

--- Called every frame during filling: advances the smoothers of each container that has not reached its target and applies masses/beam properties; disables itself when everything is at target. Is nop otherwise. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactCargoContainers.lua:dyn
---@param dtSim number Simulation time step in seconds.
function gameplayInterfaceModules_interactCargoContainers.updateGFX(dtSim) end

