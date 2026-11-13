---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/smtp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce LuaSocket (auteur Diego Nehab) : client SMTP pour envoyer des e-mails. Elle s'attache à la table `socket` sous `socket.smtp`. Elle fournit l'API de haut niveau `send` (connexion, EHLO, authentification LOGIN/PLAIN, envoi, QUIT) et l'API de bas niveau `open` (objet à méthodes greet/mail/rcpt/data/quit/login/plain/auth/send/close), ainsi que `message` pour construire une source de message MIME (simple ou multipart). Elle n'est pas utilisée par le gameplay : c'est du code embarqué avec LuaSocket.
--- Accès : `require("libs/luasocket/socket/smtp")`
---@class libs_luasocket_socket_smtp
---@field DOMAIN string Domaine utilisé dans la commande EHLO ; variable d'environnement SERVER_NAME ou "localhost".
---@field PORT number Port SMTP par défaut (25).
---@field SERVER string Serveur SMTP par défaut ("localhost").
---@field TIMEOUT number Délai de connexion en secondes (60).
---@field ZONE string Fuseau horaire par défaut de l'en-tête Date ("-0000" = inconnu).
---@field send function API de haut niveau : prend une table {server, port, domain, user, password, from, rcpt, source, step, create}, ouvre la connexion, fait greet, auth, send, quit puis close. Renvoie 1 en cas de succès, sinon nil et un message d'erreur.
local libs_luasocket_socket_smtp = {}

--- Construit une source (fonction itératrice de chunks, compatible LTN12) pour un message. mesgt = {headers, body} ; body peut être une chaîne, une fonction source ou une table (multipart, avec preamble/epilogue). Ajoute les en-têtes date, x-mailer et mime-version.
---Source : lua/common/libs/luasocket/socket/smtp.lua:233
---@param mesgt table Description du message ; sa clé `headers` est remplacée par la version normalisée (modifiée en place).
---@return function  Source : chaque appel renvoie le chunk suivant, ou nil puis une erreur.
function libs_luasocket_socket_smtp.message(mesgt) end

--- Ouvre une connexion SMTP et renvoie un objet de bas niveau (méthodes greet, mail, rcpt, data, quit, close, login, plain, auth, send). Lève une erreur (via socket.try) si la connexion échoue.
---Source : lua/common/libs/luasocket/socket/smtp.lua:116
---@param server string|nil Hôte du serveur ; défaut SERVER.
---@param port integer|nil Port ; défaut PORT.
---@param create function|nil Fabrique de socket TCP ; défaut socket.tcp.
---@return table  Objet SMTP dont les méthodes lèvent une erreur en cas de réponse inattendue du serveur.
function libs_luasocket_socket_smtp.open(server, port, create) end

return libs_luasocket_socket_smtp
