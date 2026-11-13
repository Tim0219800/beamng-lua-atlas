# `message_io`

*Fichier : `lua/common/libs/lua-websockets/websocket/ev_common.lua` · VM : Commun (GE + véhicule) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `message_io`, `send_io_stop`

Fonctions communes aux backends client_ev et server_ev de lua-websockets (boucle d'événements lua-ev) : envoi asynchrone avec tampon et lecture/décodage de trames WebSocket sur un socket. Nécessite le module 'ev' (non fourni par le jeu).

## Remarques

- Le fichier est une table de retour {async_send, message_io} ; le doc auto liste des noms 'message_io' en globale, mais ce sont des variables locales.
- Une partie de async_send est tronquée dans l'extraction auto (corps réel : fonction send/stop/send_async plus bas dans le fichier).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `message_io.async_send(sock, loop)` | Prépare l'envoi asynchrone sur un socket : crée un IO d'écriture ev et renvoie deux fonctions, send_async(data, on_sent, on_err) qui ajoute les données au tampon et renvoie le nombre d'octets en attente, et stop() qui arrête l'IO et vide le tampon. on_sent reçoit les données envoyées ; on_err reçoit l'erreur. | 21 |
| `message_io.message_io(sock, loop, on_message, on_error)` | Surveille la lecture d'un socket, reconstitue les trames WebSocket (via frame.decode), concatène les fragments et appelle on_message pour chaque message complet. Appelle on_error à la déconnexion ou à une erreur autre que timeout. | 99 |

### Détail des paramètres

#### `message_io.async_send(sock, loop)`

Prépare l'envoi asynchrone sur un socket : crée un IO d'écriture ev et renvoie deux fonctions, send_async(data, on_sent, on_err) qui ajoute les données au tampon et renvoie le nombre d'octets en attente, et stop() qui arrête l'IO et vide le tampon. on_sent reçoit les données envoyées ; on_err reçoit l'erreur.

- `sock` (*table*) : Socket luasocket.
- `loop` (*table*) : Boucle ev (défaut ev.Loop.default).
- **renvoie** : function send_async(data, on_sent, on_err).
- **renvoie** : function stop().

#### `message_io.message_io(sock, loop, on_message, on_error)`

Surveille la lecture d'un socket, reconstitue les trames WebSocket (via frame.decode), concatène les fragments et appelle on_message pour chaque message complet. Appelle on_error à la déconnexion ou à une erreur autre que timeout.

- `sock` (*table*) : Socket luasocket avec descripteur valide.
- `loop` (*table*) : Boucle ev.
- `on_message` (*function*) : fonction(message, opcode).
- `on_error` (*function*) : fonction(err, io, sock).
- **renvoie** : table L'IO ev de lecture (arrêt avec :stop(loop)).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/lua-websockets/websocket/ev_common.lua`.*
