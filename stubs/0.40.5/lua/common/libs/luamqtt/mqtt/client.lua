---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/client.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- MQTT client (3.1.1 or 5.0) from the luamqtt library. Handles connecting to a broker through a connector (luasocket by default), sending/receiving packets, publish/subscribe/unsubscribe, QoS 1 and 2 acknowledgements, keep_alive (PINGREQ), automatic reconnection and user events registered with on(). The client is driven either by an ioloop (ioloop.lua), or synchronously (mqtt.run_sync).
--- Access: `require("libs/luamqtt/mqtt/client")`
---@class libs_luamqtt_mqtt_client
local libs_luamqtt_mqtt_client = {}

--- Creates, initializes and returns an MQTT client instance. If a default ioloop already exists and is running, the client is added to it and the connection starts.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1197
---@param ... table Argument table of client_mt:__init.
---@return table  client_mt instance.
function libs_luamqtt_mqtt_client.create(...) end

--- MQTT client instance returned by create. Notable fields: args (validated arguments), handlers (callbacks per event), connection (connection table, nil if disconnected).
---@class libs_luamqtt_mqtt_client_client_mt
local libs_luamqtt_mqtt_client_client_mt = {}

--- Called by the garbage collector.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1183
function libs_luamqtt_mqtt_client_client_mt:__gc() end

--- Validates the creation arguments (uri 'host[:port]', clean, version 4/5, id, username, password, secure, will{topic,payload,qos,retain}, keep_alive, reconnect, connector, ssl_module, properties, user_properties) and initializes the handlers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:87
---@param args table Creation arguments.
function libs_luamqtt_mqtt_client_client_mt:__init(args) end

--- Text representation of the client.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1178
function libs_luamqtt_mqtt_client_client_mt:__tostring() end

--- Applies the ioloop's network timeout to an already established connection.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1054
function libs_luamqtt_mqtt_client_client_mt:_apply_network_timeout() end

--- Builds conn.secure_params from the creation arguments.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1121
---@param args any
---@param conn any
function libs_luamqtt_mqtt_client_client_mt._apply_secure(args, conn) end

--- Assigns the next packet identifier.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:866
---@param pargs any
function libs_luamqtt_mqtt_client_client_mt:_assign_packet_id(pargs) end

--- Performs one I/O iteration: receiving the next packet and firing the events.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:948
---@param recv any
function libs_luamqtt_mqtt_client_client_mt:_io_iteration(recv) end

--- One I/O iteration called by the ioloop.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:891
function libs_luamqtt_mqtt_client_client_mt:_ioloop_iteration() end

--- Fills conn.host and conn.port from args.uri (port 1883, or 8883 when secure).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1102
---@param args any
---@param conn any
function libs_luamqtt_mqtt_client_client_mt._parse_uri(args, conn) end

--- Receives a packet from the connection.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1164
function libs_luamqtt_mqtt_client_client_mt:_receive_packet() end

--- Sends a packet on the connection.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:1140
---@param packet any
function libs_luamqtt_mqtt_client_client_mt:_send_packet(packet) end

--- One I/O iteration called by the synchronous loop (mqtt.run_sync).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:881
function libs_luamqtt_mqtt_client_client_mt:_sync_iteration() end

--- Acknowledges a received PUBLISH message (PUBACK, or PUBREC for QoS 2).
---Source: lua/common/libs/luamqtt/mqtt/client.lua:492
---@param msg table PUBLISH packet received.
---@param rc integer Reason code (MQTT 5, default 0).
---@param properties table Properties.
---@param user_properties table User properties.
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:acknowledge(msg, rc, properties, user_properties) end

--- Sends PUBCOMP (last phase of a QoS 2 exchange).
---Source: lua/common/libs/luamqtt/mqtt/client.lua:820
---@param packet_id integer Packet identifier.
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:acknowledge_pubcomp(packet_id) end

--- Sends PUBREL (second phase of a QoS 2 exchange).
---Source: lua/common/libs/luamqtt/mqtt/client.lua:797
---@param packet_id integer Packet identifier.
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:acknowledge_pubrel(packet_id) end

--- Sends an AUTH packet (MQTT 5.0).
---Source: lua/common/libs/luamqtt/mqtt/client.lua:602
---@param rc integer Reason code (default 0).
---@param properties table Properties.
---@param user_properties table User properties.
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:auth(rc, properties, user_properties) end

--- Immediately closes the network connection, without DISCONNECT. Fires the close event; may schedule a reconnection if reconnect is active.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:636
---@param reason string|nil Reason text.
function libs_luamqtt_mqtt_client_client_mt:close_connection(reason) end

--- Sends DISCONNECT to the broker then closes the connection.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:563
---@param rc integer MQTT 5 reason code (default 0).
---@param properties table Properties.
---@param user_properties table User properties.
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:disconnect(rc, properties, user_properties) end

--- Calls the handlers registered for an event.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/luamqtt/mqtt/client.lua:842
---@param event string Event name.
---@param ... any Arguments passed to the handlers.
function libs_luamqtt_mqtt_client_client_mt:handle(event, ...) end

--- Removes a handler from an event.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:268
---@param event string Event name.
---@param func function Handler to remove.
function libs_luamqtt_mqtt_client_client_mt:off(event, func) end

--- Adds event handlers: on(name, function) or on({name1 = f1, name2 = f2}). Raises an error if the event name is invalid.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:234
---@param ... string|table, function|nil (event_name, function) or table of events.
function libs_luamqtt_mqtt_client_client_mt:on(...) end

--- Opens the network connection to the broker via the connector.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:710
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:open_connection() end

--- Publishes a message.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:425
---@param args table topic, payload, qos (default 0), retain (default false), dup (default false), properties, user_properties, callback (called on acknowledgement).
---@return boolean|integer  true or packet identifier; false and message on failure.
function libs_luamqtt_mqtt_client_client_mt:publish(args) end

--- Sends the CONNECT packet on the open connection.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:751
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:send_connect() end

--- Sends a PINGREQ (keep_alive).
---Source: lua/common/libs/luamqtt/mqtt/client.lua:685
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:send_pingreq() end

--- Associates or dissociates (nil) the client with an ioloop; called by ioloop:add/remove.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:790
---@param loop table|nil ioloop instance.
function libs_luamqtt_mqtt_client_client_mt:set_ioloop(loop) end

--- Starts the connection to the broker (network open then CONNECT).
---Source: lua/common/libs/luamqtt/mqtt/client.lua:663
---@return boolean  true, or false and message.
function libs_luamqtt_mqtt_client_client_mt:start_connecting() end

--- Subscribes to a topic. Returns the SUBSCRIBE packet identifier; the callback is called when the subscription is confirmed.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:296
---@param args table topic, qos (default 0), no_local / retain_as_published / retain_handling / properties / user_properties (MQTT 5 only), callback.
---@return integer|boolean  Packet identifier, or false and error message.
function libs_luamqtt_mqtt_client_client_mt:subscribe(args) end

--- Unsubscribes from a topic; callback called when the broker confirms.
---Source: lua/common/libs/luamqtt/mqtt/client.lua:364
---@param args table topic, properties, user_properties, callback.
---@return integer|boolean  Packet identifier, or false and message.
function libs_luamqtt_mqtt_client_client_mt:unsubscribe(args) end

return libs_luamqtt_mqtt_client
