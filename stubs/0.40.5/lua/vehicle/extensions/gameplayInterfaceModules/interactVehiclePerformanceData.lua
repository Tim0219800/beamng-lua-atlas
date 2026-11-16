---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module relaying to the vehicle extension `vehiclePerformanceData`: starts/stops performance recordings (up to 5 types), reads the recorded data and the vehicle's static data.
--- Access: extension `gameplayInterfaceModules_interactVehiclePerformanceData`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactVehiclePerformanceData")`, then the global `gameplayInterfaceModules_interactVehiclePerformanceData`
---@class gameplayInterfaceModules_interactVehiclePerformanceData
---@field moduleActions table<string, function> Actions: startRecording, stopRecording.
---@field moduleLookups table<string, function> Lookups: getRecordingData, getStaticData.
gameplayInterfaceModules_interactVehiclePerformanceData = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua:49
function gameplayInterfaceModules_interactVehiclePerformanceData.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua:45
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactVehiclePerformanceData.requestRegistration(gi) end

