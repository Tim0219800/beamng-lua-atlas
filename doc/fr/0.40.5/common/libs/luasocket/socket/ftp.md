# `libs_luasocket_socket_ftp`

*Fichier : `lua/common/libs/luasocket/socket/ftp.lua` · VM : Commun (GE + véhicule) · 285 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/ftp")`

Client FTP de LuaSocket (Diego Nehab), bâti sur socket.tp et LTN12. Offre une API haut niveau (get, put, command) acceptant une URL ftp:// ou une table de paramètres, et une API bas niveau (open puis greet, login, pasv, send, receive…). Le module s'enregistre aussi dans socket.ftp.

## Exemple

```lua
local ftp = require('libs/luasocket/socket/ftp')
local contenu, err = ftp.get('ftp://anonymous:mdp@serveur/chemin/fichier.txt;type=i')
ftp.put('ftp://user:mdp@serveur/dest.txt', 'données')
```

## Remarques

- Les fonctions high-level sont enveloppées par socket.protect : en cas d'erreur elles renvoient nil, message au lieu de lever une exception.
- Bug : metat.__index:port utilise math.mod, absent de LuaJIT/Lua 5.1 standard (remplacé par math.fmod) : le mode actif (PORT) échouera ; le mode passif (pasv, utilisé par get/put) n'est pas concerné.
- Bug : dans send, readyt[tp] indexe avec le module tp au lieu de la socket de contrôle (le test de statut pendant le transfert n'est donc jamais vrai).
- Le fichier requiert 'socket.socket', 'socket.url', 'socket.tp' et 'ltn12' par nom court : ces noms doivent être résolubles par le chemin de recherche des modules du jeu.
- Dans une table de requête, les champs reconnus : host, port, user, password, type ('a' ou 'i'), path, command, argument, source, sink, step, url, create. Un champ explicite écrase celui de l'URL.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_ftp.open(server, port, create)` | Ouvre une connexion de contrôle vers un serveur FTP et renvoie un objet bas niveau avec les méthodes greet, login, pasv, port, send, receive, cwd, type, quit, close. Lève une erreur (socket.try) en cas d'échec. | 37 |

### Détail des paramètres

#### `libs_luasocket_socket_ftp.open(server, port, create)`

Ouvre une connexion de contrôle vers un serveur FTP et renvoie un objet bas niveau avec les méthodes greet, login, pasv, port, send, receive, cwd, type, quit, close. Lève une erreur (socket.try) en cas d'échec.

- `server` (*string*) : Hôte.
- `port` (*integer|nil*) : Port (défaut 21).
- `create` (*function|nil*) : Fabrique de socket alternative (défaut socket.tcp).
- **renvoie** : table Objet de connexion FTP.

## Champs

| Champ | Type | Description |
|---|---|---|
| `PASSWORD` | string | Mot de passe anonyme par défaut : 'anonymous@anonymous.org' (à remplacer par une adresse e-mail). |
| `PORT` | integer | Port FTP par défaut : 21. |
| `TIMEOUT` | number | Délai en secondes avant d'abandonner une connexion : 60. |
| `USER` | string | Utilisateur anonyme par défaut : 'ftp'. |
| `command` | function | ftp.command(cmdt) : envoie une commande FTP (champs host, command, argument, check, user, password…) et ferme la connexion. Renvoie 1 ou nil, erreur. |
| `get` | function | ftp.get(url\|table) : télécharge un fichier. Avec une URL, renvoie le contenu (chaîne) ; avec une table, utilise le sink fourni. |
| `put` | function | ftp.put(url, corps) ou ftp.put(table) : envoie un fichier ; renvoie le nombre d'octets envoyés. |

## Classe `connection`

Objet renvoyé par open (champs tp = canal de contrôle, data, server, pasvt, try).

| Méthode | Description | Ligne |
|---|---|---|
| `connection:close()` | Ferme les connexions de données, serveur et contrôle. | dyn |
| `connection:cwd(dir)` | Change de répertoire distant. | dyn |
| `connection:greet()` | Lit le message d'accueil du serveur. | dyn |
| `connection:login(user, password)` | Authentifie avec USER/PASS (valeurs anonymes par défaut). | dyn |
| `connection:pasv()` | Passe en mode passif et mémorise l'IP et le port de données ; renvoie ip, port. | dyn |
| `connection:pasvconnect()` | Ouvre la connexion de données en mode passif. | dyn |
| `connection:port(ip, port)` | Passe en mode actif : annonce un port local au serveur (ouvre un socket serveur si ip est nil). Utilise math.mod (voir notes). | dyn |
| `connection:portconnect()` | Accepte la connexion de données en mode actif. | dyn |
| `connection:quit()` | Envoie QUIT. | dyn |
| `connection:receive(recvt)` | Reçoit des données (commande RETR par défaut) dans le sink fourni ; nécessite pasv ou port avant. | dyn |
| `connection:send(sendt)` | Envoie des données (commande STOR par défaut) ; nécessite pasv ou port avant. Renvoie le nombre d'octets envoyés. | dyn |
| `connection:type(type)` | Choisit le mode de transfert ('a' texte, 'i' binaire). | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/ftp.lua`.*
