# `libs_lua_websockets_websocket_client_ev`

*Fichier : `lua/common/libs/lua-websockets/websocket/client_ev.lua` · VM : Commun (GE + véhicule) · 252 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/client_ev")`

Backend client WebSocket asynchrone de lua-websockets pour la boucle d'événements lua-ev (module 'ev', non fourni par le jeu). Le module renvoie une fonction constructeur ; l'objet fonctionne par callbacks (on_open, on_message, on_error, on_close) et gère connexion non bloquante, poignée de main et fermeture avec délai.

## Exemple

```lua
local newClient = require('libs/lua-websockets/websocket/client_ev')
local ws = newClient()
ws:on_open(function() ws:send('hello') end)
ws:on_message(function(_, msg, opcode) end)
ws:connect('ws://127.0.0.1:8080', 'proto')
```

## Remarques

- Nécessite le module 'ev' (lua-ev) ; probablement non utilisé dans le jeu (déduit du code).

## Classe `client`

Objet renvoyé par le constructeur new(ws). ws est une table d'options facultative (loop : boucle ev, défaut ev.Loop.default). L'état self.state vaut 'CLOSED', 'CONNECTING', 'OPEN' ou 'CLOSING'.

| Méthode | Description | Ligne |
|---|---|---|
| `client:close(code, reason, timeout)` | Ferme la connexion : annule la connexion en cours ou envoie une trame CLOSE puis attend l'écho jusqu'au délai (3 s par défaut), sinon ferme avec le code 1006 'timeout'. | dyn |
| `client:connect(url, ws_protocol, options)` | Lance une connexion asynchrone, puis la poignée de main WebSocket. | dyn |
| `client:on_close(f)` | Définit le callback de fermeture. | dyn |
| `client:on_error(f)` | Définit le callback d'erreur. | dyn |
| `client:on_message(f)` | Définit le callback de réception. | dyn |
| `client:on_open(f)` | Définit le callback appelé quand la connexion est ouverte. | dyn |
| `client:send(message, opcode)` | Envoie un message (trame masquée côté client). | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/client_ev.lua`.*
