---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/AVAS.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller for the pedestrian acoustic vehicle alerting system (AVAS) of electric vehicles. Plays a "forward" loop in D/S modes, a "reverse" loop in R, and nothing otherwise or above the maximum speed (+1 m/s); the pitch/volume parameter depends on speed.
--- Access: controller `sound/AVAS` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_sound_AVAS
---@field type string "auxiliary".
local controller_sound_AVAS = {}

--- Does nothing (the configuration is read in initSounds).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/AVAS.lua:62
---@param jbeamData table Jbeam data.
function controller_sound_AVAS.init(jbeamData) end

--- Creates the two looping sound sources and reads the maximum speed and volume. Called by the engine at sound initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/AVAS.lua:65
---@param jbeamData table Jbeam data.
function controller_sound_AVAS.initSounds(jbeamData) end

--- Stops both sounds and resets the state to "stopped".
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/AVAS.lua:56
function controller_sound_AVAS.reset() end

--- Every frame: chooses the state (forward/reverse/stopped) depending on the gear and speed, plays/stops the sounds and adjusts the speed parameter.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/AVAS.lua:22
---@param dt number Time step in seconds.
function controller_sound_AVAS.updateGFX(dt) end

return controller_sound_AVAS
