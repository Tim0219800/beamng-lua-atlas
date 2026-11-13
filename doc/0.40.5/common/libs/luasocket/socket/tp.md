# `libs_luasocket_socket_tp`

*Fichier : `lua/common/libs/luasocket/socket/tp.lua` · VM : Commun (GE + véhicule) · 126 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/luasocket/socket/tp")`

Bibliothèque tierce LuaSocket (Diego Nehab) : sous-système commun aux protocoles texte SMTP/FTP (« Telnet-like Protocol »). `connect` ouvre une connexion TCP et renvoie un objet dont les méthodes lisent les réponses du serveur à code numérique à trois chiffres (réponses multilignes comprises) et envoient des commandes. Utilisé par socket.smtp.

## Remarques

- L'objet renvoyé par connect expose : check(ok), command(cmd, arg), send(data), receive(pat), source(source, step), sink(snk, pat), getfd, dirty, getcontrol et close.
- `check(ok)` accepte un motif Lua (ex. "2.."), une liste de motifs, ou une fonction (code, réponse) ; renvoie le code numérique et le texte, ou nil et la réponse si le code ne correspond pas.
- Bug du code : la méthode `sink` utilise une variable `c` non définie (elle devrait utiliser self.c) ; elle échoue si on l'appelle.
- TIMEOUT par défaut : 60 s.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_luasocket_socket_tp.connect(host, port, timeout, create)` | Crée un socket (create ou socket.tcp), fixe le délai, se connecte et renvoie l'objet de contrôle. En cas d'échec, ferme le socket et renvoie nil et l'erreur. | 114 |

### Détail des paramètres

#### `libs_luasocket_socket_tp.connect(host, port, timeout, create)`

Crée un socket (create ou socket.tcp), fixe le délai, se connecte et renvoie l'objet de contrôle. En cas d'échec, ferme le socket et renvoie nil et l'erreur.

- `host` (*string*) : Hôte du serveur.
- `port` (*integer*) : Port du serveur.
- `timeout` (*number|nil*) : Délai en secondes ; défaut TIMEOUT.
- `create` (*function|nil*) : Fabrique de socket ; défaut socket.tcp.
- **renvoie** : table|nil Objet de contrôle du protocole, ou nil.
- **renvoie** : string|nil Message d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `TIMEOUT` | number | Délai par défaut des opérations réseau en secondes (60). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/luasocket/socket/tp.lua`.*
