# `libs_lua_websockets_websocket`

*Fichier : `lua/common/libs/lua-websockets/websocket.lua` · VM : Commun (GE + véhicule) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket")`

Point d'entrée de la bibliothèque tierce lua-websockets (Gerhard Lipp, licence MIT), implémentation WebSocket (RFC 6455) en Lua pur. Ce module regroupe les sous-modules client et server (chargés à la demande) et les constantes d'opcodes de trame. Il est chargé via require('libs/lua-websockets/websocket').

## Exemple

```lua
local ws = require('libs/lua-websockets/websocket')
local c = ws.client.new({timeout = 2})
local ok, err = c:connect('ws://127.0.0.1:8080', 'echo')
if ok then c:send('salut', ws.TEXT) end
```

## Remarques

- Les require internes utilisent le chemin 'libs/lua-websockets/websocket.frame' (avec un point) ; c'est la convention de require de Lua, équivalente à un slash.
- Les backends 'ev' (client_ev, server_ev) exigent la bibliothèque 'ev' (lua-ev) et les backends 'copas' exigent 'libs/copas/copas' ; sans ces dépendances, le require échoue.

## Champs

| Champ | Type | Description |
|---|---|---|
| `BINARY` | integer | Opcode 2 : message binaire. |
| `CLOSE` | integer | Opcode 8 : fermeture de la connexion. |
| `CONTINUATION` | integer | Opcode 0 : trame de continuation d'un message fragmenté. |
| `PING` | integer | Opcode 9 : ping. |
| `PONG` | integer | Opcode 10 : pong. |
| `TEXT` | integer | Opcode 1 : message texte. |
| `client` | table | Table paresseuse (voir websocket/client.lua) : client.new / client.sync (backend synchrone), client.copas, client.ev. |
| `server` | table | Table paresseuse (voir websocket/server.lua) : server.copas, server.ev. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket.lua`.*
