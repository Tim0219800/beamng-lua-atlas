# `libs_luamqtt_mqtt_protocol4`

*File: `lua/common/libs/luamqtt/mqtt/protocol4.lua` · VM: Common (GE + vehicle) · 428 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/protocol4")`

luamqtt implementation of the MQTT 3.1.1 protocol: packet construction (make_packet) and parsing (parse_packet). Loaded by client.lua when version 4 is used (default).

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_protocol4.make_packet(args)` | Builds a packet from an arguments table whose type field is a packet_type (CONNECT, PUBLISH, SUBSCRIBE...). | 280 |
| `libs_luamqtt_mqtt_protocol4.parse_packet(read_func)` | Parses a received packet using read_func. | 313 |

### Parameter details

#### `libs_luamqtt_mqtt_protocol4.make_packet(args)`

Builds a packet from an arguments table whose type field is a packet_type (CONNECT, PUBLISH, SUBSCRIBE...).

- `args` (*table*) : type and packet-specific fields.
- **returns**: table|boolean Combined packet ready to send, or false and an error message.

#### `libs_luamqtt_mqtt_protocol4.parse_packet(read_func)`

Parses a received packet using read_func.

- `read_func` (*function*) : Function that reads n bytes.
- **returns**: table|boolean Parsed packet (metatable packet_mt), or false and an error message.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/protocol4.lua`.*
