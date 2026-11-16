---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/ioloop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luamqtt I/O loop: runs several MQTT clients (and user functions) in the same thread, in non-blocking mode with a small network timeout, which enables keep_alive PINGREQs and reconnection. Only works with the standard luasocket connectors.
--- Access: `require("libs/luamqtt/mqtt/ioloop")`
---@class libs_luamqtt_mqtt_ioloop
local libs_luamqtt_mqtt_ioloop = {}

--- Creates an ioloop instance.
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:149
---@param args table timeout (default 0.005 s), sleep (default 0), sleep_function.
---@return table  ioloop_mt instance.
function libs_luamqtt_mqtt_ioloop.create(args) end

--- Returns the default ioloop (singleton), created on demand.
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:163
---@param autocreate boolean Create automatically (default true).
---@param args table Creation arguments.
---@return table|nil  ioloop instance.
function libs_luamqtt_mqtt_ioloop.get(autocreate, args) end

--- ioloop instance returned by create/get.
---@class libs_luamqtt_mqtt_ioloop_ioloop_mt
local libs_luamqtt_mqtt_ioloop_ioloop_mt = {}

--- Initializes the instance with timeout, sleep and sleep_function _anon(default socket.sleep).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:53
---@param args table timeout (0.005 s), sleep (0), sleep_function.
function libs_luamqtt_mqtt_ioloop_ioloop_mt:__init(args) end

--- Adds an MQTT client or a loop function. For a client, calls client:set_ioloop(self) to associate it with the loop.
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:66
---@param client table|function Client or function.
---@return boolean  true, or false and error message.
function libs_luamqtt_mqtt_ioloop_ioloop_mt:add(client) end

--- If no network timeout has occurred yet during the iteration, calls sleep_function(args.timeout) once (socket.sleep by default) so as not to spin idle.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:127
function libs_luamqtt_mqtt_ioloop_ioloop_mt:can_sleep() end

--- Performs one iteration: calls _ioloop_iteration of each client and each added function, then sleeps args.sleep seconds if sleep > 0.
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:109
function libs_luamqtt_mqtt_ioloop_ioloop_mt:iteration() end

--- Removes a client or a function from the ioloop.
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:85
---@param client table|function Client or function.
---@return boolean  true, or false and error message.
function libs_luamqtt_mqtt_ioloop_ioloop_mt:remove(client) end

--- Blocking loop: iterates as long as at least one client remains in the ioloop.
---Source: lua/common/libs/luamqtt/mqtt/ioloop.lua:136
function libs_luamqtt_mqtt_ioloop_ioloop_mt:run_until_clients() end

return libs_luamqtt_mqtt_ioloop
