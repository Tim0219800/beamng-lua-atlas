---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas/http.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module HTTP de la bibliothèque tierce Copas : copie complète du client HTTP/1.1 de LuaSocket (Diego Nehab) modifiée pour gérer https, les redirections http/https et les sockets Copas asynchrones. Définit copas.http ; copas.http.request(url[, body]) renvoie corps, code, en-têtes, statut. À appeler depuis une coroutine Copas.
--- Accès : `require("libs/copas/copas/http")`
---@class libs_copas_copas_http
---@field PORT integer Port par défaut HTTP, 80.
---@field SSLOPTIONS string Options SSL par défaut, "all".
---@field SSLPORT integer Port par défaut HTTPS, 443.
---@field SSLPROTOCOL string Protocole SSL par défaut, "tlsv1_2".
---@field SSLVERIFY string Vérification des certificats, "none" par défaut (non vérifiés).
---@field TIMEOUT number Timeout de connexion, 60 s.
---@field USERAGENT string Champ User-Agent envoyé, valeur de socket._VERSION.
---@field request function request(url_ou_table, body) : envoie une requête HTTP/HTTPS (protégée par socket.protect).
local libs_copas_copas_http = {}

--- API bas niveau : crée le socket (reqt:create()), fixe le timeout, se connecte à reqt.host:reqt.port et renvoie un objet de connexion HTTP.
---Source : lua/common/libs/copas/copas/http.lua:121
---@param reqt table Requête avec host, port, create
---@return table  Objet de connexion
function libs_copas_copas_http.open(reqt) end

--- Convertit la forme abrégée en table de requête avancée avec champ target (résultats) ; si un corps est donné : méthode POST, en-têtes content-length et content-type.
---Source : lua/common/libs/copas/copas/http.lua:380
---@param u string URL
---@param b string|nil Corps POST
---@return table  Table de requête
function libs_copas_copas_http.parseRequest(u, b) end

return libs_copas_copas_http
