# `libs_lua_websockets_websocket_client_copas`

*Fichier : `lua/common/libs/lua-websockets/websocket/client_copas.lua` · VM : Commun (GE + véhicule) · 45 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/client_copas")`

Backend client WebSocket de lua-websockets pour la bibliothèque coopérative 'copas' (sockets non bloquants dans des coroutines). Le module renvoie une fonction constructeur ; l'objet renvoyé est étendu par websocket/sync (méthodes connect, send, receive, close).

## Exemple

```lua
local newClient = require('libs/lua-websockets/websocket/client_copas')
local ws = newClient({timeout = 2})
-- à appeler dans une coroutine copas :
ws:connect('ws://127.0.0.1:8080', 'proto')
```

## Remarques

- Nécessite libs/copas/copas et libs/luasocket/socket.socket.
- Les entrées/sorties passent par copas.connect/send/receive/dohandshake, donc les appels doivent se faire depuis une coroutine gérée par copas.

## Classe `client`

Objet renvoyé par le constructeur new(ws). ws est une table d'options facultative (champ timeout en secondes). Les méthodes connect/send/receive/close viennent de websocket/sync ; les méthodes sock_* ci-dessous fournissent le transport.

| Méthode | Description | Ligne |
|---|---|---|
| `client:dohandshake()` | Délègue à copas.dohandshake (négociation TLS) sur le socket. | dyn |
| `client:sock_close()` | Ferme le socket. | dyn |
| `client:sock_connect(host, port)` | Crée un socket TCP (luasocket), applique ws.timeout et se connecte via copas.connect. Renvoie nil et l'erreur en cas d'échec (sauf 'already connected'). | dyn |
| `client:sock_receive()` | Lit des données via copas.receive sur le socket. | dyn |
| `client:sock_send()` | Envoie des données via copas.send sur le socket. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/client_copas.lua`.*
