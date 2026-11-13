---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol4.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Here is a MQTT v3.1.1 protocol implementation
---
--- MQTT v3.1.1 documentation (DOC):
--- 	http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html
---  module table
--- Accès : `require("libs/luamqtt/mqtt/protocol4")`
---@class libs_luamqtt_mqtt_protocol4
local libs_luamqtt_mqtt_protocol4 = {}

--- Create packet of given {type: number} in args
---Source : lua/common/libs/luamqtt/mqtt/protocol4.lua:280
---@param args any
function libs_luamqtt_mqtt_protocol4.make_packet(args) end

--- Parse packet using given read_func
---  Returns packet on success or false and error message on failure
---Source : lua/common/libs/luamqtt/mqtt/protocol4.lua:313
---@param read_func any
function libs_luamqtt_mqtt_protocol4.parse_packet(read_func) end

return libs_luamqtt_mqtt_protocol4
