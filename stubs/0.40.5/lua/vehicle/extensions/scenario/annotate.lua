---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/scenario/annotate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Example of a vehicle extension driven by a scenario. It displays floating text 2 m above the vehicle (with a vertical line) via obj.debugDrawProxy. The text comes from the `text` field of the vehicle's `extensions.annotate` entry in the scenario .json, passed by the onVehicleScenarioData hook.
--- Access: extension `scenario_annotate`: `extensions.load (vehicle VM)("scenario_annotate")`, then the global `scenario_annotate`
---@class scenario_annotate
---@field onExtensionLoaded nil Always nil: assigned from an undefined variable (see notes).
scenario_annotate = {}

--- Debug draw hook called by main.lua (extensions.hook('onDebugDraw', focusPos)) on each debug graphics frame. Draws the text `data.text` in black at vehicle position + (0,0,2) and a line between the vehicle and this point.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/annotate.lua:29
---@param focusPos vec3 Camera focus position (unused here).
function scenario_annotate.onDebugDraw(focusPos) end

--- Hook called when the scenario provides the extension data for this vehicle. Copies the table (deepcopy), checks that `text` is a string (otherwise error log) and dumps it to the console.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/scenario/annotate.lua:35
---@param _data table Table from the scenario .json (`extensions.annotate`), expected with a `text` field (string).
function scenario_annotate.onVehicleScenarioData(_data) end

