---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de gameplayInterface relayant vers l'extension véhicule `vehiclePerformanceData` : démarrer/arrêter des enregistrements de performance (jusqu'à 5 types), lire les données enregistrées et les données statiques du véhicule.
--- Accès : extension `gameplayInterfaceModules_interactVehiclePerformanceData` : `extensions.load (VM véhicule)("gameplayInterfaceModules_interactVehiclePerformanceData")`, puis la globale `gameplayInterfaceModules_interactVehiclePerformanceData`
---@class gameplayInterfaceModules_interactVehiclePerformanceData
---@field moduleActions table<string, function> Actions : startRecording, stopRecording.
---@field moduleLookups table<string, function> Lookups : getRecordingData, getStaticData.
gameplayInterfaceModules_interactVehiclePerformanceData = {}

--- Appelé au chargement : remplit moduleActions et moduleLookups.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua:49
function gameplayInterfaceModules_interactVehiclePerformanceData.onExtensionLoaded() end

--- Enregistre les actions et lookups auprès de gameplayInterface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayInterfaceModules/interactVehiclePerformanceData.lua:45
---@param gi table Le module gameplayInterface.
function gameplayInterfaceModules_interactVehiclePerformanceData.requestRegistration(gi) end

