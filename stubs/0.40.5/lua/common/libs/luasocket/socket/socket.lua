---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/socket.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce LuaSocket (Diego Nehab) : module d'aide au-dessus du noyau `socket` natif. Il ajoute connect4/connect6 (connexion forcée en IPv4/IPv6), bind (serveur TCP avec choix de la famille d'adresse), choose (sélecteur de variantes) et les sources/sinks LTN12 sur socket (sink : close-when-done, keep-open ; source : by-length, until-closed). Il modifie et renvoie la table `socket` elle-même.
--- Accès : `require("libs/luasocket/socket/socket")`
---@class libs_luasocket_socket_socket
---@field BLOCKSIZE integer Taille des blocs lus par les sources de socket (2048).
---@field sink function socket.sink(nom, sock) : choisit un sink dans sinkt (nom omis = "default").
---@field sinkt table<string, function> Fabriques de sinks LTN12 : "close-when-done", "keep-open", "default" (= keep-open).
---@field source function socket.source(nom, sock, longueur?) : choisit une source dans sourcet (nom omis = "default").
---@field sourcet table<string, function> Fabriques de sources LTN12 : "by-length", "until-closed", "default" (= until-closed).
---@field try function Résultat de socket.newtry() : lève une erreur si son premier argument est nil/false, sinon renvoie les arguments.
local libs_luasocket_socket_socket = {}

--- Crée un socket TCP serveur : résout `host`, lie le port, puis écoute.
---Source : lua/common/libs/luasocket/socket/socket.lua:27
---@param host string Hôte ou "*" pour toutes les interfaces IPv4.
---@param port integer Port d'écoute.
---@param backlog integer|nil Longueur de la file d'attente de listen.
---@return table|nil  Socket serveur en écoute, ou nil suivi d'une erreur.
function libs_luasocket_socket_socket.bind(host, port, backlog) end

--- Renvoie une fonction (nom, opt1, opt2) qui appelle table[nom](opt1, opt2). Si le premier argument n'est pas une chaîne, le nom "default" est utilisé. Lève une erreur « unknown key » si le nom est inconnu.
---Source : lua/common/libs/luasocket/socket/socket.lua:59
---@param table table<string, function> Table de variantes.
---@return function  Sélecteur.
function libs_luasocket_socket_socket.choose(table) end

--- Se connecte à une adresse en forçant la famille IPv4 (appelle socket.connect avec "inet").
---Source : lua/common/libs/luasocket/socket/socket.lua:19
---@param address string Adresse ou nom d'hôte distant.
---@param port integer Port distant.
---@param laddress string|nil Adresse locale à lier.
---@param lport integer|nil Port local à lier.
---@return table|nil  Socket connecté, ou nil suivi d'un message d'erreur.
function libs_luasocket_socket_socket.connect4(address, port, laddress, lport) end

--- Comme connect4 mais en IPv6 ("inet6").
---Source : lua/common/libs/luasocket/socket/socket.lua:23
---@param address string Adresse ou nom d'hôte distant.
---@param port integer Port distant.
---@param laddress string|nil Adresse locale à lier.
---@param lport integer|nil Port local à lier.
---@return table|nil  Socket connecté, ou nil suivi d'un message d'erreur.
function libs_luasocket_socket_socket.connect6(address, port, laddress, lport) end

return libs_luasocket_socket_socket
