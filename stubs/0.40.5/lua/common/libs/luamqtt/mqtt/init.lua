---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry point of the third-party luamqtt library (xHasKx, version 3.4.3 according to the _VERSION field), a pure-Lua MQTT 3.1.1 and 5.0 client. The module returns the 'mqtt' table with the version constants, client creation, and run loops (shared or synchronous ioloop). Useful to a modder who wants to exchange with an MQTT broker from the game.
--- Access: global `luamqtt_VERSION`
---@class luamqtt_VERSION
---@field get_ioloop function Alias of ioloop.get: returns the default ioloop instance (created if needed).
luamqtt_VERSION = {}

--- Creates an MQTT client (equivalent to mqtt.client.create).
---Source: lua/common/libs/luamqtt/mqtt/init.lua:43
---@param ... table Argument table of client_mt:__init (uri, clean, version, id, username, password, secure, will, keep_alive, reconnect, connector, ssl_module).
---@return table  MQTT client instance.
function luamqtt_VERSION.client(...) end

--- Adds the clients (or loop functions) to the default ioloop, calls start_connecting() on each client, then runs the ioloop as long as at least one client remains.
---Source: lua/common/libs/luamqtt/mqtt/init.lua:55
---@param ... table|function MQTT clients or functions called on each iteration.
function luamqtt_VERSION.run_ioloop(...) end

--- Synchronous loop for a single client: opens the connection then iterates as long as cl.connection exists. No reconnection nor keep_alive.
---Source: lua/common/libs/luamqtt/mqtt/init.lua:71
---@param cl table MQTT client.
---@return boolean|nil  false and the error message on failure.
function luamqtt_VERSION.run_sync(cl) end

