---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Métatable d'une connexion IRC établie (après connect()). Les méthodes d'envoi sont dans asyncoperations.lua.
---@class libs_LuaIRC_init_meta
local libs_LuaIRC_init_meta = {}

--- Déconnexion propre : déclenche OnDisconnect (message, false), envoie QUIT puis ferme la socket.
---Source : lua/common/libs/LuaIRC/init.lua:153
---@param message string|nil Message de départ (défaut "Bye!")
function libs_LuaIRC_init_meta:disconnect(message) end

--- Exécute le gestionnaire irc.handlers correspondant à la commande reçue ; affiche la commande si elle est inconnue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/LuaIRC/init.lua:228
---@param prefix string|nil Préfixe de la ligne (nick!user@host ou serveur)
---@param cmd string Commande ou code numérique
---@param params table<integer, string> Paramètres de la ligne
function libs_LuaIRC_init_meta:handle(prefix, cmd, params) end

--- Enregistre une fonction pour un événement (ex. OnChat, OnJoin, OnRaw, OnSend, PreRegister, OnConnect, OnDisconnect). Si f est omis, id est utilisé comme fonction. Renvoie id (ou f).
---Source : lua/common/libs/LuaIRC/init.lua:51
---@param name string Nom de l'événement
---@param id any Identifiant du hook (sert à unhook) ou la fonction elle-même
---@param f function|nil Fonction appelée avec les arguments de l'événement
---@return any  L'identifiant du hook
function libs_LuaIRC_init_meta:hook(name, id, f) end

--- Appelle les hooks d'un événement ; s'arrête au premier qui renvoie une valeur vraie.
---Source : lua/common/libs/LuaIRC/init.lua:70
---@param name string Nom de l'événement
---@param ... any Arguments passés aux hooks
---@return boolean|nil  true si un hook a répondu vrai
function libs_LuaIRC_init_meta:invoke(name, ...) end

--- Ferme la socket et retire la métatable de l'objet (il n'est plus utilisable).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/LuaIRC/init.lua:162
function libs_LuaIRC_init_meta:shutdown() end

--- Lit toutes les lignes disponibles sur la socket (non bloquant), déclenche le hook OnRaw puis, s'il ne renvoie pas vrai, traite la ligne via handle. À appeler régulièrement. Lève une erreur si la socket est coupée.
---Source : lua/common/libs/LuaIRC/init.lua:179
function libs_LuaIRC_init_meta:think() end

--- Demande le sujet d'un salon (commande TOPIC) ; la réponse arrive via le hook OnTopic.
---Source : lua/common/libs/LuaIRC/init.lua:276
---@param channel string Nom du salon
function libs_LuaIRC_init_meta:topic(channel) end

--- Retire un hook ; assert si l'événement n'a pas de hook ou si l'id est inconnu.
---Source : lua/common/libs/LuaIRC/init.lua:60
---@param name string Nom de l'événement
---@param id any Identifiant renvoyé par hook
function libs_LuaIRC_init_meta:unhook(name, id) end

--- Envoie WHOIS et lit les réponses de façon bloquante jusqu'au code 318. Renvoie une table avec userinfo, node, channels, account/registered selon les réponses du serveur ; les autres lignes reçues sont traitées par handle.
---Source : lua/common/libs/LuaIRC/init.lua:246
---@param nick string Pseudo à interroger
---@return table  Champs userinfo, node, channels, registered, account
function libs_LuaIRC_init_meta:whois(nick) end

--- Métatable d'un client créé par irc.new mais pas encore connecté.
---@class libs_LuaIRC_init_meta_preconnect
local libs_LuaIRC_init_meta_preconnect = {}

--- Renvoie hook, unhook ou connect ; lève une erreur pour tout autre champ qui existe dans meta (accessible seulement après connexion).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/LuaIRC/init.lua:29
---@param o table Le client
---@param k string Clé demandée
function libs_LuaIRC_init_meta_preconnect.__index(o, k) end

--- Ouvre la connexion TCP (SSL facultatif), envoie CAP REQ multi-prefix, déclenche PreRegister, envoie PASS/NICK/USER, puis boucle sur think() jusqu'à réception du 001 avant de déclencher OnConnect. Accepte soit (host, port), soit une table.
---Source : lua/common/libs/LuaIRC/init.lua:81
---@param _host string|table Nom d'hôte, ou table {host, port, timeout, password, secure}
---@param _port integer|nil Port (défaut 6667)
function libs_LuaIRC_init_meta_preconnect:connect(_host, _port) end

--- Crée un client IRC non connecté. data.nick est obligatoire (assert) et validé par checkNick ; username vaut "lua" et realname "Lua owns" par défaut ; nickGenerator vaut defaultNickGenerator ; track_users est vrai par défaut.
---Source : lua/common/libs/LuaIRC/init.lua:38
---@param data table {nick, username?, realname?, nickGenerator?}
---@return table  Client avec la métatable meta_preconnect
function new(data) end

---@type any
_META = nil
