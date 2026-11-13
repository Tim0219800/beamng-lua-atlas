---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/ioloop.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ioloop module
---  @module mqtt.ioloop
---  @alias ioloop
---
--- 	ioloop module
---
--- 	In short: allowing you to work with several MQTT clients in one script, and allowing them to maintain
--- 	a long-term connection to broker, using PINGs.
---
--- 	NOTE: this module will work only with MQTT clients using standard luasocket/luasocket_ssl connectors.
---
--- 	In long:
--- 	Providing an IO loop instance dealing with efficient (as much as possible in limited lua IO) network communication
--- 	for several MQTT clients in the same OS thread.
--- 	The main idea is that you are creating an ioloop instance, then adding created and connected MQTT clients to it.
--- 	The ioloop instance is setting a non-blocking mode for sockets in MQTT clients and setting a small timeout
--- 	for their receive/send operations. Then ioloop is starting an endless loop trying to receive/send data for all added MQTT clients.
--- 	You may add more or remove some MQTT clients from the ioloop after it's created and started.
---
--- 	Using that ioloop is allowing you to run a MQTT client for long time, through sending PINGREQ packets to broker
--- 	in keepAlive interval to maintain long-term connection.
---
--- 	Also, any function can be added to the ioloop instance, and it will be called in the same endless loop over and over
--- 	alongside with added MQTT clients to provide you a piece of processor time to run your own logic (like running your own
--- 	network communications or any other thing good working in an io-loop)
---  module table
--- Accès : `require("libs/luamqtt/mqtt/ioloop")`
---@class libs_luamqtt_mqtt_ioloop
local libs_luamqtt_mqtt_ioloop = {}

--- Create IO loop instance with given options
---  @see ioloop_mt:__init
---  @treturn ioloop_mt ioloop instance
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:149
---@param args any
function libs_luamqtt_mqtt_ioloop.create(args) end

--- Returns default ioloop instance
---  @tparam[opt=true] boolean autocreate Automatically create ioloop instance
---  @tparam[opt] table args Arguments for creating ioloop instance
---  @treturn ioloop_mt ioloop instance
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:163
---@param autocreate any
---@param args any
function libs_luamqtt_mqtt_ioloop.get(autocreate, args) end

--- Classe locale `ioloop_mt` de lua/common/libs/luamqtt/mqtt/ioloop.lua
---@class libs_luamqtt_mqtt_ioloop_ioloop_mt
local libs_luamqtt_mqtt_ioloop_ioloop_mt = {}

--- Initialize ioloop instance
---  @tparam table args							ioloop creation arguments table
---  @tparam[opt=0.005] number args.timeout		network operations timeout in seconds
---  @tparam[opt=0] number args.sleep				sleep interval after each iteration
---  @tparam[opt] function args.sleep_function	custom sleep function to call after each iteration
---  @treturn ioloop_mt ioloop instance
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:53
---@param args any
function libs_luamqtt_mqtt_ioloop_ioloop_mt:__init(args) end

--- Add MQTT client or a loop function to the ioloop instance
---  @tparam client_mt|function client		MQTT client or a loop function to add to ioloop
---  @return true on success or false and error message on failure
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:66
---@param client any
function libs_luamqtt_mqtt_ioloop_ioloop_mt:add(client) end

--- Perform sleep if no one of the network operation in current iteration was not timeouted
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:127
function libs_luamqtt_mqtt_ioloop_ioloop_mt:can_sleep() end

--- Perform one ioloop iteration
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:109
function libs_luamqtt_mqtt_ioloop_ioloop_mt:iteration() end

--- Remove MQTT client or a loop function from the ioloop instance
---  @tparam client_mt|function client		MQTT client or a loop function to remove from ioloop
---  @return true on success or false and error message on failure
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:85
---@param client any
function libs_luamqtt_mqtt_ioloop_ioloop_mt:remove(client) end

--- Run ioloop until at least one client are in ioloop
---Source : lua/common/libs/luamqtt/mqtt/ioloop.lua:136
function libs_luamqtt_mqtt_ioloop_ioloop_mt:run_until_clients() end

return libs_luamqtt_mqtt_ioloop
