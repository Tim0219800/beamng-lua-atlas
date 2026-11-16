---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/vehicleCapture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Recorder bound to a vehicle. Fields: vehicle, interval_m (2), last_dist_pos, capturesBuffer, fname.
---@class gameplay_rally_vehicleCapture
local gameplay_rally_vehicleCapture = {}

--- To be called every frame: reads the vehicle's position and orientation (quatf from direction and up vector) and, if it has moved more than interval_m away from the last capture, buffers {ts, pos, quat, steering}. Then tries to write the buffer.
---Source: lua/ge/extensions/gameplay/rally/vehicleCapture.lua:52
function gameplay_rally_vehicleCapture:capture() end

--- Draws a semi-transparent blue sphere of radius 2 at the last captured position (debugDrawer:drawSphere).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/vehicleCapture.lua:83
function gameplay_rally_vehicleCapture:drawDebug() end

--- Constructor. Registers the 'steering' change notification with core_vehicleBridge and computes the path of the driveline.json file via rallyUtil.missionReccePath.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/vehicleCapture.lua:12
---@param vehicle table Vehicle object (getId, getPosition, getDirectionVector…).
---@param missionDir string Mission folder.
function gameplay_rally_vehicleCapture:init(vehicle, missionDir) end

--- Empties the captures file (opened in "w" mode). Logs an error if opening fails.
---Source: lua/ge/extensions/gameplay/rally/vehicleCapture.lua:23
function gameplay_rally_vehicleCapture:truncateCapturesFile() end

--- Appends the buffer's captures to the file (one JSON line each) then empties the buffer. Without force, does nothing as long as the buffer contains fewer than 10 elements.
---Source: lua/ge/extensions/gameplay/rally/vehicleCapture.lua:32
---@param force boolean|nil true to write even with fewer than 10 captures.
function gameplay_rally_vehicleCapture:writeCaptures(force) end

