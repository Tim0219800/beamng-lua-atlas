---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/client_ev.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend client WebSocket asynchrone de lua-websockets pour la boucle d'événements lua-ev (module 'ev', non fourni par le jeu). Le module renvoie une fonction constructeur ; l'objet fonctionne par callbacks (on_open, on_message, on_error, on_close) et gère connexion non bloquante, poignée de main et fermeture avec délai.
--- Accès : `require("libs/lua-websockets/websocket/client_ev")`
---@class libs_lua_websockets_websocket_client_ev
local libs_lua_websockets_websocket_client_ev = {}

--- Objet renvoyé par le constructeur new(ws). ws est une table d'options facultative (loop : boucle ev, défaut ev.Loop.default). L'état self.state vaut 'CLOSED', 'CONNECTING', 'OPEN' ou 'CLOSING'.
---@class libs_lua_websockets_websocket_client_ev_client
local libs_lua_websockets_websocket_client_ev_client = {}

--- Ferme la connexion : annule la connexion en cours ou envoie une trame CLOSE puis attend l'écho jusqu'au délai (3 s par défaut), sinon ferme avec le code 1006 'timeout'.
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param code integer Code (défaut 1000).
---@param reason string Raison.
---@param timeout number Délai en secondes.
function libs_lua_websockets_websocket_client_ev_client:close(code, reason, timeout) end

--- Lance une connexion asynchrone, puis la poignée de main WebSocket.
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param url string URL ws:// ou wss://.
---@param ws_protocol string|string[] Sous-protocole(s) demandé(s).
---@param options table Options (ex. extra_http_headers, ssl_params) — déduit du code.
function libs_lua_websockets_websocket_client_ev_client:connect(url, ws_protocol, options) end

--- Définit le callback de fermeture.
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function Callback.
function libs_lua_websockets_websocket_client_ev_client:on_close(f) end

--- Définit le callback d'erreur.
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function Callback.
function libs_lua_websockets_websocket_client_ev_client:on_error(f) end

--- Définit le callback de réception.
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function fonction(client, message, opcode).
function libs_lua_websockets_websocket_client_ev_client:on_message(f) end

--- Définit le callback appelé quand la connexion est ouverte.
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param f function Callback.
function libs_lua_websockets_websocket_client_ev_client:on_open(f) end

--- Envoie un message (trame masquée côté client).
---Source : lua/common/libs/lua-websockets/websocket/client_ev.lua:dyn
---@param message string Données.
---@param opcode integer Opcode (TEXT par défaut).
function libs_lua_websockets_websocket_client_ev_client:send(message, opcode) end

