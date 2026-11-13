# `connector`

*Fichier : `lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua` · VM : Commun (GE + véhicule) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `connector`

DOC: http://w3.impa.br/~diego/software/luasocket/tcp.html
 module table

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `connector.connect(conn)` | Open network connection to .host and .port in conn table<br> Store opened socket to conn table<br> Returns true on success, or false and error text on failure | 13 |
| `connector.shutdown(conn)` | Shutdown network connection | 44 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `receive` | any |  |
| `send` | any | Copy original methods from mqtt.luasocket module |
| `settimeout` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luamqtt/mqtt/luasocket_ssl.lua`.*
