# `libs_luamqtt_mqtt_client`

*File: `lua/common/libs/luamqtt/mqtt/client.lua` · VM: Common (GE + vehicle) · 1209 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/client")`

MQTT client (3.1.1 or 5.0) from the luamqtt library. Handles connecting to a broker through a connector (luasocket by default), sending/receiving packets, publish/subscribe/unsubscribe, QoS 1 and 2 acknowledgements, keep_alive (PINGREQ), automatic reconnection and user events registered with on(). The client is driven either by an ioloop (ioloop.lua), or synchronously (mqtt.run_sync).

## Example

```lua
local client = require('libs/luamqtt/mqtt/client')
local cl = client.create({uri = 'broker.local:1883', clean = true, id = 'beamng'})
cl:on('message', function(msg, c) print(msg.topic, msg.payload) end)
cl:on('connect', function(pkt, c) c:subscribe({topic = 'test/#'}) end)
require('libs/luamqtt/mqtt/ioloop').get():add(cl); cl:start_connecting()
```

## Notes

- Events accepted by on(): connect, subscribe, unsubscribe, message, acknowledge, error, close, auth. Any other name raises an error.
- Handler signatures: connect(packet, client), subscribe(packet, client), unsubscribe(packet, client), message(packet, client), acknowledge(packet, client), auth(packet, client), error(err, client[, packet]), close(conn, client).
- Creation arguments (allowed keys only): uri, clean (required), version (4 or 5), id, username, password, secure, will, keep_alive (default 60 s), properties, user_properties, reconnect, connector, ssl_module. An unknown key raises an error.
- If no id is provided, a random identifier 'luamqtt-v<version>-<hex>' is generated.
- Network error functions return false and a message; arguments of the wrong type raise an exception.
- Methods prefixed with _ are internal.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_luamqtt_mqtt_client.create(...)` | Creates, initializes and returns an MQTT client instance. If a default ioloop already exists and is running, the client is added to it and the connection starts. | 1197 |

### Parameter details

#### `libs_luamqtt_mqtt_client.create(...)`

Creates, initializes and returns an MQTT client instance. If a default ioloop already exists and is running, the client is added to it and the connection starts.

- `...` (*table*) : Argument table of client_mt:__init.
- **returns**: table client_mt instance.

## Class `client_mt`

MQTT client instance returned by create. Notable fields: args (validated arguments), handlers (callbacks per event), connection (connection table, nil if disconnected).

| Method | Description | Line |
|---|---|---|
| `client_mt:__gc()` | Called by the garbage collector. | 1183 |
| `client_mt:__init(args)` | Validates the creation arguments (uri 'host[:port]', clean, version 4/5, id, username, password, secure, will{topic,payload,qos,retain}, keep_alive, reconnect, connector, ssl_module, properties, user_properties) and initializes the handlers. | 87 |
| `client_mt:__tostring()` | Text representation of the client. | 1178 |
| `client_mt:_apply_network_timeout()` | Applies the ioloop's network timeout to an already established connection. | 1054 |
| `client_mt._apply_secure(args, conn)` | Builds conn.secure_params from the creation arguments. | 1121 |
| `client_mt:_assign_packet_id(pargs)` | Assigns the next packet identifier. | 866 |
| `client_mt:_io_iteration(recv)` | Performs one I/O iteration: receiving the next packet and firing the events. | 948 |
| `client_mt:_ioloop_iteration()` | One I/O iteration called by the ioloop. | 891 |
| `client_mt._parse_uri(args, conn)` | Fills conn.host and conn.port from args.uri (port 1883, or 8883 when secure). | 1102 |
| `client_mt:_receive_packet()` | Receives a packet from the connection. | 1164 |
| `client_mt:_send_packet(packet)` | Sends a packet on the connection. | 1140 |
| `client_mt:_sync_iteration()` | One I/O iteration called by the synchronous loop (mqtt.run_sync). | 881 |
| `client_mt:acknowledge(msg, rc, properties, user_properties)` | Acknowledges a received PUBLISH message (PUBACK, or PUBREC for QoS 2). | 492 |
| `client_mt:acknowledge_pubcomp(packet_id)` | Sends PUBCOMP (last phase of a QoS 2 exchange). | 820 |
| `client_mt:acknowledge_pubrel(packet_id)` | Sends PUBREL (second phase of a QoS 2 exchange). | 797 |
| `client_mt:auth(rc, properties, user_properties)` | Sends an AUTH packet (MQTT 5.0). | 602 |
| `client_mt:close_connection(reason)` | Immediately closes the network connection, without DISCONNECT. Fires the close event; may schedule a reconnection if reconnect is active. | 636 |
| `client_mt:disconnect(rc, properties, user_properties)` | Sends DISCONNECT to the broker then closes the connection. | 563 |
| `client_mt:handle(event, ...)` | Calls the handlers registered for an event. | 842 |
| `client_mt:off(event, func)` | Removes a handler from an event. | 268 |
| `client_mt:on(...)` | Adds event handlers: on(name, function) or on({name1 = f1, name2 = f2}). Raises an error if the event name is invalid. | 234 |
| `client_mt:open_connection()` | Opens the network connection to the broker via the connector. | 710 |
| `client_mt:publish(args)` | Publishes a message. | 425 |
| `client_mt:send_connect()` | Sends the CONNECT packet on the open connection. | 751 |
| `client_mt:send_pingreq()` | Sends a PINGREQ (keep_alive). | 685 |
| `client_mt:set_ioloop(loop)` | Associates or dissociates (nil) the client with an ioloop; called by ioloop:add/remove. | 790 |
| `client_mt:start_connecting()` | Starts the connection to the broker (network open then CONNECT). | 663 |
| `client_mt:subscribe(args)` | Subscribes to a topic. Returns the SUBSCRIBE packet identifier; the callback is called when the subscription is confirmed. | 296 |
| `client_mt:unsubscribe(args)` | Unsubscribes from a topic; callback called when the broker confirms. | 364 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/client.lua`.*
