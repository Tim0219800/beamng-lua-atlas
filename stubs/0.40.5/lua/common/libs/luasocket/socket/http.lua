---@meta
-- tim19Atlas stub generated from lua/common/libs/luasocket/socket/http.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client HTTP/1.1 de LuaSocket (Diego Nehab) : requêtes GET/POST, corps en flux via LTN12, transfert chunked, redirections (jusqu'à 5), authentification Basic, proxy. API haut niveau avec http.request (URL simple ou table de paramètres) et API bas niveau avec http.open. Le module s'enregistre aussi dans socket.http. Appels bloquants : un moddeur doit les lancer avec précaution (délai TIMEOUT de 60 s).
--- Accès : `require("libs/luasocket/socket/http")`
---@class libs_luasocket_socket_http
---@field PORT integer Port HTTP par défaut : 80.
---@field TIMEOUT number Délai de connexion en secondes : 60.
---@field USERAGENT string Valeur de l'en-tête user-agent : socket._VERSION.
---@field request function http.request(url [, corps]) ou http.request(table). Voir notes. Protégée par socket.protect.
local libs_luasocket_socket_http = {}

--- API bas niveau : crée la socket (socket.tcp ou create), fixe le délai et se connecte. Renvoie un objet avec les méthodes sendrequestline, sendheaders, sendbody, receivestatusline, receiveheaders, receivebody, receive09body et close. Lève une erreur en cas d'échec (socket.try).
---Source : lua/common/libs/luasocket/socket/http.lua:109
---@param host string Hôte.
---@param port integer|nil Port (défaut 80).
---@param create function|nil Fabrique de socket alternative.
---@return table  Objet de connexion HTTP.
function libs_luasocket_socket_http.open(host, port, create) end

--- Objet renvoyé par open (champs c = socket, try = fonction de contrôle d'erreur qui ferme la connexion).
---@class libs_luasocket_socket_http_connection
local libs_luasocket_socket_http_connection = {}

--- Ferme la socket.
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
function libs_luasocket_socket_http_connection:close() end

--- Lit un corps de réponse HTTP/0.9.
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@param status string Octets déjà lus.
---@param sink function Sink.
---@param step function|nil Fonction de pas.
function libs_luasocket_socket_http_connection:receive09body(status, sink, step) end

--- Lit le corps (chunked, par longueur ou jusqu'à la fermeture) vers un sink LTN12.
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@param headers table En-têtes reçus.
---@param sink function|nil Sink (défaut : sink nul).
---@param step function|nil Fonction de pas.
function libs_luasocket_socket_http_connection:receivebody(headers, sink, step) end

--- Lit les en-têtes de réponse (noms en minuscules).
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@return table<string, string>  En-têtes.
function libs_luasocket_socket_http_connection:receiveheaders() end

--- Lit la ligne de statut ; renvoie le code, ou nil et les 5 premiers octets si la réponse est de type HTTP/0.9.
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@return integer|nil  Code HTTP.
---@return string  Ligne de statut.
function libs_luasocket_socket_http_connection:receivestatusline() end

--- Envoie le corps depuis une source LTN12 (chunked sauf si content-length est connu).
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@param headers table En-têtes.
---@param source function|nil Source.
---@param step function|nil Fonction de pas.
function libs_luasocket_socket_http_connection:sendbody(headers, source, step) end

--- Envoie les en-têtes (noms mis en forme canonique) suivis de la ligne vide.
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@param tosend table<string, string> En-têtes.
function libs_luasocket_socket_http_connection:sendheaders(tosend) end

--- Envoie la ligne de requête 'METHODE uri HTTP/1.1'.
---Source : lua/common/libs/luasocket/socket/http.lua:dyn
---@param method string|nil Méthode (défaut GET).
---@param uri string URI.
function libs_luasocket_socket_http_connection:sendrequestline(method, uri) end

return libs_luasocket_socket_http
