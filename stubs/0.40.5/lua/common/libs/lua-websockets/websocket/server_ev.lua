---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/server_ev.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend serveur WebSocket de lua-websockets pour la boucle d'événements lua-ev (module 'ev', non fourni par le jeu). listen accepte les connexions de façon asynchrone, effectue la poignée de main, puis crée un objet client piloté par callbacks (on_message, on_close, on_error).
--- Accès : `require("libs/lua-websockets/websocket/server_ev")`
---@class libs_lua_websockets_websocket_server_ev
local libs_lua_websockets_websocket_server_ev = {}

--- Démarre un serveur WebSocket asynchrone sur la boucle ev. Lève une erreur si le bind échoue.
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:142
---@param opts table port (défaut 80), interface (défaut '*'), loop (défaut ev.Loop.default), protocols (sous-protocole -> fonction(client)), default (fonction(client)). protocols ou default est obligatoire.
---@return table  Objet serveur : on_error(self, f), sock() (socket d'écoute), close(keep_clients).
function libs_lua_websockets_websocket_server_ev.listen(opts) end

--- Objet client passé au gestionnaire (state 'OPEN'). Les callbacks se posent avec les méthodes on_*.
---@class libs_lua_websockets_websocket_server_ev_client
local libs_lua_websockets_websocket_server_ev_client = {}

--- Envoie à tous les clients du même sous-protocole.
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param ... any Arguments de send.
function libs_lua_websockets_websocket_server_ev_client:broadcast(...) end

--- Ferme la connexion proprement (trame CLOSE) avec un délai d'expiration.
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param code integer Code de fermeture (défaut 1000).
---@param reason string Raison.
---@param timeout number Secondes avant fermeture forcée (défaut 3).
function libs_lua_websockets_websocket_server_ev_client:close(code, reason, timeout) end

--- Définit le callback de fermeture.
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param on_close function fonction(client, ...) .
function libs_lua_websockets_websocket_server_ev_client:on_close(on_close) end

--- Définit le callback d'erreur.
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param on_error function fonction(client, erreur).
function libs_lua_websockets_websocket_server_ev_client:on_error(on_error) end

--- Définit le callback de réception.
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param on_message function fonction(client, message, opcode).
function libs_lua_websockets_websocket_server_ev_client:on_message(on_message) end

--- Envoie un message de façon asynchrone (tampon d'écriture).
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
---@param message string Données.
---@param opcode integer Opcode de trame (TEXT par défaut).
function libs_lua_websockets_websocket_server_ev_client:send(message, opcode) end

--- Démarre la lecture asynchrone des messages ; appelé par listen après l'appel du gestionnaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/lua-websockets/websocket/server_ev.lua:dyn
function libs_lua_websockets_websocket_server_ev_client:start() end

return libs_lua_websockets_websocket_server_ev
