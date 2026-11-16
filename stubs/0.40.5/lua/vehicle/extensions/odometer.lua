---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/odometer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Relative' odometer for statistics: integrates the distance traveled from electrics.values.wheelspeed with a 'rope' filter (±5 cm) to ignore back-and-forth oscillations, then submits the distance to gameplayStatistic (metrics 'vehicle/odometer/<model>.length' and 'vehicle/total_odometer.length'). Only counts when the AI is disabled.
--- Access: extension `odometer`: `extensions.load (vehicle VM)("odometer")`, then the global `odometer`
---@class odometer
odometer = {}

--- Returns the cumulative relative distance.
---Source: lua/vehicle/extensions/odometer.lua:39
---@return number  Distance in meters.
function odometer.getRelativeRecording() end

--- Load hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/odometer.lua:43
function odometer.onExtensionLoaded() end

--- Vehicle reset hook: submits the accumulated distance to the statistics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/odometer.lua:15
function odometer.onReset() end

--- Intended to reset the recording; does nothing (commented-out code).
---Source: lua/vehicle/extensions/odometer.lua:35
function odometer.startRecording() end

--- Sends the distance not yet submitted to gameplayStatistic (conditions described in the notes).
---Source: lua/vehicle/extensions/odometer.lua:46
function odometer.submitStatistic() end

--- Called every frame: integrates the distance and triggers the periodic send.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/odometer.lua:19
---@param dt number Time step in seconds.
function odometer.updateGFX(dt) end

