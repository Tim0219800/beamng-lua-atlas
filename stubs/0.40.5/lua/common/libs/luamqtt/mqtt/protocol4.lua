---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol4.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luamqtt implementation of the MQTT 3.1.1 protocol: packet construction (make_packet) and parsing (parse_packet). Loaded by client.lua when version 4 is used (default).
--- Access: `require("libs/luamqtt/mqtt/protocol4")`
---@class libs_luamqtt_mqtt_protocol4
local libs_luamqtt_mqtt_protocol4 = {}

--- Builds a packet from an arguments table whose type field is a packet_type (CONNECT, PUBLISH, SUBSCRIBE...).
---Source: lua/common/libs/luamqtt/mqtt/protocol4.lua:280
---@param args table type and packet-specific fields.
---@return table|boolean  Combined packet ready to send, or false and an error message.
function libs_luamqtt_mqtt_protocol4.make_packet(args) end

--- Parses a received packet using read_func.
---Source: lua/common/libs/luamqtt/mqtt/protocol4.lua:313
---@param read_func function Function that reads n bytes.
---@return table|boolean  Parsed packet (metatable packet_mt), or false and an error message.
function libs_luamqtt_mqtt_protocol4.parse_packet(read_func) end

return libs_luamqtt_mqtt_protocol4
