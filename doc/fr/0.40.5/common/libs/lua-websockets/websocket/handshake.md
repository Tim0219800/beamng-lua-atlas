# `libs_lua_websockets_websocket_handshake`

*Fichier : `lua/common/libs/lua-websockets/websocket/handshake.lua` · VM : Commun (GE + véhicule) · 109 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/lua-websockets/websocket/handshake")`

Poignée de main HTTP/1.1 de WebSocket (upgrade) pour lua-websockets : construction de la requête client, analyse des en-têtes, validation côté serveur et calcul de Sec-WebSocket-Accept (SHA-1 de la clé + GUID RFC 6455, encodé en base64). Utilisé par websocket/sync et les backends serveur.

## Remarques

- http_headers met les noms d'en-têtes en minuscules ; les valeurs aussi, sauf pour les en-têtes contenant 'sec-websocket' (clé et accept gardent leur casse).
- Les assertions échouent (assert(false, ligne)) si une ligne d'en-tête est malformée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols)` | Côté serveur : vérifie qu'une requête est un upgrade WebSocket valide (Upgrade: websocket, Connection contenant upgrade, clé présente, version 13) et fabrique la réponse '101 Switching Protocols'. Choisit le premier sous-protocole demandé qui figure dans la liste supportée. | 67 |
| `libs_lua_websockets_websocket_handshake.http_headers(request)` | Analyse une requête/réponse HTTP/1.1 en texte brut. Si la première ligne ne finit pas par HTTP/1.1, renvoie une table vide. | 14 |
| `libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key)` | Calcule la valeur Sec-WebSocket-Accept : SHA-1 de (clé .. GUID 258EAFA5-E914-47DA-95CA-C5AB0DC85B11) puis base64. | 7 |
| `libs_lua_websockets_websocket_handshake.upgrade_request(req)` | Côté client : construit le texte de la requête GET d'upgrade WebSocket (version 13) avec Host, clé, sous-protocoles, en-têtes supplémentaires et Origin facultatifs. | 40 |

### Détail des paramètres

#### `libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols)`

Côté serveur : vérifie qu'une requête est un upgrade WebSocket valide (Upgrade: websocket, Connection contenant upgrade, clé présente, version 13) et fabrique la réponse '101 Switching Protocols'. Choisit le premier sous-protocole demandé qui figure dans la liste supportée.

- `request` (*string*) : Requête HTTP brute.
- `protocols` (*string[]*) : Sous-protocoles supportés par le serveur.
- **renvoie** : string|nil Réponse HTTP 101, ou nil si la requête est invalide.
- **renvoie** : string|nil Sous-protocole retenu ; en cas de refus, 'HTTP/1.1 400 Bad Request' en seconde valeur.

#### `libs_lua_websockets_websocket_handshake.http_headers(request)`

Analyse une requête/réponse HTTP/1.1 en texte brut. Si la première ligne ne finit pas par HTTP/1.1, renvoie une table vide.

- `request` (*string*) : Texte brut avec lignes terminées par CRLF.
- **renvoie** : table<string, string> En-têtes en minuscules ; les doublons sont joints par une virgule.
- **renvoie** : string|nil Corps après la ligne vide, s'il existe.

#### `libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key)`

Calcule la valeur Sec-WebSocket-Accept : SHA-1 de (clé .. GUID 258EAFA5-E914-47DA-95CA-C5AB0DC85B11) puis base64.

- `sec_websocket_key` (*string*) : Valeur de l'en-tête Sec-WebSocket-Key envoyée par le client.
- **renvoie** : string Valeur à placer dans Sec-WebSocket-Accept.

#### `libs_lua_websockets_websocket_handshake.upgrade_request(req)`

Côté client : construit le texte de la requête GET d'upgrade WebSocket (version 13) avec Host, clé, sous-protocoles, en-têtes supplémentaires et Origin facultatifs.

- `req` (*table*) : Champs : uri, host, port (ajouté à Host s'il vaut autre chose que 80), key, protocols (liste de chaînes), extra_headers (table nom->valeur), origin.
- **renvoie** : string Requête HTTP complète.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/handshake.lua`.*
