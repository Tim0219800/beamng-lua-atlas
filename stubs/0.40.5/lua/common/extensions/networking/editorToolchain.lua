---@meta
-- tim19Atlas stub generated from lua/common/extensions/networking/editorToolchain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- TCP server (port 7000, all interfaces) that lets an external tool (JBeam editor, etc.) talk to the game. Clients send JSON commands (ping, init, getPlayerVehicleInfo, selectNodes, subscribe) and receive responses (pong, siminfo, playerVehicleInfo, data). It can also highlight nodes of the player vehicle in the 3D world and continuously stream node positions and velocity. Not loaded by default (commented-out line extensions.load('networking_editorToolchain')); once loaded, it stays in memory (unload mode 'manual').
--- Access: extension `networking_editorToolchain`: `extensions.load("networking_editorToolchain")`, then the global `networking_editorToolchain`
---@class networking_editorToolchain
networking_editorToolchain = {}

--- Hook called when the extension is loaded: creates the TCPServer on '*':7000.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/networking/editorToolchain.lua:183
function networking_editorToolchain.onExtensionLoaded() end

--- Hook called on unload: destroys the server if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/networking/editorToolchain.lua:187
function networking_editorToolchain.onExtensionUnloaded() end

--- Initialization hook: sets the extension's unload mode to 'manual'.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/networking/editorToolchain.lua:202
function networking_editorToolchain.onInit() end

--- Called every frame before rendering: reads and handles received messages, sends the vehicle context back to clients if the player vehicle changed, draws the selected nodes, then sends the subscription data (node positions, velocity).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/networking/editorToolchain.lua:126
---@param dtReal number Real delta time (s), unused.
---@param dtSim number Simulation delta time (s), unused.
---@param dtRaw number Raw delta time (s), unused.
function networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook called when a vehicle spawns: if it is player vehicle 0, flags the vehicle context to be resent to clients.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/networking/editorToolchain.lua:194
---@param vehID integer Id of the created vehicle.
function networking_editorToolchain.onVehicleSpawned(vehID) end

--- Hook called when the player switches vehicle: if the player is nil or 0, flags the vehicle context to be resent to clients.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/extensions/networking/editorToolchain.lua:198
---@param _ any First argument ignored.
---@param _ any First argument ignored.
---@param player integer|nil Index of the player concerned.
function networking_editorToolchain.onVehicleSwitched(_, _, player) end

