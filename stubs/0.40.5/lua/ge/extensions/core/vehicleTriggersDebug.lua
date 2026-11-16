---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicleTriggersDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Vehicle event debug" ImGui window to inspect vehicle triggers: shows the state of core_vehicleTriggers (camera, held trigger, hovered position, labels), lists vehicles with their triggers, action links and JBeam events, and lets you fire them with the mouse. Loaded by core_vehicleTriggers.enableDebugUI() and unloaded by disableDebugUI(). A vehicle modder uses it to check their triggers and triggerEventLinks sections.
--- Access: extension `core_vehicleTriggersDebug`: `extensions.load("core_vehicleTriggersDebug")`, then the global `core_vehicleTriggersDebug`
---@class core_vehicleTriggersDebug
---@field dependencies string[] core_vehicleTriggers and core_vehicle_vehicleTriggerHighlight.
core_vehicleTriggersDebug = {}

--- Hook called after an extensions reload: restores the highlighted triggers through core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggersDebug.lua:485
---@param data table|nil Data from onSerialize ({highLightedTriggerData}).
function core_vehicleTriggersDebug.onDeserialized(data) end

--- Hook called before an extensions reload: saves the highlighted triggers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggersDebug.lua:475
---@return table  {highLightedTriggerData = highlight data or nil}
function core_vehicleTriggersDebug.onSerialize() end

--- Hook called every frame: draws the debug ImGui window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/vehicleTriggersDebug.lua:471
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
---@param dtRaw number Raw elapsed time (s).
function core_vehicleTriggersDebug.onUpdate(dtReal, dtSim, dtRaw) end

