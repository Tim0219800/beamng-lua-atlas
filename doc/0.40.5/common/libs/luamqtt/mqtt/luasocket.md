# `connector`

*Fichier : `lua/common/libs/luamqtt/mqtt/luasocket.lua` · VM : Commun (GE + véhicule) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `connector`

DOC: http://w3.impa.br/~diego/software/luasocket/tcp.html
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `connector.connect(conn)` | Open network connection to .host and .port in conn table<br> Store opened socket to conn table<br> Returns true on success, or false and error text on failure | 11 |
| `connector.receive(conn, size)` | Receive given amount of data from network connection | 33 |
| `connector.send(conn, data, i, j)` | Send data to network connection | 26 |
| `connector.settimeout(conn, timeout)` | Set connection's socket to non-blocking mode and set a timeout for it | 44 |
| `connector.shutdown(conn)` | Shutdown network connection | 21 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/luasocket.lua`.*
