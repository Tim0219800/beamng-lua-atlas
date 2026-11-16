---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/remoteController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UDP server that lets you control the game with the BeamNG "remote controller" mobile app. getQRCode opens UDP port 4444 and returns a 5-digit code that the app must send; then each recognized device becomes a virtual device (core_input_virtualInput, type bngremotectrlv1, 1 axis, 2 buttons) fed by the orientation packets received. The vehicle's UI data is sent back to the app (port 4445) via the vehicle's outgauge extension.
--- Access: extension `core_remoteController`: `extensions.load("core_remoteController")`, then the global `core_remoteController`
---@class core_remoteController
---@field onFirstUpdate nil Is nil: reference to a variable not defined in the file.
core_remoteController = {}

--- Indicates whether at least one remote device is connected.
---Source: lua/ge/extensions/core/remoteController.lua:182
---@return boolean  true if there is at least one virtual device.
function core_remoteController.devicesConnected() end

--- Opens the listening UDP socket (port 4444) if it is not open, and returns the pairing code to display (as a QR code by the UI).
---Source: lua/ge/extensions/core/remoteController.lua:54
---@return integer|boolean  5-digit code, or false if the socket could not be opened.
function core_remoteController.getQRCode() end

--- Load hook: checks for FFI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/remoteController.lua:164
---@return boolean  false if FFI is unavailable (load refused).
function core_remoteController.onExtensionLoaded() end

--- Hook called when input bindings change: remembers which player each virtual device is assigned to (key 'vinput<instance>'), or forgets it if the player is negative.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/remoteController.lua:172
---@param players table<string, integer> Device name -> player index.
function core_remoteController.onInputBindingsChanged(players) end

--- Update hook: removes devices inactive for more than 10 s, reads UDP packets, creates the virtual devices and emits their events (buttons, axis) to core_input_virtualInput. Does nothing as long as the socket is not open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/remoteController.lua:70
function core_remoteController.onUpdate() end

