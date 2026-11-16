---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gameplayInterface module for partCondition: initializes or reads part conditions (odometer, integrity, visual, default paints), reads the root part's odometer and manages condition snapshots, including the one used on reset.
--- Access: extension `gameplayInterfaceModules_interactPartCondition`: `extensions.load (vehicle VM)("gameplayInterfaceModules_interactPartCondition")`, then the global `gameplayInterfaceModules_interactPartCondition`
---@class gameplayInterfaceModules_interactPartCondition
---@field moduleActions table<string, function> Actions: initPartConditions, ensurePartConditionsInit, createPartConditionSnapshot, applyPartConditionSnapshot, deletePartConditionSnapshots, setPartConditionResetSnapshotKey, createAndSetPartConditionResetSnapshotKey.
---@field moduleLookups table<string, function> Lookups: getPartConditions, getRootPartOdometer.
gameplayInterfaceModules_interactPartCondition = {}

--- Called at load: fills moduleActions and moduleLookups.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua:99
function gameplayInterfaceModules_interactPartCondition.onExtensionLoaded() end

--- Registers the actions and lookups with gameplayInterface.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/gameplayInterfaceModules/interactPartCondition.lua:95
---@param gi table The gameplayInterface module.
function gameplayInterfaceModules_interactPartCondition.requestRegistration(gi) end

