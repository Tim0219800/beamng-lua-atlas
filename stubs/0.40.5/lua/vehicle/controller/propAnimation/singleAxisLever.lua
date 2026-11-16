---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/singleAxisLever.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller animating a single-axis gear lever (automatic gearbox lever). Converts electrics.values.gearModeIndex into a smoothed lever position (output electric) using a coordinate table keyed by mode index, and plays a lever sound at the start of each movement.
--- Access: controller `propAnimation/singleAxisLever` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_propAnimation_singleAxisLever
---@field type string "auxiliary".
local controller_propAnimation_singleAxisLever = {}

--- Reads the coordinate table, the sound node/event and the output electric name.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/singleAxisLever.lua:55
---@param jbeamData table Controller jbeam data.
function controller_propAnimation_singleAxisLever.init(jbeamData) end

--- Resets the lever position to 0 and the smoother to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/singleAxisLever.lua:47
---@param jbeamData table Jbeam data.
function controller_propAnimation_singleAxisLever.reset(jbeamData) end

--- Every frame: smooths the position toward the coordinate of the current mode, plays the sound at the start of the movement and publishes the position.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/singleAxisLever.lua:28
---@param dt number Time step in seconds.
function controller_propAnimation_singleAxisLever.updateGFX(dt) end

return controller_propAnimation_singleAxisLever
