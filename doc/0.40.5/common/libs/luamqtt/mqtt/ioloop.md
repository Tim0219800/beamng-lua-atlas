# `libs_luamqtt_mqtt_ioloop`

*Fichier : `lua/common/libs/luamqtt/mqtt/ioloop.lua` · VM : Commun (GE + véhicule) · 181 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/ioloop")`

ioloop module
 @module mqtt.ioloop
 @alias ioloop

	ioloop module

	In short: allowing you to work with several MQTT clients in one script, and allowing them to maintain
	a long-term connection to broker, using PINGs.

	NOTE: this module will work only with MQTT clients using standard luasocket/luasocket_ssl connectors.

	In long:
	Providing an IO loop instance dealing with efficient (as much as possible in limited lua IO) network communication
	for several MQTT clients in the same OS thread.
	The main idea is that you are creating an ioloop instance, then adding created and connected MQTT clients to it.
	The ioloop instance is setting a non-blocking mode for sockets in MQTT clients and setting a small timeout
	for their receive/send operations. Then ioloop is starting an endless loop trying to receive/send data for all added MQTT clients.
	You may add more or remove some MQTT clients from the ioloop after it's created and started.

	Using that ioloop is allowing you to run a MQTT client for long time, through sending PINGREQ packets to broker
	in keepAlive interval to maintain long-term connection.

	Also, any function can be added to the ioloop instance, and it will be called in the same endless loop over and over
	alongside with added MQTT clients to provide you a piece of processor time to run your own logic (like running your own
	network communications or any other thing good working in an io-loop)
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_ioloop.create(args)` | Create IO loop instance with given options<br> @see ioloop_mt:__init<br> @treturn ioloop_mt ioloop instance | 149 |
| `libs_luamqtt_mqtt_ioloop.get(autocreate, args)` | Returns default ioloop instance<br> @tparam[opt=true] boolean autocreate Automatically create ioloop instance<br> @tparam[opt] table args Arguments for creating ioloop instance<br> @treturn ioloop_mt ioloop instance | 163 |

## Classe `ioloop_mt`

| Méthode | Description | Ligne |
|---|---|---|
| `ioloop_mt:__init(args)` | Initialize ioloop instance<br> @tparam table args							ioloop creation arguments table<br> @tparam[opt=0.005] number args.timeout		network operations timeout in seconds<br> @tparam[opt=0] number args.sleep				sleep interval after each iteration<br> @tparam[opt] function args.sleep_function	custom sleep function to call after each iteration<br> @treturn ioloop_mt ioloop instance | 53 |
| `ioloop_mt:add(client)` | Add MQTT client or a loop function to the ioloop instance<br> @tparam client_mt\|function client		MQTT client or a loop function to add to ioloop<br> @return true on success or false and error message on failure | 66 |
| `ioloop_mt:can_sleep()` | Perform sleep if no one of the network operation in current iteration was not timeouted | 127 |
| `ioloop_mt:iteration()` | Perform one ioloop iteration | 109 |
| `ioloop_mt:remove(client)` | Remove MQTT client or a loop function from the ioloop instance<br> @tparam client_mt\|function client		MQTT client or a loop function to remove from ioloop<br> @return true on success or false and error message on failure | 85 |
| `ioloop_mt:run_until_clients()` | Run ioloop until at least one client are in ioloop | 136 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/ioloop.lua`.*
