---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor/record.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Path recording for the Drive Path Editor: while the player drives a vehicle, the module samples its position and speed every second, then on stop creates a new "Recorded_<name>" spline linked to that vehicle, simplified by the RDP algorithm.
--- Access: extension `editor_drivePathEditor_record`: `extensions.load("editor_drivePathEditor_record")`, then the global `editor_drivePathEditor_record`
---@class editor_drivePathEditor_record
editor_drivePathEditor_record = {}

--- Time elapsed since the start of recording.
---Source: lua/ge/extensions/editor/drivePathEditor/record.lua:36
---@return number  seconds
function editor_drivePathEditor_record.getRecordingTime() end

--- To be called every frame: advances the timer and adds a point (position, speed >= 3 m/s) every second. No effect if no vehicle is being recorded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/drivePathEditor/record.lua:39
function editor_drivePathEditor_record.handleRecord() end

--- Starts recording: stores the vehicle, makes the player enter it (be:enterVehicle(0, ...)), clears the data and records the first point.
---Source: lua/ge/extensions/editor/drivePathEditor/record.lua:64
---@param vehicle table|nil editor vehicle entry with .veh (vehicle object) and .name
function editor_drivePathEditor_record.startRecord(vehicle) end

--- Ends recording: adds a path spline linked to the vehicle, copies positions and speeds, removes nearby duplicates, simplifies via rdp.simplifyNodesVels and resets the state.
---Source: lua/ge/extensions/editor/drivePathEditor/record.lua:86
---@param sceneVehicles table scene vehicles; the matching entry receives isLink = true and linkSplineId
function editor_drivePathEditor_record.stopRecord(sceneVehicles) end

