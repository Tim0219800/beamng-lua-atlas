# `libs_luamqtt_mqtt_protocol5`

*File: `lua/common/libs/luamqtt/mqtt/protocol5.lua` · VM: Common (GE + vehicle) · 1040 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/protocol5")`

luamqtt implementation of the MQTT 5.0 protocol: packet construction (make_packet) and parsing (parse_packet), with properties and user properties, reason codes and the AUTH packet. Loaded by client.lua when version 5 is requested.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_protocol5.make_packet(args)` | Builds an MQTT 5 packet from an arguments table whose type field is a packet_type; handles properties and user_properties. | 687 |
| `libs_luamqtt_mqtt_protocol5.parse_packet(read_func)` | Parses a received MQTT 5 packet using read_func. | 806 |

### Parameter details

#### `libs_luamqtt_mqtt_protocol5.make_packet(args)`

Builds an MQTT 5 packet from an arguments table whose type field is a packet_type; handles properties and user_properties.

- `args` (*table*) : type and packet-specific fields.
- **returns**: table|boolean Combined packet ready to send, or false and an error message.

#### `libs_luamqtt_mqtt_protocol5.parse_packet(read_func)`

Parses a received MQTT 5 packet using read_func.

- `read_func` (*function*) : Function that reads n bytes.
- **returns**: table|boolean Parsed packet, or false and an error message.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/protocol5.lua`.*
