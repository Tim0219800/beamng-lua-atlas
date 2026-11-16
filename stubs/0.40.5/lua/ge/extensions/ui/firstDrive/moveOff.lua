---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/firstDrive/moveOff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Start and drive off" tutorial of the First Drive experience. Once enabled, it follows player 0's vehicle (throttle, brake, clutch, gear, engine, RPM, wheel speed, read via core_vehicleBridge) and shows in the "moveOff" application of the "topCenter" container the keys to use for each step: turn the engine on, drive off, stop, reverse, turn the engine off. The instructions depend on the gearbox mode: arcade, realistic manual with automatic clutch, or realistic manual.
--- Access: extension `ui_firstDrive_moveOff`: `extensions.load("ui_firstDrive_moveOff")`, then the global `ui_firstDrive_moveOff`
---@class ui_firstDrive_moveOff
---@field dependencies string[] Extensions loaded before this one: ui_appContainers.
ui_firstDrive_moveOff = {}

--- Indicates whether the tutorial is active.
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:654
---@return boolean  true if active.
function ui_firstDrive_moveOff.getEnabled() end

--- Returns the last published instruction (label, steps, sectionIndex, sectionCount, active), or nil if nothing is displayed.
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:588
---@return table|nil  Last state sent to the interface.
function ui_firstDrive_moveOff.getState() end

--- Hook called at the end of the level: disables the tutorial.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:649
function ui_firstDrive_moveOff.onClientEndMission() end

--- Hook called when the extension is unloaded: disables the tutorial.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:645
function ui_firstDrive_moveOff.onExtensionUnloaded() end

--- Hook called when the settings change. If active, restarts the vehicle tracking after 0.1 s, which rereads the gearbox mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:636
function ui_firstDrive_moveOff.onSettingsChanged() end

--- Hook called every frame with dtReal (real seconds). Reconfigures the tracking if the player's vehicle changes, waits for the delays to end, computes the current instruction, publishes it to the interface if it has changed and emits onFirstDriveMoveOffSectionCompleted when a section has just been validated.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:592
---@param dtReal number Real frame duration in seconds.
function ui_firstDrive_moveOff.onUpdate(dtReal) end

--- Hook called when a vehicle is destroyed: stops the tracking if it is the tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:632
---@param vehicleId integer Identifier of the destroyed vehicle.
function ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId) end

--- Hook called when a vehicle is replaced; same handling as onVehicleDestroyed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:632
---@param vehicleId integer Identifier of the replaced vehicle.
function ui_firstDrive_moveOff.onVehicleReplaced(vehicleId) end

--- Hook called when the player's vehicle changes. Restarts the tracking on the new vehicle (ignored if inactive or if player is not 0).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:627
---@param _ any Identifier of the old vehicle (not used).
---@param newVehicleId integer|nil Identifier of the new vehicle.
---@param player integer|nil Index of the player concerned.
function ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player) end

--- Enables or disables the tutorial. On enable, starts following player 0's vehicle (subscriptions to the values throttle_input, brake_input, clutch_input, gearIndex, engineRunning, rpm, wheelspeed); on disable, unsubscribes, hides the application and sends { active = false }. No effect if the state does not change.
---Source: lua/ge/extensions/ui/firstDrive/moveOff.lua:576
---@param value boolean Only true enables; any other value disables.
function ui_firstDrive_moveOff.setEnabled(value) end

