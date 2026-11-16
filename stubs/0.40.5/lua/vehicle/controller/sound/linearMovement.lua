---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/linearMovement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary sound controller for a linear movement (cylinder, seat, platform, kickstand...). It measures the length of a "position sensor" beam (found by tag), derives a smoothed velocity from it and plays: a movement loop (volume/pitch depending on velocity, CT parameter = direction), segment sounds at each segmentLength step (up/down) and end-stop sounds (min/max position).
--- Access: controller `sound/linearMovement` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_sound_linearMovement
---@field type string "auxiliary".
---@field updateGFX function nop at load, then internal updateGFX after a successful init.
local controller_sound_linearMovement = {}

--- Finds the sensor beam by tag, reads the segment/end-stop configuration and creates the velocity smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/linearMovement.lua:236
---@param jbeamData table Controller jbeam data.
function controller_sound_linearMovement.init(jbeamData) end

--- Creates the movement loop and reads the sound events and settings; validates the thresholds. Called by the engine at sound initialization.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/linearMovement.lua:178
---@param jbeamData table Jbeam data.
function controller_sound_linearMovement.initSounds(jbeamData) end

--- Resets the last length, the segment and the smoothers to their initial state.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/linearMovement.lua:171
---@param jbeamData table Jbeam data.
function controller_sound_linearMovement.reset(jbeamData) end

--- Stops the loop and rearms the end-stop sounds according to the current position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/linearMovement.lua:163
---@param jbeamData table Jbeam data.
function controller_sound_linearMovement.resetSounds(jbeamData) end

return controller_sound_linearMovement
