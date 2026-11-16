# `libs_luasocket_socket_smtp`

*Fichier : `lua/common/libs/luasocket/socket/smtp.lua` · VM : Commun (GE + véhicule) · 256 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/smtp")`

Bibliothèque tierce LuaSocket (auteur Diego Nehab) : client SMTP pour envoyer des e-mails. Elle s'attache à la table `socket` sous `socket.smtp`. Elle fournit l'API de haut niveau `send` (connexion, EHLO, authentification LOGIN/PLAIN, envoi, QUIT) et l'API de bas niveau `open` (objet à méthodes greet/mail/rcpt/data/quit/login/plain/auth/send/close), ainsi que `message` pour construire une source de message MIME (simple ou multipart). Elle n'est pas utilisée par le gameplay : c'est du code embarqué avec LuaSocket.

## Exemple

```lua
local smtp = require('socket.smtp')
local ok, err = smtp.send{ from = '<a@b.c>', rcpt = {'<d@e.f>'}, source = smtp.message{ headers = {subject = 'Hello'}, body = 'texte' }, server = 'localhost', port = 25 }
```

## Remarques

- Le fichier fait `require('socket.socket')`, `require('socket.tp')`, `require('ltn12')`, `require('socket.headers')` et `require('mime')` : ces modules doivent être résolvables (le chemin atlas `libs/luasocket/socket/smtp` est celui du fichier, pas le nom de require interne).
- TIMEOUT = 60 s, SERVER = 'localhost', PORT = 25, ZONE = '-0000' par défaut ; DOMAIN vaut la variable d'environnement SERVER_NAME ou 'localhost'.
- `send` est enveloppée par `socket.protect` : les erreurs sont renvoyées sous la forme `nil, message` au lieu d'être levées.
- Les corps de message sans content-type reçoivent 'text/plain; charset="iso-8859-1"'. L'en-tête mime-version est toujours forcé à '1.0'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_smtp.message(mesgt)` | Construit une source (fonction itératrice de chunks, compatible LTN12) pour un message. mesgt = {headers, body} ; body peut être une chaîne, une fonction source ou une table (multipart, avec preamble/epilogue). Ajoute les en-têtes date, x-mailer et mime-version. | 233 |
| `libs_luasocket_socket_smtp.open(server, port, create)` | Ouvre une connexion SMTP et renvoie un objet de bas niveau (méthodes greet, mail, rcpt, data, quit, close, login, plain, auth, send). Lève une erreur (via socket.try) si la connexion échoue. | 116 |

### Détail des paramètres

#### `libs_luasocket_socket_smtp.message(mesgt)`

Construit une source (fonction itératrice de chunks, compatible LTN12) pour un message. mesgt = {headers, body} ; body peut être une chaîne, une fonction source ou une table (multipart, avec preamble/epilogue). Ajoute les en-têtes date, x-mailer et mime-version.

- `mesgt` (*table*) : Description du message ; sa clé `headers` est remplacée par la version normalisée (modifiée en place).
- **renvoie** : function Source : chaque appel renvoie le chunk suivant, ou nil puis une erreur.

#### `libs_luasocket_socket_smtp.open(server, port, create)`

Ouvre une connexion SMTP et renvoie un objet de bas niveau (méthodes greet, mail, rcpt, data, quit, close, login, plain, auth, send). Lève une erreur (via socket.try) si la connexion échoue.

- `server` (*string|nil*) : Hôte du serveur ; défaut SERVER.
- `port` (*integer|nil*) : Port ; défaut PORT.
- `create` (*function|nil*) : Fabrique de socket TCP ; défaut socket.tcp.
- **renvoie** : table Objet SMTP dont les méthodes lèvent une erreur en cas de réponse inattendue du serveur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `DOMAIN` | string | Domaine utilisé dans la commande EHLO ; variable d'environnement SERVER_NAME ou "localhost". |
| `PORT` | number | Port SMTP par défaut (25). |
| `SERVER` | string | Serveur SMTP par défaut ("localhost"). |
| `TIMEOUT` | number | Délai de connexion en secondes (60). |
| `ZONE` | string | Fuseau horaire par défaut de l'en-tête Date ("-0000" = inconnu). |
| `send` | function | API de haut niveau : prend une table {server, port, domain, user, password, from, rcpt, source, step, create}, ouvre la connexion, fait greet, auth, send, quit puis close. Renvoie 1 en cas de succès, sinon nil et un message d'erreur. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/smtp.lua`.*
