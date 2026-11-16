---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/airplaneSurfaces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for airplanes: combines the pilot's inputs (rudder, ailerons, elevator) with the trims, and handles flaps and slats. It writes the results to `electrics.values` (rudder, aileron, elevator, slat, flap), which the jbeam actuators then use, and displays UI messages when a value changes.
--- Access: controller `airplaneSurfaces` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_airplaneSurfaces
---@field type string "auxiliary" (mandatory controller parameter).
local controller_airplaneSurfaces = {}

--- Initializes the electrics, the start values of flaps/slats/trims and the speeds from the jbeam.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/airplaneSurfaces.lua:91
---@param jbeamData table Controller jbeam data.
function controller_airplaneSurfaces.init(jbeamData) end

--- Directly sets the trim value of an axis (no effect if the axis is unknown).
---Source: lua/vehicle/controller/airplaneSurfaces.lua:85
---@param input string "rudder", "aileron" or "elevator".
---@param value number Trim value (normally -1 to 1).
function controller_airplaneSurfaces.setTrimValue(input, value) end

--- Switches to the next trim axis (elevator, aileron, rudder) and announces it with a UI message.
---Source: lua/vehicle/controller/airplaneSurfaces.lua:75
function controller_airplaneSurfaces.toggleTrimMode() end

--- Every frame: applies the inputs and trims to the electrics rudder, aileron, elevator, updates flap and slat (absolute input value if it changed, otherwise relative adjustment), and displays a UI message when a trim, the flaps or the slats vary by more than 0.005.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/airplaneSurfaces.lua:32
---@param dt number Time step in seconds.
function controller_airplaneSurfaces.updateGFX(dt) end

return controller_airplaneSurfaces
