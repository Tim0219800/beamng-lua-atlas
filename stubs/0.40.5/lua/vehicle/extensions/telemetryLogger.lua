---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/telemetryLogger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simple telemetry recorder: every graphics frame (when recording is active) it stores timestamp, position, speed, throttle, brake, steering, parking brake and G forces (sensors.gx2/gy2), then saveDataToDisk writes it all to a CSV file `telemetryData_HH-MM-SS.csv`. Handy for a modder who wants to export a driving session.
--- Access: extension `telemetryLogger`: `extensions.load (vehicle VM)("telemetryLogger")`, then the global `telemetryLogger`
---@class telemetryLogger
telemetryLogger = {}

--- Hook called on vehicle initialization: clears the data, resets the index and the timestamp to zero and stops recording.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/telemetryLogger.lua:72
function telemetryLogger.onInit() end

--- Hook called on vehicle reset; same function as onInit (clears the data and stops recording).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/telemetryLogger.lua:72
function telemetryLogger.onReset() end

--- Stops recording and writes the collected data to `telemetryData_<time>.csv`, then resets the state.
---Source: lua/vehicle/extensions/telemetryLogger.lua:40
---@return boolean|nil  false if the file could not be opened, nil otherwise.
function telemetryLogger.saveDataToDisk() end

--- Enables recording: updateGFX adds a data point every frame. Does not reset the data (use onInit/onReset or saveDataToDisk for that).
---Source: lua/vehicle/extensions/telemetryLogger.lua:64
function telemetryLogger.startRecording() end

--- Pauses recording without clearing the data already collected.
---Source: lua/vehicle/extensions/telemetryLogger.lua:68
function telemetryLogger.stopRecording() end

--- Called every graphics frame (extensions.hook('updateGFX')). If recording is active, adds a data point.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/telemetryLogger.lua:13
---@param dt number Time step in seconds, added to the timestamp.
function telemetryLogger.updateGFX(dt) end

