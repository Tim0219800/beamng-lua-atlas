---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/server_copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend serveur WebSocket de lua-websockets pour la bibliothèque coopérative 'copas'. listen ouvre un socket serveur luasocket, réalise la poignée de main pour chaque connexion entrante et appelle le gestionnaire du sous-protocole négocié (ou le gestionnaire par défaut) avec un objet client.
--- Accès : `require("libs/lua-websockets/websocket/server_copas")`
---@class libs_lua_websockets_websocket_server_copas
local libs_lua_websockets_websocket_server_copas = {}

--- Démarre un serveur WebSocket. Lève une erreur si le socket ne peut pas être ouvert. Chaque client accepté est enregistré, passé au gestionnaire, puis la coroutine reste en vie tant que client.state n'est pas 'CLOSED'.
---Source : lua/common/libs/lua-websockets/websocket/server_copas.lua:52
---@param opts table port (défaut 80), interface (défaut '*'), protocols (table sous-protocole -> fonction(client)), default (fonction(client) pour les autres cas), on_error (fonction(message), défaut print). protocols ou default est obligatoire.
---@return table  Objet avec la méthode close(_, keep_clients) qui retire le serveur de copas et, sauf keep_clients, ferme les clients.
function libs_lua_websockets_websocket_server_copas.listen(opts) end

--- Objet client passé au gestionnaire (état 'OPEN', is_server = true). Hérite de websocket/sync (send, receive, close).
---@class libs_lua_websockets_websocket_server_copas_client
local libs_lua_websockets_websocket_server_copas_client = {}

--- Envoie le message à tous les clients du même sous-protocole, puis à lui-même.
---Source : lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
---@param ... any Mêmes arguments que send (data, opcode).
function libs_lua_websockets_websocket_server_copas_client:broadcast(...) end

--- Appelé à la fermeture : retire le client de la liste du sous-protocole.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:on_close() end

--- Shutdown puis fermeture du socket.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:sock_close() end

--- Lecture via copas.receive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:sock_receive() end

--- Envoi via copas.send.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/server_copas.lua:dyn
function libs_lua_websockets_websocket_server_copas_client:sock_send() end

return libs_lua_websockets_websocket_server_copas
