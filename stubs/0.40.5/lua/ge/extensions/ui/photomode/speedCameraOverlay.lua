---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/speedCameraOverlay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Provides the data displayed by the photo mode "radar / speed camera" overlay: current map, place name, level time, player vehicle license plate, speed limit of the nearest road and position. Everything is read-only with protected accesses (pcall): no value is modified.
--- Access: extension `ui_photomode_speedCameraOverlay`: `extensions.load("ui_photomode_speedCameraOverlay")`, then the global `ui_photomode_speedCameraOverlay`
---@class ui_photomode_speedCameraOverlay
ui_photomode_speedCameraOverlay = {}

--- Builds the overlay's data table. Missing strings are "", levelTime is {} if the time is unavailable, roadDistance/speedLimit/position are nil if unknown.
---Source: lua/ge/extensions/ui/photomode/speedCameraOverlay.lua:129
---@return table  {mapId=string, mapName=string, locationName=string (highest-priority gameplay_city zone, otherwise mapName), levelTime={time,year,month,day} from core_environment.getTimeOfDay, licensePlate=string, roadDistance=number|nil (distance to the nearest road), speedLimit=number|nil, position={x,y,z}|nil}.
function ui_photomode_speedCameraOverlay.getData() end

