# `libs_LuaIRC_init`

*Fichier : `lua/common/libs/LuaIRC/init.lua` · VM : Commun (GE + véhicule) · 280 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuaIRC/init")`

Point d'entrée de la bibliothèque tierce LuaIRC (client IRC en Lua, adapté pour BeamNG). Définit le module global `irc` (écriture `module "irc"`, Lua 5.1) : irc.new(data) crée un client, connect() ouvre la socket TCP (SSL possible via libs/luasec/ssl), envoie CAP/NICK/USER et boucle jusqu'à l'authentification. Charge irc.util, irc.asyncoperations et irc.handlers. Les événements se branchent avec hook(name, id, f) ; think() doit être appelé régulièrement pour lire les messages entrants.

## Exemple

```lua
local irc = require("libs/LuaIRC/init")
local c = irc.new({nick = "MonBot"})
c:hook("OnChat", function(user, channel, msg) print(user.nick, msg) end)
c:connect("irc.example.org", 6667)
c:join("#test")
-- puis appeler c:think() à chaque frame
```

## Remarques

- Avant connect(), l'objet a la métatable meta_preconnect : seules hook, unhook et connect sont utilisables, tout autre accès aux méthodes de meta lève une erreur.
- connect() bloque (timeout 30 s par défaut, puis boucle d'attente avec pause de 0.1 s) tant que le serveur n'a pas répondu 001 ; il ne renvoie rien. Sur échec de connexion TCP, il logge une erreur et retourne sans lever d'erreur.
- Dans connect(), `success` est affecté sans `local` (variable globale). En cas de LuaSec absent, le log passe un 4e argument inutile (2).
- meta:handle affiche par print les commandes IRC inconnues et leurs paramètres.
- Un hook qui renvoie une valeur vraie interrompt la chaîne des hooks suivants pour cet événement (invoke retourne true).

## Classe `meta`

Métatable d'une connexion IRC établie (après connect()). Les méthodes d'envoi sont dans asyncoperations.lua.

| Méthode | Description | Ligne |
|---|---|---|
| `meta:disconnect(message)` | Déconnexion propre : déclenche OnDisconnect (message, false), envoie QUIT puis ferme la socket. | 153 |
| `meta:handle(prefix, cmd, params)` | Exécute le gestionnaire irc.handlers correspondant à la commande reçue ; affiche la commande si elle est inconnue. | 228 |
| `meta:hook(name, id, f)` | Enregistre une fonction pour un événement (ex. OnChat, OnJoin, OnRaw, OnSend, PreRegister, OnConnect, OnDisconnect). Si f est omis, id est utilisé comme fonction. Renvoie id (ou f). | 51 |
| `meta:invoke(name, ...)` | Appelle les hooks d'un événement ; s'arrête au premier qui renvoie une valeur vraie. | 70 |
| `meta:shutdown()` | Ferme la socket et retire la métatable de l'objet (il n'est plus utilisable). | 162 |
| `meta:think()` | Lit toutes les lignes disponibles sur la socket (non bloquant), déclenche le hook OnRaw puis, s'il ne renvoie pas vrai, traite la ligne via handle. À appeler régulièrement. Lève une erreur si la socket est coupée. | 179 |
| `meta:topic(channel)` | Demande le sujet d'un salon (commande TOPIC) ; la réponse arrive via le hook OnTopic. | 276 |
| `meta:unhook(name, id)` | Retire un hook ; assert si l'événement n'a pas de hook ou si l'id est inconnu. | 60 |
| `meta:whois(nick)` | Envoie WHOIS et lit les réponses de façon bloquante jusqu'au code 318. Renvoie une table avec userinfo, node, channels, account/registered selon les réponses du serveur ; les autres lignes reçues sont traitées par handle. | 246 |

## Classe `meta_preconnect`

Métatable d'un client créé par irc.new mais pas encore connecté.

| Méthode | Description | Ligne |
|---|---|---|
| `meta_preconnect.__index(o, k)` | Renvoie hook, unhook ou connect ; lève une erreur pour tout autre champ qui existe dans meta (accessible seulement après connexion). | 29 |
| `meta_preconnect:connect(_host, _port)` | Ouvre la connexion TCP (SSL facultatif), envoie CAP REQ multi-prefix, déclenche PreRegister, envoie PASS/NICK/USER, puis boucle sur think() jusqu'à réception du 001 avant de déclencher OnConnect. Accepte soit (host, port), soit une table. | 81 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `new(data)` | Crée un client IRC non connecté. data.nick est obligatoire (assert) et validé par checkNick ; username vaut "lua" et realname "Lua owns" par défaut ; nickGenerator vaut defaultNickGenerator ; track_users est vrai par défaut. | 38 |

**Globales affectées :** `_META`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaIRC/init.lua`.*
