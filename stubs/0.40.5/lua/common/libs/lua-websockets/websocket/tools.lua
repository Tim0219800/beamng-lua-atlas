---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-websockets/websocket/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires de lua-websockets : lecture/écriture d'entiers 8/16/32 bits en gros-boutiste, SHA-1 (via la bibliothèque 'crypto' si présente, sinon une implémentation en Lua), base64 (via le module luasocket 'mime'), analyse d'URL ws:// et génération de la clé Sec-WebSocket-Key.
--- Accès : `require("libs/lua-websockets/websocket/tools")`
---@class libs_lua_websockets_websocket_tools
---@field base64 table Table avec encode(data) -> chaîne base64 (mime.b64).
---@field sha1 function Fonction SHA-1 : crypto.digest si disponible, sinon l'implémentation maison ; renvoie 20 octets bruts.
---@field write_int8 function Alias de string.char : écrit un ou plusieurs octets.
local libs_lua_websockets_websocket_tools = {}

--- Génère une clé Sec-WebSocket-Key : 16 octets aléatoires (math.random) en base64.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:180
---@return string  Clé.
function libs_lua_websockets_websocket_tools.generate_key() end

--- Décompose une URL ws:// ou wss://. Port par défaut 80 (ws) ou 443 (wss) ; uri par défaut '/'. Lève une erreur si l'URL est invalide.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:167
---@param url string URL.
---@return string  Protocole en minuscules.
---@return string  Hôte.
---@return integer  Port.
---@return string  URI.
function libs_lua_websockets_websocket_tools.parse_url(url) end

--- Lit un entier 16 bits gros-boutiste.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:27
---@param str string Source.
---@param pos integer|nil Position.
---@return integer  Nouvelle position.
---@return integer  Valeur.
function libs_lua_websockets_websocket_tools.read_int16(str, pos) end

--- Lit un entier 32 bits gros-boutiste.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:32
---@param str string Source.
---@param pos integer|nil Position.
---@return integer  Nouvelle position.
---@return integer  Valeur.
function libs_lua_websockets_websocket_tools.read_int32(str, pos) end

--- Lit un octet.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:23
---@param str string Source.
---@param pos integer|nil Position (défaut 1).
---@return integer  Nouvelle position.
---@return integer  Valeur.
function libs_lua_websockets_websocket_tools.read_int8(str, pos) end

--- Écrit un entier 16 bits gros-boutiste sur 2 octets.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:45
---@param v integer Valeur.
---@return string  2 octets.
function libs_lua_websockets_websocket_tools.write_int16(v) end

--- Écrit un entier 32 bits gros-boutiste sur 4 octets.
---Source : lua/common/libs/lua-websockets/websocket/tools.lua:49
---@param v integer Valeur.
---@return string  4 octets.
function libs_lua_websockets_websocket_tools.write_int32(v) end

return libs_lua_websockets_websocket_tools
