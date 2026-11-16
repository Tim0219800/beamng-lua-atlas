---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary low air pressure warning controller (heavy trucks). Monitors the pressure of a tank: below airTooLowPressure and with the ignition on (ignitionLevel > 0), it sets the warning electrics value to 1, plays a sound loop and displays a message; above airOkPressure or with the ignition off it resets everything to zero (hysteresis).
--- Access: controller `pneumatics/lowAirPressureWarning` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_pneumatics_lowAirPressureWarning
---@field type string "auxiliary".
local controller_pneumatics_lowAirPressureWarning = {}

--- Reads the pressure thresholds and the monitored tank.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:60
---@param jbeamData table Controller jbeam data.
function controller_pneumatics_lowAirPressureWarning.init(jbeamData) end

--- Creates the warning sound source (if lowAirWarningSoundEvent is defined) and sets its volume. Called by the engine at sound initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:47
---@param jbeamData table Jbeam data.
function controller_pneumatics_lowAirPressureWarning.initSounds(jbeamData) end

--- Resets the warning electrics value to 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:43
---@param jbeamData table Jbeam data.
function controller_pneumatics_lowAirPressureWarning.reset(jbeamData) end

--- Stops the warning sound and resets the playback state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:36
---@param jbeamData table Jbeam data.
function controller_pneumatics_lowAirPressureWarning.resetSounds(jbeamData) end

--- Every frame: compares the tank pressure to the thresholds and updates the warning electrics value, the sound and the message.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/pneumatics/lowAirPressureWarning.lua:18
---@param dt number Time step in seconds.
function controller_pneumatics_lowAirPressureWarning.updateGFX(dt) end

return controller_pneumatics_lowAirPressureWarning
