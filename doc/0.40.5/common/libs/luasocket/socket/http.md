# `libs_luasocket_socket_http`

*Fichier : `lua/common/libs/luasocket/socket/http.lua` · VM : Commun (GE + véhicule) · 354 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/http")`

Client HTTP/1.1 de LuaSocket (Diego Nehab) : requêtes GET/POST, corps en flux via LTN12, transfert chunked, redirections (jusqu'à 5), authentification Basic, proxy. API haut niveau avec http.request (URL simple ou table de paramètres) et API bas niveau avec http.open. Le module s'enregistre aussi dans socket.http. Appels bloquants : un moddeur doit les lancer avec précaution (délai TIMEOUT de 60 s).

## Exemple

```lua
local http = require('libs/luasocket/socket/http')
local corps, code, entetes, statut = http.request('http://example.com/')

local t = {}
local ok, code = http.request{url = 'http://example.com/api', method = 'POST', source = ltn12.source.string('a=1'),
  headers = {['content-length'] = 3, ['content-type'] = 'application/x-www-form-urlencoded'}, sink = ltn12.sink.table(t)}
```

## Remarques

- request est enveloppée par socket.protect : en cas d'erreur elle renvoie nil, message plutôt que de lever.
- Forme chaîne : request(url [, corps]) renvoie corps (chaîne), code, headers, status ; avec un corps, c'est un POST x-www-form-urlencoded. Forme table : request{...} renvoie 1, code, headers, status (le corps va dans reqt.sink).
- Champs de la table de requête : url, host, port, path, params, query, fragment, scheme, user, password, method, headers, source, sink, step, proxy, redirect (false pour désactiver), create, uri. Si le corps est envoyé sans en-tête content-length, il part en transfert chunked.
- Les redirections (301, 302, 303, 307) ne sont suivies que pour GET/HEAD, si aucun corps n'a été envoyé et jusqu'à 5 fois ; l'en-tête location est renvoyé pour indiquer une redirection.
- Pas de HTTPS : ce module ne gère que HTTP simple (socket TCP).
- http.PROXY (globale du module, non définie par défaut) force l'usage d'un proxy.
- Bug mineur du code original : dans receiveheaders, la boucle de dépliage fait 'line = sock:receive()' sans mettre à jour err, puis teste err.
- Le fichier requiert 'socket.socket', 'socket.url', 'ltn12', 'mime' et 'socket.headers' par nom court ; ces noms doivent être résolubles par le chemin de recherche du jeu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_http.open(host, port, create)` | API bas niveau : crée la socket (socket.tcp ou create), fixe le délai et se connecte. Renvoie un objet avec les méthodes sendrequestline, sendheaders, sendbody, receivestatusline, receiveheaders, receivebody, receive09body et close. Lève une erreur en cas d'échec (socket.try). | 109 |

### Détail des paramètres

#### `libs_luasocket_socket_http.open(host, port, create)`

API bas niveau : crée la socket (socket.tcp ou create), fixe le délai et se connecte. Renvoie un objet avec les méthodes sendrequestline, sendheaders, sendbody, receivestatusline, receiveheaders, receivebody, receive09body et close. Lève une erreur en cas d'échec (socket.try).

- `host` (*string*) : Hôte.
- `port` (*integer|nil*) : Port (défaut 80).
- `create` (*function|nil*) : Fabrique de socket alternative.
- **renvoie** : table Objet de connexion HTTP.

## Champs

| Champ | Type | Description |
|---|---|---|
| `PORT` | integer | Port HTTP par défaut : 80. |
| `TIMEOUT` | number | Délai de connexion en secondes : 60. |
| `USERAGENT` | string | Valeur de l'en-tête user-agent : socket._VERSION. |
| `request` | function | http.request(url [, corps]) ou http.request(table). Voir notes. Protégée par socket.protect. |

## Classe `connection`

Objet renvoyé par open (champs c = socket, try = fonction de contrôle d'erreur qui ferme la connexion).

| Méthode | Description | Ligne |
|---|---|---|
| `connection:close()` | Ferme la socket. | dyn |
| `connection:receive09body(status, sink, step)` | Lit un corps de réponse HTTP/0.9. | dyn |
| `connection:receivebody(headers, sink, step)` | Lit le corps (chunked, par longueur ou jusqu'à la fermeture) vers un sink LTN12. | dyn |
| `connection:receiveheaders()` | Lit les en-têtes de réponse (noms en minuscules). | dyn |
| `connection:receivestatusline()` | Lit la ligne de statut ; renvoie le code, ou nil et les 5 premiers octets si la réponse est de type HTTP/0.9. | dyn |
| `connection:sendbody(headers, source, step)` | Envoie le corps depuis une source LTN12 (chunked sauf si content-length est connu). | dyn |
| `connection:sendheaders(tosend)` | Envoie les en-têtes (noms mis en forme canonique) suivis de la ligne vide. | dyn |
| `connection:sendrequestline(method, uri)` | Envoie la ligne de requête 'METHODE uri HTTP/1.1'. | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/http.lua`.*
