# `libs_lua_websockets_websocket_sync`

*Fichier : `lua/common/libs/lua-websockets/websocket/sync.lua` · VM : Commun (GE + véhicule) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/sync")`

Cœur synchrone de lua-websockets : extend(obj) ajoute à un objet disposant de sock_send, sock_receive, sock_close (et sock_connect côté client) les méthodes connect, send, receive et close. Gère la poignée de main, le réassemblage de messages fragmentés, la réponse automatique aux PING (client) et la fermeture propre. Utilisé par client_sync, client_copas et server_copas.

## Remarques

- extend lève une assertion si l'objet possède déjà receive, send, close, connect ou is_closing.
- receive renvoie (nil, nil, was_clean, code, reason) à la fermeture ; sinon (message, opcode).
- Dans receive, le message d'erreur 'frame was not masked' est émis quand une trame reçue côté client EST masquée (message inversé par rapport à la condition).
- Pour 'wss', connect appelle self:dohandshake ; avec client_sync, ssl est nil donc cela échoue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_websockets_websocket_sync.extend(obj)` | Ajoute les méthodes WebSocket à obj et initialise obj.state à 'CLOSED' s'il est absent. | 186 |

### Détail des paramètres

#### `libs_lua_websockets_websocket_sync.extend(obj)`

Ajoute les méthodes WebSocket à obj et initialise obj.state à 'CLOSED' s'il est absent.

- `obj` (*table*) : Objet avec sock_send, sock_receive, sock_close (et sock_connect s'il n'est pas serveur).
- **renvoie** : table Le même objet, étendu.

## Classe `obj`

Objet étendu par extend. Champs : state ('CLOSED', 'OPEN'), is_server, is_closing, callback facultatif on_close.

Objet `obj` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `obj:close(code, reason)` | Envoie une trame CLOSE, attend la réponse, ferme le socket, appelle on_close s'il existe et passe state à 'CLOSED'. Renvoie false si l'état n'est pas 'OPEN'. | 95 |
| `obj:connect(ws_url, ws_protocol, options)` | Connexion client : analyse l'URL, connecte le socket, fait la poignée de main HTTP et vérifie Sec-WebSocket-Accept. Passe state à 'OPEN' en cas de succès. | 126 |
| `obj:receive()` | Bloque jusqu'à réception d'un message complet. Réassemble les fragments, répond aux PING côté client, répond à CLOSE par un écho. | 8 |
| `obj:send(data, opcode)` | Envoie un message (masqué si l'objet n'est pas un serveur). Ferme la connexion si l'envoi échoue. | 83 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/sync.lua`.*
