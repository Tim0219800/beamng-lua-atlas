---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/client_sync.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend client WebSocket synchrone (bloquant) de lua-websockets, basé sur luasocket. Le module renvoie une fonction constructeur (aussi accessible par websocket.client.new). L'objet est étendu par websocket/sync, ce qui lui donne connect, send, receive et close. À utiliser pour un client WebSocket simple dans un script Lua du jeu.
--- Accès : `require("libs/lua-websockets/websocket/client_sync")`
---@class libs_lua_websockets_websocket_client_sync
local libs_lua_websockets_websocket_client_sync = {}

--- Objet renvoyé par le constructeur new(ws). ws est une table d'options facultative (timeout en secondes). connect/send/receive/close proviennent de websocket/sync.
---@class libs_lua_websockets_websocket_client_sync_client
local libs_lua_websockets_websocket_client_sync_client = {}

--- Enveloppe le socket avec ssl.wrap puis lance la négociation TLS. Inutilisable en pratique car ssl vaut nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
---@param ssl_params table Paramètres TLS.
function libs_lua_websockets_websocket_client_sync_client:dohandshake(ssl_params) end

--- Ferme le socket.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
function libs_lua_websockets_websocket_client_sync_client:sock_close() end

--- Crée un socket TCP luasocket, applique ws.timeout et se connecte. Renvoie nil et l'erreur en cas d'échec.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
---@param host string Hôte.
---@param port integer Port.
function libs_lua_websockets_websocket_client_sync_client:sock_connect(host, port) end

--- Lit des données sur le socket (luasocket receive).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
function libs_lua_websockets_websocket_client_sync_client:sock_receive() end

--- Envoie des données sur le socket (luasocket send).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_sync.lua:dyn
function libs_lua_websockets_websocket_client_sync_client:sock_send() end

