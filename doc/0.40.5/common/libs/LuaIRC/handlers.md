# `libs_LuaIRC_handlers`

*Fichier : `lua/common/libs/LuaIRC/handlers.lua` · VM : Commun (GE + véhicule) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/LuaIRC/handlers")`

Partie de la bibliothèque tierce LuaIRC (client IRC en Lua). Définit la table globale `irc.handlers` (module "irc") : un gestionnaire par commande ou code numérique IRC reçu (PING, 001, PRIVMSG, NOTICE, JOIN, PART, QUIT, NICK, 432/433, 353, 366, 331/332/333, TOPIC, KICK, 221, 324, 474, MODE, ERROR). Chaque gestionnaire met à jour l'état de la connexion (pseudo, salons, utilisateurs) puis déclenche le hook correspondant (OnChat, OnNotice, OnJoin, OnPart, OnQuit, NickChange, NameList, OnTopic, OnTopicInfo, OnKick, OnUserMode, OnChannelMode, OnBan, OnModeChange, OnDisconnect). Appelé par meta:handle de libs/LuaIRC/init.

## Remarques

- Signature commune des gestionnaires : function(o, prefix, ...params) où o est la connexion.
- PING répond automatiquement PONG ; 001 marque la connexion comme authentifiée (o.authed) et mémorise o.nick ; 432/433 (pseudo invalide ou pris) renvoient NICK avec o.nickGenerator(badnick).
- ERROR déclenche OnDisconnect, ferme la socket puis lève une erreur Lua (error(message, 3)).
- Avec track_users actif, JOIN/MODE accèdent à o.channels[channel].users sans vérification : une erreur Lua est possible si le salon ou l'utilisateur est inconnu.

**Globales affectées :** `handlers`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/LuaIRC/handlers.lua`.*
