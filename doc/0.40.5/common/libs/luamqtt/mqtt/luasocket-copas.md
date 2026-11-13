# `libs_luamqtt_mqtt_luasocket_copas`

*Fichier : `lua/common/libs/luamqtt/mqtt/luasocket-copas.lua` · VM : Commun (GE + véhicule) · 49 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/luasocket-copas")`

DOC: https://keplerproject.github.io/copas/
 NOTE: you will need to install copas like this: luarocks install copas
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_luasocket_copas.connect(conn)` | Open network connection to .host and .port in conn table<br> Store opened socket to conn table<br> Returns true on success, or false and error text on failure | 13 |
| `libs_luamqtt_mqtt_luasocket_copas.receive(conn, size)` | Receive given amount of data from network connection | 34 |
| `libs_luamqtt_mqtt_luasocket_copas.send(conn, data, i, j)` | Send data to network connection | 28 |
| `libs_luamqtt_mqtt_luasocket_copas.settimeout(conn, timeout)` | Set connection's socket to non-blocking mode and set a timeout for it | 40 |
| `libs_luamqtt_mqtt_luasocket_copas.shutdown(conn)` | Shutdown network connection | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/luasocket-copas.lua`.*
