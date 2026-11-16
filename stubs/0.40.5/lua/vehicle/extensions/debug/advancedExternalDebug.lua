---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/debug/advancedExternalDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Debug extension that sends JSON packets over UDP to an external tool (AED, 'Advanced External Debug') on 127.0.0.1:43812, at 30 sends per second, with a heartbeat planned at 1 Hz. Vehicle modules drop their packets there via debugPacket; the extension adds to each frame a main packet indicating whether this vehicle is the player's.
--- Access: extension `debug_advancedExternalDebug`: `extensions.load (vehicle VM)("debug_advancedExternalDebug")`, then the global `debug_advancedExternalDebug`
---@class debug_advancedExternalDebug
debug_advancedExternalDebug = {}

--- Adds a packet to the send queue (vehicleID is added automatically).
---Source: lua/vehicle/extensions/debug/advancedExternalDebug.lua:19
---@param packet table JSON-serializable table, preferably with sourceType and packetType.
function debug_advancedExternalDebug.debugPacket(packet) end

--- Called when the extension loads: calls onInit.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/debug/advancedExternalDebug.lua:127
function debug_advancedExternalDebug.onExtensionLoaded() end

--- Initialization hook: creates the UDP link and signals a new vehicle to the tool.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/debug/advancedExternalDebug.lua:106
function debug_advancedExternalDebug.onInit() end

--- Reset hook: clears the packet queue.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/debug/advancedExternalDebug.lua:102
function debug_advancedExternalDebug.onReset() end

--- Called every frame: adds the main packet then sends the accumulated packets at 30 Hz.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/debug/advancedExternalDebug.lua:85
---@param dt number Time step in seconds.
function debug_advancedExternalDebug.updateGFX(dt) end

