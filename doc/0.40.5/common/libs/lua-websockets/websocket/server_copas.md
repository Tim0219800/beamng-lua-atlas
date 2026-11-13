# `libs_lua_websockets_websocket_server_copas`

*Fichier : `lua/common/libs/lua-websockets/websocket/server_copas.lua` · VM : Commun (GE + véhicule) · 149 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/server_copas")`

Backend serveur WebSocket de lua-websockets pour la bibliothèque coopérative 'copas'. listen ouvre un socket serveur luasocket, réalise la poignée de main pour chaque connexion entrante et appelle le gestionnaire du sous-protocole négocié (ou le gestionnaire par défaut) avec un objet client.

## Exemple

```lua
local srv = require('libs/lua-websockets/websocket/server_copas').listen({
  port = 8080,
  default = function(client)
    local msg, opcode = client:receive()
    client:send(msg)
  end
})
```

## Remarques

- Nécessite libs/copas/copas ; il faut faire tourner la boucle copas pour traiter les connexions.
- Le gestionnaire par défaut est indexé par la clé magique true dans la table interne des clients.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_websockets_websocket_server_copas.listen(opts)` | Démarre un serveur WebSocket. Lève une erreur si le socket ne peut pas être ouvert. Chaque client accepté est enregistré, passé au gestionnaire, puis la coroutine reste en vie tant que client.state n'est pas 'CLOSED'. | 52 |

### Détail des paramètres

#### `libs_lua_websockets_websocket_server_copas.listen(opts)`

Démarre un serveur WebSocket. Lève une erreur si le socket ne peut pas être ouvert. Chaque client accepté est enregistré, passé au gestionnaire, puis la coroutine reste en vie tant que client.state n'est pas 'CLOSED'.

- `opts` (*table*) : port (défaut 80), interface (défaut '*'), protocols (table sous-protocole -> fonction(client)), default (fonction(client) pour les autres cas), on_error (fonction(message), défaut print). protocols ou default est obligatoire.
- **renvoie** : table Objet avec la méthode close(_, keep_clients) qui retire le serveur de copas et, sauf keep_clients, ferme les clients.

## Classe `client`

Objet client passé au gestionnaire (état 'OPEN', is_server = true). Hérite de websocket/sync (send, receive, close).

| Méthode | Description | Ligne |
|---|---|---|
| `client:broadcast(...)` | Envoie le message à tous les clients du même sous-protocole, puis à lui-même. | dyn |
| `client:on_close()` | Appelé à la fermeture : retire le client de la liste du sous-protocole. | dyn |
| `client:sock_close()` | Shutdown puis fermeture du socket. | dyn |
| `client:sock_receive()` | Lecture via copas.receive. | dyn |
| `client:sock_send()` | Envoi via copas.send. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/server_copas.lua`.*
