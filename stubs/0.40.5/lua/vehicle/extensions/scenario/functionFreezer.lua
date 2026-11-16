---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/scenario/functionFreezer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lets a scenario creator prevent some of the vehicle's Lua functions from running until the scenario has started (intro screen, intro camera), for example so that a cannon does not fire during playback. On load the extension wraps controller.setFreeze: when the game calls setFreeze(1) the listed functions are replaced by `nop`, and setFreeze(any other value) restores them. The list comes from the onVehicleScenarioData hook (array of strings like "hydro_input.liftUp").
--- Access: extension `scenario_functionFreezer`: `extensions.load (vehicle VM)("scenario_functionFreezer")`, then the global `scenario_functionFreezer`
---@class scenario_functionFreezer
scenario_functionFreezer = {}

--- Hook called when the extension loads. Saves controller.setFreeze and replaces it with a function that calls the original (if it exists) then applies the freeze/unfreeze of the listed functions.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/functionFreezer.lua:38
function scenario_functionFreezer.onExtensionLoaded() end

--- Hook called on unload. Unfreezes all functions (internal setFreeze(0)) then restores the original controller.setFreeze.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/functionFreezer.lua:51
function scenario_functionFreezer.onExtensionUnloaded() end

--- Hook called with the scenario configuration. First unfreezes everything, empties the list, then validates each function name in the array and adds it to the list to freeze (does not freeze immediately: freezing happens at the next controller.setFreeze(1)).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/functionFreezer.lua:57
---@param data string[] Array of global function paths as strings (e.g. "controller.shiftDown").
function scenario_functionFreezer.onVehicleScenarioData(data) end

