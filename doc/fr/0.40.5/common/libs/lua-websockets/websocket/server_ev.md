# `libs_lua_websockets_websocket_server_ev`

*Fichier : `lua/common/libs/lua-websockets/websocket/server_ev.lua` · VM : Commun (GE + véhicule) · 267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/server_ev")`

Backend serveur WebSocket de lua-websockets pour la boucle d'événements lua-ev (module 'ev', non fourni par le jeu). listen accepte les connexions de façon asynchrone, effectue la poignée de main, puis crée un objet client piloté par callbacks (on_message, on_close, on_error).

## Exemple

```lua
local srv = require('libs/lua-websockets/websocket/server_ev').listen({
  port = 8080,
  default = function(client)
    client:on_message(function(c, msg, opcode) c:send(msg) end)
  end
})
```

## Remarques

- Nécessite le module 'ev' (lua-ev) ; sans lui le require échoue. Probablement non utilisé dans le jeu (déduit du code).
- Plusieurs messages d'erreur sont affichés avec print() plutôt que remontés au callback.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_websockets_websocket_server_ev.listen(opts)` | Démarre un serveur WebSocket asynchrone sur la boucle ev. Lève une erreur si le bind échoue. | 142 |

### Détail des paramètres

#### `libs_lua_websockets_websocket_server_ev.listen(opts)`

Démarre un serveur WebSocket asynchrone sur la boucle ev. Lève une erreur si le bind échoue.

- `opts` (*table*) : port (défaut 80), interface (défaut '*'), loop (défaut ev.Loop.default), protocols (sous-protocole -> fonction(client)), default (fonction(client)). protocols ou default est obligatoire.
- **renvoie** : table Objet serveur : on_error(self, f), sock() (socket d'écoute), close(keep_clients).

## Classe `client`

Objet client passé au gestionnaire (state 'OPEN'). Les callbacks se posent avec les méthodes on_*.

| Méthode | Description | Ligne |
|---|---|---|
| `client:broadcast(...)` | Envoie à tous les clients du même sous-protocole. | dyn |
| `client:close(code, reason, timeout)` | Ferme la connexion proprement (trame CLOSE) avec un délai d'expiration. | dyn |
| `client:on_close(on_close)` | Définit le callback de fermeture. | dyn |
| `client:on_error(on_error)` | Définit le callback d'erreur. | dyn |
| `client:on_message(on_message)` | Définit le callback de réception. | dyn |
| `client:send(message, opcode)` | Envoie un message de façon asynchrone (tampon d'écriture). | dyn |
| `client:start()` | Démarre la lecture asynchrone des messages ; appelé par listen après l'appel du gestionnaire. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/server_ev.lua`.*
