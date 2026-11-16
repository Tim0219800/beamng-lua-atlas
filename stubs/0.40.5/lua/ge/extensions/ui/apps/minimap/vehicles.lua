---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/apps/minimap/vehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Draws the minimap's vehicle markers: the player (vehicle, pedestrian on foot or free camera) and the other active vehicles (traffic, parked cars, police, usable or unusable vehicles). The minimap module passes its drawing state to it via setMinimapState then calls drawPlayer and drawOtherVehicles every frame. Loaded by require, it relies on ui_apps_minimap_utils and the minimap's td:vehicleMarker.
--- Access: extension `ui_apps_minimap_vehicles`: `extensions.load("ui_apps_minimap_vehicles")`, then the global `ui_apps_minimap_vehicles`
---@class ui_apps_minimap_vehicles
ui_apps_minimap_vehicles = {}

--- Draws all the other active vehicles visible according to the debug settings (traffic, parked, active police, usable, unusable).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/vehicles.lua:153
---@param dtReal number Elapsed real time (not used).
---@param dtSim number Elapsed simulation time (not used).
function ui_apps_minimap_vehicles.drawOtherVehicles(dtReal, dtSim) end

--- Draws the player marker (vehicle or pedestrian) and, in free camera, the camera marker. Also computes a dynamic scale (larger at high speed) returned to the caller; returns nil if there is no player vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/vehicles.lua:56
---@param dtReal number Elapsed real time (s).
---@param dtSim number Simulation elapsed time (s).
---@return number|nil  Adjusted scale of the player marker.
function ui_apps_minimap_vehicles.drawPlayer(dtReal, dtSim) end

--- Receives from the main minimap the whole drawing state (size, center, camera, scale, drawing object, debug settings, camera direction, dpi) and retrieves the current palette and world-to-map transform.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/apps/minimap/vehicles.lua:31
---@param w number Map width in pixels.
---@param h number Map height in pixels.
---@param cx number Center X.
---@param cy number Center Y.
---@param cp vec3 Camera position.
---@param cr quat Camera rotation.
---@param cri quat Inverse camera rotation.
---@param s number Map scale.
---@param si number Inverse of the scale.
---@param textureDraw table Drawing object (vehicleMarker, line…).
---@param debugSettingsObj table Debug settings (drawPlayer, drawTrafficVehicles, drawParkedVehicles, drawOtherVehicles, drawUnusableVehicles, drawActivePoliceVehicles, lookaheadEnabled, lookaheadValue).
---@param cameraLookObj vec3 Camera look direction.
---@param dpiValue number|nil dpi factor, multiplied by the global globalDpi if it exists.
function ui_apps_minimap_vehicles.setMinimapState(w, h, cx, cy, cp, cr, cri, s, si, textureDraw, debugSettingsObj, cameraLookObj, dpiValue) end

