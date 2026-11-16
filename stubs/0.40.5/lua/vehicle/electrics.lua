---@meta
-- tim19Atlas stub generated from lua/vehicle/electrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Table of vehicle electrical values (`electrics.values`) shared by all controllers, the UI and extensions, plus the logic of lights, turn signals, warning, light bar, horn and ignition level. A modder reads `electrics.values.xxx` to know the vehicle state (RPM, speed, lights...) and calls the `toggle_*`/`set_*` functions to act on the lights or the ignition key. Controllers and the jbeam (`electrics`/`components.electrics` sections) write their own keys in this table.
--- Access: global `electrics`
---@class electrics
---@field disabledState table<string, any> Set of electrics.values keys to force to nil at each updateGFX (presence of the key is enough). Reset to {} by init and reset.
---@field values table<string, number|boolean|nil> Table of current electrical values (see notes for the usual keys). Read by the UI, streams, sensors. Booleans are converted to 0/1 at the end of the 1st step.
electrics = {}

--- Enables or cuts the horn (electrics.values.horn) and plays/stops the 'horn' sound (two alternating slots to avoid an abrupt cut).
---Source: lua/vehicle/electrics.lua:1034
---@param state boolean true sounds the horn.
function electrics.horn(state) end

--- Called at vehicle creation: reads the jbeam config (smoothers, custom values, ignition levels, turn signal cycle), compiles the custom values, sets the starting ignition level and registers the radial menu entries (core_quickAccess).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electrics.lua:824
function electrics.init() end

--- Called at the end of initialization: if the ignition level is 3, brings it back to 2 (storing 3 as the previous level) so as not to stay in starter.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electrics.lua:948
function electrics.initLastStage() end

--- Headlight flash: at true, stores the current state and switches to high beam; at false, restores the stored state.
---Source: lua/vehicle/electrics.lua:996
---@param enabled boolean true starts the headlight flash, false ends it.
function electrics.light_flash_highbeams(enabled) end

--- Called at vehicle reset: clears disabledState, resets the smoothers and base values to 0, restores the default custom values, the turn signal pulse and the spawn ignition level.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electrics.lua:774
function electrics.reset() end

--- Same function as initLastStage (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electrics.lua:948
function electrics.resetLastStage() end

--- Defines the list of allowed ignition levels and rebuilds the substitution table (forbidden level -> nearest allowed higher level, otherwise lower). An empty list becomes {0}.
---Source: lua/vehicle/electrics.lua:740
---@param newAllowedIgnitionLevels table<integer, integer> List of levels among 0 to 3.
function electrics.setAllowedIgnitionLevels(newAllowedIgnitionLevels) end

--- Sets the ignition level after filtering by the allowed levels, displays a UI message (levels 0 to 2) and commands the main controller: levels 0/1 cut ignition and starter, 2 turns ignition on without starter, 3 turns ignition on and engages the starter. Updates the values override.
---Source: lua/vehicle/electrics.lua:348
---@param ignitionLevel integer 0 off, 1 accessories, 2 run, 3 starter.
function electrics.setIgnitionLevel(ignitionLevel) end

--- Directly sets the headlight state without validation (used by the radial menu).
---Source: lua/vehicle/electrics.lua:1022
---@param newval integer 0 off, 1 low beam, 2 high beam.
function electrics.setLightsState(newval) end

--- Sets the fog light state (value stored as is then read in electrics.values.fog).
---Source: lua/vehicle/electrics.lua:1030
---@param state boolean true turns on.
function electrics.set_fog_lights(state) end

--- Explicitly turns the left turn signal on or off (cuts right and warning on activation).
---Source: lua/vehicle/electrics.lua:187
---@param state boolean true turns on, false turns off.
---@param autoCancel boolean|nil If true (on activation), the turn signal stops when the steering wheel has returned to neutral after turning.
function electrics.set_left_signal(state, autoCancel) end

--- Sets the light bar state. The value is taken modulo 3 (modulo 2 if the vehicle has no 'siren' sound). State 2 plays the siren.
---Source: lua/vehicle/electrics.lua:1005
---@param state integer 0 off, 1 lights, 2 lights + siren.
function electrics.set_lightbar_signal(state) end

--- Explicitly turns the right turn signal on or off.
---Source: lua/vehicle/electrics.lua:242
---@param state boolean true turns on, false turns off.
---@param autoCancel boolean|nil Auto-cancel after a turn, like set_left_signal.
function electrics.set_right_signal(state, autoCancel) end

--- Enables or cuts the hazard lights; also sets the left and right states to the same value and disables auto-cancel.
---Source: lua/vehicle/electrics.lua:955
---@param value boolean true enables the warning.
function electrics.set_warn_signal(value) end

--- Turns off both turn signals (unless the warning is active, in which case does nothing) and plays the off sound.
---Source: lua/vehicle/electrics.lua:143
function electrics.stop_turn_signal() end

--- Start of the ignition key press: arms the counter; beyond 0.5 s held, goes to level 3 (starter).
---Source: lua/vehicle/electrics.lua:1054
function electrics.toggleIgnitionLevelOnDown() end

--- Ignition key release: advances the level 0 -> 1 -> 2, then 2 -> 1, 1 -> 0 (depending on the previous direction); level 3 falls back to 2.
---Source: lua/vehicle/electrics.lua:1058
function electrics.toggleIgnitionLevelOnUp() end

--- Toggles the fog lights.
---Source: lua/vehicle/electrics.lua:1026
function electrics.toggle_fog_lights() end

--- Toggles between low beam (1) and high beam (2). No effect if the headlights are off.
---Source: lua/vehicle/electrics.lua:983
function electrics.toggle_highbeams() end

--- Toggles the left turn signal (user input). Cuts the right one and the warning when it activates; if the warning is active, forces the left to true. Plays the sounds if ignitionLevel > 0 and enables auto-cancel.
---Source: lua/vehicle/electrics.lua:159
function electrics.toggle_left_signal() end

--- Moves to the next light bar state (0 off, 1 lights, 2 lights + siren if the 'siren' sound exists; otherwise 0/1).
---Source: lua/vehicle/electrics.lua:1018
function electrics.toggle_lightbar_signal() end

--- Cycles the headlight state: 0 off -> 1 low beam -> 2 high beam -> 0, with on/off sound.
---Source: lua/vehicle/electrics.lua:968
function electrics.toggle_lights() end

--- Toggles the right turn signal (same logic as toggle_left_signal).
---Source: lua/vehicle/electrics.lua:214
function electrics.toggle_right_signal() end

--- Toggles the hazard lights (warning).
---Source: lua/vehicle/electrics.lua:964
function electrics.toggle_warn_signal() end

--- 1st update step per frame: handles the held starter, the turn signal pulse, computes derived values (lights, ground speed, altitude, smoothed RPM...), injects remote electrics (beamstate.updateRemoteElectrics(true)), then converts booleans to 0/1 and clears the disabledState keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electrics.lua:384
---@param dt number Time step in seconds.
function electrics.updateGFX(dt) end

--- 2nd step, called after the controllers: computes brakelights, brakelight_signal_R/L, reinjects remote electrics, applies the override according to the ignition level (values set to 0 if ignitionLevel == 0), runs the jbeam custom values then the smoothers.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/electrics.lua:476
---@param dt number Time step in seconds.
function electrics.updateGFXSecondStep(dt) end

