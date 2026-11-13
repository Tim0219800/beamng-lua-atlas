---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MQTT module
---  @module mqtt
---
--- MQTT protocol DOC: http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html
---
--- CONVENTIONS:
---
--- 	* errors:
--- 		* passing invalid arguments (like number instead of string) to function in this library will raise exception
--- 		* all other errors will be returned in format: false, "error-text"
--- 			* you can wrap function call into standard lua assert() to raise exception
--- Module table
---  @field v311 MQTT v3.1.1 protocol version constant
---  @field v50  MQTT v5.0   protocol version constant
---  @field _VERSION luamqtt version string
---  @table mqtt
--- Accès : globale `luamqtt_VERSION`
---@class luamqtt_VERSION
---@field get_ioloop any
luamqtt_VERSION = {}

--- Create new MQTT client instance
---  @param ... Same as for mqtt.client.create(...)
---  @see mqtt.client.client_mt:__init
---Source : lua/common/libs/luamqtt/mqtt/init.lua:43
---@param ... any
function luamqtt_VERSION.client(...) end

--- Run default ioloop for given MQTT clients or functions
---  @param ... MQTT clients or lopp functions to add to ioloop
---  @see mqtt.ioloop.get
---  @see mqtt.ioloop.run_until_clients
---Source : lua/common/libs/luamqtt/mqtt/init.lua:55
---@param ... any
function luamqtt_VERSION.run_ioloop(...) end

--- Run synchronous input/output loop for only one given MQTT client.
---  Provided client's connection will be opened.
---  Client reconnect feature will not work, and keep_alive too.
---  @param cl MQTT client instance to run
---Source : lua/common/libs/luamqtt/mqtt/init.lua:71
---@param cl any
function luamqtt_VERSION.run_sync(cl) end

