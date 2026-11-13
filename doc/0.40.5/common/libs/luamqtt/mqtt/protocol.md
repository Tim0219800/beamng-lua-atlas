# `libs_luamqtt_mqtt_protocol`

*Fichier : `lua/common/libs/luamqtt/mqtt/protocol.lua` · VM : Commun (GE + véhicule) · 526 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/protocol")`

MQTT generic protocol components module
 @module mqtt.protocol


Here is a generic implementation of MQTT protocols of all supported versions.

MQTT v3.1.1 documentation (DOCv3.1.1):
	http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html

MQTT v5.0 documentation (DOCv5.0):
	http://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html

CONVENTIONS:

	* read_func - function to read data from some stream-like object (like network connection).
		We are calling it with one argument: number of bytes to read.
		Use currying/closures to pass other arguments to this function.
		This function should return string of given size on success.
		On failure it should return false/nil and an error message.
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_protocol.check_packet_id(val)` | Returns true if given value is a valid Packet Identifier<br> DOCv3.1.1: 2.3.1 Packet Identifier<br> DOCv5.0: 2.2.1 Packet Identifier | 265 |
| `libs_luamqtt_mqtt_protocol.check_qos(val)` | Returns true if given value is a valid QoS | 258 |
| `libs_luamqtt_mqtt_protocol.combine(...)` | Combine several data parts into one | 414 |
| `libs_luamqtt_mqtt_protocol.make_header(ptype, flags, len)` | Create fixed packet header data<br> DOCv3.1.1: 2.2 Fixed header<br> DOCv5.0: 2.1.1 Fixed Header | 252 |
| `libs_luamqtt_mqtt_protocol.make_string(str)` | Create UTF-8 string data<br> DOCv3.1.1: 1.5.3 UTF-8 encoded strings<br> DOCv5.0: 1.5.4 UTF-8 Encoded String | 85 |
| `libs_luamqtt_mqtt_protocol.make_uint16(val)` | Create uint16 value data | 66 |
| `libs_luamqtt_mqtt_protocol.make_uint16_nonzero(value)` | Make data for 2-byte property with nonzero value check | 120 |
| `libs_luamqtt_mqtt_protocol.make_uint32(val)` | Create uint32 value data | 75 |
| `libs_luamqtt_mqtt_protocol.make_uint8(val)` | Create uint8 value data | 57 |
| `libs_luamqtt_mqtt_protocol.make_uint8_0_or_1(value)` | Make data for 1-byte property with only 0 or 1 value | 112 |
| `libs_luamqtt_mqtt_protocol.make_var_length(len)` | Returns bytes of given integer value encoded as variable length field<br> DOCv3.1.1: 2.2.3 Remaining Length<br> DOCv5.0: 2.1.4 Remaining Length | 92 |
| `libs_luamqtt_mqtt_protocol.make_var_length_nonzero(value)` | Make data for variable length property with nonzero value check | 128 |
| `libs_luamqtt_mqtt_protocol.next_packet_id(curr)` | Returns the next Packet Identifier value relative to given current value<br> DOCv3.1.1: 2.3.1 Packet Identifier<br> DOCv5.0: 2.2.1 Packet Identifier | 272 |
| `libs_luamqtt_mqtt_protocol.packet_id_required(args)` | Returns true if Packet Identifier field are required for given packet | 372 |
| `libs_luamqtt_mqtt_protocol.packet_tostring(packet)` | Convert packet to string representation | 443 |
| `libs_luamqtt_mqtt_protocol.parse_string(read_func)` | Read string using given read_func function<br> Returns false plus error message on failure<br> Returns parsed string on success | 138 |
| `libs_luamqtt_mqtt_protocol.parse_uint16(read_func)` | Parse uint16 value using given read_func | 175 |
| `libs_luamqtt_mqtt_protocol.parse_uint16_nonzero(read_func)` | Parse uint16 non-zero value using given read_func | 187 |
| `libs_luamqtt_mqtt_protocol.parse_uint32(read_func)` | Parse uint32 value using given read_func | 199 |
| `libs_luamqtt_mqtt_protocol.parse_uint8(read_func)` | Parse uint8 value using given read_func | 152 |
| `libs_luamqtt_mqtt_protocol.parse_uint8_0_or_1(read_func)` | Parse uint8 value with only 0 or 1 value | 163 |
| `libs_luamqtt_mqtt_protocol.parse_var_length(read_func)` | Returns variable length field value calling read_func function read data, DOC: 2.2.3 Remaining Length | 217 |
| `libs_luamqtt_mqtt_protocol.parse_var_length_nonzero(read_func)` | Parse Variable Byte Integer with non-zero constraint | 238 |
| `libs_luamqtt_mqtt_protocol.start_parse_packet(read_func)` | Start parsing a new packet<br> @tparam function read_func - function to read data from the network connection<br> @treturn number packet_type<br> @treturn number flags<br> @treturn table input - a table with fields "read_func" and "available" representing a stream-like object<br> to read already received packet data in chunks<br> @return false and error_message on failure | 476 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `connack_packet_mt` | table | Parsed CONNACK packet metatable |
| `connack_rc` | table |  |
| `packet_mt` | table | Parsed packet metatable |
| `packet_type` | table |  |

## Classe `combined_packet_mt`

| Méthode | Description | Ligne |
|---|---|---|
| `combined_packet_mt.__index(_, key)` | Make combined_packet_mt table works like a class | 409 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/protocol.lua`.*
