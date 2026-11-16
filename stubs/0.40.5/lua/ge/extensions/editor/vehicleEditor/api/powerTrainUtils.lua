---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared imgui display functions for the Vehicle Editor's powertrain inspector (vePowerTrain). They show the jbeam data of a device (recursive tree) and its live data (angular velocities, torques, ratios, clutch...), with fields specific to the device type (combustionEngine, differential, shaft, manualGearbox, frictionClutch, torqueConverter, automaticGearbox, cvtGearbox, dctGearbox).
--- Access: extension `editor_vehicleEditor_api_powerTrainUtils`: `extensions.load("editor_vehicleEditor_api_powerTrainUtils")`, then the global `editor_vehicleEditor_api_powerTrainUtils`
---@class editor_vehicleEditor_api_powerTrainUtils
editor_vehicleEditor_api_powerTrainUtils = {}

--- Displays the common live data: inputAV, outputAV1/2, outputTorque1/2, isBroken, mode, virtualMassAV, isPhysicallyDisconnected, gearRatio, cumulativeGearRatio, cumulativeInertia.
---Source: lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:102
---@param device table Serialized live data of the device.
function editor_vehicleEditor_api_powerTrainUtils.displayLivedata(device) end

--- Displays in two columns the live fields specific to the device type (for example engineLoad for an engine, diffAngle/outputAV2/outputTorque2 for a differential, clutchAngle/lockSpring for a clutch).
---Source: lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:11
---@param deviceType string Type of the device (device.type).
---@param device table Serialized live data of the device.
function editor_vehicleEditor_api_powerTrainUtils.displayLivedataByType(deviceType, device) end

--- Assigns the global `vEditor` to the given instance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:133
---@param editorInstance table Editor instance (normally editor_veMain).
function editor_vehicleEditor_api_powerTrainUtils.initialize(editorInstance) end

--- Displays in a tree node 'All jbeam data' all the jbeam data of the device vEditor.vdata.powertrain[deviceID].
---Source: lua/ge/extensions/editor/vehicleEditor/api/powerTrainUtils.lua:126
---@param deviceID integer Index of the device in vdata.powertrain (0-based).
function editor_vehicleEditor_api_powerTrainUtils.showJbeamData(deviceID) end

