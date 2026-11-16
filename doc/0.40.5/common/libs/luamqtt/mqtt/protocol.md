# `libs_luamqtt_mqtt_protocol`

*File: `lua/common/libs/luamqtt/mqtt/protocol.lua` · VM: Common (GE + vehicle) · 526 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/protocol")`

Generic building blocks of the MQTT protocol (shared by versions 3.1.1 and 5.0) of luamqtt: creating and reading integers, UTF-8 strings and variable-length fields, fixed header, packet type constants and CONNACK codes, packet identifiers, combined packets. Used by protocol4.lua and protocol5.lua. parse_* function convention: they receive read_func(n), which reads n bytes and returns the string, or false/nil and an error message.

## Notes

- Only useful for writing or parsing MQTT packets by hand; a modder normally uses client.lua.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_protocol.check_packet_id(val)` | True if the value is a valid packet identifier. | 265 |
| `libs_luamqtt_mqtt_protocol.check_qos(val)` | True if the value is a valid QoS. | 258 |
| `libs_luamqtt_mqtt_protocol.combine(...)` | Combines several pieces of data into a combined packet (behaves like a string: tostring, len, append). | 414 |
| `libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len)` | Creates the fixed header of a packet. | 252 |
| `libs_luamqtt_mqtt_protocol.make_string(str)` | Creates a UTF-8 string prefixed by its 2-byte length. | 85 |
| `libs_luamqtt_mqtt_protocol.make_uint16(val)` | Creates the data for a 16-bit integer. | 66 |
| `libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value)` | Data of a 2-byte property with a non-zero value check. | 120 |
| `libs_luamqtt_mqtt_protocol.make_uint32(val)` | Creates the data for a 32-bit integer. | 75 |
| `libs_luamqtt_mqtt_protocol.make_uint8(val)` | Creates the data for an 8-bit integer. | 57 |
| `libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value)` | Data of a 1-byte property that can only be 0 or 1. | 112 |
| `libs_luamqtt_mqtt_protocol.make_var_length(len)` | Encodes an integer as a variable-length field (Remaining Length). | 92 |
| `libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value)` | Data of a variable-length property with a non-zero value check. | 128 |
| `libs_luamqtt_mqtt_protocol.next_packet_id(curr)` | Returns the packet identifier following the given one. | 272 |
| `libs_luamqtt_mqtt_protocol.packet_id_required(args)` | True if the packet described by args (type field, and qos for PUBLISH) requires a packet identifier. Raises an exception if args is not a table or if args.type is not a number. | 372 |
| `libs_luamqtt_mqtt_protocol.packet_tostring(packet)` | Converts a parsed packet to readable text. | 443 |
| `libs_luamqtt_mqtt_protocol.parse_string(read_func)` | Reads a UTF-8 string prefixed by its length. Returns false and a message on failure. | 138 |
| `libs_luamqtt_mqtt_protocol.parse_uint16(read_func)` | Reads a 16-bit integer. | 175 |
| `libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func)` | Reads a non-zero 16-bit integer. | 187 |
| `libs_luamqtt_mqtt_protocol.parse_uint32(read_func)` | Reads a 32-bit integer. | 199 |
| `libs_luamqtt_mqtt_protocol.parse_uint8(read_func)` | Reads an 8-bit integer with read_func. | 152 |
| `libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func)` | Reads a byte that must be 0 or 1. | 163 |
| `libs_luamqtt_mqtt_protocol.parse_var_length(read_func)` | Reads a variable-length field (Remaining Length). | 217 |
| `libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func)` | Reads a variable-length integer that must be non-zero. | 238 |
| `libs_luamqtt_mqtt_protocol.start_parse_packet(read_func)` | Starts parsing a new packet: reads the fixed header and prepares an input stream (table with read_func and available) for the content. Returns the type, the flags, the stream, etc. | 476 |

### Parameter details

#### `libs_luamqtt_mqtt_protocol.check_packet_id(val)`

True if the value is a valid packet identifier.

- `val` (*any*) : Value tested.
- **returns**: boolean Validity.

#### `libs_luamqtt_mqtt_protocol.check_qos(val)`

True if the value is a valid QoS.

- `val` (*any*) : Value tested.
- **returns**: boolean Validity.

#### `libs_luamqtt_mqtt_protocol.combine(...)`

Combines several pieces of data into a combined packet (behaves like a string: tostring, len, append).

- `...` (*any*) : Pieces.
- **returns**: table Combined packet.

#### `libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len)`

Creates the fixed header of a packet.

- `ptype` (*integer*) : Packet type (packet_type).
- `flags` (*integer*) : Flags.
- `len` (*integer*) : Remaining length.
- **returns**: string Header.

#### `libs_luamqtt_mqtt_protocol.make_string(str)`

Creates a UTF-8 string prefixed by its 2-byte length.

- `str` (*string*) : Text.
- **returns**: string Data.

#### `libs_luamqtt_mqtt_protocol.make_uint16(val)`

Creates the data for a 16-bit integer.

- `val` (*integer*) : Value.
- **returns**: string 2 bytes.

#### `libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value)`

Data of a 2-byte property with a non-zero value check.

- `value` (*integer*) : Non-zero value.

#### `libs_luamqtt_mqtt_protocol.make_uint32(val)`

Creates the data for a 32-bit integer.

- `val` (*integer*) : Value.
- **returns**: string 4 bytes.

#### `libs_luamqtt_mqtt_protocol.make_uint8(val)`

Creates the data for an 8-bit integer.

- `val` (*integer*) : Value.
- **returns**: string 1 byte.

#### `libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value)`

Data of a 1-byte property that can only be 0 or 1.

- `value` (*integer*) : 0 or 1.

#### `libs_luamqtt_mqtt_protocol.make_var_length(len)`

Encodes an integer as a variable-length field (Remaining Length).

- `len` (*integer*) : Value.
- **returns**: string Encoded bytes.

#### `libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value)`

Data of a variable-length property with a non-zero value check.

- `value` (*integer*) : Non-zero value.

#### `libs_luamqtt_mqtt_protocol.next_packet_id(curr)`

Returns the packet identifier following the given one.

- `curr` (*integer|nil*) : Current identifier.
- **returns**: integer Next identifier.

#### `libs_luamqtt_mqtt_protocol.packet_id_required(args)`

True if the packet described by args (type field, and qos for PUBLISH) requires a packet identifier. Raises an exception if args is not a table or if args.type is not a number.

- `args` (*table*) : Packet creation arguments.
- **returns**: boolean Result.

#### `libs_luamqtt_mqtt_protocol.packet_tostring(packet)`

Converts a parsed packet to readable text.

- `packet` (*table*) : Packet.
- **returns**: string Representation.

#### `libs_luamqtt_mqtt_protocol.parse_string(read_func)`

Reads a UTF-8 string prefixed by its length. Returns false and a message on failure.

- `read_func` (*function*) : Read function.
- **returns**: string|boolean Text, or false.

#### `libs_luamqtt_mqtt_protocol.parse_uint16(read_func)`

Reads a 16-bit integer.

- `read_func` (*function*) : Read function.

#### `libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func)`

Reads a non-zero 16-bit integer.

- `read_func` (*function*) : Read function.

#### `libs_luamqtt_mqtt_protocol.parse_uint32(read_func)`

Reads a 32-bit integer.

- `read_func` (*function*) : Read function.

#### `libs_luamqtt_mqtt_protocol.parse_uint8(read_func)`

Reads an 8-bit integer with read_func.

- `read_func` (*function*) : Read function.
- **returns**: integer|boolean Value, or false and a message.

#### `libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func)`

Reads a byte that must be 0 or 1.

- `read_func` (*function*) : Read function.

#### `libs_luamqtt_mqtt_protocol.parse_var_length(read_func)`

Reads a variable-length field (Remaining Length).

- `read_func` (*function*) : Read function.

#### `libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func)`

Reads a variable-length integer that must be non-zero.

- `read_func` (*function*) : Read function.

#### `libs_luamqtt_mqtt_protocol.start_parse_packet(read_func)`

Starts parsing a new packet: reads the fixed header and prepares an input stream (table with read_func and available) for the content. Returns the type, the flags, the stream, etc.

- `read_func` (*function*) : Connection read function.

## Fields

| Field | Type | Description |
|---|---|---|
| `connack_packet_mt` | table | Metatable of parsed CONNACK packets. |
| `connack_rc` | table | Table of CONNACK return codes. |
| `packet_mt` | table | Metatable of parsed packets (provides __tostring in particular). |
| `packet_type` | table | MQTT packet types: CONNECT=1, CONNACK=2, PUBLISH=3, PUBACK=4, PUBREC=5, PUBREL=6, PUBCOMP=7, SUBSCRIBE=8, SUBACK=9, UNSUBSCRIBE=10, UNSUBACK=11, PINGREQ=12, PINGRESP=13, DISCONNECT=14, AUTH=15 (MQTT 5). Table also keyed the other way (1 -> 'CONNECT'). |

## Class `combined_packet_mt`

Metatable of the combined data created by combine.

| Method | Description | Line |
|---|---|---|
| `combined_packet_mt.__index(_, key)` | Makes the table work like a class (access to the tostring, len, append methods). | 409 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/protocol.lua`.*
