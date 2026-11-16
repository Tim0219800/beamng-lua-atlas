---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol5.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- luamqtt implementation of the MQTT 5.0 protocol: packet construction (make_packet) and parsing (parse_packet), with properties and user properties, reason codes and the AUTH packet. Loaded by client.lua when version 5 is requested.
--- Access: `require("libs/luamqtt/mqtt/protocol5")`
---@class libs_luamqtt_mqtt_protocol5
local libs_luamqtt_mqtt_protocol5 = {}

--- Builds an MQTT 5 packet from an arguments table whose type field is a packet_type; handles properties and user_properties.
---Source: lua/common/libs/luamqtt/mqtt/protocol5.lua:687
---@param args table type and packet-specific fields.
---@return table|boolean  Combined packet ready to send, or false and an error message.
function libs_luamqtt_mqtt_protocol5.make_packet(args) end

--- Parses a received MQTT 5 packet using read_func.
---Source: lua/common/libs/luamqtt/mqtt/protocol5.lua:806
---@param read_func function Function that reads n bytes.
---@return table|boolean  Parsed packet, or false and an error message.
function libs_luamqtt_mqtt_protocol5.parse_packet(read_func) end

return libs_luamqtt_mqtt_protocol5
