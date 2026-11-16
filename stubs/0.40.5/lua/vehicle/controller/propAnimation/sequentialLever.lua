---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/sequentialLever.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary sequential lever animation controller: at each gear change of the "gearbox" device (upshift = lever pushed, downshift = lever pulled), it makes a smoothed value oscillate between -1, 0 and 1 published in electrics.values.sequentialLeverY, and plays a lever sound (up / down) with the shift aggression as a parameter.
--- Access: controller `propAnimation/sequentialLever` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_propAnimation_sequentialLever
---@field type string "auxiliary".
local controller_propAnimation_sequentialLever = {}

--- Gets the gearbox device, checks its type and reads the sounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/sequentialLever.lua:59
---@param jbeamData table Controller jbeam data.
function controller_propAnimation_sequentialLever.init(jbeamData) end

--- Resets the lever state and the smoother to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/sequentialLever.lua:52
---@param jbeamData table Jbeam data.
function controller_propAnimation_sequentialLever.reset(jbeamData) end

--- Every frame: detects the gear change, smooths the impulse, plays the sound and publishes the value.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/sequentialLever.lua:28
---@param dt number Time step in seconds.
function controller_propAnimation_sequentialLever.updateGFX(dt) end

return controller_propAnimation_sequentialLever
