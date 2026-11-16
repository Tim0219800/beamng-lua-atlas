---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/adaptiveBrakeLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Auxiliary controller that computes the brake light value (`electrics.values.brakelights` by default) beyond the simple brake pedal: blinking during ABS, turning on during an ESC intervention above 14 m/s, turning on when deceleration ("one pedal" regeneration) exceeds a threshold, adding regenerative braking, and automatically turning on the hazard lights after emergency braking until stop. Call order: `defaultOrder = 900` (late).
--- Access: controller `braking/adaptiveBrakeLights` declared in the jbeam (`controller`), reachable with `controller.getController("name")`
---@class controller_braking_adaptiveBrakeLights
---@field defaultOrder number 900: default call rank, late in the sorted list.
---@field type string "auxiliary".
local controller_braking_adaptiveBrakeLights = {}

--- Reads the jbeam parameters and creates the smoothers (ABS, ESC, acceleration).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/adaptiveBrakeLights.lua:139
---@param jbeamData table Controller jbeam data.
function controller_braking_adaptiveBrakeLights.init(jbeamData) end

--- Turns off the hazard lights triggered by this controller and resets the timers, smoothers and latches.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/adaptiveBrakeLights.lua:122
function controller_braking_adaptiveBrakeLights.reset() end

--- Enables or disables the adaptive behavior; when disabled, the lights simply follow the brake.
---Source: lua/vehicle/controller/braking/adaptiveBrakeLights.lua:165
---@param parameters table Optional field: isEnabled (boolean).
function controller_braking_adaptiveBrakeLights.setParameters(parameters) end

--- Every frame: computes the brake light value (brake + ESC + deceleration + regeneration, clamped to 1), applies the ABS blinking and handles the emergency braking hazard lights.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/controller/braking/adaptiveBrakeLights.lua:48
---@param dt number Time step in seconds.
function controller_braking_adaptiveBrakeLights.updateGFX(dt) end

return controller_braking_adaptiveBrakeLights
