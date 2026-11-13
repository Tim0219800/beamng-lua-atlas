# `luamqtt_VERSION`

*Fichier : `lua/common/libs/luamqtt/mqtt/init.lua` · VM : Commun (GE + véhicule) · 88 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `luamqtt_VERSION`

MQTT module
 @module mqtt

MQTT protocol DOC: http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/errata01/os/mqtt-v3.1.1-errata01-os-complete.html

CONVENTIONS:

	* errors:
		* passing invalid arguments (like number instead of string) to function in this library will raise exception
		* all other errors will be returned in format: false, "error-text"
			* you can wrap function call into standard lua assert() to raise exception
Module table
 @field v311 MQTT v3.1.1 protocol version constant
 @field v50  MQTT v5.0   protocol version constant
 @field _VERSION luamqtt version string
 @table mqtt

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `luamqtt_VERSION.client(...)` | Create new MQTT client instance<br> @param ... Same as for mqtt.client.create(...)<br> @see mqtt.client.client_mt:__init | 43 |
| `luamqtt_VERSION.run_ioloop(...)` | Run default ioloop for given MQTT clients or functions<br> @param ... MQTT clients or lopp functions to add to ioloop<br> @see mqtt.ioloop.get<br> @see mqtt.ioloop.run_until_clients | 55 |
| `luamqtt_VERSION.run_sync(cl)` | Run synchronous input/output loop for only one given MQTT client.<br> Provided client's connection will be opened.<br> Client reconnect feature will not work, and keep_alive too.<br> @param cl MQTT client instance to run | 71 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `get_ioloop` | any | Returns default ioloop instance<br> @function mqtt.get_ioloop |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/init.lua`.*
