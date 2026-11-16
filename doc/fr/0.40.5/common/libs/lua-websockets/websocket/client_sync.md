# `libs_lua_websockets_websocket_client_sync`

*Fichier : `lua/common/libs/lua-websockets/websocket/client_sync.lua` · VM : Commun (GE + véhicule) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/client_sync")`

Backend client WebSocket synchrone (bloquant) de lua-websockets, basé sur luasocket. Le module renvoie une fonction constructeur (aussi accessible par websocket.client.new). L'objet est étendu par websocket/sync, ce qui lui donne connect, send, receive et close. À utiliser pour un client WebSocket simple dans un script Lua du jeu.

## Exemple

```lua
local newClient = require('libs/lua-websockets/websocket/client_sync')
local ws = newClient({timeout = 1})
local ok, protocole = ws:connect('ws://127.0.0.1:8080', 'echo')
if ok then ws:send('hello'); local msg, opcode = ws:receive() end
```

## Remarques

- Bug/limitation : la variable locale ssl est fixée à nil (le require de luasec est commenté). dohandshake appelle ssl.wrap, donc une URL 'wss://' provoque une erreur Lua.
- Les appels sont bloquants (timeout facultatif via ws.timeout).

## Classe `client`

Objet renvoyé par le constructeur new(ws). ws est une table d'options facultative (timeout en secondes). connect/send/receive/close proviennent de websocket/sync.

| Méthode | Description | Ligne |
|---|---|---|
| `client:dohandshake(ssl_params)` | Enveloppe le socket avec ssl.wrap puis lance la négociation TLS. Inutilisable en pratique car ssl vaut nil. | dyn |
| `client:sock_close()` | Ferme le socket. | dyn |
| `client:sock_connect(host, port)` | Crée un socket TCP luasocket, applique ws.timeout et se connecte. Renvoie nil et l'erreur en cas d'échec. | dyn |
| `client:sock_receive()` | Lit des données sur le socket (luasocket receive). | dyn |
| `client:sock_send()` | Envoie des données sur le socket (luasocket send). | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/client_sync.lua`.*
