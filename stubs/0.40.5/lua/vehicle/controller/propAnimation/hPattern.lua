---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/propAnimation/hPattern.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary H-pattern gear lever animation controller (manual gearbox). Follows the engaged gear of the "gearbox" device and moves a virtual lever on two axes (electrics hPatternAxisX / hPatternAxisY) through the gate: on engagement, it moves first in X then in Y; on disengagement, first in Y then in X. Plays an engagement and disengagement sound with the shift aggression. Rapid gear changes are queued (dequeue) to be animated one after the other.
--- Access: controller `propAnimation/hPattern` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_propAnimation_hPattern
---@field type string "auxiliary".
local controller_propAnimation_hPattern = {}

--- Reads the H-pattern gate coordinates, checks the gearbox device and initializes sounds and the gear queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/hPattern.lua:159
---@param jbeamData table Controller jbeam data.
function controller_propAnimation_hPattern.init(jbeamData) end

--- Resets the lever to (0, 0), clears the gear queue and resets smoothers and demo.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/hPattern.lua:142
---@param jbeamData table Jbeam data.
function controller_propAnimation_hPattern.reset(jbeamData) end

--- Every frame: queues the gear changes, moves the lever in X/Y, plays the sounds and publishes the electrics.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/propAnimation/hPattern.lua:72
---@param dt number Time step in seconds.
function controller_propAnimation_hPattern.updateGFX(dt) end

return controller_propAnimation_hPattern
