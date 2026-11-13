# `libs_luasocket_socket_ftp`

*Fichier : `lua/common/libs/luasocket/socket/ftp.lua` · VM : Commun (GE + véhicule) · 285 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/ftp")`

FTP support for the Lua language
 LuaSocket toolkit.
 Author: Diego Nehab
 Declare module and import dependencies

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_ftp.open(server, port, create)` |  | 37 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `PASSWORD` | string |  |
| `PORT` | number | default port for ftp service |
| `TIMEOUT` | number | Program constants<br> timeout in seconds before the program gives up on a connection |
| `USER` | string | this is the default anonymous password. used when no password is<br> provided in url. should be changed to your e-mail. |
| `command` | any |  |
| `get` | any |  |
| `put` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/ftp.lua`.*
