---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/inputOutputDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Demo controller (type "auxiliary", defaultOrder 100000) showing how to read vehicle data, generate inputs and communicate over UDP. Every frame it records time, throttle, brake, battery energy and motor power in an in-memory CSV table, sends random inputs (throttle, brake, steering in FILTER_DIRECT) and exchanges a JSON message with 127.0.0.1:54812. Not intended for a playable vehicle.
--- Access: controller `inputOutputDemo` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_inputOutputDemo
---@field defaultOrder number 100000 (executed last).
---@field type string "auxiliary".
local controller_inputOutputDemo = {}

--- Prepares the CSV header, resets the timer to 0 and configures the UDP socket toward 127.0.0.1:54812.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/inputOutputDemo.lua:125
function controller_inputOutputDemo.init() end

--- Clears the CSV log (header only) and resets the timer to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/inputOutputDemo.lua:119
function controller_inputOutputDemo.reset() end

--- Writes the accumulated log to testLog.csv.
---Source: lua/vehicle/controller/inputOutputDemo.lua:37
function controller_inputOutputDemo.saveLogToCSV() end

--- Increments the internal timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/inputOutputDemo.lua:112
---@param dt number Time step (s).
function controller_inputOutputDemo.update(dt) end

--- Does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/inputOutputDemo.lua:102
---@param dt number Time step (s).
function controller_inputOutputDemo.updateFixedStep(dt) end

--- Logs the data, generates random inputs and communicates over UDP.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/inputOutputDemo.lua:95
---@param dt number Time step (s).
function controller_inputOutputDemo.updateGFX(dt) end

return controller_inputOutputDemo
