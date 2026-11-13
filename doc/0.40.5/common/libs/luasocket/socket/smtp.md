# `libs_luasocket_socket_smtp`

*Fichier : `lua/common/libs/luasocket/socket/smtp.lua` · VM : Commun (GE + véhicule) · 256 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/smtp")`

SMTP client support for the Lua language.
 LuaSocket toolkit.
 Author: Diego Nehab
 Declare module and import dependencies

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_smtp.message(mesgt)` |  | 233 |
| `libs_luasocket_socket_smtp.open(server, port, create)` |  | 116 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `DOMAIN` | any | domain used in HELO command and default sendmail<br> If we are under a CGI, try to get from environment |
| `PORT` | number | default port |
| `SERVER` | string | default server used to send e-mails |
| `TIMEOUT` | number | Program constants<br> timeout for connection |
| `ZONE` | string | default time zone (means we don't know) |
| `send` | any | High level SMTP API |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/smtp.lua`.*
