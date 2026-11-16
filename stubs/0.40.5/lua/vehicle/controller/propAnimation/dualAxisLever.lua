---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/dualAxisLever.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary two-axis lever animation controller (automatic gearbox lever of the P R N D S M type with a gate). Reads the current mode name (electrics.values.gear by default), queues it then moves the virtual lever mode by mode (passing through the intermediate modes), optionally via intermediate coordinates (modeChanges), and publishes the position in electrics dualAxisX / dualAxisY. Handles the S and M modes (with impulse modes M+ and M-).
--- Access: controller `propAnimation/dualAxisLever` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_propAnimation_dualAxisLever
---@field type string "auxiliary".
---@field updateGFX function nop at load, then internal updateGFX after init.
local controller_propAnimation_dualAxisLever = {}

--- Reads mode coordinates, impulse modes, mode changes, sounds and smoothers; starts on the first mode of the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/dualAxisLever.lua:271
---@param jbeamData table Controller jbeam data.
function controller_propAnimation_dualAxisLever.init(jbeamData) end

--- Resets position, mode queue, movement states and smoothers to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/dualAxisLever.lua:249
---@param jbeamData table Jbeam data.
function controller_propAnimation_dualAxisLever.reset(jbeamData) end

return controller_propAnimation_dualAxisLever
