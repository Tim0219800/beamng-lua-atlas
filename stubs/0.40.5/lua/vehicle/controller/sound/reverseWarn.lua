---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sound/reverseWarn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary reverse beep controller. Every 0.5 s, it tests an electric (default "reverse"): if it is > 0, it starts a looping beep sound; otherwise it stops it.
--- Access: controller `sound/reverseWarn` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_sound_reverseWarn
---@field type string "auxiliary".
local controller_sound_reverseWarn = {}

--- Reads the jbeam configuration.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/reverseWarn.lua:42
---@param jbeamData table Jbeam data.
function controller_sound_reverseWarn.init(jbeamData) end

--- Resets the state and the timer to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/reverseWarn.lua:37
function controller_sound_reverseWarn.reset() end

--- Every frame: starts or stops the beep depending on the electric.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/sound/reverseWarn.lua:18
---@param dt number Time step in seconds.
function controller_sound_reverseWarn.updateGFX(dt) end

return controller_sound_reverseWarn
