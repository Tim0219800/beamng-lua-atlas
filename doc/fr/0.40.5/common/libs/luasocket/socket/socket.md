# `libs_luasocket_socket_socket`

*Fichier : `lua/common/libs/luasocket/socket/socket.lua` · VM : Commun (GE + véhicule) · 151 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/socket")`

Bibliothèque tierce LuaSocket (Diego Nehab) : module d'aide au-dessus du noyau `socket` natif. Il ajoute connect4/connect6 (connexion forcée en IPv4/IPv6), bind (serveur TCP avec choix de la famille d'adresse), choose (sélecteur de variantes) et les sources/sinks LTN12 sur socket (sink : close-when-done, keep-open ; source : by-length, until-closed). Il modifie et renvoie la table `socket` elle-même.

## Remarques

- Le module renvoie `socket` (le noyau natif) enrichi : `require('socket.socket')` et `require('socket')` donnent la même table.
- `bind` active tcp-nodelay et reuseaddr, accepte host == '*' (devient 0.0.0.0), essaie chaque adresse renvoyée par socket.dns.getaddrinfo et renvoie le premier socket qui a réussi bind + listen.
- BLOCKSIZE vaut 2048 octets (taille des lectures des sources).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_socket.bind(host, port, backlog)` | Crée un socket TCP serveur : résout `host`, lie le port, puis écoute. | 27 |
| `libs_luasocket_socket_socket.choose(table)` | Renvoie une fonction (nom, opt1, opt2) qui appelle table[nom](opt1, opt2). Si le premier argument n'est pas une chaîne, le nom "default" est utilisé. Lève une erreur « unknown key » si le nom est inconnu. | 59 |
| `libs_luasocket_socket_socket.connect4(address, port, laddress, lport)` | Se connecte à une adresse en forçant la famille IPv4 (appelle socket.connect avec "inet"). | 19 |
| `libs_luasocket_socket_socket.connect6(address, port, laddress, lport)` | Comme connect4 mais en IPv6 ("inet6"). | 23 |

### Détail des paramètres

#### `libs_luasocket_socket_socket.bind(host, port, backlog)`

Crée un socket TCP serveur : résout `host`, lie le port, puis écoute.

- `host` (*string*) : Hôte ou "*" pour toutes les interfaces IPv4.
- `port` (*integer*) : Port d'écoute.
- `backlog` (*integer|nil*) : Longueur de la file d'attente de listen.
- **renvoie** : table|nil Socket serveur en écoute, ou nil suivi d'une erreur.

#### `libs_luasocket_socket_socket.choose(table)`

Renvoie une fonction (nom, opt1, opt2) qui appelle table[nom](opt1, opt2). Si le premier argument n'est pas une chaîne, le nom "default" est utilisé. Lève une erreur « unknown key » si le nom est inconnu.

- `table` (*table<string, function>*) : Table de variantes.
- **renvoie** : function Sélecteur.

#### `libs_luasocket_socket_socket.connect4(address, port, laddress, lport)`

Se connecte à une adresse en forçant la famille IPv4 (appelle socket.connect avec "inet").

- `address` (*string*) : Adresse ou nom d'hôte distant.
- `port` (*integer*) : Port distant.
- `laddress` (*string|nil*) : Adresse locale à lier.
- `lport` (*integer|nil*) : Port local à lier.
- **renvoie** : table|nil Socket connecté, ou nil suivi d'un message d'erreur.

#### `libs_luasocket_socket_socket.connect6(address, port, laddress, lport)`

Comme connect4 mais en IPv6 ("inet6").

- `address` (*string*) : Adresse ou nom d'hôte distant.
- `port` (*integer*) : Port distant.
- `laddress` (*string|nil*) : Adresse locale à lier.
- `lport` (*integer|nil*) : Port local à lier.
- **renvoie** : table|nil Socket connecté, ou nil suivi d'un message d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `BLOCKSIZE` | integer | Taille des blocs lus par les sources de socket (2048). |
| `sink` | function | socket.sink(nom, sock) : choisit un sink dans sinkt (nom omis = "default"). |
| `sinkt` | table<string, function> | Fabriques de sinks LTN12 : "close-when-done", "keep-open", "default" (= keep-open). |
| `source` | function | socket.source(nom, sock, longueur?) : choisit une source dans sourcet (nom omis = "default"). |
| `sourcet` | table<string, function> | Fabriques de sources LTN12 : "by-length", "until-closed", "default" (= until-closed). |
| `try` | function | Résultat de socket.newtry() : lève une erreur si son premier argument est nil/false, sinon renvoie les arguments. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/socket.lua`.*
