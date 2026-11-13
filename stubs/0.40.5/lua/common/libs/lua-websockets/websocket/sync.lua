---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/sync.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cœur synchrone de lua-websockets : extend(obj) ajoute à un objet disposant de sock_send, sock_receive, sock_close (et sock_connect côté client) les méthodes connect, send, receive et close. Gère la poignée de main, le réassemblage de messages fragmentés, la réponse automatique aux PING (client) et la fermeture propre. Utilisé par client_sync, client_copas et server_copas.
--- Accès : `require("libs/lua-websockets/websocket/sync")`
---@class libs_lua_websockets_websocket_sync
local libs_lua_websockets_websocket_sync = {}

--- Ajoute les méthodes WebSocket à obj et initialise obj.state à 'CLOSED' s'il est absent.
---Source : lua/common/libs/lua-websockets/websocket/sync.lua:186
---@param obj table Objet avec sock_send, sock_receive, sock_close (et sock_connect s'il n'est pas serveur).
---@return table  Le même objet, étendu.
function libs_lua_websockets_websocket_sync.extend(obj) end

--- Objet étendu par extend. Champs : state ('CLOSED', 'OPEN'), is_server, is_closing, callback facultatif on_close.
---@class libs_lua_websockets_websocket_sync_obj
local libs_lua_websockets_websocket_sync_obj = {}

--- Envoie une trame CLOSE, attend la réponse, ferme le socket, appelle on_close s'il existe et passe state à 'CLOSED'. Renvoie false si l'état n'est pas 'OPEN'.
---Source : lua/common/libs/lua-websockets/websocket/sync.lua:95
---@param code integer Code (défaut 1000).
---@param reason string Raison.
---@return boolean  was_clean.
---@return integer  Code.
---@return string  Raison.
function libs_lua_websockets_websocket_sync_obj:close(code, reason) end

--- Connexion client : analyse l'URL, connecte le socket, fait la poignée de main HTTP et vérifie Sec-WebSocket-Accept. Passe state à 'OPEN' en cas de succès.
---Source : lua/common/libs/lua-websockets/websocket/sync.lua:126
---@param ws_url string URL ws:// ou wss://.
---@param ws_protocol string|string[]|nil Sous-protocole(s) demandé(s).
---@param options table|nil ssl_params et extra_http_headers.
---@return boolean|nil  true si ouvert, nil sinon.
---@return string|nil  Sous-protocole accepté, ou message d'erreur.
---@return table|nil  En-têtes de la réponse.
function libs_lua_websockets_websocket_sync_obj:connect(ws_url, ws_protocol, options) end

--- Bloque jusqu'à réception d'un message complet. Réassemble les fragments, répond aux PING côté client, répond à CLOSE par un écho.
---Source : lua/common/libs/lua-websockets/websocket/sync.lua:8
---@return string|nil  Message.
---@return integer|nil  Opcode.
---@return boolean  was_clean (en cas de fermeture).
---@return integer  Code de fermeture.
---@return string  Raison.
function libs_lua_websockets_websocket_sync_obj:receive() end

--- Envoie un message (masqué si l'objet n'est pas un serveur). Ferme la connexion si l'envoi échoue.
---Source : lua/common/libs/lua-websockets/websocket/sync.lua:83
---@param data string Données.
---@param opcode integer Opcode (TEXT par défaut).
---@return boolean|nil  true si envoyé ; nil, was_clean, code, reason sinon.
function libs_lua_websockets_websocket_sync_obj:send(data, opcode) end

return libs_lua_websockets_websocket_sync
