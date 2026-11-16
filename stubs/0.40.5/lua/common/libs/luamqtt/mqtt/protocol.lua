---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic building blocks of the MQTT protocol (shared by versions 3.1.1 and 5.0) of luamqtt: creating and reading integers, UTF-8 strings and variable-length fields, fixed header, packet type constants and CONNACK codes, packet identifiers, combined packets. Used by protocol4.lua and protocol5.lua. parse_* function convention: they receive read_func(n), which reads n bytes and returns the string, or false/nil and an error message.
--- Access: `require("libs/luamqtt/mqtt/protocol")`
---@class libs_luamqtt_mqtt_protocol
---@field connack_packet_mt table Metatable of parsed CONNACK packets.
---@field connack_rc table Table of CONNACK return codes.
---@field packet_mt table Metatable of parsed packets (provides __tostring in particular).
---@field packet_type table MQTT packet types: CONNECT=1, CONNACK=2, PUBLISH=3, PUBACK=4, PUBREC=5, PUBREL=6, PUBCOMP=7, SUBSCRIBE=8, SUBACK=9, UNSUBSCRIBE=10, UNSUBACK=11, PINGREQ=12, PINGRESP=13, DISCONNECT=14, AUTH=15 (MQTT 5). Table also keyed the other way (1 -> 'CONNECT').
local libs_luamqtt_mqtt_protocol = {}

--- True if the value is a valid packet identifier.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:265
---@param val any Value tested.
---@return boolean  Validity.
function libs_luamqtt_mqtt_protocol.check_packet_id(val) end

--- True if the value is a valid QoS.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:258
---@param val any Value tested.
---@return boolean  Validity.
function libs_luamqtt_mqtt_protocol.check_qos(val) end

--- Combines several pieces of data into a combined packet (behaves like a string: tostring, len, append).
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:414
---@param ... any Pieces.
---@return table  Combined packet.
function libs_luamqtt_mqtt_protocol.combine(...) end

--- Creates the fixed header of a packet.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:252
---@param ptype integer Packet type (packet_type).
---@param flags integer Flags.
---@param len integer Remaining length.
---@return string  Header.
function libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len) end

--- Creates a UTF-8 string prefixed by its 2-byte length.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:85
---@param str string Text.
---@return string  Data.
function libs_luamqtt_mqtt_protocol.make_string(str) end

--- Creates the data for a 16-bit integer.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:66
---@param val integer Value.
---@return string  2 bytes.
function libs_luamqtt_mqtt_protocol.make_uint16(val) end

--- Data of a 2-byte property with a non-zero value check.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:120
---@param value integer Non-zero value.
function libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value) end

--- Creates the data for a 32-bit integer.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:75
---@param val integer Value.
---@return string  4 bytes.
function libs_luamqtt_mqtt_protocol.make_uint32(val) end

--- Creates the data for an 8-bit integer.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:57
---@param val integer Value.
---@return string  1 byte.
function libs_luamqtt_mqtt_protocol.make_uint8(val) end

--- Data of a 1-byte property that can only be 0 or 1.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:112
---@param value integer 0 or 1.
function libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value) end

--- Encodes an integer as a variable-length field (Remaining Length).
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:92
---@param len integer Value.
---@return string  Encoded bytes.
function libs_luamqtt_mqtt_protocol.make_var_length(len) end

--- Data of a variable-length property with a non-zero value check.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:128
---@param value integer Non-zero value.
function libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value) end

--- Returns the packet identifier following the given one.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:272
---@param curr integer|nil Current identifier.
---@return integer  Next identifier.
function libs_luamqtt_mqtt_protocol.next_packet_id(curr) end

--- True if the packet described by args (type field, and qos for PUBLISH) requires a packet identifier. Raises an exception if args is not a table or if args.type is not a number.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:372
---@param args table Packet creation arguments.
---@return boolean  Result.
function libs_luamqtt_mqtt_protocol.packet_id_required(args) end

--- Converts a parsed packet to readable text.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:443
---@param packet table Packet.
---@return string  Representation.
function libs_luamqtt_mqtt_protocol.packet_tostring(packet) end

--- Reads a UTF-8 string prefixed by its length. Returns false and a message on failure.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:138
---@param read_func function Read function.
---@return string|boolean  Text, or false.
function libs_luamqtt_mqtt_protocol.parse_string(read_func) end

--- Reads a 16-bit integer.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:175
---@param read_func function Read function.
function libs_luamqtt_mqtt_protocol.parse_uint16(read_func) end

--- Reads a non-zero 16-bit integer.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:187
---@param read_func function Read function.
function libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func) end

--- Reads a 32-bit integer.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:199
---@param read_func function Read function.
function libs_luamqtt_mqtt_protocol.parse_uint32(read_func) end

--- Reads an 8-bit integer with read_func.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:152
---@param read_func function Read function.
---@return integer|boolean  Value, or false and a message.
function libs_luamqtt_mqtt_protocol.parse_uint8(read_func) end

--- Reads a byte that must be 0 or 1.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:163
---@param read_func function Read function.
function libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func) end

--- Reads a variable-length field (Remaining Length).
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:217
---@param read_func function Read function.
function libs_luamqtt_mqtt_protocol.parse_var_length(read_func) end

--- Reads a variable-length integer that must be non-zero.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:238
---@param read_func function Read function.
function libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func) end

--- Starts parsing a new packet: reads the fixed header and prepares an input stream (table with read_func and available) for the content. Returns the type, the flags, the stream, etc.
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:476
---@param read_func function Connection read function.
function libs_luamqtt_mqtt_protocol.start_parse_packet(read_func) end

--- Metatable of the combined data created by combine.
---@class libs_luamqtt_mqtt_protocol_combined_packet_mt
local libs_luamqtt_mqtt_protocol_combined_packet_mt = {}

--- Makes the table work like a class (access to the tostring, len, append methods).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/protocol.lua:409
---@param _ table Instance.
---@param key string Requested key.
function libs_luamqtt_mqtt_protocol_combined_packet_mt.__index(_, key) end

return libs_luamqtt_mqtt_protocol
