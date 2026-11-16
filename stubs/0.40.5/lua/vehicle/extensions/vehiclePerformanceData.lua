---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/vehiclePerformanceData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Collection of vehicle performance data, mostly used by the UI/the game for spec sheets and certifications. Two parts: static data (weight, driven wheel distribution, gearbox type, fuels, induction type) via getStaticData, and dynamic recordings (peak power, torque, longitudinal and lateral acceleration) started by startRecording and read by getRecordingData. The extension only enables its updateGFX during a recording.
--- Access: extension `vehiclePerformanceData`: `extensions.load (vehicle VM)("vehiclePerformanceData")`, then the global `vehiclePerformanceData`
---@class vehiclePerformanceData
---@field recordingTypes table<string, string> Dynamic recording types: power, torque, speed, longitudinalAcceleration, lateralAcceleration.
---@field staticTypes table<string, string> Static data names: weight, powertrainLayout, transmissionStyle, propulsionType, fuelType, inductionType.
---@field updateGFX function|nil nil at rest; set by startRecording while a recording is active.
vehiclePerformanceData = {}

--- Returns the data collected for the requested types.
---Source: lua/vehicle/extensions/vehiclePerformanceData.lua:262
---@param recordingTypes string[] List of recordingTypes values.
---@return table<string, table>  Table type -> data (nil for a type never started).
function vehiclePerformanceData.getRecordingData(recordingTypes) end

--- Computes and returns the vehicle's static data (weight, layout, gearbox, fuels, induction).
---Source: lua/vehicle/extensions/vehiclePerformanceData.lua:270
---@return table  Table with the keys of staticTypes.
function vehiclePerformanceData.getStaticData() end

--- Load hook: initializes the recording tables and associates each type with its start/stop/update routines.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/vehiclePerformanceData.lua:281
function vehiclePerformanceData.onExtensionLoaded() end

--- Starts the requested recordings (initializes their data, calls their start routine) and enables the updateGFX hook if needed.
---Source: lua/vehicle/extensions/vehiclePerformanceData.lua:233
---@param recordingTypes string[] List of recordingTypes values.
function vehiclePerformanceData.startRecording(recordingTypes) end

--- Stops the requested recordings; disables updateGFX if none is active anymore. The data stays readable.
---Source: lua/vehicle/extensions/vehiclePerformanceData.lua:248
---@param recordingTypes string[] List of recordingTypes values.
function vehiclePerformanceData.stopRecording(recordingTypes) end

