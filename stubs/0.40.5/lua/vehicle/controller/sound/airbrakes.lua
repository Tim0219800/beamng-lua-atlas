---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/airbrakes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for a simple pneumatic brake release sound (no air simulation, unlike pneumatics/airbrakes). Monitors electrics.values[electricsBrakeName]; if the brake is released by more than 0.2 per second over a 0.25 s window, plays a "pssht" whose intensity depends on the release speed, then waits for a cooldown.
--- Access: controller `sound/airbrakes` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_sound_airbrakes
---@field type string "auxiliary".
local controller_sound_airbrakes = {}

--- Reads the jbeam configuration and resets the state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/airbrakes.lua:56
---@param jbeamData table Jbeam data.
function controller_sound_airbrakes.init(jbeamData) end

--- Resets the sampling state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/airbrakes.lua:49
function controller_sound_airbrakes.reset() end

--- Every frame: detects a quick brake release and plays the sound.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/airbrakes.lua:23
---@param dt number Time step in seconds.
function controller_sound_airbrakes.updateGFX(dt) end

return controller_sound_airbrakes
