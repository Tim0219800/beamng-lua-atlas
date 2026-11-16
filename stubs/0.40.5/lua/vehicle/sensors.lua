---@meta
-- tim19Atlas stub generated from lua/vehicle/sensors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exposes the accelerations measured at the vehicle's reference node (gx, gy, gz) as well as their smoothed version (gx2, gy2, gz2). The raw values come from an FFI structure provided by the engine (obj:getSensorsFFI()) and are copied at each updateGFX. Used by the AI, ESC, post-crash braking, gauges and simulator protocols.
--- Access: global `sensors`
---@class sensors
---@field ffiSensors table|number FFI structure returned by obj:getSensorsFFI() (fields sensorX, sensorY, sensorZnonInertial...). Is 0 before init().
---@field gx number Raw acceleration on the sensor X axis (ffiSensors.sensorX).
---@field gx2 number gx temporally smoothed (non-linear smoothing, parameter 7).
---@field gy number Raw acceleration on the sensor Y axis (ffiSensors.sensorY).
---@field gy2 number gy temporally smoothed.
---@field gz number Raw non-inertial vertical acceleration (ffiSensors.sensorZnonInertial).
---@field gz2 number gz temporally smoothed.
sensors = {}

--- Fetches the sensors FFI structure from the engine then calls reset(). Called when the vehicle loads.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sensors.lua:36
function sensors.init() end

--- Resets the three temporal smoothers. Called when the vehicle is reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sensors.lua:19
function sensors.reset() end

--- Copies the raw accelerations from ffiSensors into gx/gy/gz and updates the smoothed values gx2/gy2/gz2. Called every graphics frame by the main loop.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/sensors.lua:25
---@param dt number Frame time step in seconds.
function sensors.updateGFX(dt) end

