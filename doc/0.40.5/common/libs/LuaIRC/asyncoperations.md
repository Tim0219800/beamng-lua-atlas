# `libs_LuaIRC_asyncoperations`

*Fichier : `lua/common/libs/LuaIRC/asyncoperations.lua` · VM : Commun (GE + véhicule) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuaIRC/asyncoperations")`

Partie de la bibliothèque tierce LuaIRC (client IRC en Lua). Ajoute à la métatable de connexion `irc._META` les commandes d'envoi : message brut, PRIVMSG, NOTICE, JOIN, PART, MODE et activation du suivi des utilisateurs. Fichier chargé par libs/LuaIRC/init via require "irc.asyncoperations" ; il utilise l'écriture `module "irc"` (Lua 5.1) et ne renvoie rien.

## Remarques

- Les méthodes ne sont accessibles qu'après un connect() réussi (avant, la métatable meta_preconnect lève une erreur).
- Les paramètres de commande sont validés par verify() : une chaîne commençant par ':' (ou contenant un espace suivi d'un NUL) provoque une erreur 'malformed parameter'.
- Bug probable : dans meta:send, error(err, errlevel) utilise une variable `errlevel` qui n'est jamais définie (nil, donc niveau par défaut).

## Classe `meta`

Métatable des connexions IRC connectées (les méthodes sont appelées avec ':' sur l'objet renvoyé par irc.new).

| Méthode | Description | Ligne |
|---|---|---|
| `meta:join(channel, key)` | Rejoint un salon, avec une clé (mot de passe) facultative. | 48 |
| `meta:part(channel)` | Quitte un salon. Si le suivi des utilisateurs est actif, supprime le salon de self.channels. | 56 |
| `meta:send(msg, ...)` | Envoie une ligne brute au serveur (suffixée de \r\n). Si des arguments supplémentaires sont donnés, msg est passé à string.format. Déclenche le hook OnSend avant l'envoi ; en cas d'erreur socket autre que timeout/wantwrite, déclenche OnDisconnect, ferme la connexion et lève l'erreur. | 11 |
| `meta:sendChat(target, msg)` | Envoie un message PRIVMSG à un salon ou un utilisateur. Un message multi-lignes est découpé en une commande par ligne. | 34 |
| `meta:sendNotice(target, msg)` | Comme sendChat mais avec la commande NOTICE (une commande par ligne du message). | 41 |
| `meta:setMode(t)` | Envoie une commande MODE. La table peut contenir add (modes à ajouter) et/ou remove (modes à retirer) ; au moins l'un des deux est obligatoire (assert). | 73 |
| `meta:trackUsers(b)` | Active ou désactive le suivi des utilisateurs par salon (self.track_users). En désactivant, vide self.channels. | 64 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaIRC/asyncoperations.lua`.*
