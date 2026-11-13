---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MQTT generic protocol components module
---  @module mqtt.protocol
---
---
--- Here is a generic implementation of MQTT protocols of all supported versions.
---
--- MQTT v3.1.1 documentation (DOCv3.1.1):
--- 	http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html
---
--- MQTT v5.0 documentation (DOCv5.0):
--- 	http://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html
---
--- CONVENTIONS:
---
--- 	* read_func - function to read data from some stream-like object (like network connection).
--- 		We are calling it with one argument: number of bytes to read.
--- 		Use currying/closures to pass other arguments to this function.
--- 		This function should return string of given size on success.
--- 		On failure it should return false/nil and an error message.
---  module table
--- Accès : `require("libs/luamqtt/mqtt/protocol")`
---@class libs_luamqtt_mqtt_protocol
---@field connack_packet_mt table
---@field connack_rc table
---@field packet_mt table
---@field packet_type table
local libs_luamqtt_mqtt_protocol = {}

--- Returns true if given value is a valid Packet Identifier
---  DOCv3.1.1: 2.3.1 Packet Identifier
---  DOCv5.0: 2.2.1 Packet Identifier
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:265
---@param val any
function libs_luamqtt_mqtt_protocol.check_packet_id(val) end

--- Returns true if given value is a valid QoS
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:258
---@param val any
function libs_luamqtt_mqtt_protocol.check_qos(val) end

--- Combine several data parts into one
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:414
---@param ... any
function libs_luamqtt_mqtt_protocol.combine(...) end

--- Create fixed packet header data
---  DOCv3.1.1: 2.2 Fixed header
---  DOCv5.0: 2.1.1 Fixed Header
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:252
---@param ptype any
---@param flags any
---@param len any
function libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len) end

--- Create UTF-8 string data
---  DOCv3.1.1: 1.5.3 UTF-8 encoded strings
---  DOCv5.0: 1.5.4 UTF-8 Encoded String
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:85
---@param str any
function libs_luamqtt_mqtt_protocol.make_string(str) end

--- Create uint16 value data
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:66
---@param val any
function libs_luamqtt_mqtt_protocol.make_uint16(val) end

--- Make data for 2-byte property with nonzero value check
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:120
---@param value any
function libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value) end

--- Create uint32 value data
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:75
---@param val any
function libs_luamqtt_mqtt_protocol.make_uint32(val) end

--- Create uint8 value data
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:57
---@param val any
function libs_luamqtt_mqtt_protocol.make_uint8(val) end

--- Make data for 1-byte property with only 0 or 1 value
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:112
---@param value any
function libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value) end

--- Returns bytes of given integer value encoded as variable length field
---  DOCv3.1.1: 2.2.3 Remaining Length
---  DOCv5.0: 2.1.4 Remaining Length
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:92
---@param len any
function libs_luamqtt_mqtt_protocol.make_var_length(len) end

--- Make data for variable length property with nonzero value check
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:128
---@param value any
function libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value) end

--- Returns the next Packet Identifier value relative to given current value
---  DOCv3.1.1: 2.3.1 Packet Identifier
---  DOCv5.0: 2.2.1 Packet Identifier
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:272
---@param curr any
function libs_luamqtt_mqtt_protocol.next_packet_id(curr) end

--- Returns true if Packet Identifier field are required for given packet
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:372
---@param args any
function libs_luamqtt_mqtt_protocol.packet_id_required(args) end

--- Convert packet to string representation
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:443
---@param packet any
function libs_luamqtt_mqtt_protocol.packet_tostring(packet) end

--- Read string using given read_func function
---  Returns false plus error message on failure
---  Returns parsed string on success
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:138
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_string(read_func) end

--- Parse uint16 value using given read_func
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:175
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_uint16(read_func) end

--- Parse uint16 non-zero value using given read_func
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:187
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func) end

--- Parse uint32 value using given read_func
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:199
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_uint32(read_func) end

--- Parse uint8 value using given read_func
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:152
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_uint8(read_func) end

--- Parse uint8 value with only 0 or 1 value
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:163
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func) end

--- Returns variable length field value calling read_func function read data, DOC: 2.2.3 Remaining Length
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:217
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_var_length(read_func) end

--- Parse Variable Byte Integer with non-zero constraint
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:238
---@param read_func any
function libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func) end

--- Start parsing a new packet
---  @tparam function read_func - function to read data from the network connection
---  @treturn number packet_type
---  @treturn number flags
---  @treturn table input - a table with fields "read_func" and "available" representing a stream-like object
---  to read already received packet data in chunks
---  @return false and error_message on failure
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:476
---@param read_func any
function libs_luamqtt_mqtt_protocol.start_parse_packet(read_func) end

--- Classe locale `combined_packet_mt` de lua/common/libs/luamqtt/mqtt/protocol.lua
---@class libs_luamqtt_mqtt_protocol_combined_packet_mt
local libs_luamqtt_mqtt_protocol_combined_packet_mt = {}

--- Make combined_packet_mt table works like a class
---Source : lua/common/libs/luamqtt/mqtt/protocol.lua:409
---@param _ any
---@param key any
function libs_luamqtt_mqtt_protocol_combined_packet_mt.__index(_, key) end

return libs_luamqtt_mqtt_protocol
