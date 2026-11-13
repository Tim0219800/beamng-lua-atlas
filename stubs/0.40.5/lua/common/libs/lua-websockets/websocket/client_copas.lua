---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/client_copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend client WebSocket de lua-websockets pour la bibliothèque coopérative 'copas' (sockets non bloquants dans des coroutines). Le module renvoie une fonction constructeur ; l'objet renvoyé est étendu par websocket/sync (méthodes connect, send, receive, close).
--- Accès : `require("libs/lua-websockets/websocket/client_copas")`
---@class libs_lua_websockets_websocket_client_copas
local libs_lua_websockets_websocket_client_copas = {}

--- Objet renvoyé par le constructeur new(ws). ws est une table d'options facultative (champ timeout en secondes). Les méthodes connect/send/receive/close viennent de websocket/sync ; les méthodes sock_* ci-dessous fournissent le transport.
---@class libs_lua_websockets_websocket_client_copas_client
local libs_lua_websockets_websocket_client_copas_client = {}

--- Délègue à copas.dohandshake (négociation TLS) sur le socket.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:dohandshake() end

--- Ferme le socket.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:sock_close() end

--- Crée un socket TCP (luasocket), applique ws.timeout et se connecte via copas.connect. Renvoie nil et l'erreur en cas d'échec (sauf 'already connected').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
---@param host string Hôte.
---@param port integer Port.
---@return nil|string  nil, message d'erreur en cas d'échec.
function libs_lua_websockets_websocket_client_copas_client:sock_connect(host, port) end

--- Lit des données via copas.receive sur le socket.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:sock_receive() end

--- Envoie des données via copas.send sur le socket.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/client_copas.lua:dyn
function libs_lua_websockets_websocket_client_copas_client:sock_send() end

