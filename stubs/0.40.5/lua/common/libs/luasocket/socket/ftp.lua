---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/ftp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client FTP de LuaSocket (Diego Nehab), bâti sur socket.tp et LTN12. Offre une API haut niveau (get, put, command) acceptant une URL ftp:// ou une table de paramètres, et une API bas niveau (open puis greet, login, pasv, send, receive…). Le module s'enregistre aussi dans socket.ftp.
--- Accès : `require("libs/luasocket/socket/ftp")`
---@class libs_luasocket_socket_ftp
---@field PASSWORD string Mot de passe anonyme par défaut : 'anonymous@anonymous.org' (à remplacer par une adresse e-mail).
---@field PORT integer Port FTP par défaut : 21.
---@field TIMEOUT number Délai en secondes avant d'abandonner une connexion : 60.
---@field USER string Utilisateur anonyme par défaut : 'ftp'.
---@field command function ftp.command(cmdt) : envoie une commande FTP (champs host, command, argument, check, user, password…) et ferme la connexion. Renvoie 1 ou nil, erreur.
---@field get function ftp.get(url|table) : télécharge un fichier. Avec une URL, renvoie le contenu (chaîne) ; avec une table, utilise le sink fourni.
---@field put function ftp.put(url, corps) ou ftp.put(table) : envoie un fichier ; renvoie le nombre d'octets envoyés.
local libs_luasocket_socket_ftp = {}

--- Ouvre une connexion de contrôle vers un serveur FTP et renvoie un objet bas niveau avec les méthodes greet, login, pasv, port, send, receive, cwd, type, quit, close. Lève une erreur (socket.try) en cas d'échec.
---Source : lua/common/libs/luasocket/socket/ftp.lua:37
---@param server string Hôte.
---@param port integer|nil Port (défaut 21).
---@param create function|nil Fabrique de socket alternative (défaut socket.tcp).
---@return table  Objet de connexion FTP.
function libs_luasocket_socket_ftp.open(server, port, create) end

--- Objet renvoyé par open (champs tp = canal de contrôle, data, server, pasvt, try).
---@class libs_luasocket_socket_ftp_connection
local libs_luasocket_socket_ftp_connection = {}

--- Ferme les connexions de données, serveur et contrôle.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:close() end

--- Change de répertoire distant.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param dir string Répertoire.
function libs_luasocket_socket_ftp_connection:cwd(dir) end

--- Lit le message d'accueil du serveur.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:greet() end

--- Authentifie avec USER/PASS (valeurs anonymes par défaut).
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param user string|nil Utilisateur.
---@param password string|nil Mot de passe.
function libs_luasocket_socket_ftp_connection:login(user, password) end

--- Passe en mode passif et mémorise l'IP et le port de données ; renvoie ip, port.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:pasv() end

--- Ouvre la connexion de données en mode passif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:pasvconnect() end

--- Passe en mode actif : annonce un port local au serveur (ouvre un socket serveur si ip est nil). Utilise math.mod (voir notes).
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param ip string|nil IP à annoncer.
---@param port integer|nil Port.
function libs_luasocket_socket_ftp_connection:port(ip, port) end

--- Accepte la connexion de données en mode actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:portconnect() end

--- Envoie QUIT.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
function libs_luasocket_socket_ftp_connection:quit() end

--- Reçoit des données (commande RETR par défaut) dans le sink fourni ; nécessite pasv ou port avant.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param recvt table sink, path ou argument, command, step.
---@return integer  1.
function libs_luasocket_socket_ftp_connection:receive(recvt) end

--- Envoie des données (commande STOR par défaut) ; nécessite pasv ou port avant. Renvoie le nombre d'octets envoyés.
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param sendt table source, path ou argument, command, step.
---@return integer  Octets envoyés.
function libs_luasocket_socket_ftp_connection:send(sendt) end

--- Choisit le mode de transfert ('a' texte, 'i' binaire).
---Source : lua/common/libs/luasocket/socket/ftp.lua:dyn
---@param type string 'a' ou 'i'.
function libs_luasocket_socket_ftp_connection:type(type) end

return libs_luasocket_socket_ftp
