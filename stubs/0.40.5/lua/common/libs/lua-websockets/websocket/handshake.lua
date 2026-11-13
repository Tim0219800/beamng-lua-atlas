---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/handshake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Poignée de main HTTP/1.1 de WebSocket (upgrade) pour lua-websockets : construction de la requête client, analyse des en-têtes, validation côté serveur et calcul de Sec-WebSocket-Accept (SHA-1 de la clé + GUID RFC 6455, encodé en base64). Utilisé par websocket/sync et les backends serveur.
--- Accès : `require("libs/lua-websockets/websocket/handshake")`
---@class libs_lua_websockets_websocket_handshake
local libs_lua_websockets_websocket_handshake = {}

--- Côté serveur : vérifie qu'une requête est un upgrade WebSocket valide (Upgrade: websocket, Connection contenant upgrade, clé présente, version 13) et fabrique la réponse '101 Switching Protocols'. Choisit le premier sous-protocole demandé qui figure dans la liste supportée.
---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:67
---@param request string Requête HTTP brute.
---@param protocols string[] Sous-protocoles supportés par le serveur.
---@return string|nil  Réponse HTTP 101, ou nil si la requête est invalide.
---@return string|nil  Sous-protocole retenu ; en cas de refus, 'HTTP/1.1 400 Bad Request' en seconde valeur.
function libs_lua_websockets_websocket_handshake.accept_upgrade(request, protocols) end

--- Analyse une requête/réponse HTTP/1.1 en texte brut. Si la première ligne ne finit pas par HTTP/1.1, renvoie une table vide.
---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:14
---@param request string Texte brut avec lignes terminées par CRLF.
---@return table<string, string>  En-têtes en minuscules ; les doublons sont joints par une virgule.
---@return string|nil  Corps après la ligne vide, s'il existe.
function libs_lua_websockets_websocket_handshake.http_headers(request) end

--- Calcule la valeur Sec-WebSocket-Accept : SHA-1 de (clé .. GUID 258EAFA5-E914-47DA-95CA-C5AB0DC85B11) puis base64.
---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:7
---@param sec_websocket_key string Valeur de l'en-tête Sec-WebSocket-Key envoyée par le client.
---@return string  Valeur à placer dans Sec-WebSocket-Accept.
function libs_lua_websockets_websocket_handshake.sec_websocket_accept(sec_websocket_key) end

--- Côté client : construit le texte de la requête GET d'upgrade WebSocket (version 13) avec Host, clé, sous-protocoles, en-têtes supplémentaires et Origin facultatifs.
---Source : lua/common/libs/lua-websockets/websocket/handshake.lua:40
---@param req table Champs : uri, host, port (ajouté à Host s'il vaut autre chose que 80), key, protocols (liste de chaînes), extra_headers (table nom->valeur), origin.
---@return string  Requête HTTP complète.
function libs_lua_websockets_websocket_handshake.upgrade_request(req) end

return libs_lua_websockets_websocket_handshake
