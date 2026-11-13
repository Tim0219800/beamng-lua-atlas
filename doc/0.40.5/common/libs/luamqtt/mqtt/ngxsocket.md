# `libs_luamqtt_mqtt_ngxsocket`

*Fichier : `lua/common/libs/luamqtt/mqtt/ngxsocket.lua` · VM : Commun (GE + véhicule) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luamqtt/mqtt/ngxsocket")`

module table
 thanks to @irimiab: https://github.com/xHasKx/luamqtt/issues/13

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luamqtt_mqtt_ngxsocket.connect(conn)` | Open network connection to .host and .port in conn table<br> Store opened socket to conn table<br> Returns true on success, or false and error text on failure | 12 |
| `libs_luamqtt_mqtt_ngxsocket.receive(conn, size)` | Receive given amount of data from network connection | 41 |
| `libs_luamqtt_mqtt_ngxsocket.send(conn, data, i, j)` | Send data to network connection | 32 |
| `libs_luamqtt_mqtt_ngxsocket.settimeout(conn, timeout)` | Set connection's socket to non-blocking mode and set a timeout for it | 46 |
| `libs_luamqtt_mqtt_ngxsocket.shutdown(conn)` | Shutdown network connection | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/ngxsocket.lua`.*
